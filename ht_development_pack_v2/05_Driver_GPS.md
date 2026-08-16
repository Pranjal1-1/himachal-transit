# 05 — Driver GPS Prototype

Flow:
Driver login → assignment → Start Trip → permission → GPS → backend → End Trip.

GPS payload:
```json
{
  "tripId": "TRIP_123",
  "latitude": 31.1048,
  "longitude": 77.1734,
  "speed": 32.4,
  "heading": 145,
  "accuracy": 8.5,
  "timestamp": "2026-08-10T18:30:00Z"
}
```

Backend verifies driver, active trip and assigned bus.

Support background GPS and offline buffering. Tracking should stop when the trip ends.
