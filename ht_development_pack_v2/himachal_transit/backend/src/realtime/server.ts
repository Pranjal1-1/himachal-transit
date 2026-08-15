import { Server as SocketIOServer, Socket, ExtendedError } from 'socket.io';
import { createServer, Server as HTTPServer } from 'http';
import { createRealtimeEvent, RealtimeEvent, REALTIME_EVENTS } from './events';

interface AuthenticatedSocket extends Socket {
  userId?: string;
  role?: string;
  driverId?: string;
  organizationId?: string;
  subscriptions: Set<string>;
}

export class RealtimeServer {
  private io: SocketIOServer;
  private httpServer: HTTPServer;
  private connectedClients: Map<string, AuthenticatedSocket> = new Map();
  private busSubscriptions: Map<string, Set<string>> = new Map(); // busId -> socketIds
  private tripSubscriptions: Map<string, Set<string>> = new Map(); // tripId -> socketIds
  private organizationSubscriptions: Map<string, Set<string>> = new Map(); // orgId -> socketIds

  constructor(httpServer: HTTPServer) {
    this.httpServer = httpServer;
    this.io = new SocketIOServer(httpServer, {
      cors: {
        origin: '*',
        methods: ['GET', 'POST'],
      },
      pingTimeout: 60000,
      pingInterval: 25000,
    });

    this.setupMiddleware();
    this.setupEventHandlers();
  }

  private setupMiddleware() {
    this.io.use(async (socket: Socket, next: (err?: ExtendedError) => void) => {
      const authSocket = socket as AuthenticatedSocket;
      const token = authSocket.handshake.auth.token || authSocket.handshake.headers.authorization?.split(' ')[1];
      
      if (!token) {
        return next(new Error('Authentication required'));
      }

      try {
        const parts = token.split('.');
        if (parts.length === 3) {
          const payload = JSON.parse(Buffer.from(parts[1], 'base64').toString());
          authSocket.userId = payload.sub;
          authSocket.role = payload.role || 'PASSENGER';
          authSocket.driverId = payload.driverId;
          authSocket.organizationId = payload.orgId;
        }
      } catch (e) {
        // Token parsing failed, continue as anonymous
      }

      authSocket.subscriptions = new Set();
      next();
    });
  }

  private setupEventHandlers() {
    this.io.on('connection', (socket: Socket) => {
      const authSocket = socket as AuthenticatedSocket;
      console.log(`Client connected: ${authSocket.id} (user: ${authSocket.userId}, role: ${authSocket.role})`);
      this.connectedClients.set(authSocket.id, authSocket);

      // Handle subscription to bus updates
      authSocket.on('subscribe:bus', (busId: string) => {
        authSocket.subscriptions.add(`bus:${busId}`);
        authSocket.join(`bus:${busId}`);
        this.addToBusSubscription(busId, authSocket.id);
        console.log(`Socket ${authSocket.id} subscribed to bus ${busId}`);
      });

      authSocket.on('unsubscribe:bus', (busId: string) => {
        authSocket.subscriptions.delete(`bus:${busId}`);
        authSocket.leave(`bus:${busId}`);
        this.removeFromBusSubscription(busId, authSocket.id);
      });

      // Handle subscription to trip updates
      authSocket.on('subscribe:trip', (tripId: string) => {
        authSocket.subscriptions.add(`trip:${tripId}`);
        authSocket.join(`trip:${tripId}`);
        this.addToTripSubscription(tripId, authSocket.id);
        console.log(`Socket ${authSocket.id} subscribed to trip ${tripId}`);
      });

      authSocket.on('unsubscribe:trip', (tripId: string) => {
        authSocket.subscriptions.delete(`trip:${tripId}`);
        authSocket.leave(`trip:${tripId}`);
        this.removeFromTripSubscription(tripId, authSocket.id);
      });

      // Handle subscription to organization fleet (admin)
      authSocket.on('subscribe:org', (orgId: string) => {
        if (authSocket.role === 'ADMIN') {
          authSocket.subscriptions.add(`org:${orgId}`);
          authSocket.join(`org:${orgId}`);
          this.addToOrgSubscription(orgId, authSocket.id);
          console.log(`Admin socket ${authSocket.id} subscribed to org ${orgId}`);
        }
      });

      authSocket.on('unsubscribe:org', (orgId: string) => {
        authSocket.subscriptions.delete(`org:${orgId}`);
        authSocket.leave(`org:${orgId}`);
        this.removeFromOrgSubscription(orgId, authSocket.id);
      });

      // Handle driver location updates (alternative to HTTP)
      authSocket.on('driver:location', (data: { tripId: string; latitude: number; longitude: number; speed?: number; heading?: number; accuracy?: number }) => {
        if (authSocket.role === 'DRIVER' && authSocket.driverId) {
          this.broadcastBusLocation({
            busId: '', // Will be resolved from trip
            tripId: data.tripId,
            latitude: data.latitude,
            longitude: data.longitude,
            speed: data.speed ?? null,
            heading: data.heading ?? null,
            accuracy: data.accuracy ?? null,
            recordedAt: new Date().toISOString(),
          });
        }
      });

      authSocket.on('disconnect', (reason) => {
        console.log(`Client disconnected: ${authSocket.id} (${reason})`);
        this.cleanupSocket(authSocket);
        this.connectedClients.delete(authSocket.id);
      });
    });
  }

  private addToBusSubscription(busId: string, socketId: string) {
    if (!this.busSubscriptions.has(busId)) {
      this.busSubscriptions.set(busId, new Set());
    }
    this.busSubscriptions.get(busId)!.add(socketId);
  }

  private removeFromBusSubscription(busId: string, socketId: string) {
    const subs = this.busSubscriptions.get(busId);
    if (subs) {
      subs.delete(socketId);
      if (subs.size === 0) {
        this.busSubscriptions.delete(busId);
      }
    }
  }

  private addToTripSubscription(tripId: string, socketId: string) {
    if (!this.tripSubscriptions.has(tripId)) {
      this.tripSubscriptions.set(tripId, new Set());
    }
    this.tripSubscriptions.get(tripId)!.add(socketId);
  }

  private removeFromTripSubscription(tripId: string, socketId: string) {
    const subs = this.tripSubscriptions.get(tripId);
    if (subs) {
      subs.delete(socketId);
      if (subs.size === 0) {
        this.tripSubscriptions.delete(tripId);
      }
    }
  }

  private addToOrgSubscription(orgId: string, socketId: string) {
    if (!this.organizationSubscriptions.has(orgId)) {
      this.organizationSubscriptions.set(orgId, new Set());
    }
    this.organizationSubscriptions.get(orgId)!.add(socketId);
  }

  private removeFromOrgSubscription(orgId: string, socketId: string) {
    const subs = this.organizationSubscriptions.get(orgId);
    if (subs) {
      subs.delete(socketId);
      if (subs.size === 0) {
        this.organizationSubscriptions.delete(orgId);
      }
    }
  }

  private cleanupSocket(socket: AuthenticatedSocket) {
    for (const sub of socket.subscriptions) {
      if (sub.startsWith('bus:')) {
        this.removeFromBusSubscription(sub.slice(4), socket.id);
      } else if (sub.startsWith('trip:')) {
        this.removeFromTripSubscription(sub.slice(5), socket.id);
      } else if (sub.startsWith('org:')) {
        this.removeFromOrgSubscription(sub.slice(4), socket.id);
      }
    }
  }

  // Public broadcast methods
  broadcastBusLocation(payload: RealtimeEvent['payload']) {
    const event = createRealtimeEvent('bus.location.updated', payload);
    
    // Broadcast to trip subscribers (passengers tracking this trip)
    this.io.to(`trip:${payload.tripId}`).emit('bus.location.updated', event);
    
    // Broadcast to bus subscribers
    this.io.to(`bus:${payload.busId}`).emit('bus.location.updated', event);
    
    // Broadcast to organization subscribers (admin dashboard)
    // We'd need orgId from bus/trip - for now broadcast to all org rooms
    // In production, look up orgId from bus/trip
  }

  broadcastBusStatus(payload: RealtimeEvent['payload']) {
    const event = createRealtimeEvent('bus.status.updated', payload);
    this.io.to(`bus:${payload.busId}`).emit('bus.status.updated', event);
    this.io.to(`trip:${payload.tripId}`).emit('bus.status.updated', event);
  }

  broadcastTripStarted(payload: RealtimeEvent['payload']) {
    const event = createRealtimeEvent('trip.started', payload);
    this.io.to(`trip:${payload.tripId}`).emit('trip.started', event);
    this.io.to(`bus:${payload.busId}`).emit('trip.started', event);
  }

  broadcastTripUpdated(payload: RealtimeEvent['payload']) {
    const event = createRealtimeEvent('trip.updated', payload);
    this.io.to(`trip:${payload.tripId}`).emit('trip.updated', event);
    this.io.to(`bus:${payload.busId}`).emit('trip.updated', event);
  }

  broadcastTripEnded(payload: RealtimeEvent['payload']) {
    const event = createRealtimeEvent('trip.ended', payload);
    this.io.to(`trip:${payload.tripId}`).emit('trip.ended', event);
    this.io.to(`bus:${payload.busId}`).emit('trip.ended', event);
  }

  broadcastBusEta(payload: RealtimeEvent['payload']) {
    const event = createRealtimeEvent('bus.eta.updated', payload);
    this.io.to(`trip:${payload.tripId}`).emit('bus.eta.updated', event);
    this.io.to(`bus:${payload.busId}`).emit('bus.eta.updated', event);
  }

  broadcastBusAlert(payload: RealtimeEvent['payload']) {
    const event = createRealtimeEvent('bus.alert', payload);
    this.io.to(`trip:${payload.tripId}`).emit('bus.alert', event);
    this.io.to(`bus:${payload.busId}`).emit('bus.alert', event);
    // Also broadcast to org for admin
    this.io.emit('bus.alert', event); // Broadcast to all for now
  }

  // Generic broadcast to all connected clients
  broadcast(event: string, payload: any) {
    this.io.emit(event, createRealtimeEvent(event as any, payload));
  }

  // Get connected client count
  getConnectedCount(): number {
    return this.connectedClients.size;
  }

  // Get clients by role
  getClientsByRole(role: string): AuthenticatedSocket[] {
    return Array.from(this.connectedClients.values()).filter(s => s.role === role);
  }

  // Get the Socket.IO instance for direct access if needed
  getIO(): SocketIOServer {
    return this.io;
  }
}

// Singleton instance
let realtimeServerInstance: RealtimeServer | null = null;

export function initializeRealtimeServer(httpServer: HTTPServer): RealtimeServer {
  if (!realtimeServerInstance) {
    realtimeServerInstance = new RealtimeServer(httpServer);
  }
  return realtimeServerInstance;
}

export function getRealtimeServer(): RealtimeServer | null {
  return realtimeServerInstance;
}