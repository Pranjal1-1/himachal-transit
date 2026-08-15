import request from 'supertest';
import { resetTestDb, startTestServer } from './testServer';

let server: any;

beforeEach(() => {
  resetTestDb();
  server = startTestServer();
});

afterEach(() => {
  if (server && server.close) server.close();
});

describe('Phase 3 route and DB integration', () => {
  it('creates organizations, drivers, buses, routes, trips, gps, notifications, and audit logs', async () => {
    const register = await request(server).post('/auth/register').send({
      fullName: 'Phase3 User',
      phone: '9992223333',
      email: 'phase3@example.com',
      password: 'Password123!',
      confirmPassword: 'Password123!',
    });
    expect(register.status).toBe(200);
    const userId = register.body.userId;
    expect(userId).toBeTruthy();

    const adminRegister = await request(server).post('/auth/register').send({
      fullName: 'Phase3 Admin',
      phone: '9992223334',
      email: 'admin.phase3@example.com',
      password: 'AdminPass123!',
      confirmPassword: 'AdminPass123!',
    });
    expect(adminRegister.status).toBe(200);

    const db = await import('../db');
    await db.updateUser(adminRegister.body.userId, { role: 'ADMIN' });

    const adminLogin = await request(server).post('/auth/login').send({ identifier: 'admin.phase3@example.com', password: 'AdminPass123!' });
    expect(adminLogin.status).toBe(200);
    const adminAuth = `Bearer ${adminLogin.body.tokens.access}`;

    const org = await request(server).post('/organizations').send({ name: 'Phase3 Org', code: 'PH3' });
    expect(org.status).toBe(201);
    const orgId = org.body.id;
    expect(orgId).toBeTruthy();

    const driver = await request(server)
      .post('/drivers')
      .send({ userId, organizationId: orgId, employeeId: 'EMP100', verificationStatus: 'VERIFIED' });
    expect(driver.status).toBe(201);
    const driverId = driver.body.id;
    expect(driverId).toBeTruthy();

    // Update user role to DRIVER for GPS authentication
    await db.updateUser(userId, { role: 'DRIVER' });

    const bus = await request(server)
      .post('/buses')
      .set('Authorization', adminAuth)
      .send({ organizationId: orgId, registrationNumber: 'HP01AB1234', model: 'TATA', fuelType: 'Diesel', emissionStandard: 'BS-VI', capacity: 35, status: 'IN_SERVICE' });
    expect(bus.status).toBe(201);
    const busId = bus.body.id;
    expect(busId).toBeTruthy();

    const busUpdated = await request(server)
      .patch(`/buses/${busId}`)
      .set('Authorization', adminAuth)
      .send({ status: 'MAINTENANCE' });
    expect(busUpdated.status).toBe(200);
    expect(busUpdated.body.status).toBe('MAINTENANCE');

    const route = await request(server)
      .post('/routes')
      .set('Authorization', adminAuth)
      .send({ organizationId: orgId, name: 'Shimla Express', origin: 'Shimla', destination: 'Solan', geometry: 'LINESTRING(76.7794 31.1048, 77.1110 30.9160)' });
    expect(route.status).toBe(201);
    const routeId = route.body.id;
    expect(routeId).toBeTruthy();

    const routeUpdated = await request(server)
      .patch(`/routes/${routeId}`)
      .set('Authorization', adminAuth)
      .send({ destination: 'Kullu' });
    expect(routeUpdated.status).toBe(200);
    expect(routeUpdated.body.destination).toBe('Kullu');

    const stop = await request(server)
      .post('/stops')
      .set('Authorization', adminAuth)
      .send({ name: 'Phase3 Stop', latitude: 31.1000, longitude: 77.1000, address: 'Main Road' });
    expect(stop.status).toBe(201);
    const stopId = stop.body.id;
    expect(stopId).toBeTruthy();

    const stopUpdated = await request(server)
      .patch(`/stops/${stopId}`)
      .set('Authorization', adminAuth)
      .send({ address: 'Updated Road' });
    expect(stopUpdated.status).toBe(200);
    expect(stopUpdated.body.address).toBe('Updated Road');

    const routeStop = await request(server)
      .post('/route-stops')
      .set('Authorization', adminAuth)
      .send({ routeId, stopId, stopOrder: 1 });
    expect(routeStop.status).toBe(201);
    expect(routeStop.body.route_id).toBe(routeId);

    const assignment = await request(server)
      .post('/assignments')
      .set('Authorization', adminAuth)
      .send({ driverId, busId, startTime: Date.now(), status: 'ACTIVE' });
    expect(assignment.status).toBe(201);
    expect(assignment.body.driver_id).toBe(driverId);

    const trip = await request(server).post('/trips').send({ driverId, busId, routeId, startTime: Date.now(), status: 'ACTIVE' });
    expect(trip.status).toBe(201);
    const tripId = trip.body.id;
    expect(tripId).toBeTruthy();

    const tripFetch = await request(server).get(`/trips/${tripId}`);
    expect(tripFetch.status).toBe(200);
    expect(tripFetch.body.id).toBe(tripId);

    // Login as driver to get auth token for GPS
    const driverLogin = await request(server).post('/auth/login').send({ identifier: 'phase3@example.com', password: 'Password123!' });
    expect(driverLogin.status).toBe(200);
    const driverAuth = `Bearer ${driverLogin.body.tokens.access}`;

    const gps = await request(server).post('/gps').set('Authorization', driverAuth).send({ tripId, latitude: 31.1010, longitude: 77.1010, speed: 24, heading: 180, accuracy: 5, recordedAt: Date.now() });
    expect(gps.status).toBe(201);
    expect(gps.body.trip_id).toBe(tripId);

    const gpsList = await request(server).get('/gps').query({ tripId });
    expect(gpsList.status).toBe(200);
    expect(Array.isArray(gpsList.body)).toBe(true);
    expect(gpsList.body.length).toBeGreaterThan(0);

    const notifications = await request(server).post('/notifications').send({ userId, title: 'Test Notification', body: 'Hello Phase 3' });
    expect(notifications.status).toBe(201);
    expect(notifications.body.title).toBe('Test Notification');

    const auditLog = await request(server).post('/audit-logs').send({ userId, action: 'TEST_PHASE3', meta: { source: 'integration' } });
    expect(auditLog.status).toBe(201);
    expect(auditLog.body.action).toBe('TEST_PHASE3');

    const routeStops = await request(server).get(`/routes/${routeId}/stops`);
    expect(routeStops.status).toBe(200);
    expect(Array.isArray(routeStops.body)).toBe(true);
    expect(routeStops.body[0].stop_id).toBe(stopId);
  }, 20000);
});
