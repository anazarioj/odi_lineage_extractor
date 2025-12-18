'use client'

import { Container, Typography, Box, Button, Card, CardContent, TextField, MenuItem, Divider } from '@mui/material'
import Link from 'next/link'
import CheckCircleIcon from '@mui/icons-material/CheckCircle'
import ErrorIcon from '@mui/icons-material/Error'
import StorageIcon from '@mui/icons-material/Storage'
import { useEffect, useState } from 'react'
import { backendApi } from '@/lib/api/backend'

export default function Home() {
  const [apiStatus, setApiStatus] = useState<string>('Verificando...')
  const [isLoading, setIsLoading] = useState<boolean>(true)
  const [error, setError] = useState<string | null>(null)

  useEffect(() => {
    const checkAPI = async () => {
      try {
        setIsLoading(true)
        const data = await backendApi.healthCheck()
        setApiStatus(data.status)
        setError(null)
      } catch (e) {
        setError('No se pudo conectar con el backend')
        setApiStatus('Error de conexión')
      } finally {
        setIsLoading(false)
      }
    }
    checkAPI()
  }, [])

  return (
    <Container maxWidth="lg" sx={{ py: 4 }}>
      <Box sx={{ mb: 4 }}>
        <Typography
          variant="h3"
          component="h1"
          gutterBottom
          sx={{ color: 'var(--indra-primary)', fontWeight: 600 }}
        >
          Oracle Lineage AI — Configuración
        </Typography>
        <Typography variant="body1" sx={{ color: 'var(--indra-text)' }}>
          Configura las conexiones a bases de datos Oracle/ODI y selecciona el modelo de lenguaje para análisis.
        </Typography>
      </Box>

      {/* Estado del Backend */}
      <Card sx={{ mb: 4, boxShadow: 3, borderLeft: `4px solid ${error ? 'var(--indra-yellow)' : 'var(--indra-accent)'}` }}>
        <CardContent>
          <Box sx={{ display: 'flex', alignItems: 'center', gap: 2 }}>
            {error ? (
              <ErrorIcon sx={{ color: 'var(--indra-yellow)', fontSize: 36 }} />
            ) : (
              <CheckCircleIcon sx={{ color: 'var(--indra-accent)', fontSize: 36 }} />
            )}
            <Box>
              <Typography variant="h6" sx={{ color: 'var(--indra-text)' }}>
                Estado del Backend
              </Typography>
              <Typography variant="body1" sx={{ color: 'var(--indra-primary)', fontWeight: 500 }}>
                {isLoading ? 'Cargando...' : apiStatus}
              </Typography>
            </Box>
          </Box>
        </CardContent>
      </Card>

      {/* Configuración de Base de Datos Oracle */}
      <Card sx={{ mb: 3, boxShadow: 2 }}>
        <CardContent>
          <Box sx={{ display: 'flex', alignItems: 'center', gap: 1, mb: 2 }}>
            <StorageIcon sx={{ color: 'var(--indra-primary)' }} />
            <Typography variant="h6" sx={{ color: 'var(--indra-primary)', fontWeight: 600 }}>
              Base de Datos Oracle
            </Typography>
          </Box>
          <Box sx={{ display: 'flex', flexDirection: 'column', gap: 2 }}>
            <TextField fullWidth label="Host" placeholder="localhost" />
            <TextField fullWidth label="Puerto" placeholder="1521" />
            <TextField fullWidth label="SID/Service Name" placeholder="ORCL" />
            <TextField fullWidth label="Usuario" placeholder="system" />
            <TextField fullWidth label="Contraseña" type="password" placeholder="******" />
          </Box>
        </CardContent>
      </Card>

      {/* Configuración de Base de Datos ODI */}
      <Card sx={{ mb: 3, boxShadow: 2 }}>
        <CardContent>
          <Box sx={{ display: 'flex', alignItems: 'center', gap: 1, mb: 2 }}>
            <StorageIcon sx={{ color: 'var(--indra-secondary)' }} />
            <Typography variant="h6" sx={{ color: 'var(--indra-secondary)', fontWeight: 600 }}>
              Base de Datos ODI (Oracle)
            </Typography>
          </Box>
          <Box sx={{ display: 'flex', flexDirection: 'column', gap: 2 }}>
            <TextField fullWidth label="Host" placeholder="localhost" />
            <TextField fullWidth label="Puerto" placeholder="1521" />
            <TextField fullWidth label="SID/Service Name" placeholder="ODI_REPO" />
            <TextField fullWidth label="Usuario" placeholder="odi_user" />
            <TextField fullWidth label="Contraseña" type="password" placeholder="******" />
          </Box>
        </CardContent>
      </Card>

      {/* Selección de LLM */}
      <Card sx={{ mb: 3, boxShadow: 2 }}>
        <CardContent>
          <Typography variant="h6" sx={{ color: 'var(--indra-primary)', fontWeight: 600, mb: 2 }}>
            Modelo de Lenguaje (LLM)
          </Typography>
          <TextField
            fullWidth
            select
            label="Selecciona el modelo"
            defaultValue=""
            sx={{ mb: 2 }}
          >
            <MenuItem value="gemini">Google Gemini</MenuItem>
            <MenuItem value="azure-openai">Azure OpenAI</MenuItem>
            <MenuItem value="openai">OpenAI</MenuItem>
          </TextField>
          <Divider sx={{ my: 2 }} />
          <Typography variant="body2" sx={{ color: 'var(--indra-text)', mb: 1 }}>
            Configuración del modelo:
          </Typography>
          <Box sx={{ display: 'flex', flexDirection: 'column', gap: 2 }}>
            <TextField fullWidth label="API Key" type="password" placeholder="sk-..." />
            <TextField fullWidth label="Endpoint (opcional)" placeholder="https://..." />
          </Box>
        </CardContent>
      </Card>

      {/* Botones de acción */}
      <Box sx={{ display: 'flex', gap: 2, justifyContent: 'flex-end' }}>
        <Button
          variant="outlined"
          sx={{
            borderColor: 'var(--indra-primary)',
            color: 'var(--indra-primary)',
            '&:hover': { borderColor: 'var(--indra-secondary)' },
          }}
        >
          Probar Conexión
        </Button>
        <Button
          variant="contained"
          component={Link}
          href="/inventory"
          sx={{
            backgroundColor: 'var(--indra-primary)',
            '&:hover': { backgroundColor: 'var(--indra-secondary)' },
          }}
        >
          Extraer Inventario
        </Button>
      </Box>
    </Container>
  )
}
