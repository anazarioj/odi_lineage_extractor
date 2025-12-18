FROM node:22-slim

WORKDIR /app

# Copiar archivos de dependencias
COPY package*.json ./

# Instalar dependencias
RUN npm install

# Copiar el resto del código
COPY . .

# Exponer el puerto
EXPOSE 3000

# El comando se ejecuta desde docker-compose.yml para habilitar hot reload
CMD ["npm", "run", "dev"]
