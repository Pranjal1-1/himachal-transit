export interface RealtimeEvent<T = any> {
  event: string;
  payload: T;
  timestamp: string;
}

export interface BusLocationUpdatedPayload {
  busId: string;
  tripId: string;
  latitude: number;
  longitude: number;
  speed: number | null;
  heading: number | null;
  accuracy: number | null;
  recordedAt: string;
}

export interface BusStatusUpdatedPayload {
  busId: string;
  status: string;
  updatedAt: string;
}

export interface TripStartedPayload {
  tripId: string;
  driverId: string;
  busId: string;
  routeId: string;
  startTime: string;
}

export interface TripUpdatedPayload {
  tripId: string;
  status: string;
  startTime?: string;
  endTime?: string;
}

export interface TripEndedPayload {
  tripId: string;
  driverId: string;
  busId: string;
  endTime: string;
}

export interface BusEtaUpdatedPayload {
  busId: string;
  tripId: string;
  nextStopId: string;
  etaMinutes: number;
  distanceMeters: number;
}

export interface BusAlertPayload {
  busId: string;
  tripId: string;
  alertType: 'speed' | 'deviation' | 'delay' | 'offline' | 'panic';
  message: string;
  severity: 'info' | 'warning' | 'critical';
  timestamp: string;
}

export type RealtimeEventType = 
  | 'trip.started'
  | 'trip.updated'
  | 'trip.ended'
  | 'bus.location.updated'
  | 'bus.status.updated'
  | 'bus.eta.updated'
  | 'bus.alert';

export const REALTIME_EVENTS: RealtimeEventType[] = [
  'trip.started',
  'trip.updated',
  'trip.ended',
  'bus.location.updated',
  'bus.status.updated',
  'bus.eta.updated',
  'bus.alert',
];

export function createRealtimeEvent<T>(event: RealtimeEventType, payload: T): RealtimeEvent<T> {
  return {
    event,
    payload,
    timestamp: new Date().toISOString(),
  };
}