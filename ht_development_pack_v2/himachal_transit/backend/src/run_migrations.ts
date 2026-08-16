import { runMigrations } from './db_pg';

async function main() {
  try {
    await runMigrations();
    console.log('Migrations applied');
    process.exit(0);
  } catch (e) {
    console.error('Migration failed', e);
    process.exit(1);
  }
}

main();
