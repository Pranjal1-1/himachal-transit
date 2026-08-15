export enum BusFuelType {
  DIESEL = 'Diesel',
  CNG = 'CNG',
  ELECTRIC = 'Electric',
  HYBRID = 'Hybrid',
}

export enum BusEmissionStandard {
  BS_III = 'BS-III',
  BS_IV = 'BS-IV',
  BS_VI = 'BS-VI',
  ELECTRIC = 'Electric',
  UNKNOWN = 'Unknown',
}

export enum BusStatus {
  IN_SERVICE = 'IN_SERVICE',
  MAINTENANCE = 'MAINTENANCE',
  OUT_OF_SERVICE = 'OUT_OF_SERVICE',
  RETIRED = 'RETIRED',
}

export enum RouteStatus {
  ACTIVE = 'ACTIVE',
  INACTIVE = 'INACTIVE',
}

export enum StopStatus {
  ACTIVE = 'ACTIVE',
  INACTIVE = 'INACTIVE',
  MAINTENANCE = 'MAINTENANCE',
}

export const BusFuelTypeValues = Object.values(BusFuelType).filter(v => typeof v === 'string') as string[];
export const BusEmissionStandardValues = Object.values(BusEmissionStandard).filter(v => typeof v === 'string') as string[];
export const BusStatusValues = Object.values(BusStatus).filter(v => typeof v === 'string') as string[];
export const RouteStatusValues = Object.values(RouteStatus).filter(v => typeof v === 'string') as string[];
export const StopStatusValues = Object.values(StopStatus).filter(v => typeof v === 'string') as string[];

export function isValidBusFuelType(value: string): value is BusFuelType {
  return BusFuelTypeValues.includes(value as BusFuelType);
}

export function isValidBusEmissionStandard(value: string): value is BusEmissionStandard {
  return BusEmissionStandardValues.includes(value as BusEmissionStandard);
}

export function isValidBusStatus(value: string): value is BusStatus {
  return BusStatusValues.includes(value as BusStatus);
}

export function isValidRouteStatus(value: string): value is RouteStatus {
  return RouteStatusValues.includes(value as RouteStatus);
}

export function isValidStopStatus(value: string): value is StopStatus {
  return StopStatusValues.includes(value as StopStatus);
}