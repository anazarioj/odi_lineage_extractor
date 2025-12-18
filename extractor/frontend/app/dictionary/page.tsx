'use client'

import { Container, Typography, Box, Card, CardContent, TextField, Table, TableHead, TableBody, TableRow, TableCell } from '@mui/material'

export default function DictionaryPage() {
  return (
    <Container maxWidth="lg" sx={{ py: 4 }}>
      <Typography 
        variant="h3" 
        component="h1" 
        gutterBottom
        sx={{ color: 'var(--indra-primary)', fontWeight: 600 }}
      >
        Diccionario de Campos
      </Typography>
      <Typography variant="body1" sx={{ color: 'var(--indra-text)', mb: 3 }}>
        Explora la metadata de los campos: descripción, tipo de dato, longitud, constraints, etc.
      </Typography>

      <Box sx={{ mb: 3 }}>
        <TextField 
          fullWidth 
          placeholder="Buscar campo por nombre..." 
          sx={{ mb: 2 }}
        />
      </Box>

      <Card sx={{ boxShadow: 2 }}>
        <CardContent>
          <Table>
            <TableHead>
              <TableRow>
                <TableCell><strong>Tabla</strong></TableCell>
                <TableCell><strong>Campo</strong></TableCell>
                <TableCell><strong>Tipo</strong></TableCell>
                <TableCell><strong>Longitud</strong></TableCell>
                <TableCell><strong>Nullable</strong></TableCell>
                <TableCell><strong>Descripción</strong></TableCell>
              </TableRow>
            </TableHead>
            <TableBody>
              <TableRow>
                <TableCell colSpan={6} align="center">
                  <Typography variant="body2" sx={{ color: 'var(--indra-text)', py: 4 }}>
                    No hay datos disponibles. Extrae primero el inventario.
                  </Typography>
                </TableCell>
              </TableRow>
            </TableBody>
          </Table>
        </CardContent>
      </Card>
    </Container>
  )
}
