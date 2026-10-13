# Local development setup

## Prerequisites

- Java 21+
- Node.js 22+ and npm
- Docker with the Compose plugin
- An OpenAI-compatible API key for AI-backed operations

## Start the database

Copy `.env.example` to `.env`, set a local database password, then run:

```sh
docker compose up -d postgres
```

The database listens on port `5434` on the host and is initialized with the
pgvector extension. The Compose defaults are for local development only.

## Start the applications

In one terminal:

```sh
set -a
. ./.env
set +a
./mvnw spring-boot:run
```

In another terminal:

```sh
cd frontend
npm ci
npm run dev
```

The Vite server runs at `http://localhost:3000` and proxies `/api` to the backend
at `http://localhost:8081`. The backend defaults to the `dev` Spring profile;
replace the example database password and AI key in `.env` with local values
before starting the services.

## Validate changes

Run `./scripts/validate.sh` to execute backend verification and the frontend
lint/build checks. The backend test suite may need a reachable PostgreSQL service.
