# Extractor Project

Proyecto con arquitectura de microservicios usando Docker Compose.

## Estructura

- **Backend**: FastAPI con Python 3.13
- **Frontend**: Next.js con React 18 y Material-UI

## Requisitos

- Docker
- Docker Compose

## Inicio rápido

1. Clonar el repositorio y navegar a la carpeta extractor:
```bash
cd extractor
```

2. Copiar el archivo de variables de entorno:
```bash
cp backend/.env.example backend/.env
```

3. Editar `backend/.env` con tus credenciales.

4. Levantar los contenedores:
```bash
docker-compose up --build
```

Los servicios estarán disponibles en:
- Frontend: http://localhost:3000
- Backend API: http://localhost:8000
- Backend API Docs: http://localhost:8000/docs

## Desarrollo

### Hot Reload

Ambos servicios tienen hot reload habilitado:
- Los cambios en `backend/` se reflejan automáticamente
- Los cambios en `frontend/` se reflejan automáticamente

### Comandos útiles

```bash
# Levantar servicios
docker-compose up

# Levantar en background
docker-compose up -d

# Ver logs
docker-compose logs -f

# Ver logs de un servicio específico
docker-compose logs -f backend
docker-compose logs -f frontend

# Detener servicios
docker-compose down

# Reconstruir contenedores
docker-compose up --build

# Ejecutar comandos en el backend
docker-compose exec backend python manage.py <comando>

# Ejecutar comandos en el frontend
docker-compose exec frontend npm <comando>
```

## Dependencias

### Backend
- FastAPI
- SQLGlot
- Google Generative AI (Gemini)
- OpenAI (Azure)
- Uvicorn

### Frontend
- Next.js 14
- React 18
- Material-UI 5
- TypeScript

## Notas

- `node_modules` no se monta en el contenedor para mejorar el rendimiento
- Los volúmenes están configurados para persistir cache y optimizar rebuilds
