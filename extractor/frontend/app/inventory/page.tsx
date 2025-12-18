'use client'

import { Container, Typography, Box, Card, CardContent, Tabs, Tab, Button } from '@mui/material'
import { useState } from 'react'
import Link from 'next/link'

export default function InventoryPage() {
  const [tabValue, setTabValue] = useState(0)

  return (
    <Container maxWidth="lg" sx={{ py: 4 }}>
      <Typography 
        variant="h3" 
        component="h1" 
        gutterBottom
        sx={{ color: 'var(--indra-primary)', fontWeight: 600 }}
      >
        Inventario de Objetos
      </Typography>
      <Typography variant="body1" sx={{ color: 'var(--indra-text)', mb: 3 }}>
        Visualiza el inventario completo de objetos Oracle/ODI: tablas, campos, vistas, stored procedures, etc.
      </Typography>

      <Card sx={{ mb: 3, boxShadow: 2 }}>
        <CardContent>
          <Tabs 
            value={tabValue} 
            onChange={(_, newValue) => setTabValue(newValue)}
            sx={{ mb: 2 }}
          >
            <Tab label="Tablas" />
            <Tab label="Vistas" />
            <Tab label="Stored Procedures" />
            <Tab label="Funciones" />
            <Tab label="Paquetes" />
          </Tabs>

          <Box sx={{ minHeight: 300, display: 'flex', alignItems: 'center', justifyContent: 'center' }}>
            <Typography variant="body2" sx={{ color: 'var(--indra-text)' }}>
              {tabValue === 0 && 'Lista de tablas aparecerá aquí'}
              {tabValue === 1 && 'Lista de vistas aparecerá aquí'}
              {tabValue === 2 && 'Lista de stored procedures aparecerá aquí'}
              {tabValue === 3 && 'Lista de funciones aparecerá aquí'}
              {tabValue === 4 && 'Lista de paquetes aparecerá aquí'}
            </Typography>
          </Box>
        </CardContent>
      </Card>

      <Box sx={{ display: 'flex', gap: 2, justifyContent: 'flex-end' }}>
        <Button
          variant="outlined"
          component={Link}
          href="/dictionary"
          sx={{
            borderColor: 'var(--indra-primary)',
            color: 'var(--indra-primary)',
            '&:hover': { borderColor: 'var(--indra-secondary)' },
          }}
        >
          Ver Diccionario
        </Button>
        <Button
          variant="contained"
          component={Link}
          href="/lineage"
          sx={{
            backgroundColor: 'var(--indra-primary)',
            '&:hover': { backgroundColor: 'var(--indra-secondary)' },
          }}
        >
          Explorar Linaje
        </Button>
      </Box>
    </Container>
  )
}
