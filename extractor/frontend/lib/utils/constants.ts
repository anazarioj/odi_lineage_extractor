/**
 * Constantes de la aplicación
 */

export const APP_NAME = 'Oracle Lineage AI';
export const APP_VERSION = '1.0.0';

// Rutas de la aplicación
export const ROUTES = {
  HOME: '/',
  INVENTORY: '/inventory',
  DICTIONARY: '/dictionary',
  LINEAGE: '/lineage',
  MIGRATION: '/migration',
  DASHBOARD: '/dashboard',
  SETTINGS: '/settings',
} as const;

// Mensajes de error comunes
export const ERROR_MESSAGES = {
  NETWORK_ERROR: 'Error de conexión. Por favor, intenta de nuevo.',
  UNAUTHORIZED: 'No tienes autorización para realizar esta acción.',
  NOT_FOUND: 'Recurso no encontrado.',
  SERVER_ERROR: 'Error del servidor. Por favor, contacta al administrador.',
} as const;
