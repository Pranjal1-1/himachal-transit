# 02 — Authentication & Role Detection

Passenger:
- register
- login
- OTP/verification
- password recovery

Driver:
- no public signup
- organization creates account
- driver login
- organization verification

Backend returns role:
```json
{ "userId": "USR_1", "role": "PASSENGER" }
```
or:
```json
{ "userId": "USR_2", "role": "DRIVER", "driverId": "DRV_1" }
```

The Flutter app then opens the correct interface. Never trust a client-provided role.

API:
POST /auth/register
POST /auth/login
POST /auth/otp/request
POST /auth/otp/verify
POST /auth/refresh
POST /auth/logout
POST /auth/driver/verify

Security: password hashing, secure token handling, rate limiting, server-side authorization.
