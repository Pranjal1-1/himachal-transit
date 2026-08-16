import fs from 'fs';
import path from 'path';

// Lazy-require `pg` so tests and file-backed mode don't need it installed
let Pool: any = null;
try {
  // eslint-disable-next-line @typescript-eslint/no-var-requires
  Pool = require('pg').Pool;
} catch (e) {
  Pool = null;
}

const DATABASE_URL = process.env.DATABASE_URL;
const pool = Pool ? new Pool({ connectionString: DATABASE_URL }) : (null as any);

export async function runMigrations() {
  const migrationsDir = path.join(__dirname, '..', 'migrations');
  const files = fs.readdirSync(migrationsDir).filter((f) => f.endsWith('.sql')).sort();
  for (const file of files) {
    if (!pool) throw new Error('Postgres pool not initialized');
    const id = file;
    const client = await pool.connect();
    try {
      const res = await client.query('SELECT 1 FROM migrations WHERE id=$1', [id]).catch(() => null);
      if (res && res.rowCount > 0) {
        client.release();
        continue;
      }
      const sql = fs.readFileSync(path.join(migrationsDir, file), 'utf8');
      await client.query('BEGIN');
      await client.query(sql);
      await client.query('INSERT INTO migrations(id) VALUES($1)', [id]);
      await client.query('COMMIT');
    } catch (e) {
      await client.query('ROLLBACK').catch(() => null);
      client.release();
      throw e;
    }
    client.release();
  }
}

export async function createUser({ fullName, phone, email, passwordHash, role = 'PASSENGER' }: any) {
  if (!pool) throw new Error('Postgres pool not initialized');
  const res = await pool.query(
    `INSERT INTO users(full_name, phone, email, password_hash, role) VALUES($1,$2,$3,$4,$5) RETURNING *`,
    [fullName, phone, email, passwordHash, role]
  );
  return res.rows[0];
}

export async function getUserByEmailOrPhone(identifier: string) {
  if (!pool) throw new Error('Postgres pool not initialized');
  const res = await pool.query(`SELECT * FROM users WHERE email=$1 OR phone=$1 LIMIT 1`, [identifier]);
  return res.rows[0];
}

export async function getUserById(id: string) {
  if (!pool) throw new Error('Postgres pool not initialized');
  const res = await pool.query(`SELECT * FROM users WHERE id=$1`, [id]);
  return res.rows[0];
}

export async function updateUser(id: string, patch: any) {
  if (!pool) throw new Error('Postgres pool not initialized');
  const keys = Object.keys(patch);
  const vals = keys.map((k, i) => `${k}=$${i + 2}`).join(', ');
  const params = [id, ...keys.map((k) => (patch as any)[k])];
  const res = await pool.query(`UPDATE users SET ${vals}, updated_at=now() WHERE id=$1 RETURNING *`, params);
  return res.rows[0];
}

export async function storeRefreshToken(token: string, userId: string, ttlSec = 60 * 60 * 24 * 7) {
  const expiresAt = new Date(Date.now() + ttlSec * 1000);
  await pool.query(`INSERT INTO refresh_tokens(token, user_id, expires_at, created_at) VALUES($1,$2,$3,now())`, [token, userId, expiresAt.toISOString()]);
}

export async function consumeRefreshToken(token: string) {
  // Atomically delete and return user_id if token exists and not expired
  const client = await pool.connect();
  try {
    await client.query('BEGIN');
    const res = await client.query(`DELETE FROM refresh_tokens WHERE token=$1 AND expires_at > now() RETURNING user_id`, [token]);
    await client.query('COMMIT');
    if (res.rowCount === 0) return null;
    return res.rows[0].user_id;
  } catch (e) {
    await client.query('ROLLBACK').catch(() => null);
    throw e;
  } finally {
    client.release();
  }
}

export async function saveOTP(key: string, code: string, ttlSec = 5 * 60) {
  // store in notifications table temporarily
  await pool.query(`INSERT INTO audit_logs(action, meta) VALUES('otp', $1)`, [JSON.stringify({ key, code, expiresAt: Date.now() + ttlSec * 1000 })]);
}

export async function verifyOTP(key: string, code: string) {
  const res = await pool.query(`SELECT meta FROM audit_logs WHERE action='otp' ORDER BY created_at DESC LIMIT 10`);
  for (const row of res.rows) {
    const meta = row.meta as any;
    if (meta.key === key && meta.code === code && meta.expiresAt > Date.now()) return true;
  }
  return false;
}

export async function seedDriverIfMissing() {
  const res = await pool.query(`SELECT 1 FROM drivers LIMIT 1`);
  if (res.rowCount === 0) {
    // create organization
    const org = await pool.query(`INSERT INTO organizations(name, code) VALUES($1,$2) RETURNING *`, ['Seed Org', 'ORG123']);
    const passwordHash = '$2b$10$xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
    const user = await createUser({ fullName: 'Seed Driver', phone: '9990001111', email: 'driver@example.com', passwordHash, role: 'DRIVER' });
    await pool.query(`INSERT INTO drivers(user_id, organization_id, employee_id, verification_status) VALUES($1,$2,$3,$4)`, [user.id, org.rows[0].id, 'EMP001', 'VERIFIED']);
  }
}

export async function getOrganizations() {
  if (!pool) throw new Error('Postgres pool not initialized');
  const res = await pool.query(`SELECT * FROM organizations ORDER BY created_at ASC`);
  return res.rows;
}

export async function createOrganization({ name, code }: any) {
  if (!pool) throw new Error('Postgres pool not initialized');
  const res = await pool.query(`INSERT INTO organizations(name, code) VALUES($1,$2) RETURNING *`, [name, code]);
  return res.rows[0];
}

export async function getDrivers() {
  if (!pool) throw new Error('Postgres pool not initialized');
  const res = await pool.query(`SELECT d.*, u.full_name, u.email, u.phone FROM drivers d JOIN users u ON u.id = d.user_id ORDER BY d.created_at ASC`);
  return res.rows;
}

export async function createDriver({ userId, organizationId, employeeId, verificationStatus = 'PENDING' }: any) {
  if (!pool) throw new Error('Postgres pool not initialized');
  const res = await pool.query(
    `INSERT INTO drivers(user_id, organization_id, employee_id, verification_status) VALUES($1,$2,$3,$4) RETURNING *`,
    [userId, organizationId, employeeId, verificationStatus]
  );
  return res.rows[0];
}

export async function getBuses() {
  if (!pool) throw new Error('Postgres pool not initialized');
  const res = await pool.query(`SELECT * FROM buses ORDER BY created_at ASC`);
  return res.rows;
}

export async function createBus({ organizationId, registrationNumber, model, fuelType, emissionStandard, capacity, status = 'IN_SERVICE' }: any) {
  if (!pool) throw new Error('Postgres pool not initialized');
  const res = await pool.query(
    `INSERT INTO buses(organization_id, registration_number, model, fuel_type, emission_standard, capacity, status) VALUES($1,$2,$3,$4,$5,$6,$7) RETURNING *`,
    [organizationId, registrationNumber, model, fuelType, emissionStandard, capacity, status]
  );
  return res.rows[0];
}

export async function getBusById(id: string) {
  if (!pool) throw new Error('Postgres pool not initialized');
  const res = await pool.query(`SELECT * FROM buses WHERE id=$1`, [id]);
  return res.rows[0];
}

export async function updateBus(id: string, patch: any) {
  if (!pool) throw new Error('Postgres pool not initialized');
  const keys = Object.keys(patch);
  if (keys.length === 0) {
    const res = await pool.query(`SELECT * FROM buses WHERE id=$1`, [id]);
    return res.rows[0];
  }
  const vals = keys.map((k, i) => `${k}=$${i + 2}`).join(', ');
  const params = [id, ...keys.map((k) => (patch as any)[k])];
  const res = await pool.query(`UPDATE buses SET ${vals}, updated_at=now() WHERE id=$1 RETURNING *`, params);
  return res.rows[0];
}

export async function getRoutes() {
  if (!pool) throw new Error('Postgres pool not initialized');
  const res = await pool.query(`SELECT * FROM routes ORDER BY created_at ASC`);
  return res.rows;
}

export async function createRoute({ organizationId, name, origin, destination, geometry }: any) {
  if (!pool) throw new Error('Postgres pool not initialized');
  const res = await pool.query(
    `INSERT INTO routes(organization_id, name, origin, destination, geometry) VALUES($1,$2,$3,$4, ${geometry ? 'ST_GeomFromText($5, 4326)' : 'NULL'}) RETURNING *`,
    geometry ? [organizationId, name, origin, destination, geometry] : [organizationId, name, origin, destination]
  );
  return res.rows[0];
}

export async function getStops() {
  if (!pool) throw new Error('Postgres pool not initialized');
  const res = await pool.query(`SELECT *, ST_X(geom) AS longitude, ST_Y(geom) AS latitude FROM stops ORDER BY created_at ASC`);
  return res.rows;
}

export async function createStop({ name, latitude, longitude, address, status = 'ACTIVE' }: any) {
  if (!pool) throw new Error('Postgres pool not initialized');
  const res = await pool.query(
    `INSERT INTO stops(name, latitude, longitude, address, status, geom) VALUES($1,$2,$3,$4,$5, ST_SetSRID(ST_MakePoint($3, $2), 4326)) RETURNING *`,
    [name, latitude, longitude, address, status]
  );
  return res.rows[0];
}

export async function getStopById(id: string) {
  if (!pool) throw new Error('Postgres pool not initialized');
  const res = await pool.query(`SELECT *, ST_X(geom) AS longitude, ST_Y(geom) AS latitude FROM stops WHERE id=$1`, [id]);
  return res.rows[0];
}

export async function updateStop(id: string, patch: any) {
  if (!pool) throw new Error('Postgres pool not initialized');
  const hasGeom = 'latitude' in patch || 'longitude' in patch;
  const keys = Object.keys(patch).filter((k) => k !== 'latitude' && k !== 'longitude');
  const vals = keys.map((k, i) => `${k}=$${i + 2}`).join(', ');
  const params = [id, ...keys.map((k) => (patch as any)[k])];
  let setClause = vals;
  if (hasGeom) {
    params.push((patch as any).longitude ?? null, (patch as any).latitude ?? null);
    const geomUpdate = `geom=ST_SetSRID(ST_MakePoint(COALESCE($${params.length - 1}, longitude), COALESCE($${params.length}, latitude)), 4326)`;
    setClause = setClause ? `${setClause}, ${geomUpdate}` : geomUpdate;
  }
  if (!setClause) {
    const res = await pool.query(`SELECT *, ST_X(geom) AS longitude, ST_Y(geom) AS latitude FROM stops WHERE id=$1`, [id]);
    return res.rows[0];
  }
  const res = await pool.query(`UPDATE stops SET ${setClause} WHERE id=$1 RETURNING *`, params);
  return res.rows[0];
}

export async function getUsers() {
  if (!pool) throw new Error('Postgres pool not initialized');
  const res = await pool.query(`SELECT * FROM users ORDER BY created_at ASC`);
  return res.rows;
}

export async function getRouteById(id: string) {
  if (!pool) throw new Error('Postgres pool not initialized');
  const res = await pool.query(`SELECT * FROM routes WHERE id=$1`, [id]);
  return res.rows[0];
}

export async function updateRoute(id: string, patch: any) {
  if (!pool) throw new Error('Postgres pool not initialized');
  const routePatch = { ...patch };
  const geometry = 'geometry' in routePatch ? routePatch.geometry : undefined;
  delete routePatch.geometry;
  const keys = Object.keys(routePatch);
  const vals = keys.map((k, i) => `${k}=$${i + 2}`).join(', ');
  const params = [id, ...keys.map((k) => (routePatch as any)[k])];
  let setClause = vals;
  if (geometry !== undefined) {
    params.push(geometry);
    const geomUpdate = `geometry=ST_GeomFromText($${params.length}, 4326)`;
    setClause = setClause ? `${setClause}, ${geomUpdate}` : geomUpdate;
  }
  if (!setClause) {
    const res = await pool.query(`SELECT * FROM routes WHERE id=$1`, [id]);
    return res.rows[0];
  }
  const res = await pool.query(`UPDATE routes SET ${setClause} WHERE id=$1 RETURNING *`, params);
  return res.rows[0];
}

export async function getTripById(id: string) {
  if (!pool) throw new Error('Postgres pool not initialized');
  const res = await pool.query(`SELECT * FROM trips WHERE id=$1`, [id]);
  return res.rows[0];
}

export async function getRouteStops(routeId: string) {
  if (!pool) throw new Error('Postgres pool not initialized');
  const res = await pool.query(`SELECT * FROM route_stops WHERE route_id=$1 ORDER BY stop_order ASC`, [routeId]);
  return res.rows;
}

export async function createRouteStop({ routeId, stopId, stopOrder }: any) {
  if (!pool) throw new Error('Postgres pool not initialized');
  const res = await pool.query(
    `INSERT INTO route_stops(route_id, stop_id, stop_order) VALUES($1,$2,$3) RETURNING *`,
    [routeId, stopId, stopOrder]
  );
  return res.rows[0];
}

export async function getAssignments() {
  if (!pool) throw new Error('Postgres pool not initialized');
  const res = await pool.query(`SELECT * FROM driver_bus_assignments ORDER BY created_at ASC`);
  return res.rows;
}

export async function createAssignment({ driverId, busId, startTime, endTime, status = 'ACTIVE' }: any) {
  if (!pool) throw new Error('Postgres pool not initialized');
  const res = await pool.query(
    `INSERT INTO driver_bus_assignments(driver_id, bus_id, start_time, end_time, status) VALUES($1,$2,$3,$4,$5) RETURNING *`,
    [driverId, busId, startTime, endTime, status]
  );
  return res.rows[0];
}

export async function getTrips() {
  if (!pool) throw new Error('Postgres pool not initialized');
  const res = await pool.query(`SELECT * FROM trips ORDER BY created_at ASC`);
  return res.rows;
}

export async function createTrip({ driverId, busId, routeId, startTime, endTime, status = 'SCHEDULED' }: any) {
  if (!pool) throw new Error('Postgres pool not initialized');
  const res = await pool.query(
    `INSERT INTO trips(driver_id, bus_id, route_id, start_time, end_time, status) VALUES($1,$2,$3,$4,$5,$6) RETURNING *`,
    [driverId, busId, routeId, startTime, endTime, status]
  );
  return res.rows[0];
}

export async function updateTrip(id: string, patch: any) {
  if (!pool) throw new Error('Postgres pool not initialized');
  const keys = Object.keys(patch);
  const vals = keys.map((k, i) => `${k}=$${i + 2}`).join(', ');
  const params = [id, ...keys.map((k) => (patch as any)[k])];
  const res = await pool.query(`UPDATE trips SET ${vals}, updated_at=now() WHERE id=$1 RETURNING *`, params);
  return res.rows[0];
}

export async function getGpsLocations(tripId: string) {
  if (!pool) throw new Error('Postgres pool not initialized');
  const res = await pool.query(`SELECT * FROM gps_locations WHERE trip_id=$1 ORDER BY recorded_at ASC`, [tripId]);
  return res.rows;
}

export async function addGpsLocation({ tripId, latitude, longitude, speed, heading, accuracy, recordedAt }: any) {
  if (!pool) throw new Error('Postgres pool not initialized');
  const res = await pool.query(
    `INSERT INTO gps_locations(trip_id, latitude, longitude, speed, heading, accuracy, recorded_at, geom) VALUES($1,$2,$3,$4,$5,$6,$7, ST_SetSRID(ST_MakePoint($3, $2), 4326)) RETURNING *`,
    [tripId, latitude, longitude, speed, heading, accuracy, recordedAt]
  );
  return res.rows[0];
}

export async function getAssignmentByDriverId(driverId: string) {
  if (!pool) throw new Error('Postgres pool not initialized');
  const res = await pool.query(`SELECT * FROM driver_bus_assignments WHERE driver_id=$1 AND status='ACTIVE' LIMIT 1`, [driverId]);
  return res.rows[0] || null;
}

export async function getDriverByUserId(userId: string) {
  if (!pool) throw new Error('Postgres pool not initialized');
  const res = await pool.query(`SELECT * FROM drivers WHERE user_id=$1 LIMIT 1`, [userId]);
  return res.rows[0] || null;
}

export async function getActiveTripByDriverId(driverId: string) {
  if (!pool) throw new Error('Postgres pool not initialized');
  const res = await pool.query(`SELECT * FROM trips WHERE driver_id=$1 AND status IN ('ACTIVE', 'IN_PROGRESS') LIMIT 1`, [driverId]);
  return res.rows[0] || null;
}

export async function getNotifications(userId?: string) {
  if (!pool) throw new Error('Postgres pool not initialized');
  const query = userId ? `SELECT * FROM notifications WHERE user_id=$1 ORDER BY created_at DESC` : `SELECT * FROM notifications ORDER BY created_at DESC`;
  const params = userId ? [userId] : [];
  const res = await pool.query(query, params);
  return res.rows;
}

export async function createNotification({ userId, title, body, read = false }: any) {
  if (!pool) throw new Error('Postgres pool not initialized');
  const res = await pool.query(`INSERT INTO notifications(user_id, title, body, read) VALUES($1,$2,$3,$4) RETURNING *`, [userId, title, body, read]);
  return res.rows[0];
}

export async function getAuditLogs() {
  if (!pool) throw new Error('Postgres pool not initialized');
  const res = await pool.query(`SELECT * FROM audit_logs ORDER BY created_at DESC`);
  return res.rows;
}

export async function createAuditLog({ userId, action, meta }: any) {
  if (!pool) throw new Error('Postgres pool not initialized');
  const res = await pool.query(`INSERT INTO audit_logs(user_id, action, meta) VALUES($1,$2,$3) RETURNING *`, [userId, action, meta]);
  return res.rows[0];
}

// Search buses by origin/destination
export async function searchBuses(origin?: string, destination?: string) {
  if (!pool) throw new Error('Postgres pool not initialized');
  // Simple implementation - in production would use PostGIS for better performance
  let query = `
    SELECT b.*, r.name as route_name, r.origin, r.destination
    FROM buses b
    JOIN driver_bus_assignments dba ON b.id = dba.bus_id AND dba.status = 'ACTIVE'
    JOIN trips t ON dba.trip_id = t.id AND t.status IN ('ACTIVE', 'IN_PROGRESS', 'SCHEDULED')
    JOIN routes r ON t.route_id = r.id
    WHERE b.status = 'IN_SERVICE'
  `;
  const params: any[] = [];
  let paramIndex = 1;
  
  if (origin) {
    query += ` AND r.origin ILIKE $${paramIndex++}`;
    params.push(`%${origin}%`);
  }
  if (destination) {
    query += ` AND r.destination ILIKE $${paramIndex++}`;
    params.push(`%${destination}%`);
  }
  
  query += ` ORDER BY r.origin, r.destination`;
  
  const res = await pool.query(query, params);
  return res.rows;
}

// Get nearby buses based on location
export async function getNearbyBuses(latitude: number, longitude: number, radiusKm = 10) {
  if (!pool) throw new Error('Postgres pool not initialized');
  // This would use PostGIS in production
  // For now, return empty array as stub
  return [];
}

// Saved routes
export async function getSavedRoutes(userId: string) {
  if (!pool) throw new Error('Postgres pool not initialized');
  const res = await pool.query(`SELECT * FROM saved_routes WHERE user_id = $1`, [userId]);
  return res.rows;
}

export async function saveRoute(userId: string, routeId: string) {
  if (!pool) throw new Error('Postgres pool not initialized');
  const res = await pool.query(
    `INSERT INTO saved_routes(user_id, route_id) VALUES($1,$2) ON CONFLICT (user_id, route_id) DO NOTHING RETURNING *`,
    [userId, routeId]
  );
  return res.rows[0];
}

export async function unsaveRoute(userId: string, routeId: string) {
  if (!pool) throw new Error('Postgres pool not initialized');
  const res = await pool.query(`DELETE FROM saved_routes WHERE user_id = $1 AND route_id = $2`, [userId, routeId]);
  return res.rowCount > 0;
}

// Favourite buses
export async function getFavouriteBuses(userId: string) {
  if (!pool) throw new Error('Postgres pool not initialized');
  const res = await pool.query(`SELECT * FROM favourite_buses WHERE user_id = $1`, [userId]);
  return res.rows;
}

export async function favouriteBus(userId: string, busId: string) {
  if (!pool) throw new Error('Postgres pool not initialized');
  const res = await pool.query(
    `INSERT INTO favourite_buses(user_id, bus_id) VALUES($1,$2) ON CONFLICT (user_id, bus_id) DO NOTHING RETURNING *`,
    [userId, busId]
  );
  return res.rows[0];
}

export async function unfavouriteBus(userId: string, busId: string) {
  if (!pool) throw new Error('Postgres pool not initialized');
  const res = await pool.query(`DELETE FROM favourite_buses WHERE user_id = $1 AND bus_id = $2`, [userId, busId]);
  return res.rowCount > 0;
}

// ETA Engine - stub for PostgreSQL (would use PostGIS in production)
export async function calculateTripEta(tripId: string) {
  if (!pool) throw new Error('Postgres pool not initialized');
  // This would use PostGIS for accurate routing in production
  // For now, return null to indicate not implemented for PG
  return null;
}

export { pool };
