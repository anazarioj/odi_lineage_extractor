'use client'

import { Container, Typography, Box, Card, CardContent, TextField, Button, Autocomplete } from '@mui/material'

export default function LineagePage() {
  return (
    <Container maxWidth="lg" sx={{ py: 4 }}>
      <Typography 
        variant="h3" 
        component="h1" 
        gutterBottom
        sx={{ color: 'var(--indra-primary)', fontWeight: 600 }}
      >
        Linaje de Datos
      </Typography>
      <Typography variant="body1" sx={{ color: 'var(--indra-text)', mb: 3 }}>
        Visualiza la trazabilidad de objetos: tablas, columnas, mappings y procedimientos.
      </Typography>

      {/* Selector de objeto/campo */}
      <Card sx={{ mb: 3, boxShadow: 2 }}>
        <CardContent>
          <Typography variant="h6" sx={{ color: 'var(--indra-text)', mb: 2 }}>
            Seleccionar Objeto o Campo
          </Typography>
          <Box sx={{ display: 'flex', gap: 2, mb: 2 }}>
            <Autocomplete
              fullWidth
              options={[]}
              renderInput={(params) => <TextField {...params} label="Buscar tabla o campo" placeholder="Ej: EMPLOYEES, EMPLOYEES.SALARY" />}
            />
            <Button
              variant="contained"
              sx={{
                backgroundColor: 'var(--indra-primary)',
                '&:hover': { backgroundColor: 'var(--indra-secondary)' },
                minWidth: '150px',
              }}
            >
              Generar Linaje
            </Button>
          </Box>
        </CardContent>
      </Card>

      {/* Área del grafo */}
      <Card sx={{ boxShadow: 2 }}>
        <CardContent>
          <Box sx={{ minHeight: 500, display: 'flex', alignItems: 'center', justifyContent: 'center', backgroundColor: '#fafafa', borderRadius: 1 }}>
            <Typography variant="body2" sx={{ color: 'var(--indra-text)' }}>
              Selecciona un objeto para visualizar su grafo de linaje
            </Typography>
          </Box>
        </CardContent>
      </Card>
    </Container>
  )
}
