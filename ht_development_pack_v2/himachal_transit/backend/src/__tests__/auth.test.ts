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

describe('Auth flow', () => {
  it('registers, logs in, and detects passenger role', async () => {
    const register = await request(server).post('/auth/register').send({
      fullName: 'Test User',
      phone: '9991112222',
      email: 'test@example.com',
      password: 'Password123!',
      confirmPassword: 'Password123!',
    });
    expect(register.status).toBe(200);
    expect(register.body.role).toBe('PASSENGER');

    const login = await request(server).post('/auth/login').send({ identifier: 'test@example.com', password: 'Password123!' });
    expect(login.status).toBe(200);
    expect(login.body.role).toBe('PASSENGER');
  });

  it('rejects invalid password', async () => {
    await request(server).post('/auth/register').send({
      fullName: 'Test User',
      phone: '9991112223',
      email: 'test2@example.com',
      password: 'Password123!',
      confirmPassword: 'Password123!',
    });
    const login = await request(server).post('/auth/login').send({ identifier: 'test2@example.com', password: 'wrong' });
    expect(login.status).toBe(401);
  });
});
