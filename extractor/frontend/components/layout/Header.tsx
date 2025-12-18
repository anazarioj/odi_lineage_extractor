'use client'

import { AppBar, Toolbar, Typography, Box, Button } from '@mui/material';
import Link from 'next/link';

export default function Header() {
  return (
    <AppBar 
      position="static" 
      sx={{ 
        backgroundColor: 'var(--indra-primary)',
        boxShadow: 2,
      }}
    >
      <Toolbar>
        <Typography 
          variant="h6" 
          component="div" 
          sx={{ 
            flexGrow: 1,
            fontWeight: 600,
          }}
        >
          Extractor
        </Typography>
        <Box sx={{ display: 'flex', gap: 2 }}>
          <Button 
            color="inherit" 
            component={Link} 
            href="/"
            sx={{ '&:hover': { backgroundColor: 'var(--indra-secondary)' } }}
          >
            Inicio
          </Button>
          <Button 
            color="inherit" 
            component={Link} 
            href="/lineage"
            sx={{ '&:hover': { backgroundColor: 'var(--indra-secondary)' } }}
          >
            Linaje
          </Button>
          <Button 
            color="inherit" 
            component={Link} 
            href="/explorer"
            sx={{ '&:hover': { backgroundColor: 'var(--indra-secondary)' } }}
          >
            Explorador
          </Button>
          <Button 
            color="inherit" 
            component={Link} 
            href="/impact"
            sx={{ '&:hover': { backgroundColor: 'var(--indra-secondary)' } }}
          >
            Impacto
          </Button>
          <Button 
            color="inherit" 
            component={Link} 
            href="/dashboard"
            sx={{ '&:hover': { backgroundColor: 'var(--indra-secondary)' } }}
          >
            Dashboard
          </Button>
        </Box>
      </Toolbar>
    </AppBar>
  );
}
