# 06 — Realtime Tracking

```text
Driver GPS
→ Backend
→ Redis/current state
→ WebSocket
→ Passenger map
```

Events:
trip.started
trip.updated
trip.ended
bus.location.updated
bus.status.updated
bus.eta.updated
bus.alert

Done when a physical driver phone moves and the passenger map updates without refresh.
