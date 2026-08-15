import bcrypt from 'bcrypt';
import jwt from 'jsonwebtoken';
import { v4 as uuidv4 } from 'uuid';
import { createUser, getUserByEmailOrPhone, storeRefreshToken, consumeRefreshToken, getUserById, seedDriverIfMissing, getDriverByUserId } from './db';

const JWT_SECRET = process.env.JWT_SECRET || 'dev_secret_change_me';

// trigger seeding in background for local file DB (no top-level await)
seedDriverIfMissing().catch(() => {});

export async function registerUser({ fullName, phone, email, password }: any) {
  // validations done upstream
  const existing = (await getUserByEmailOrPhone(email)) || (await getUserByEmailOrPhone(phone));
  if (existing) throw new Error('User exists');
  const hash = await bcrypt.hash(password, 10);
  const user = await createUser({ fullName, phone, email, passwordHash: hash, role: 'PASSENGER' });
  return user;
}

export async function verifyPassword(user: any, password: string) {
  if (!user) return false;
  const hash = user.passwordHash || user.password_hash || '';
  return bcrypt.compare(password, hash);
}

export async function issueTokens(userId: string) {
  const access = jwt.sign({ sub: userId }, JWT_SECRET, { expiresIn: '15m' });
  const refresh = uuidv4();
  await storeRefreshToken(refresh, userId);
  return { access, refresh };
}

export async function refreshTokens(refresh: string) {
  const userId = await Promise.resolve(consumeRefreshToken(refresh));
  if (!userId) return null;
  return issueTokens(userId);
}

export function decodeAccess(token: string) {
  try {
    return jwt.verify(token, JWT_SECRET) as any;
  } catch (e) {
    return null;
  }
}

export function getTrustedRole(userId: string) {
  // getUserById may be async if backed by Postgres
  const maybe = getUserById(userId);
  return Promise.resolve(maybe).then(async (user: any) => {
    if (!user) return null;
    if (user.role === 'ADMIN' || user.role === 'MANAGER') return { userId: user.id, role: 'ADMIN' };
    if (user.role === 'DRIVER') {
      const driver = await getDriverByUserId(user.id);
      return { userId: user.id, role: 'DRIVER', driverId: driver?.id || user.id };
    }
    return { userId: user.id, role: 'PASSENGER' };
  });
}
