'use client'

import { Container, Typography, Box, Card, CardContent, Button, Checkbox, FormControlLabel, Divider } from '@mui/material'

export default function MigrationPage() {
  return (
    <Container maxWidth="lg" sx={{ py: 4 }}>
      <Typography 
        variant="h3" 
        component="h1" 
        gutterBottom
        sx={{ color: 'var(--indra-primary)', fontWeight: 600 }}
      >
        Plan de Migración
      </Typography>
      <Typography variant="body1" sx={{ color: 'var(--indra-text)', mb: 3 }}>
        Genera el plan de migración para objetos seleccionados o todo el inventario.
      </Typography>

      {/* Selección de objetos */}
      <Card sx={{ mb: 3, boxShadow: 2 }}>
        <CardContent>
          <Typography variant="h6" sx={{ color: 'var(--indra-text)', mb: 2 }}>
            Seleccionar Objetos a Migrar
          </Typography>
          <Box sx={{ display: 'flex', flexDirection: 'column', gap: 1 }}>
            <FormControlLabel control={<Checkbox />} label="Todas las Tablas" />
            <FormControlLabel control={<Checkbox />} label="Todas las Vistas" />
            <FormControlLabel control={<Checkbox />} label="Todos los Stored Procedures" />
            <FormControlLabel control={<Checkbox />} label="Todas las Funciones" />
            <FormControlLabel control={<Checkbox />} label="Todos los Paquetes" />
          </Box>
          <Divider sx={{ my: 2 }} />
          <Typography variant="body2" sx={{ color: 'var(--indra-text)', mb: 1 }}>
            O selecciona objetos específicos:
          </Typography>
          <Box sx={{ minHeight: 100, backgroundColor: '#f9f9f9', p: 2, borderRadius: 1, mb: 2 }}>
            <Typography variant="body2" sx={{ color: 'var(--indra-text)' }}>
              Lista de objetos seleccionados aparecerá aquí
            </Typography>
          </Box>
          <Button
            variant="contained"
            sx={{
              backgroundColor: 'var(--indra-primary)',
              '&:hover': { backgroundColor: 'var(--indra-secondary)' },
            }}
          >
            Generar Plan de Migración
          </Button>
        </CardContent>
      </Card>

      {/* Visualización del plan */}
      <Card sx={{ boxShadow: 2 }}>
        <CardContent>
          <Typography variant="h6" sx={{ color: 'var(--indra-text)', mb: 2 }}>
            Plan de Migración Generado
          </Typography>
          <Box sx={{ minHeight: 300, backgroundColor: '#fafafa', p: 2, borderRadius: 1 }}>
            <Typography variant="body2" sx={{ color: 'var(--indra-text)' }}>
              El plan de migración aparecerá aquí una vez generado
            </Typography>
          </Box>
        </CardContent>
      </Card>
    </Container>
  )
}
