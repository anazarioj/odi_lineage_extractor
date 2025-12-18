'use client'

import { Box, Container, Typography, Link as MuiLink } from '@mui/material';

export default function Footer() {
  return (
    <Box
      component="footer"
      sx={{
        py: 3,
        px: 2,
        mt: 'auto',
        backgroundColor: 'var(--indra-primary)',
        color: 'white',
      }}
    >
      <Container maxWidth="lg">
        <Typography variant="body2" align="center">
          © {new Date().getFullYear()} Indra Lineage Extractor. Todos los derechos reservados.
        </Typography>
        <Typography variant="body2" align="center" sx={{ mt: 1 }}>
          <MuiLink 
            href="https://www.indracompany.com" 
            target="_blank" 
            rel="noopener"
            sx={{ color: 'var(--indra-accent)', textDecoration: 'none' }}
          >
            Indra Company
          </MuiLink>
        </Typography>
      </Container>
    </Box>
  );
}
