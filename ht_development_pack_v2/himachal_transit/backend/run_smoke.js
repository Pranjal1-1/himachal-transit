const fs = require('fs');
const path = require('path');
const request = require('supertest');

let app;
const distIndex = path.join(__dirname, 'dist', 'index.js');
if (fs.existsSync(distIndex)) {
  const mod = require(distIndex);
  app = mod.default || mod;
} else {
  try {
    require('ts-node/register');
    const mod = require('./src/index');
    app = mod.default || mod;
  } catch (e) {
    console.error('Unable to load backend app. Build the project first or install ts-node.');
    throw e;
  }
}

(async () => {
  const server = app.listen();
  try {
    const register = await request(server).post('/auth/register').send({
      fullName: 'Test User',
      phone: '9991112222',
      email: 'smoke@example.com',
      password: 'Password123!',
      confirmPassword: 'Password123!'
    });
    console.log('register status', register.status);
    console.log('register body', register.body);

    const login = await request(server).post('/auth/login').send({ identifier: 'smoke@example.com', password: 'Password123!' });
    console.log('login status', login.status);
    console.log('login body', login.body);

    const refresh = await request(server).post('/auth/refresh').send({ refresh: login.body.tokens.refresh });
    console.log('refresh status', refresh.status);
    console.log('refresh body', refresh.body);

    const refreshAgain = await request(server).post('/auth/refresh').send({ refresh: login.body.tokens.refresh });
    console.log('refresh-again status', refreshAgain.status);
    console.log('refresh-again body', refreshAgain.body);
  } catch (e) {
    console.error(e);
  } finally {
    server.close();
  }
})();
