# Himachal Transit Development Pack

Complete development plan for a real-time Himachal Pradesh bus tracking system.

## Stack
- Flutter/Dart mobile app
- Node.js + TypeScript backend (NestJS recommended)
- PostgreSQL + PostGIS
- Redis where useful
- WebSockets for realtime
- Next.js/React admin dashboard

## Product
One Flutter app automatically becomes Passenger or Driver based on the authenticated backend role. Driver accounts are organization-provisioned. Admin is a separate web dashboard.

## Core MVP
Driver login → assigned bus → Start Trip → phone GPS → backend → realtime → passenger live map → moving bus → basic ETA → End Trip.

## UI references
Use the five supplied conversation images as visual references:
- Authentication
- Passenger Home & Bus Discovery
- Passenger Tracking & Journey
- Driver App
- Admin / Management Web App

They are references, not pixel-perfect templates.
