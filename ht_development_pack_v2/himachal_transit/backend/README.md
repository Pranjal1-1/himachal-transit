# Backend (Phase 01)

Minimal Node.js + TypeScript starter for Phase 01.

To run locally:

```bash
cd himachal_transit/backend
npm install
npm run dev
```

Environment variables (see ../.env.example):
- `PORT` — HTTP port
- `DATABASE_URL` — Postgres connection (not used yet)
- `REDIS_URL` — Redis connection (not used yet)
- `JWT_SECRET` — JWT signing secret

This service exposes `/health` for a basic readiness check.

Migrations
----------

Set `DATABASE_URL` in your environment (Postgres with PostGIS).

Run migrations:

```bash
# build TS files
npm run build
# run migration script
node dist/run_migrations.js
```

Seed data: migrations include seed placeholders for an organization and driver when empty.
