import fs from 'fs/promises';
import path from 'path';
import { v4 as uuidv4 } from 'uuid';
import bcrypt from 'bcrypt';

const DATA_FILE = path.join(__dirname, '..', 'data.json');

async function ensureData() {
  try {
    await fs.access(DATA_FILE);
  } catch (e) {
    const init = { users: [], organizations: [], drivers: [], buses: [], routes: [], stops: [], route_stops: [], driver_bus_assignments: [], trips: [], gps_locations: [], notifications: [], audit_logs: [], refresh_tokens: [], otps: [] };
    await fs.writeFile(DATA_FILE, JSON.stringify(init, null, 2), 'utf8');
  }
}

async function readData() {
  await ensureData();
  const raw = await fs.readFile(DATA_FILE, 'utf8');
  return JSON.parse(raw);
}

async function writeData(d: any) {
  await ensureData();
  await fs.writeFile(DATA_FILE, JSON.stringify(d, null, 2), 'utf8');
}

export async function runMigrations() {
  // no-op for file DB
  return;
}

export async function createUser({ fullName, phone, email, passwordHash, role = 'PASSENGER' }: any) {
  const d = await readData();
  const user = { id: uuidv4(), full_name: fullName || null, phone: phone || null, email: email || null, password_hash: passwordHash || null, role, created_at: Date.now(), updated_at: Date.now() };
  d.users.push(user);
  await writeData(d);
  return user;
}

export async function getUserByEmailOrPhone(identifier: string) {
  const d = await readData();
  return d.users.find((u: any) => u.email === identifier || u.phone === identifier) || null;
}

export async function getUserById(id: string) {
  const d = await readData();
  return d.users.find((u: any) => u.id === id) || null;
}

export async function updateUser(id: string, patch: any) {
  const d = await readData();
  const idx = d.users.findIndex((u: any) => u.id === id);
  if (idx === -1) return null;
  d.users[idx] = { ...d.users[idx], ...patch, updated_at: Date.now() };
  await writeData(d);
  return d.users[idx];
}

export async function storeRefreshToken(token: string, userId: string, ttlSec = 60 * 60 * 24 * 7) {
  const d = await readData();
  const expiresAt = Date.now() + ttlSec * 1000;
  d.refresh_tokens.push({ token, userId, expiresAt, created_at: Date.now() });
  await writeData(d);
}

export async function consumeRefreshToken(token: string) {
  const d = await readData();
  const idx = d.refresh_tokens.findIndex((t: any) => t.token === token);
  if (idx === -1) return null;
  const rec = d.refresh_tokens.splice(idx, 1)[0];
  await writeData(d);
  if (rec.expiresAt < Date.now()) return null;
  return rec.userId;
}

export async function saveOTP(key: string, code: string, ttlSec = 5 * 60) {
  const d = await readData();
  d.otps.push({ key, code, expiresAt: Date.now() + ttlSec * 1000, created_at: Date.now() });
  await writeData(d);
}

export async function verifyOTP(key: string, code: string) {
  const d = await readData();
  for (let i = d.otps.length - 1; i >= 0; i--) {
    const o = d.otps[i];
    if (o.key === key && o.code === code && o.expiresAt > Date.now()) return true;
  }
  return false;
}

export async function getOrganizations() {
  const d = await readData();
  return d.organizations || [];
}

export async function createOrganization({ name, code }: any) {
  const d = await readData();
  if (!d.organizations) d.organizations = [];
  const org = { id: uuidv4(), name, code, created_at: Date.now() };
  d.organizations.push(org);
  await writeData(d);
  return org;
}

export async function getDrivers() {
  const d = await readData();
  return d.drivers.map((driver: any) => {
    const user = d.users.find((u: any) => u.id === driver.user_id);
    return { ...driver, user };
  });
}

export async function getDriverByUserId(userId: string) {
  const d = await readData();
  return (d.drivers || []).find((driver: any) => driver.user_id === userId) || null;
}

export async function createDriver({ userId, organizationId, employeeId, verificationStatus = 'PENDING' }: any) {
  const d = await readData();
  if (!d.drivers) d.drivers = [];
  const driver = { id: uuidv4(), user_id: userId, organization_id: organizationId, employee_id: employeeId, verification_status: verificationStatus, status: 'ACTIVE', created_at: Date.now() };
  d.drivers.push(driver);
  await writeData(d);
  return driver;
}

export async function getBuses() {
  const d = await readData();
  return d.buses || [];
}

export async function createBus({ organizationId, registrationNumber, model, fuelType, emissionStandard, capacity, status = 'IN_SERVICE' }: any) {
  const d = await readData();
  if (!d.buses) d.buses = [];
  const bus = { id: uuidv4(), organization_id: organizationId, registration_number: registrationNumber, model, fuel_type: fuelType, emission_standard: emissionStandard, capacity, status, created_at: Date.now(), updated_at: Date.now() };
  d.buses.push(bus);
  await writeData(d);
  return bus;
}

export async function getBusById(id: string) {
  const d = await readData();
  return (d.buses || []).find((bus: any) => bus.id === id) || null;
}

export async function updateBus(id: string, patch: any) {
  const d = await readData();
  const idx = (d.buses || []).findIndex((bus: any) => bus.id === id);
  if (idx === -1) return null;
  d.buses[idx] = { ...d.buses[idx], ...patch, updated_at: Date.now() };
  await writeData(d);
  return d.buses[idx];
}

export async function getRoutes() {
  const d = await readData();
  return d.routes || [];
}

export async function createRoute({ organizationId, name, origin, destination, geometry }: any) {
  const d = await readData();
  if (!d.routes) d.routes = [];
  const route = { id: uuidv4(), organization_id: organizationId, name, origin, destination, geometry: geometry || null, status: 'ACTIVE', created_at: Date.now(), updated_at: Date.now() };
  d.routes.push(route);
  await writeData(d);
  return route;
}

export async function getStops() {
  const d = await readData();
  return d.stops || [];
}

export async function createStop({ name, latitude, longitude, address, status = 'ACTIVE' }: any) {
  const d = await readData();
  if (!d.stops) d.stops = [];
  const stop = { id: uuidv4(), name, latitude, longitude, address, status, geom: { type: 'Point', coordinates: [longitude, latitude] }, created_at: Date.now() };
  d.stops.push(stop);
  await writeData(d);
  return stop;
}

export async function getStopById(id: string) {
  const d = await readData();
  return (d.stops || []).find((stop: any) => stop.id === id) || null;
}

export async function updateStop(id: string, patch: any) {
  const d = await readData();
  const idx = (d.stops || []).findIndex((stop: any) => stop.id === id);
  if (idx === -1) return null;
  const updated = { ...d.stops[idx], ...patch, updated_at: Date.now() };
  if ('latitude' in patch || 'longitude' in patch) {
    updated.geom = { type: 'Point', coordinates: [updated.longitude, updated.latitude] };
  }
  d.stops[idx] = updated;
  await writeData(d);
  return d.stops[idx];
}

export async function getUsers() {
  const d = await readData();
  return d.users || [];
}

export async function getRouteById(id: string) {
  const d = await readData();
  return (d.routes || []).find((route: any) => route.id === id) || null;
}

export async function updateRoute(id: string, patch: any) {
  const d = await readData();
  const idx = (d.routes || []).findIndex((route: any) => route.id === id);
  if (idx === -1) return null;
  d.routes[idx] = { ...d.routes[idx], ...patch, updated_at: Date.now() };
  await writeData(d);
  return d.routes[idx];
}

export async function getTripById(id: string) {
  const d = await readData();
  return (d.trips || []).find((trip: any) => trip.id === id) || null;
}

export async function getRouteStops(routeId: string) {
  const d = await readData();
  return (d.route_stops || []).filter((rs: any) => rs.route_id === routeId).sort((a: any, b: any) => a.stop_order - b.stop_order);
}

// Search buses by origin/destination
export async function searchBuses(origin?: string, destination?: string) {
  const d = await readData();
  let routes = d.routes || [];
  
  // Filter routes by origin/destination
  if (origin) {
    routes = routes.filter((r: any) => r.origin?.toLowerCase().includes(origin.toLowerCase()));
  }
  if (destination) {
    routes = routes.filter((r: any) => r.destination?.toLowerCase().includes(destination.toLowerCase()));
  }
  
  // Get buses that have active trips on these routes
  const routeIds = routes.map((r: any) => r.id);
  const trips = (d.trips || []).filter((t: any) => routeIds.includes(t.route_id) && (t.status === 'ACTIVE' || t.status === 'IN_PROGRESS' || t.status === 'SCHEDULED'));
  const tripIds = trips.map((t: any) => t.id);
  
  // Get buses from assignments for these trips
  const assignments = (d.driver_bus_assignments || []).filter((a: any) => tripIds.some((tid: any) => tid === a.trip_id) && a.status === 'ACTIVE');
  const busIds = [...new Set(assignments.map((a: any) => a.bus_id))];
  
  const buses = (d.buses || []).filter((b: any) => busIds.includes(b.id) && b.status === 'IN_SERVICE');
  
  // Enrich with route info
  return buses.map((bus: any) => {
    const assignment = assignments.find((a: any) => a.bus_id === bus.id);
    const trip = trips.find((t: any) => t.id === assignment?.trip_id);
    const route = routes.find((r: any) => r.id === trip?.route_id);
    return { ...bus, route, trip };
  });
}

// Get nearby buses based on location (latitude/longitude)
export async function getNearbyBuses(latitude: number, longitude: number, radiusKm = 10) {
  const d = await readData();
  
  // Get all active trips with GPS locations
  const activeTrips = (d.trips || []).filter((t: any) => t.status === 'ACTIVE' || t.status === 'IN_PROGRESS');
  
  // Get latest GPS location for each trip
  const gpsLocations = d.gps_locations || [];
  const latestLocations = new Map<string, any>();
  for (const loc of gpsLocations) {
    if (loc.trip_id && activeTrips.some((t: any) => t.id === loc.trip_id)) {
      const existing = latestLocations.get(loc.trip_id);
      if (!existing || loc.recorded_at > existing.recorded_at) {
        latestLocations.set(loc.trip_id, loc);
      }
    }
  }
  
  // Calculate distance and filter by radius
  const nearby = [];
  for (const [tripId, loc] of latestLocations) {
    const distance = calculateDistance(latitude, longitude, loc.latitude, loc.longitude);
    if (distance <= radiusKm) {
      const trip = activeTrips.find((t: any) => t.id === tripId);
      if (trip) {
        const bus = (d.buses || []).find((b: any) => b.id === trip.bus_id);
        const route = (d.routes || []).find((r: any) => r.id === trip.route_id);
        nearby.push({ trip, bus, route, distance: Math.round(distance * 100) / 100, lastLocation: loc });
      }
    }
  }
  
  // Sort by distance
  return nearby.sort((a, b) => a.distance - b.distance);
}

// Saved routes
export async function getSavedRoutes(userId: string) {
  const d = await readData();
  return (d.saved_routes || []).filter((sr: any) => sr.user_id === userId);
}

export async function saveRoute(userId: string, routeId: string) {
  const d = await readData();
  const existing = (d.saved_routes || []).find((sr: any) => sr.user_id === userId && sr.route_id === routeId);
  if (existing) return existing;
  
  const savedRoute = { id: uuidv4(), user_id: userId, route_id: routeId, created_at: Date.now() };
  d.saved_routes.push(savedRoute);
  await writeData(d);
  return savedRoute;
}

export async function unsaveRoute(userId: string, routeId: string) {
  const d = await readData();
  const idx = (d.saved_routes || []).findIndex((sr: any) => sr.user_id === userId && sr.route_id === routeId);
  if (idx === -1) return false;
  d.saved_routes.splice(idx, 1);
  await writeData(d);
  return true;
}

// Favourite buses
export async function getFavouriteBuses(userId: string) {
  const d = await readData();
  return (d.favourite_buses || []).filter((fb: any) => fb.user_id === userId);
}

export async function favouriteBus(userId: string, busId: string) {
  const d = await readData();
  const existing = (d.favourite_buses || []).find((fb: any) => fb.user_id === userId && fb.bus_id === busId);
  if (existing) return existing;
  
  const favourite = { id: uuidv4(), user_id: userId, bus_id: busId, created_at: Date.now() };
  d.favourite_buses.push(favourite);
  await writeData(d);
  return favourite;
}

export async function unfavouriteBus(userId: string, busId: string) {
  const d = await readData();
  const idx = (d.favourite_buses || []).findIndex((fb: any) => fb.user_id === userId && fb.bus_id === busId);
  if (idx === -1) return false;
  d.favourite_buses.splice(idx, 1);
  await writeData(d);
  return true;
}

export async function createRouteStop({ routeId, stopId, stopOrder }: any) {
  const d = await readData();
  if (!d.route_stops) d.route_stops = [];
  const routeStop = { id: uuidv4(), route_id: routeId, stop_id: stopId, stop_order: stopOrder, created_at: Date.now() };
  d.route_stops.push(routeStop);
  await writeData(d);
  return routeStop;
}

export async function getAssignments() {
  const d = await readData();
  return d.driver_bus_assignments || [];
}

export async function getAssignmentByDriverId(driverId: string) {
  const d = await readData();
  return (d.driver_bus_assignments || []).find((a: any) => a.driver_id === driverId && a.status === 'ACTIVE') || null;
}

export async function createAssignment({ driverId, busId, startTime, endTime, status = 'ACTIVE' }: any) {
  const d = await readData();
  if (!d.driver_bus_assignments) d.driver_bus_assignments = [];
  const assignment = { id: uuidv4(), driver_id: driverId, bus_id: busId, start_time: startTime || null, end_time: endTime || null, status, created_at: Date.now() };
  d.driver_bus_assignments.push(assignment);
  await writeData(d);
  return assignment;
}

export async function getTrips() {
  const d = await readData();
  return d.trips || [];
}

export async function getActiveTripByDriverId(driverId: string) {
  const d = await readData();
  return (d.trips || []).find((t: any) => t.driver_id === driverId && (t.status === 'ACTIVE' || t.status === 'IN_PROGRESS')) || null;
}

export async function createTrip({ driverId, busId, routeId, startTime, endTime, status = 'SCHEDULED' }: any) {
  const d = await readData();
  if (!d.trips) d.trips = [];
  const trip = { id: uuidv4(), driver_id: driverId, bus_id: busId, route_id: routeId, start_time: startTime || null, end_time: endTime || null, status, created_at: Date.now(), updated_at: Date.now() };
  d.trips.push(trip);
  await writeData(d);
  return trip;
}

export async function updateTrip(id: string, patch: any) {
  const d = await readData();
  const idx = (d.trips || []).findIndex((trip: any) => trip.id === id);
  if (idx === -1) return null;
  d.trips[idx] = { ...d.trips[idx], ...patch, updated_at: Date.now() };
  await writeData(d);
  return d.trips[idx];
}

export async function getGpsLocations(tripId: string) {
  const d = await readData();
  return (d.gps_locations || []).filter((loc: any) => loc.trip_id === tripId).sort((a: any, b: any) => a.recorded_at - b.recorded_at);
}

export async function addGpsLocation({ tripId, latitude, longitude, speed, heading, accuracy, recordedAt }: any) {
  const d = await readData();
  if (!d.gps_locations) d.gps_locations = [];
  const gpsLocation = {
    id: uuidv4(),
    trip_id: tripId,
    latitude,
    longitude,
    speed: speed ?? null,
    heading: heading ?? null,
    accuracy: accuracy ?? null,
    recorded_at: recordedAt || Date.now(),
    geom: { type: 'Point', coordinates: [longitude, latitude] },
    created_at: Date.now(),
  };
  d.gps_locations.push(gpsLocation);
  await writeData(d);
  return gpsLocation;
}

// ETA Engine functions
const EARTH_RADIUS_KM = 6371;

function calculateDistance(lat1: number, lon1: number, lat2: number, lon2: number): number {
  const dLat = (lat2 - lat1) * Math.PI / 180;
  const dLon = (lon2 - lon1) * Math.PI / 180;
  const a = Math.sin(dLat / 2) * Math.sin(dLat / 2) +
    Math.cos(lat1 * Math.PI / 180) * Math.cos(lat2 * Math.PI / 180) *
    Math.sin(dLon / 2) * Math.sin(dLon / 2);
  const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
  return EARTH_RADIUS_KM * c;
}

function calculateDistanceAlongRoute(
  routePoints: { latitude: number; longitude: number }[],
  fromIndex: number,
  toIndex: number
): number {
  let totalDistance = 0;
  for (let i = fromIndex; i < toIndex && i < routePoints.length - 1; i++) {
    const p1 = routePoints[i];
    const p2 = routePoints[i + 1];
    totalDistance += calculateDistance(p1.latitude, p1.longitude, p2.latitude, p2.longitude);
  }
  return totalDistance;
}

function findClosestRoutePoint(
  routePoints: { latitude: number; longitude: number }[],
  latitude: number,
  longitude: number
): number {
  let minDistance = Infinity;
  let closestIndex = 0;
  
  for (let i = 0; i < routePoints.length; i++) {
    const dist = calculateDistance(latitude, longitude, routePoints[i].latitude, routePoints[i].longitude);
    if (dist < minDistance) {
      minDistance = dist;
      closestIndex = i;
    }
  }
  
  return closestIndex;
}

export interface EtaResult {
  distanceToNextStopKm: number;
  etaMinutes: number;
  currentSpeedKmh: number;
  nextStop: {
    name: string;
    latitude: number;
    longitude: number;
    stopOrder: number;
  } | null;
  remainingStops: number;
  totalRemainingDistanceKm: number;
  etaToDestinationMinutes: number;
  currentRouteIndex: number;
}

export async function calculateTripEta(tripId: string): Promise<EtaResult | null> {
  const d = await readData();
  
  // Get trip
  const trip = (d.trips || []).find((t: any) => t.id === tripId);
  if (!trip) return null;
  
  // Get route
  const route = (d.routes || []).find((r: any) => r.id === trip.route_id);
  if (!route) return null;
  
  // Get route stops with stop details
  const routeStops = (d.route_stops || [])
    .filter((rs: any) => rs.route_id === route.id)
    .sort((a: any, b: any) => a.stop_order - b.stop_order);
  
  if (routeStops.length === 0) return null;
  
  // Get stop details
  const stopsWithDetails = routeStops.map((rs: any) => {
    const stop = (d.stops || []).find((s: any) => s.id === rs.stop_id);
    return {
      stop_id: rs.stop_id,
      stop_order: rs.stop_order,
      name: stop?.name || 'Unknown Stop',
      latitude: stop?.latitude || 0,
      longitude: stop?.longitude || 0,
    };
  });
  
  // Get latest GPS location for this trip
  const gpsLocations = (d.gps_locations || [])
    .filter((loc: any) => loc.trip_id === tripId)
    .sort((a: any, b: any) => b.recorded_at - a.recorded_at);
  
  const latestGps = gpsLocations[0];
  if (!latestGps) {
    // No GPS data yet, return ETA from start
    const firstStop = stopsWithDetails[0];
    return {
      distanceToNextStopKm: 0,
      etaMinutes: 0,
      currentSpeedKmh: 0,
      nextStop: firstStop ? {
        name: firstStop.name,
        latitude: firstStop.latitude,
        longitude: firstStop.longitude,
        stopOrder: firstStop.stop_order,
      } : null,
      remainingStops: stopsWithDetails.length,
      totalRemainingDistanceKm: 0,
      etaToDestinationMinutes: 0,
      currentRouteIndex: 0,
    };
  }
  
  // Parse route geometry if available
  let routePoints: { latitude: number; longitude: number }[] = [];
  if (route.geometry) {
    try {
      // Parse WKT LINESTRING format: "LINESTRING(lon lat, lon lat, ...)"
      const coords = route.geometry
        .replace('LINESTRING(', '')
        .replace(')', '')
        .split(',')
        .map((c: string) => c.trim().split(' ').map(Number))
        .map(([lon, lat]: number[]) => ({ latitude: lat, longitude: lon }));
      routePoints = coords;
    } catch (e) {
      console.warn('Failed to parse route geometry:', e);
    }
  }
  
  // Use GPS speed or fallback
  const currentSpeed = latestGps.speed && latestGps.speed > 0 ? latestGps.speed : 20; // km/h fallback
  const minSpeed = 20;
  const speed = Math.max(currentSpeed, minSpeed);
  const dwellTimeMinutes = 2;
  
  const currentLocation = {
    latitude: latestGps.latitude,
    longitude: latestGps.longitude,
  };
  
  // Find closest stop to current location
  let minDist = Infinity;
  let closestStopIndex = 0;
  
  for (let i = 0; i < stopsWithDetails.length; i++) {
    const stop = stopsWithDetails[i];
    const dist = calculateDistance(
      currentLocation.latitude,
      currentLocation.longitude,
      stop.latitude,
      stop.longitude
    );
    if (dist < minDist) {
      minDist = dist;
      closestStopIndex = i;
    }
  }
  
  // Next stop is the one after the closest (assuming forward progress)
  const nextStopIndex = Math.min(closestStopIndex + 1, stopsWithDetails.length - 1);
  const nextStop = stopsWithDetails[nextStopIndex] || null;
  
  // Calculate distance to next stop
  let distanceToNextStopKm = 0;
  if (nextStop) {
    distanceToNextStopKm = calculateDistance(
      currentLocation.latitude,
      currentLocation.longitude,
      nextStop.latitude,
      nextStop.longitude
    );
  }
  
  // ETA to next stop
  const etaMinutes = nextStop ? Math.round((distanceToNextStopKm / speed) * 60) : 0;
  
  // Calculate total remaining distance and ETA
  let totalRemainingDistanceKm = distanceToNextStopKm;
  let etaToDestinationMinutes = etaMinutes;
  const remainingStopsCount = stopsWithDetails.length - nextStopIndex - 1;
  
  if (routePoints.length > 1) {
    const currentRouteIndex = findClosestRoutePoint(routePoints, currentLocation.latitude, currentLocation.longitude);
    const lastIndex = routePoints.length - 1;
    totalRemainingDistanceKm = calculateDistanceAlongRoute(routePoints, currentRouteIndex, lastIndex);
    etaToDestinationMinutes = Math.round((totalRemainingDistanceKm / speed) * 60);
    etaToDestinationMinutes += remainingStopsCount * 2; // 2 min dwell time per stop
  } else {
    // Fallback: sum distances between consecutive stops
    for (let i = nextStopIndex; i < stopsWithDetails.length - 1; i++) {
      const dist = calculateDistance(
        stopsWithDetails[i].latitude,
        stopsWithDetails[i].longitude,
        stopsWithDetails[i + 1].latitude,
        stopsWithDetails[i + 1].longitude
      );
      totalRemainingDistanceKm += dist;
    }
    etaToDestinationMinutes = Math.round((totalRemainingDistanceKm / speed) * 60);
    etaToDestinationMinutes += remainingStopsCount * 2;
  }
  
  return {
    distanceToNextStopKm: Math.round(distanceToNextStopKm * 100) / 100,
    etaMinutes,
    currentSpeedKmh: speed,
    nextStop: nextStop ? {
      name: nextStop.name,
      latitude: nextStop.latitude,
      longitude: nextStop.longitude,
      stopOrder: nextStop.stop_order,
    } : null,
    remainingStops: Math.max(0, stopsWithDetails.length - nextStopIndex - 1),
    totalRemainingDistanceKm: Math.round(totalRemainingDistanceKm * 100) / 100,
    etaToDestinationMinutes,
    currentRouteIndex: routePoints.length > 0 ? findClosestRoutePoint(routePoints, currentLocation.latitude, currentLocation.longitude) : 0,
  };
}

export async function getNotifications(userId?: string) {
  const d = await readData();
  const notifications = d.notifications || [];
  return userId ? notifications.filter((n: any) => n.user_id === userId) : notifications;
}

export async function createNotification({ userId, title, body, read = false }: any) {
  const d = await readData();
  if (!d.notifications) d.notifications = [];
  const notification = { id: uuidv4(), user_id: userId || null, title, body, read, created_at: Date.now() };
  d.notifications.push(notification);
  await writeData(d);
  return notification;
}

export async function getAuditLogs() {
  const d = await readData();
  return (d.audit_logs || []).sort((a: any, b: any) => b.created_at - a.created_at);
}

export async function createAuditLog({ userId, action, meta }: any) {
  const d = await readData();
  if (!d.audit_logs) d.audit_logs = [];
  const auditLog = { id: uuidv4(), user_id: userId || null, action, meta: meta || null, created_at: Date.now() };
  d.audit_logs.push(auditLog);
  await writeData(d);
  return auditLog;
}

export async function seedDriverIfMissing() {
  const d = await readData();
  if ((d.drivers || []).length === 0) {
    const org = { id: uuidv4(), name: 'Seed Org', code: 'ORG123', created_at: Date.now() };
    d.organizations.push(org);
    const passwordHash = await bcrypt.hash('driverpass', 10);
    const user = { id: uuidv4(), full_name: 'Seed Driver', phone: '9990001111', email: 'driver@example.com', password_hash: passwordHash, role: 'DRIVER', created_at: Date.now(), updated_at: Date.now() };
    d.users.push(user);
    const driver = { id: uuidv4(), user_id: user.id, organization_id: org.id, employee_id: 'EMP001', verification_status: 'VERIFIED', created_at: Date.now() };
    d.drivers.push(driver);
    await writeData(d);
  }
}

export default {
  runMigrations,
  createUser,
  getUserByEmailOrPhone,
  getUserById,
  updateUser,
  storeRefreshToken,
  consumeRefreshToken,
  saveOTP,
  verifyOTP,
  getOrganizations,
  createOrganization,
  getDrivers,
  createDriver,
  getBuses,
  createBus,
  getRoutes,
  createRoute,
  getStops,
  createStop,
  getUsers,
  getRouteById,
  getTripById,
  getRouteStops,
  createRouteStop,
  getAssignments,
  createAssignment,
  getTrips,
  createTrip,
  updateTrip,
  getGpsLocations,
  addGpsLocation,
  getNotifications,
  createNotification,
  getAuditLogs,
  createAuditLog,
  seedDriverIfMissing,
  searchBuses,
  getNearbyBuses,
  getSavedRoutes,
  saveRoute,
  unsaveRoute,
  getFavouriteBuses,
  favouriteBus,
  unfavouriteBus,
  calculateTripEta,
};
