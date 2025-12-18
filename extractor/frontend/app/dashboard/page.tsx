'use client'

import { Container, Typography, Box, Button, Card, CardContent } from '@mui/material';
import { useEffect, useState } from 'react';
import { backendApi } from '@/lib/api/backend';
import { Loading, ErrorMessage } from '@/components/common';
import CheckCircleIcon from '@mui/icons-material/CheckCircle';
import ErrorIcon from '@mui/icons-material/Error';

export default function DashboardPage() {
  const [apiStatus, setApiStatus] = useState<string>('Verificando...');
  const [isLoading, setIsLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    const checkAPI = async () => {
      try {
        setIsLoading(true);
        const data = await backendApi.getRoot();
        setApiStatus(data.message);
        setError(null);
      } catch (err) {
        setError('No se pudo conectar con el backend');
        setApiStatus('Error de conexión');
      } finally {
        setIsLoading(false);
      }
    };

    checkAPI();
  }, []);

  if (isLoading) {
    return <Loading />;
  }

  return (
    <Container maxWidth="lg" sx={{ py: 4 }}>
      <Typography 
        variant="h3" 
        component="h1" 
        gutterBottom
        sx={{ 
          color: 'var(--indra-primary)',
          fontWeight: 600,
          mb: 4,
        }}
      >
        Dashboard
      </Typography>

      <Card 
        sx={{ 
          mb: 3,
          boxShadow: 3,
          borderLeft: `4px solid ${error ? 'var(--indra-yellow)' : 'var(--indra-accent)'}`,
        }}
      >
        <CardContent>
          <Box sx={{ display: 'flex', alignItems: 'center', gap: 2 }}>
            {error ? (
              <ErrorIcon sx={{ color: 'var(--indra-yellow)', fontSize: 40 }} />
            ) : (
              <CheckCircleIcon sx={{ color: 'var(--indra-accent)', fontSize: 40 }} />
            )}
            <Box>
              <Typography variant="h6" sx={{ color: 'var(--indra-text)' }}>
                Estado del Backend
              </Typography>
              <Typography variant="body1" sx={{ color: 'var(--indra-primary)', fontWeight: 500 }}>
                {apiStatus}
              </Typography>
            </Box>
          </Box>
        </CardContent>
      </Card>

      {error && (
        <ErrorMessage 
          title="Error de conexión" 
          message={error}
          severity="warning"
        />
      )}

      <Box sx={{ display: 'flex', gap: 2, mt: 4 }}>
        <Button 
          variant="contained" 
          size="large"
          sx={{
            backgroundColor: 'var(--indra-primary)',
            '&:hover': {
              backgroundColor: 'var(--indra-secondary)',
            },
          }}
        >
          Acción Principal
        </Button>
        <Button 
          variant="outlined" 
          size="large"
          sx={{
            borderColor: 'var(--indra-primary)',
            color: 'var(--indra-primary)',
            '&:hover': {
              borderColor: 'var(--indra-secondary)',
              backgroundColor: 'rgba(0, 66, 84, 0.04)',
            },
          }}
        >
          Acción Secundaria
        </Button>
      </Box>
    </Container>
  );
}
