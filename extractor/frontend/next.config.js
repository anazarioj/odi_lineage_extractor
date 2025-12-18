/** @type {import('next').NextConfig} */
const nextConfig = {
  reactStrictMode: true,
  // Habilitar hot reload en Docker
  webpackDevMiddleware: config => {
    config.watchOptions = {
      poll: 1000,
      aggregateTimeout: 300,
    }
    return config
  },
}

module.exports = nextConfig
