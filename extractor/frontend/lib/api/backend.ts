import { apiClient } from './client';

export interface HealthResponse {
  status: string;
}

export interface MessageResponse {
  message: string;
}

export const backendApi = {
  // Health check
  healthCheck: () => apiClient.get<HealthResponse>('/health'),
  
  // Root endpoint
  getRoot: () => apiClient.get<MessageResponse>('/'),
  
  // Agregar más endpoints según sea necesario
};
