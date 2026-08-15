import fs from 'fs';
import path from 'path';

const app = require('../index');
const DB_PATH = path.join(__dirname, '..', '..', 'data.json');

export function resetTestDb() {
  if (fs.existsSync(DB_PATH)) fs.unlinkSync(DB_PATH);
}

export function startTestServer() {
  return app.listen();
}
