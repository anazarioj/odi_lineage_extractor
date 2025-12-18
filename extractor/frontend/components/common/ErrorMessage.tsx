import { Alert, AlertTitle, Box } from '@mui/material';

interface ErrorMessageProps {
  title?: string;
  message: string;
  severity?: 'error' | 'warning' | 'info' | 'success';
}

export default function ErrorMessage({ 
  title, 
  message, 
  severity = 'error' 
}: ErrorMessageProps) {
  return (
    <Box sx={{ my: 2 }}>
      <Alert severity={severity}>
        {title && <AlertTitle>{title}</AlertTitle>}
        {message}
      </Alert>
    </Box>
  );
}
