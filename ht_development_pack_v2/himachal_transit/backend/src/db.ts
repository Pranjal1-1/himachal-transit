import * as fileDb from './db_file';

const USE_PG = !!process.env.DATABASE_URL;

async function getPg() {
  return await import('./db_pg');
}

export async function runDbMigrationsIfNeeded() {
  if (USE_PG) {
    try {
      const pg = await getPg();
      if (!pg || !pg.runMigrations) return;
      await pg.runMigrations();
      return;
    } catch (e) {
      // If pg is not installed or pool can't be initialized, skip migrations in local/test mode
      console.warn('Skipping Postgres migrations:', (e as any)?.message || e);
      return;
    }
  }
}

export function createUser(user: any) {
  if (USE_PG) return getPg().then((pg) => pg.createUser(user));
  return fileDb.createUser(user);
}

export function getUserByEmailOrPhone(identifier: string) {
  if (USE_PG) return getPg().then((pg) => pg.getUserByEmailOrPhone(identifier));
  return fileDb.getUserByEmailOrPhone(identifier);
}

export function getUserById(id: string) {
  if (USE_PG) return getPg().then((pg) => pg.getUserById(id));
  return fileDb.getUserById(id);
}

export function updateUser(id: string, patch: Partial<any>) {
  if (USE_PG) return getPg().then((pg) => pg.updateUser(id, patch));
  return fileDb.updateUser(id, patch as any);
}

export function storeRefreshToken(token: string, userId: string, ttlSec = 60 * 60 * 24 * 7) {
  if (USE_PG) return getPg().then((pg) => pg.storeRefreshToken(token, userId, ttlSec));
  return fileDb.storeRefreshToken(token, userId, ttlSec);
}

export function consumeRefreshToken(token: string) {
  if (USE_PG) return getPg().then((pg) => pg.consumeRefreshToken(token));
  return fileDb.consumeRefreshToken(token);
}

export function saveOTP(key: string, code: string, ttlSec = 5 * 60) {
  if (USE_PG) return getPg().then((pg) => pg.saveOTP(key, code, ttlSec));
  return fileDb.saveOTP(key, code, ttlSec);
}

export function verifyOTP(key: string, code: string) {
  if (USE_PG) return getPg().then((pg) => pg.verifyOTP(key, code));
  return fileDb.verifyOTP(key, code);
}

export function seedDriverIfMissing() {
  if (USE_PG) return getPg().then((pg) => pg.seedDriverIfMissing());
  return fileDb.seedDriverIfMissing();
}

export function getOrganizations() {
  if (USE_PG) return getPg().then((pg) => pg.getOrganizations());
  return fileDb.getOrganizations();
}

export function createOrganization(payload: any) {
  if (USE_PG) return getPg().then((pg) => pg.createOrganization(payload));
  return fileDb.createOrganization(payload);
}

export function getDrivers() {
  if (USE_PG) return getPg().then((pg) => pg.getDrivers());
  return fileDb.getDrivers();
}

export function getDriverByUserId(userId: string) {
  if (USE_PG) return getPg().then((pg) => pg.getDriverByUserId(userId));
  return fileDb.getDriverByUserId(userId);
}

export function createDriver(payload: any) {
  if (USE_PG) return getPg().then((pg) => pg.createDriver(payload));
  return fileDb.createDriver(payload);
}

export function getBuses() {
  if (USE_PG) return getPg().then((pg) => pg.getBuses());
  return fileDb.getBuses();
}

export function getBusById(id: string) {
  if (USE_PG) return getPg().then((pg) => pg.getBusById(id));
  return fileDb.getBusById(id);
}

export function createBus(payload: any) {
  if (USE_PG) return getPg().then((pg) => pg.createBus(payload));
  return fileDb.createBus(payload);
}

export function updateBus(id: string, patch: any) {
  if (USE_PG) return getPg().then((pg) => pg.updateBus(id, patch));
  return fileDb.updateBus(id, patch);
}

export function getRoutes() {
  if (USE_PG) return getPg().then((pg) => pg.getRoutes());
  return fileDb.getRoutes();
}

export function getRouteById(id: string) {
  if (USE_PG) return getPg().then((pg) => pg.getRouteById(id));
  return fileDb.getRouteById(id);
}

export function createRoute(payload: any) {
  if (USE_PG) return getPg().then((pg) => pg.createRoute(payload));
  return fileDb.createRoute(payload);
}

export function updateRoute(id: string, patch: any) {
  if (USE_PG) return getPg().then((pg) => pg.updateRoute(id, patch));
  return fileDb.updateRoute(id, patch);
}

export function getStops() {
  if (USE_PG) return getPg().then((pg) => pg.getStops());
  return fileDb.getStops();
}

export function getStopById(id: string) {
  if (USE_PG) return getPg().then((pg) => pg.getStopById(id));
  return fileDb.getStopById(id);
}

export function createStop(payload: any) {
  if (USE_PG) return getPg().then((pg) => pg.createStop(payload));
  return fileDb.createStop(payload);
}

export function updateStop(id: string, patch: any) {
  if (USE_PG) return getPg().then((pg) => pg.updateStop(id, patch));
  return fileDb.updateStop(id, patch);
}

export function getUsers() {
  if (USE_PG) return getPg().then((pg) => pg.getUsers());
  return fileDb.getUsers();
}

export function getTripById(id: string) {
  if (USE_PG) return getPg().then((pg) => pg.getTripById(id));
  return fileDb.getTripById(id);
}

export function getRouteStops(routeId: string) {
  if (USE_PG) return getPg().then((pg) => pg.getRouteStops(routeId));
  return fileDb.getRouteStops(routeId);
}

export function createRouteStop(payload: any) {
  if (USE_PG) return getPg().then((pg) => pg.createRouteStop(payload));
  return fileDb.createRouteStop(payload);
}

export function getAssignments() {
  if (USE_PG) return getPg().then((pg) => pg.getAssignments());
  return fileDb.getAssignments();
}

export function getAssignmentByDriverId(driverId: string) {
  if (USE_PG) return getPg().then((pg) => pg.getAssignmentByDriverId(driverId));
  return fileDb.getAssignmentByDriverId(driverId);
}

export function createAssignment(payload: any) {
  if (USE_PG) return getPg().then((pg) => pg.createAssignment(payload));
  return fileDb.createAssignment(payload);
}

export function getTrips() {
  if (USE_PG) return getPg().then((pg) => pg.getTrips());
  return fileDb.getTrips();
}

export function getActiveTripByDriverId(driverId: string) {
  if (USE_PG) return getPg().then((pg) => pg.getActiveTripByDriverId(driverId));
  return fileDb.getActiveTripByDriverId(driverId);
}

export function createTrip(payload: any) {
  if (USE_PG) return getPg().then((pg) => pg.createTrip(payload));
  return fileDb.createTrip(payload);
}

export function updateTrip(id: string, patch: any) {
  if (USE_PG) return getPg().then((pg) => pg.updateTrip(id, patch));
  return fileDb.updateTrip(id, patch);
}

export function getGpsLocations(tripId: string) {
  if (USE_PG) return getPg().then((pg) => pg.getGpsLocations(tripId));
  return fileDb.getGpsLocations(tripId);
}

export function addGpsLocation(payload: any) {
  if (USE_PG) return getPg().then((pg) => pg.addGpsLocation(payload));
  return fileDb.addGpsLocation(payload);
}

export function getNotifications(userId?: string) {
  if (USE_PG) return getPg().then((pg) => pg.getNotifications(userId));
  return fileDb.getNotifications(userId);
}

export function createNotification(payload: any) {
  if (USE_PG) return getPg().then((pg) => pg.createNotification(payload));
  return fileDb.createNotification(payload);
}

export function getAuditLogs() {
  if (USE_PG) return getPg().then((pg) => pg.getAuditLogs());
  return fileDb.getAuditLogs();
}

export function createAuditLog(payload: any) {
  if (USE_PG) return getPg().then((pg) => pg.createAuditLog(payload));
  return fileDb.createAuditLog(payload);
}
