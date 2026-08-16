import express from 'express';
import dotenv from 'dotenv';
import cors from 'cors';
import rateLimit from 'express-rate-limit';
import { createServer, Server as HTTPServer } from 'http';
import { registerUser, verifyPassword, issueTokens, decodeAccess, refreshTokens, getTrustedRole } from './auth';
import { saveOTP, verifyOTP } from './db';
import { runDbMigrationsIfNeeded } from './db';
import { initializeRealtimeServer, getRealtimeServer } from './realtime';
import {
  BusFuelType,
  BusEmissionStandard,
  BusStatus,
  RouteStatus,
  StopStatus,
  BusFuelTypeValues,
  BusEmissionStandardValues,
  BusStatusValues,
  RouteStatusValues,
  StopStatusValues,
  isValidBusFuelType,
  isValidBusEmissionStandard,
  isValidBusStatus,
  isValidRouteStatus,
  isValidStopStatus,
} from './enums';

dotenv.config();

const app = express();
const PORT = process.env.PORT || 3000;

const httpServer: HTTPServer = createServer(app);

app.use(cors());
app.use(express.json());

const authLimiter = rateLimit({ windowMs: 60 * 1000, max: 10, skip: () => process.env.NODE_ENV === 'test' });

async function getRoleFromRequest(req: any) {
  const token = req.headers.authorization?.split(' ')[1];
  if (!token) return null;
  const decoded = decodeAccess(token);
  if (!decoded) return null;
  return getTrustedRole(decoded.sub);
}

async function requireAdmin(req: any, res: any) {
  const role = await getRoleFromRequest(req);
  if (!role) return res.status(401).json({ error: 'Missing or invalid token' });
  if (role.role !== 'ADMIN') return res.status(403).json({ error: 'Forbidden' });
  return role;
}

app.get('/health', (_req, res) => {
  res.json({ status: 'ok', env: process.env.NODE_ENV || 'development' });
});

app.post('/auth/register', authLimiter, async (req, res) => {
  try {
    const { fullName, phone, email, password, confirmPassword } = req.body;
    if (!fullName || !phone || !email || !password || password !== confirmPassword) {
      console.error('Invalid register input', { fullName, phone, email, passwordPresent: !!password, confirmPasswordPresent: !!confirmPassword });
      return res.status(400).json({ error: 'Invalid input' });
    }
    const user = await registerUser({ fullName, phone, email, password });
    const tokens = await issueTokens(user.id);
    return res.json({ userId: user.id, role: 'PASSENGER', tokens });
  } catch (e: any) {
    return res.status(400).json({ error: e.message });
  }
});

app.post('/auth/login', authLimiter, async (req, res) => {
  try {
    const { identifier, password } = req.body; // identifier = email or phone
    if (!identifier || !password) return res.status(400).json({ error: 'Missing credentials' });
    const user = await (async () => {
      // dynamic import to reuse getUserByEmailOrPhone
      const mod = await import('./db');
      return mod.getUserByEmailOrPhone(identifier);
    })();
    if (!user) return res.status(401).json({ error: 'Invalid credentials' });
    const ok = await verifyPassword(user, password);
    if (!ok) return res.status(401).json({ error: 'Invalid credentials' });
    const tokens = await issueTokens(user.id);
    const role = await getTrustedRole(user.id);
    return res.json({ ...(role as any), tokens });
  } catch (e: any) {
    return res.status(500).json({ error: e.message });
  }
});

app.post('/auth/otp/request', authLimiter, (req, res) => {
  const { identifier } = req.body;
  if (!identifier) return res.status(400).json({ error: 'Missing identifier' });
  // For Phase 2 we simulate OTP send by storing it and returning a debug hint
  const code = Math.floor(100000 + Math.random() * 900000).toString();
  saveOTP(identifier, code);
  return res.json({ ok: true, debug_code: code });
});

app.post('/auth/otp/verify', (req, res) => {
  const { identifier, code } = req.body;
  if (!identifier || !code) return res.status(400).json({ error: 'Missing' });
  const ok = verifyOTP(identifier, code);
  if (!ok) return res.status(400).json({ error: 'Invalid or expired code' });
  return res.json({ ok: true });
});

app.post('/auth/refresh', async (req, res) => {
  const { refresh } = req.body;
  if (!refresh) return res.status(400).json({ error: 'Missing refresh' });
  const tokens = await refreshTokens(refresh as string);
  if (!tokens) return res.status(401).json({ error: 'Invalid refresh' });
  return res.json(tokens);
});

app.post('/auth/logout', (req, res) => {
  // consume refresh token if provided
  const { refresh } = req.body;
  if (refresh) {
    try {
      const mod = require('./db');
      mod.consumeRefreshToken(refresh);
    } catch (e) {
      // ignore
    }
  }
  return res.json({ ok: true });
});

app.get('/organizations', async (_req, res) => {
  try {
    const db = await import('./db');
    const organizations = await db.getOrganizations();
    return res.json(organizations);
  } catch (e: any) {
    return res.status(500).json({ error: e.message });
  }
});

app.post('/organizations', async (req, res) => {
  try {
    const { name, code } = req.body;
    if (!name || !code) return res.status(400).json({ error: 'Missing name or code' });
    const db = await import('./db');
    const org = await db.createOrganization({ name, code });
    return res.status(201).json(org);
  } catch (e: any) {
    return res.status(500).json({ error: e.message });
  }
});

app.get('/drivers', async (_req, res) => {
  try {
    const db = await import('./db');
    const drivers = await db.getDrivers();
    return res.json(drivers);
  } catch (e: any) {
    return res.status(500).json({ error: e.message });
  }
});

app.post('/drivers', async (req, res) => {
  try {
    const { userId, organizationId, employeeId, verificationStatus } = req.body;
    if (!userId || !organizationId || !employeeId) return res.status(400).json({ error: 'Missing required driver fields' });
    const db = await import('./db');
    const driver = await db.createDriver({ userId, organizationId, employeeId, verificationStatus });
    return res.status(201).json(driver);
  } catch (e: any) {
    return res.status(500).json({ error: e.message });
  }
});

app.get('/buses', async (_req, res) => {
  try {
    const db = await import('./db');
    const buses = await db.getBuses();
    return res.json(buses);
  } catch (e: any) {
    return res.status(500).json({ error: e.message });
  }
});

app.post('/buses', async (req, res) => {
  try {
    const admin = await requireAdmin(req, res);
    if (!admin || admin.role !== 'ADMIN') return;
    const { organizationId, registrationNumber, model, fuelType, emissionStandard, capacity, status } = req.body;
    if (!organizationId || !registrationNumber) return res.status(400).json({ error: 'Missing required bus fields' });
    if (fuelType && !isValidBusFuelType(fuelType)) return res.status(400).json({ error: `Invalid fuelType. Allowed: ${BusFuelTypeValues.join(', ')}` });
    if (emissionStandard && !isValidBusEmissionStandard(emissionStandard)) return res.status(400).json({ error: `Invalid emissionStandard. Allowed: ${BusEmissionStandardValues.join(', ')}` });
    if (status && !isValidBusStatus(status)) return res.status(400).json({ error: `Invalid status. Allowed: ${BusStatusValues.join(', ')}` });
    const db = await import('./db');
    const bus = await db.createBus({ organizationId, registrationNumber, model, fuelType, emissionStandard, capacity, status: status || BusStatus.IN_SERVICE });
    return res.status(201).json(bus);
  } catch (e: any) {
    return res.status(500).json({ error: e.message });
  }
});

app.get('/buses/:busId', async (req, res) => {
  try {
    const { busId } = req.params;
    const db = await import('./db');
    const bus = await db.getBusById(busId);
    if (!bus) return res.status(404).json({ error: 'Bus not found' });
    return res.json(bus);
  } catch (e: any) {
    return res.status(500).json({ error: e.message });
  }
});

app.patch('/buses/:busId', async (req, res) => {
  try {
    const admin = await requireAdmin(req, res);
    if (!admin || admin.role !== 'ADMIN') return;
    const { busId } = req.params;
    const patch = req.body;
    if (patch.fuelType && !isValidBusFuelType(patch.fuelType)) return res.status(400).json({ error: `Invalid fuelType. Allowed: ${BusFuelTypeValues.join(', ')}` });
    if (patch.emissionStandard && !isValidBusEmissionStandard(patch.emissionStandard)) return res.status(400).json({ error: `Invalid emissionStandard. Allowed: ${BusEmissionStandardValues.join(', ')}` });
    if (patch.status && !isValidBusStatus(patch.status)) return res.status(400).json({ error: `Invalid status. Allowed: ${BusStatusValues.join(', ')}` });
    const db = await import('./db');
    const updated = await db.updateBus(busId, patch);
    if (!updated) return res.status(404).json({ error: 'Bus not found' });
    
    // Broadcast bus status updated event
    if (patch.status) {
      const realtimeServer = getRealtimeServer();
      if (realtimeServer) {
        realtimeServer.broadcastBusStatus({
          busId: updated.id,
          status: updated.status,
          updatedAt: new Date().toISOString(),
        });
      }
    }
    
    return res.json(updated);
  } catch (e: any) {
    return res.status(500).json({ error: e.message });
  }
});

app.get('/routes', async (_req, res) => {
  try {
    const db = await import('./db');
    const routes = await db.getRoutes();
    return res.json(routes);
  } catch (e: any) {
    return res.status(500).json({ error: e.message });
  }
});

app.post('/routes', async (req, res) => {
  try {
    const admin = await requireAdmin(req, res);
    if (!admin || admin.role !== 'ADMIN') return;
    const { organizationId, name, origin, destination, geometry, status } = req.body;
    if (!organizationId || !name) return res.status(400).json({ error: 'Missing required route fields' });
    if (status && !isValidRouteStatus(status)) return res.status(400).json({ error: `Invalid status. Allowed: ${RouteStatusValues.join(', ')}` });
    const db = await import('./db');
    const route = await db.createRoute({ organizationId, name, origin, destination, geometry, status: status || RouteStatus.ACTIVE });
    return res.status(201).json(route);
  } catch (e: any) {
    return res.status(500).json({ error: e.message });
  }
});

app.get('/routes/:routeId', async (req, res) => {
  try {
    const { routeId } = req.params;
    const db = await import('./db');
    const route = await db.getRouteById(routeId);
    if (!route) return res.status(404).json({ error: 'Route not found' });
    return res.json(route);
  } catch (e: any) {
    return res.status(500).json({ error: e.message });
  }
});

app.patch('/routes/:routeId', async (req, res) => {
  try {
    const admin = await requireAdmin(req, res);
    if (!admin || admin.role !== 'ADMIN') return;
    const { routeId } = req.params;
    const patch = req.body;
    if (patch.status && !isValidRouteStatus(patch.status)) return res.status(400).json({ error: `Invalid status. Allowed: ${RouteStatusValues.join(', ')}` });
    const db = await import('./db');
    const updated = await db.updateRoute(routeId, patch);
    if (!updated) return res.status(404).json({ error: 'Route not found' });
    return res.json(updated);
  } catch (e: any) {
    return res.status(500).json({ error: e.message });
  }
});

// Search buses by origin/destination
app.get('/search/buses', async (req, res) => {
  try {
    const { origin, destination } = req.query;
    const db = await import('./db');
    const buses = await db.searchBuses(origin as string, destination as string);
    return res.json(buses);
  } catch (e: any) {
    return res.status(500).json({ error: e.message });
  }
});

// Get nearby buses based on location
app.get('/buses/nearby', async (req, res) => {
  try {
    const { latitude, longitude, radiusKm } = req.query;
    if (!latitude || !longitude) return res.status(400).json({ error: 'Missing latitude/longitude' });
    const lat = parseFloat(latitude as string);
    const lon = parseFloat(longitude as string);
    const radius = radiusKm ? parseFloat(radiusKm as string) : 10;
    if (isNaN(lat) || isNaN(lon)) return res.status(400).json({ error: 'Invalid latitude/longitude' });
    const db = await import('./db');
    const buses = await db.getNearbyBuses(lat, lon, radius);
    return res.json(buses);
  } catch (e: any) {
    return res.status(500).json({ error: e.message });
  }
});

// Saved routes endpoints (require auth)
app.get('/saved-routes', async (req, res) => {
  try {
    const token = req.headers.authorization?.split(' ')[1];
    if (!token) return res.status(401).json({ error: 'Missing token' });
    const decoded = decodeAccess(token);
    if (!decoded) return res.status(401).json({ error: 'Invalid token' });
    const db = await import('./db');
    const savedRoutes = await db.getSavedRoutes(decoded.sub);
    return res.json(savedRoutes);
  } catch (e: any) {
    return res.status(500).json({ error: e.message });
  }
});

app.post('/saved-routes', async (req, res) => {
  try {
    const token = req.headers.authorization?.split(' ')[1];
    if (!token) return res.status(401).json({ error: 'Missing token' });
    const decoded = decodeAccess(token);
    if (!decoded) return res.status(401).json({ error: 'Invalid token' });
    const { routeId } = req.body;
    if (!routeId) return res.status(400).json({ error: 'Missing routeId' });
    const db = await import('./db');
    const savedRoute = await db.saveRoute(decoded.sub, routeId);
    return res.status(201).json(savedRoute);
  } catch (e: any) {
    return res.status(500).json({ error: e.message });
  }
});

app.delete('/saved-routes/:routeId', async (req, res) => {
  try {
    const token = req.headers.authorization?.split(' ')[1];
    if (!token) return res.status(401).json({ error: 'Missing token' });
    const decoded = decodeAccess(token);
    if (!decoded) return res.status(401).json({ error: 'Invalid token' });
    const { routeId } = req.params;
    const db = await import('./db');
    const success = await db.unsaveRoute(decoded.sub, routeId);
    if (!success) return res.status(404).json({ error: 'Saved route not found' });
    return res.status(204).send();
  } catch (e: any) {
    return res.status(500).json({ error: e.message });
  }
});

// Favourite buses endpoints (require auth)
app.get('/favourite-buses', async (req, res) => {
  try {
    const token = req.headers.authorization?.split(' ')[1];
    if (!token) return res.status(401).json({ error: 'Missing token' });
    const decoded = decodeAccess(token);
    if (!decoded) return res.status(401).json({ error: 'Invalid token' });
    const db = await import('./db');
    const favourites = await db.getFavouriteBuses(decoded.sub);
    return res.json(favourites);
  } catch (e: any) {
    return res.status(500).json({ error: e.message });
  }
});

app.post('/favourite-buses', async (req, res) => {
  try {
    const token = req.headers.authorization?.split(' ')[1];
    if (!token) return res.status(401).json({ error: 'Missing token' });
    const decoded = decodeAccess(token);
    if (!decoded) return res.status(401).json({ error: 'Invalid token' });
    const { busId } = req.body;
    if (!busId) return res.status(400).json({ error: 'Missing busId' });
    const db = await import('./db');
    const favourite = await db.favouriteBus(decoded.sub, busId);
    return res.status(201).json(favourite);
  } catch (e: any) {
    return res.status(500).json({ error: e.message });
  }
});

app.delete('/favourite-buses/:busId', async (req, res) => {
  try {
    const token = req.headers.authorization?.split(' ')[1];
    if (!token) return res.status(401).json({ error: 'Missing token' });
    const decoded = decodeAccess(token);
    if (!decoded) return res.status(401).json({ error: 'Invalid token' });
    const { busId } = req.params;
    const db = await import('./db');
    const success = await db.unfavouriteBus(decoded.sub, busId);
    if (!success) return res.status(404).json({ error: 'Favourite bus not found' });
    return res.status(204).send();
  } catch (e: any) {
    return res.status(500).json({ error: e.message });
  }
});

app.get('/stops', async (_req, res) => {
  try {
    const db = await import('./db');
    const stops = await db.getStops();
    return res.json(stops);
  } catch (e: any) {
    return res.status(500).json({ error: e.message });
  }
});

app.post('/stops', async (req, res) => {
  try {
    const admin = await requireAdmin(req, res);
    if (!admin || admin.role !== 'ADMIN') return;
    const { name, latitude, longitude, address, status } = req.body;
    if (!name || latitude == null || longitude == null) return res.status(400).json({ error: 'Missing required stop fields' });
    if (status && !isValidStopStatus(status)) return res.status(400).json({ error: `Invalid status. Allowed: ${StopStatusValues.join(', ')}` });
    const db = await import('./db');
    const stop = await db.createStop({ name, latitude, longitude, address, status: status || StopStatus.ACTIVE });
    return res.status(201).json(stop);
  } catch (e: any) {
    return res.status(500).json({ error: e.message });
  }
});

app.get('/stops/:stopId', async (req, res) => {
  try {
    const { stopId } = req.params;
    const db = await import('./db');
    const stop = await db.getStopById(stopId);
    if (!stop) return res.status(404).json({ error: 'Stop not found' });
    return res.json(stop);
  } catch (e: any) {
    return res.status(500).json({ error: e.message });
  }
});

app.patch('/stops/:stopId', async (req, res) => {
  try {
    const admin = await requireAdmin(req, res);
    if (!admin || admin.role !== 'ADMIN') return;
    const { stopId } = req.params;
    const patch = req.body;
    if (patch.status && !isValidStopStatus(patch.status)) return res.status(400).json({ error: `Invalid status. Allowed: ${StopStatusValues.join(', ')}` });
    const db = await import('./db');
    const updated = await db.updateStop(stopId, patch);
    if (!updated) return res.status(404).json({ error: 'Stop not found' });
    return res.json(updated);
  } catch (e: any) {
    return res.status(500).json({ error: e.message });
  }
});

app.get('/users', async (_req, res) => {
  try {
    const db = await import('./db');
    const users = await db.getUsers();
    return res.json(users);
  } catch (e: any) {
    return res.status(500).json({ error: e.message });
  }
});

app.get('/routes/:routeId/stops', async (req, res) => {
  try {
    const { routeId } = req.params;
    const db = await import('./db');
    const routeStops = await db.getRouteStops(routeId);
    return res.json(routeStops);
  } catch (e: any) {
    return res.status(500).json({ error: e.message });
  }
});

app.post('/route-stops', async (req, res) => {
  try {
    const admin = await requireAdmin(req, res);
    if (!admin || admin.role !== 'ADMIN') return;
    const { routeId, stopId, stopOrder } = req.body;
    if (!routeId || !stopId || stopOrder == null) return res.status(400).json({ error: 'Missing route stop fields' });
    const db = await import('./db');
    const routeStop = await db.createRouteStop({ routeId, stopId, stopOrder });
    return res.status(201).json(routeStop);
  } catch (e: any) {
    return res.status(500).json({ error: e.message });
  }
});

app.get('/assignments', async (_req, res) => {
  try {
    const db = await import('./db');
    const assignments = await db.getAssignments();
    return res.json(assignments);
  } catch (e: any) {
    return res.status(500).json({ error: e.message });
  }
});

app.post('/assignments', async (req, res) => {
  try {
    const role = await getRoleFromRequest(req);
    if (!role) return res.status(401).json({ error: 'Missing or invalid token' });
    if (role.role !== 'ADMIN') return res.status(403).json({ error: 'Forbidden' });
    const { driverId, busId, startTime, endTime, status } = req.body;
    if (!driverId || !busId) return res.status(400).json({ error: 'Missing required assignment fields' });
    const db = await import('./db');
    const assignment = await db.createAssignment({ driverId, busId, startTime, endTime, status });
    return res.status(201).json(assignment);
  } catch (e: any) {
    return res.status(500).json({ error: e.message });
  }
});

app.get('/trips', async (_req, res) => {
  try {
    const db = await import('./db');
    const trips = await db.getTrips();
    return res.json(trips);
  } catch (e: any) {
    return res.status(500).json({ error: e.message });
  }
});

app.get('/trips/:tripId', async (req, res) => {
  try {
    const { tripId } = req.params;
    const db = await import('./db');
    const trip = await db.getTripById(tripId);
    if (!trip) return res.status(404).json({ error: 'Trip not found' });
    return res.json(trip);
  } catch (e: any) {
    return res.status(500).json({ error: e.message });
  }
});

app.post('/trips', async (req, res) => {
  try {
    const { driverId, busId, routeId, startTime, endTime, status } = req.body;
    if (!driverId || !busId || !routeId) return res.status(400).json({ error: 'Missing required trip fields' });
    const db = await import('./db');
    const trip = await db.createTrip({ driverId, busId, routeId, startTime, endTime, status });
    
    // Broadcast trip started event if status is ACTIVE
    if (trip.status === 'ACTIVE') {
      const realtimeServer = getRealtimeServer();
      if (realtimeServer) {
        realtimeServer.broadcastTripStarted({
          tripId: trip.id,
          driverId: trip.driver_id,
          busId: trip.bus_id,
          routeId: trip.route_id,
          startTime: trip.start_time || new Date().toISOString(),
        });
      }
    }
    
    return res.status(201).json(trip);
  } catch (e: any) {
    return res.status(500).json({ error: e.message });
  }
});

app.patch('/trips/:tripId', async (req, res) => {
  try {
    const { tripId } = req.params;
    const patch = req.body;
    const db = await import('./db');
    const updated = await db.updateTrip(tripId, patch);
    if (!updated) return res.status(404).json({ error: 'Trip not found' });
    
    // Broadcast trip updated/ended events
    const realtimeServer = getRealtimeServer();
    if (realtimeServer) {
      if (patch.status === 'COMPLETED' || patch.status === 'ENDED') {
        realtimeServer.broadcastTripEnded({
          tripId: updated.id,
          driverId: updated.driver_id,
          busId: updated.bus_id,
          endTime: patch.endTime || new Date().toISOString(),
        });
      } else {
        realtimeServer.broadcastTripUpdated({
          tripId: updated.id,
          status: updated.status,
          startTime: updated.start_time,
          endTime: updated.end_time,
        });
      }
    }
    
    return res.json(updated);
  } catch (e: any) {
    return res.status(500).json({ error: e.message });
  }
});

app.get('/gps', async (req, res) => {
  try {
    const { tripId } = req.query;
    if (!tripId) return res.status(400).json({ error: 'Missing tripId' });
    const db = await import('./db');
    const locations = await db.getGpsLocations(tripId as string);
    return res.json(locations);
  } catch (e: any) {
    return res.status(500).json({ error: e.message });
  }
});

app.post('/gps', async (req, res) => {
  try {
    const { tripId, latitude, longitude, speed, heading, accuracy, recordedAt } = req.body;
    if (!tripId || latitude == null || longitude == null) return res.status(400).json({ error: 'Missing GPS location fields' });
    
    // Verify driver has active trip and assigned bus
    const token = req.headers.authorization?.split(' ')[1];
    if (!token) return res.status(401).json({ error: 'Missing or invalid token' });
    const decoded = decodeAccess(token);
    if (!decoded) return res.status(401).json({ error: 'Missing or invalid token' });
    const role = await getTrustedRole(decoded.sub);
    if (!role || role.role !== 'DRIVER') return res.status(403).json({ error: 'Forbidden: Drivers only' });
    
    const db = await import('./db');
    const activeTrip = await db.getActiveTripByDriverId(role.driverId);
    if (!activeTrip) return res.status(403).json({ error: 'No active trip for this driver' });
    if (activeTrip.id !== tripId) return res.status(403).json({ error: 'Trip ID does not match active trip' });
    
    const assignment = await db.getAssignmentByDriverId(role.driverId);
    if (!assignment) return res.status(403).json({ error: 'No active bus assignment for this driver' });
    
    const location = await db.addGpsLocation({ tripId, latitude, longitude, speed, heading, accuracy, recordedAt });
    
    // Broadcast realtime bus location update
    const realtimeServer = getRealtimeServer();
    if (realtimeServer) {
      realtimeServer.broadcastBusLocation({
        busId: assignment.bus_id,
        tripId: tripId,
        latitude,
        longitude,
        speed: speed ?? null,
        heading: heading ?? null,
        accuracy: accuracy ?? null,
        recordedAt: recordedAt || new Date().toISOString(),
      });

      // Calculate and broadcast ETA update
      const db = await import('./db');
      const eta = await db.calculateTripEta(tripId);
      if (eta) {
        realtimeServer.broadcastBusEta({
          tripId: tripId,
          busId: assignment.bus_id,
          ...eta,
        });
      }
    }
    
    return res.status(201).json(location);
  } catch (e: any) {
    return res.status(500).json({ error: e.message });
  }
});

// GET /trips/:tripId/eta - Get ETA for a trip
app.get('/trips/:tripId/eta', async (req, res) => {
  try {
    const { tripId } = req.params;
    const db = await import('./db');
    const eta = await db.calculateTripEta(tripId);
    if (!eta) return res.status(404).json({ error: 'Trip not found or no route data' });
    return res.json(eta);
  } catch (e: any) {
    return res.status(500).json({ error: e.message });
  }
});

app.get('/notifications', async (req, res) => {
  try {
    const { userId } = req.query;
    const db = await import('./db');
    const notifications = await db.getNotifications(userId as string | undefined);
    return res.json(notifications);
  } catch (e: any) {
    return res.status(500).json({ error: e.message });
  }
});

app.post('/notifications', async (req, res) => {
  try {
    const { userId, title, body, read } = req.body;
    if (!title || !body) return res.status(400).json({ error: 'Missing notification title or body' });
    const db = await import('./db');
    const notification = await db.createNotification({ userId, title, body, read });
    return res.status(201).json(notification);
  } catch (e: any) {
    return res.status(500).json({ error: e.message });
  }
});

app.get('/audit-logs', async (_req, res) => {
  try {
    const db = await import('./db');
    const logs = await db.getAuditLogs();
    return res.json(logs);
  } catch (e: any) {
    return res.status(500).json({ error: e.message });
  }
});

app.post('/audit-logs', async (req, res) => {
  try {
    const { userId, action, meta } = req.body;
    if (!action) return res.status(400).json({ error: 'Missing action' });
    const db = await import('./db');
    const log = await db.createAuditLog({ userId, action, meta });
    return res.status(201).json(log);
  } catch (e: any) {
    return res.status(500).json({ error: e.message });
  }
});

// Driver verification endpoint (organization flow)
app.post('/auth/driver/verify', authLimiter, async (req, res) => {
  const { identifier, orgCode, password } = req.body;
  if (!identifier || !orgCode || !password) return res.status(400).json({ error: 'Missing' });
  // For Phase 2 we simulate org verification: if orgCode === 'ORG123' then verify driver
  const mod = await import('./db');
  const user = await mod.getUserByEmailOrPhone(identifier);
  if (!user) return res.status(404).json({ error: 'Driver not found' });
  if (user.role !== 'DRIVER') return res.status(403).json({ error: 'Not a driver' });
  if (orgCode !== 'ORG123') return res.status(403).json({ error: 'Invalid org' });
  // require password match too
  const pwOk = await verifyPassword(user, password);
  if (!pwOk) return res.status(401).json({ error: 'Invalid credentials' });
  const tokens = await issueTokens(user.id);
  const role = await getTrustedRole(user.id);
  return res.json({ ...(role as any), tokens });
});

// Protected sample endpoint to demonstrate role-based access
app.get('/protected/driver-only', async (req, res) => {
  const auth = req.headers.authorization?.split(' ')[1];
  const decoded = auth ? decodeAccess(auth) : null;
  if (!decoded) return res.status(401).json({ error: 'Missing or invalid token' });
  const role = await getTrustedRole(decoded.sub);
  if (!role || role.role !== 'DRIVER') return res.status(403).json({ error: 'Forbidden' });
  return res.json({ ok: true, message: 'Driver content' });
});

// Run migrations (file DB is no-op)
runDbMigrationsIfNeeded().catch((e) => {
  console.error('Migrations failed', e);
  process.exit(1);
});

// Initialize WebSocket server
let realtimeServer: ReturnType<typeof initializeRealtimeServer> | null = null;

if (require.main === module) {
  httpServer.listen(PORT, () => {
    // Initialize realtime server after HTTP server is listening
    realtimeServer = initializeRealtimeServer(httpServer);
    console.log(`Backend listening on http://localhost:${PORT}`);
    console.log(`WebSocket server initialized`);
  });
}

export { app, httpServer, getRealtimeServer };
export default app;
// CommonJS compatibility for tests that use require()
(module as any).exports = app;

