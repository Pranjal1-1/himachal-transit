#!/usr/bin/env ts-node

/**
 * Development seed script for Himachal Transit
 * Run with: npx ts-node seed.ts
 * Or: npm run seed
 */

import { runMigrations } from './src/db';
import { 
  createUser, 
  createOrganization,
  createDriver,
  createBus,
  createRoute,
  createStop,
  createRouteStop,
  createTrip,
  createAssignment,
  addGpsLocation,
} from './src/db';
import bcrypt from 'bcrypt';

async function seed() {
  console.log('🌱 Starting database seed...');

  try {
    // Run migrations first
    console.log('📦 Running migrations...');
    await runMigrations();
    console.log('✅ Migrations complete');

    // Hash password for test users
    const passwordHash = await bcrypt.hash('testpass123', 10);
    const driverPasswordHash = await bcrypt.hash('driverpass123', 10);

    // ========== 1. Create Organization ==========
    console.log('🏢 Creating organization...');
    const org = await createOrganization({ 
      name: 'Himachal Road Transport Corporation', 
      code: 'HRTC' 
    });
    console.log(`✅ Organization: ${org.name} (${org.id})`);

    // ========== 2. Create Users & Drivers ==========
    console.log('👥 Creating users and drivers...');
    
    // Passenger user
    const passenger = await createUser({
      full_name: 'Test Passenger',
      phone: '9991112223',
      email: 'passenger@example.com',
      password_hash: await bcrypt.hash('pass123', 10),
      role: 'PASSENGER',
    });
    console.log(`✅ Passenger: ${passenger.full_name} (${passenger.id})`);

    // Driver 1
    const driverUser1 = await createUser({
      full_name: 'Rajesh Kumar',
      phone: '9876543210',
      email: 'rajesh.driver@example.com',
      password_hash: await bcrypt.hash('driver123', 10),
      role: 'DRIVER',
    });
    const driver1 = await createDriver({
      userId: driverUser1.id,
      organizationId: org.id,
      employeeId: 'HRTC-001',
      verificationStatus: 'VERIFIED',
    });
    console.log(`✅ Driver 1: ${driverUser1.full_name} (${driver1.id})`);

    // Driver 2
    const driverUser2 = await createUser({
      full_name: 'Suresh Singh',
      phone: '9876543211',
      email: 'suresh.driver@example.com',
      password_hash: await bcrypt.hash('driver123', 10),
      role: 'DRIVER',
    });
    const driver2 = await createDriver({
      userId: driverUser2.id,
      organizationId: org.id,
      employeeId: 'HRTC-002',
      verificationStatus: 'VERIFIED',
    });
    console.log(`✅ Driver 2: ${driverUser2.full_name} (${driver2.id})`);

    // ========== 3. Create Buses ==========
    console.log('🚌 Creating buses...');
    
    const bus1 = await createBus({
      organizationId: org.id,
      registrationNumber: 'HP-01A-1234',
      model: 'Tata Starbus Ultra',
      fuelType: 'CNG',
      emissionStandard: 'BS-VI',
      capacity: 40,
      status: 'IN_SERVICE',
    });
    console.log(`✅ Bus 1: ${bus1.registrationNumber} (${bus1.id})`);

    const bus2 = await createBus({
      organizationId: org.id,
      registrationNumber: 'HP-01B-5678',
      model: 'Ashok Leyland Viking',
      fuelType: 'Diesel',
      emissionStandard: 'BS-VI',
      capacity: 45,
      status: 'IN_SERVICE',
    });
    console.log(`✅ Bus 2: ${bus2.registrationNumber} (${bus2.id})`);

    const bus3 = await createBus({
      organizationId: org.id,
      registrationNumber: 'HP-01C-9012',
      model: 'Tata Starbus Ultra',
      fuelType: 'CNG',
      emissionStandard: 'BS-VI',
      capacity: 40,
      status: 'IN_SERVICE',
    });
    console.log(`✅ Bus 3: ${bus3.registrationNumber} (${bus3.id})`);

    // ========== 4. Create Stops ==========
    console.log('🚏 Creating stops...');
    
    // Shimla stops
    const stopShimlaISBT = await createStop({
      name: 'Shimla ISBT',
      latitude: 31.1048,
      longitude: 77.1734,
      address: 'Shimla ISBT, Shimla, HP',
      status: 'ACTIVE',
    });
    console.log(`✅ Stop: ${stopShimlaISBT.name} (${stopShimlaISBT.id})`);

    const stopShimlaOldBusStand = await createStop({
      name: 'Shimla Old Bus Stand',
      latitude: 31.1035,
      longitude: 77.1712,
      address: 'Old Bus Stand, Shimla, HP',
      status: 'ACTIVE',
    });
    console.log(`✅ Stop: ${stopShimlaOldBusStand.name} (${stopShimlaOldBusStand.id})`);

    // Mandi stop
    const stopMandi = await createStop({
      name: 'Mandi ISBT',
      latitude: 31.5446,
      longitude: 77.1856,
      address: 'Mandi ISBT, Mandi, HP',
      status: 'ACTIVE',
    });
    console.log(`✅ Stop: ${stopMandi.name} (${stopMandi.id})`);

    // Kullu stop
    const stopKullu = await createStop({
      name: 'Kullu Bus Stand',
      latitude: 31.9596,
      longitude: 77.1098,
      address: 'Kullu Bus Stand, Kullu, HP',
      status: 'ACTIVE',
    });
    console.log(`✅ Stop: ${stopKullu.name} (${stopKullu.id})`);

    // Manali stop
    const stopManali = await createStop({
      name: 'Manali Bus Stand',
      latitude: 32.2432,
      longitude: 77.1892,
      address: 'Manali Bus Stand, Manali, HP',
      status: 'ACTIVE',
    });
    console.log(`✅ Stop: ${stopManali.name} (${stopManali.id})`);

    // ========== 5. Create Routes ==========
    console.log('🗺️ Creating routes...');

    // Route 1: Shimla to Manali via Mandi, Kullu
    const route1 = await createRoute({
      organizationId: org.id,
      name: 'Shimla - Manali Express',
      origin: 'Shimla',
      destination: 'Manali',
      geometry: 'LINESTRING(77.1734 31.1048, 77.1856 31.5446, 77.1098 31.9596, 77.1892 32.2432)',
    });
    console.log(`✅ Route 1: ${route1.name} (${route1.id})`);

    // Route 2: Shimla to Kullu via Mandi
    const route2 = await createRoute({
      organizationId: org.id,
      name: 'Shimla - Kullu Local',
      origin: 'Shimla',
      destination: 'Kullu',
      geometry: 'LINESTRING(77.1734 31.1048, 77.1856 31.5446, 77.1098 31.9596)',
    });
    console.log(`✅ Route 2: ${route2.name} (${route2.id})`);

    // ========== 6. Create Route Stops ==========
    console.log('🔗 Creating route stops...');

    // Route 1 stops (Shimla -> Manali)
    await createRouteStop({ routeId: route1.id, stopId: stopShimlaISBT.id, stopOrder: 1 });
    await createRouteStop({ routeId: route1.id, stopId: stopMandi.id, stopOrder: 2 });
    await createRouteStop({ routeId: route1.id, stopId: stopKullu.id, stopOrder: 3 });
    await createRouteStop({ routeId: route1.id, stopId: stopManali.id, stopOrder: 4 });
    console.log('✅ Route 1 stops created');

    // Route 2 stops (Shimla -> Kullu)
    await createRouteStop({ routeId: route2.id, stopId: stopShimlaISBT.id, stopOrder: 1 });
    await createRouteStop({ routeId: route2.id, stopId: stopMandi.id, stopOrder: 2 });
    await createRouteStop({ routeId: route2.id, stopId: stopKullu.id, stopOrder: 3 });
    console.log('✅ Route 2 stops created');

    // ========== 7. Create Trips ==========
    console.log('🚌 Creating trips...');
    
    const startTime1 = Date.now() + 2 * 60 * 60 * 1000; // 2 hours from now
    const trip1 = await createTrip({
      driverId: driver1.id,
      busId: bus1.id,
      routeId: route1.id,
      startTime: startTime1.toString(),
      endTime: (startTime1 + 8 * 60 * 60 * 1000).toString(), // 8 hours duration
      status: 'ACTIVE',
    });
    console.log(`✅ Trip 1: ${trip1.id} (Driver: ${driver1.id}, Bus: ${bus1.id}, Route: ${route1.id})`);

    const startTime2 = Date.now() + 4 * 60 * 60 * 1000; // 4 hours from now
    const trip2 = await createTrip({
      driverId: driver2.id,
      busId: bus2.id,
      routeId: route2.id,
      startTime: startTime2.toString(),
      endTime: (startTime2 + 6 * 60 * 60 * 1000).toString(), // 6 hours duration
      status: 'SCHEDULED',
    });
    console.log(`✅ Trip 2: ${trip2.id} (Driver: ${driver2.id}, Bus: ${bus2.id}, Route: ${route2.id})`);

    // ========== 8. Create Assignments ==========
    console.log('🔗 Creating driver-bus assignments...');
    
    await createAssignment({
      driverId: driver1.id,
      busId: bus1.id,
      startTime: startTime1,
      status: 'ACTIVE',
    });
    console.log(`✅ Assignment: Driver ${driver1.id} -> Bus ${bus1.id}`);

    await createAssignment({
      driverId: driver2.id,
      busId: bus2.id,
      startTime: startTime2,
      status: 'ACTIVE',
    });
    console.log(`✅ Assignment: Driver ${driver2.id} -> Bus ${bus2.id}`);

    // ========== 9. Add Sample GPS Locations ==========
    console.log('📍 Adding sample GPS locations...');
    
    // Add GPS for trip1 (near Shimla)
    await addGpsLocation({
      tripId: trip1.id,
      latitude: 31.1048,
      longitude: 77.1734,
      speed: 45,
      heading: 45,
      accuracy: 5,
      recordedAt: Date.now() - 5 * 60 * 1000, // 5 minutes ago
    });
    
    await addGpsLocation({
      tripId: trip1.id,
      latitude: 31.1200,
      longitude: 77.1750,
      speed: 50,
      heading: 50,
      accuracy: 4,
      recordedAt: Date.now() - 2 * 60 * 1000, // 2 minutes ago
    });
    
    await addGpsLocation({
      tripId: trip1.id,
      latitude: 31.1350,
      longitude: 77.1765,
      speed: 55,
      heading: 52,
      accuracy: 3,
      recordedAt: Date.now(), // now
    });
    console.log(`✅ GPS locations added for Trip 1`);

    // Add GPS for trip2 (near Mandi - scheduled)
    await addGpsLocation({
      tripId: trip2.id,
      latitude: 31.5446,
      longitude: 77.1856,
      speed: 0,
      heading: 0,
      accuracy: 10,
      recordedAt: Date.now(),
    });
    console.log(`✅ GPS locations added for Trip 2`);

    console.log('\n🎉 Seed completed successfully!');
    console.log('\n📋 Summary:');
    console.log(`  - Organization: 1`);
    console.log(`  - Users: 3 (1 passenger, 2 drivers)`);
    console.log(`  - Drivers: 2`);
    console.log(`  - Buses: 3`);
    console.log(`  - Stops: 5`);
    console.log(`  - Routes: 2 (with geometry)`);
    console.log(`  - Route Stops: 7`);
    console.log(`  - Trips: 2 (1 ACTIVE, 1 SCHEDULED)`);
    console.log(`  - Assignments: 2`);
    console.log(`  - GPS Locations: 4`);
    console.log('\n🔑 Test Credentials:');
    console.log('  Passenger: passenger@example.com / pass123');
    console.log('  Driver 1: rajesh.driver@example.com / driver123');
    console.log('  Driver 2: suresh.driver@example.com / driver123');

  } catch (error) {
    console.error('❌ Seed failed:', error);
    process.exit(1);
  }
}

seed();