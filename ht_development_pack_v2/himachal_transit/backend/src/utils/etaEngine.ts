/**
 * ETA Engine - Phase 8
 * Calculates Estimated Time of Arrival based on:
 * - Distance to next stop (Haversine formula)
 * - Current/estimated speed
 */

// Earth's radius in kilometers
const EARTH_RADIUS_KM = 6371;

/**
 * Calculate distance between two lat/lon points using Haversine formula
 * Returns distance in kilometers
 */
export function calculateDistance(
  lat1: number,
  lon1: number,
  lat2: number,
  lon2: number
): number {
  const dLat = (lat2 - lat1) * Math.PI / 180;
  const dLon = (lon2 - lon1) * Math.PI / 180;
  const a = 
    Math.sin(dLat / 2) * Math.sin(dLat / 2) +
    Math.cos(lat1 * Math.PI / 180) * Math.cos(lat2 * Math.PI / 180) *
    Math.sin(dLon / 2) * Math.sin(dLon / 2);
  const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
  return EARTH_RADIUS_KM * c;
}

/**
 * Calculate distance along a route path (polyline) from a starting point
 * Returns distance in kilometers
 */
export function calculateDistanceAlongRoute(
  routePoints: { latitude: number; longitude: number }[],
  fromIndex: number,
  toIndex: number
): number {
  let totalDistance = 0;
  for (let i = fromIndex; i < toIndex && i < routePoints.length - 1; i++) {
    const p1 = routePoints[i];
    const p2 = routePoints[i + 1];
    totalDistance += calculateDistance(p1.latitude, p1.longitude, p2.latitude, p2.longitude);
  }
  return totalDistance;
}

/**
 * Find the closest point on a route to a given location
 * Returns the index of the closest route point
 */
export function findClosestRoutePoint(
  routePoints: { latitude: number; longitude: number }[],
  latitude: number,
  longitude: number
): number {
  let minDistance = Infinity;
  let closestIndex = 0;
  
  for (let i = 0; i < routePoints.length; i++) {
    const dist = calculateDistance(latitude, longitude, routePoints[i].latitude, routePoints[i].longitude);
    if (dist < minDistance) {
      minDistance = dist;
      closestIndex = i;
    }
  }
  
  return closestIndex;
}

/**
 * ETA Calculation Result
 */
export interface EtaResult {
  /** Distance to next stop in kilometers */
  distanceToNextStopKm: number;
  /** Estimated time to next stop in minutes */
  etaMinutes: number;
  /** Current speed in km/h */
  currentSpeedKmh: number;
  /** Next stop info */
  nextStop: {
    name: string;
    latitude: number;
    longitude: number;
    stopOrder: number;
  } | null;
  /** Remaining stops count */
  remainingStops: number;
  /** Total remaining distance in km */
  totalRemainingDistanceKm: number;
  /** Estimated time to destination in minutes */
  etaToDestinationMinutes: number;
  /** Current position on route (closest route point index) */
  currentRouteIndex: number;
}

/**
 * Calculate ETA for a trip based on current GPS location and route stops
 * MVP implementation: distance to next stop + current/estimated speed
 */
export function calculateEta(
  params: {
    /** Current GPS location */
    currentLocation: { latitude: number; longitude: number };
    /** Current speed in km/h (from GPS) */
    currentSpeedKmh: number | null;
    /** Route stops ordered by stop_order */
    routeStops: Array<{
      stop_id: string;
      stop_order: number;
      name: string;
      latitude: number;
      longitude: number;
    }>;
    /** Route geometry points (polyline) - optional for more accurate distance */
    routePoints?: Array<{ latitude: number; longitude: number }>;
    /** Minimum speed fallback (km/h) when GPS speed unavailable */
    minSpeedKmh?: number;
    /** Average stop dwell time in minutes */
    dwellTimeMinutes?: number;
  }
): EtaResult {
  const {
    currentLocation,
    currentSpeedKmh,
    routeStops,
    routePoints,
    minSpeedKmh = 20, // Default 20 km/h for city traffic
    dwellTimeMinutes = 2, // 2 minutes per stop
  } = params;

  // Use current speed or fallback
  const speed = currentSpeedKmh && currentSpeedKmh > 0 ? currentSpeedKmh : minSpeedKmh;

  // Find next stop (first stop not yet reached)
  // For simplicity, we find the closest stop ahead based on route order
  // In a real implementation, you'd track which stops have been passed
  let nextStop = null;
  let nextStopIndex = -1;
  
  // Find closest stop to current location
  let minDist = Infinity;
  let closestStopIndex = 0;
  
  for (let i = 0; i < routeStops.length; i++) {
    const stop = routeStops[i];
    const dist = calculateDistance(
      currentLocation.latitude,
      currentLocation.longitude,
      stop.latitude,
      stop.longitude
    );
    if (dist < minDist) {
      minDist = dist;
      closestStopIndex = i;
    }
  }
  
  // Next stop is the one after the closest (assuming forward progress)
  nextStopIndex = Math.min(closestStopIndex + 1, routeStops.length - 1);
  nextStop = routeStops[nextStopIndex] || null;

  // Calculate distance to next stop
  let distanceToNextStopKm = 0;
  if (nextStop) {
    distanceToNextStopKm = calculateDistance(
      currentLocation.latitude,
      currentLocation.longitude,
      nextStop.latitude,
      nextStop.longitude
    );
  }

  // Calculate ETA to next stop (minutes)
  const etaMinutes = nextStop 
    ? Math.round((distanceToNextStopKm / speed) * 60) 
    : 0;

  // Calculate total remaining distance and ETA to destination
  let totalRemainingDistanceKm = distanceToNextStopKm;
  let etaToDestinationMinutes = etaMinutes;
  
  if (routePoints && routePoints.length > 1) {
    // Use route geometry for more accurate distance
    const currentRouteIndex = findClosestRoutePoint(routePoints, currentLocation.latitude, currentLocation.longitude);
    const lastIndex = routePoints.length - 1;
    totalRemainingDistanceKm = calculateDistanceAlongRoute(routePoints, currentRouteIndex, lastIndex);
    etaToDestinationMinutes = Math.round((totalRemainingDistanceKm / speed) * 60);
    
    // Add dwell time for remaining stops
    const remainingStopsCount = routeStops.length - nextStopIndex - 1;
    etaToDestinationMinutes += remainingStopsCount * dwellTimeMinutes;
  } else {
    // Fallback: sum distances between consecutive stops
    for (let i = nextStopIndex; i < routeStops.length - 1; i++) {
      const dist = calculateDistance(
        routeStops[i].latitude,
        routeStops[i].longitude,
        routeStops[i + 1].latitude,
        routeStops[i + 1].longitude
      );
      totalRemainingDistanceKm += dist;
    }
    etaToDestinationMinutes = Math.round((totalRemainingDistanceKm / speed) * 60);
    // Add dwell time
    const remainingStopsCount = routeStops.length - nextStopIndex - 1;
    etaToDestinationMinutes += remainingStopsCount * dwellTimeMinutes;
  }

  return {
    distanceToNextStopKm: Math.round(distanceToNextStopKm * 100) / 100,
    etaMinutes,
    currentSpeedKmh: speed,
    nextStop: nextStop ? {
      name: nextStop.name,
      latitude: nextStop.latitude,
      longitude: nextStop.longitude,
      stopOrder: nextStop.stop_order,
    } : null,
    remainingStops: Math.max(0, routeStops.length - nextStopIndex - 1),
    totalRemainingDistanceKm: Math.round(totalRemainingDistanceKm * 100) / 100,
    etaToDestinationMinutes,
    currentRouteIndex: routePoints ? findClosestRoutePoint(routePoints, currentLocation.latitude, currentLocation.longitude) : 0,
  };
}

/**
 * Format ETA for display
 */
export function formatEta(minutes: number): string {
  if (minutes < 1) return '< 1 min';
  if (minutes < 60) return `${minutes} min`;
  const hours = Math.floor(minutes / 60);
  const mins = minutes % 60;
  if (mins === 0) return `${hours}h`;
  return `${hours}h ${mins}min`;
}