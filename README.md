# DocRead-AI

DocRead-AI is a document Q&A application with a React/Vite frontend and a Spring
Boot backend using PostgreSQL/pgvector and Spring AI.

## Repository layout

- `src/`: Spring Boot backend (root-level Maven project for now)
- `frontend/`: React/Vite application
- `infra/docker/`[text](docs/operations): production-oriented container build definitions
- `docs/`: architecture, development, operations, and security documentation
- `.github/workflows/`: backend, frontend, and security automation

## Quick start

1. Copy `.env.example` to `.env` and set local values.
2. Start PostgreSQL: `docker compose up -d postgres`.
3. Start the backend: `./mvnw spring-boot:run` (provide `OPENAI_API_KEY` for AI calls).
4. Start the frontend: `cd frontend && npm ci && npm run dev`.

See [local setup](docs/development/local-setup.md) for prerequisites and details.
Run `./scripts/validate.sh` to validate backend and frontend changes.

## Production

Use Spring's `prod` profile and pass all credentials through your deployment
secret manager. Production settings validate, but do not mutate, the database
schema. Review [deployment](docs/operations/deployment.md) and the
[security baseline](docs/security/threat-model.md) before release.
