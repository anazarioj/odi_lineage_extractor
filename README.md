# Oracle Lineage AI (Extractor)

Proyecto con arquitectura Docker Compose que incluye un backend FastAPI y un frontend Next.js para extraer inventario Oracle/ODI, visualizar linaje y planificar migración.

## Estructura

- Backend: FastAPI (Python 3.13) en `extractor/backend`
- Frontend: Next.js + React + MUI en `extractor/frontend`
- Orquestación: `docker-compose.yml` en la raíz del repositorio

## Tecnologías y versiones

- Backend: FastAPI, Uvicorn, SQLGlot, Google Generative AI (Gemini), OpenAI SDK, Azure Identity
- Frontend: Node.js 22 LTS, Next.js 15, React 19, Material-UI 6, TypeScript 5.7

## Inicio rápido

1) Variables de entorno del backend
```bash
cp extractor/backend/.env.example extractor/backend/.env
# Edita extractor/backend/.env con tus credenciales
```

2) Levantar servicios
```bash
docker-compose up --build
```

Servicios:
- Frontend: http://localhost:3000
- Backend API: http://localhost:8000
- API Docs: http://localhost:8000/docs

## Flujo funcional (UI)

Páginas principales del frontend:
- Configuración (/): Conexión a DB Oracle y DB ODI (Oracle) + selección de LLM
- Inventario (/inventory): Tabs para Tablas, Vistas, Stored Procedures, Funciones y Paquetes
- Diccionario (/dictionary): Tabla de metadata de campos (tipo, longitud, nullable, descripción)
- Linaje (/lineage): Búsqueda de objeto/campo y área para el grafo de linaje
- Migración (/migration): Selección de objetos y visualización del plan de migración
- Dashboard (/dashboard): Estado general y pruebas básicas

Nota: Estas páginas están estructuradas sin lógica de negocio aún; se integrarán paso a paso.

## Desarrollo

Hot Reload habilitado:
- Cambios en `extractor/backend` recargan Uvicorn automáticamente
- Cambios en `extractor/frontend` recargan Next.js con polling en Docker

Comandos útiles:
```bash
# Levantar en primer plano
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

# Ejecutar comandos dentro de contenedores
docker-compose exec backend sh -c "python -V"
docker-compose exec frontend npm run dev
```

## Notas

- `node_modules` NO se monta en el contenedor; se usan volúmenes internos para mejor rendimiento
- `NEXT_PUBLIC_API_URL` ya está configurado en docker-compose para apuntar al backend
- CORS del backend permite requests desde `http://localhost:3000`
