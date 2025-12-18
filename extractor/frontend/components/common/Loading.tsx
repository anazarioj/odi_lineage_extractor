import { Box, CircularProgress } from '@mui/material';

export default function Loading() {
  return (
    <Box
      sx={{
        display: 'flex',
        justifyContent: 'center',
        alignItems: 'center',
        minHeight: '100vh',
        backgroundColor: 'var(--indra-gray)',
      }}
    >
      <CircularProgress
        size={60}
        sx={{
          color: 'var(--indra-primary)',
        }}
      />
    </Box>
  );
}
