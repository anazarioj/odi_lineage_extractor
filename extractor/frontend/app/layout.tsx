import type { Metadata } from 'next'
import './globals.css'
import { Header, Footer } from '@/components/layout'
import { Box } from '@mui/material'

export const metadata: Metadata = {
  title: 'Extractor Frontend',
  description: 'Extractor application frontend',
}

export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <html lang="es">
      <body>
        <Box sx={{ display: 'flex', flexDirection: 'column', minHeight: '100vh' }}>
          <Header />
          <Box component="main" sx={{ flex: 1 }}>
            {children}
          </Box>
          <Footer />
        </Box>
      </body>
    </html>
  )
}
