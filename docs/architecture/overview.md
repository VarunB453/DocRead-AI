# Architecture overview

DocRead-AI is currently a single Spring Boot application and a React/Vite
single-page application. The backend is intentionally kept at the repository root
for now; moving it under `backend/` is a future organizational change, not a
prerequisite for the modular-monolith direction.

## Runtime components

- The React client calls the backend through `/api/v1`.
- Spring MVC exposes authentication, document, and chat APIs.
- PostgreSQL with the pgvector extension stores application and vector data.
- Spring AI provides document parsing, embedding, retrieval, and chat integration.
- JWT bearer tokens are used for stateless API authentication.

The existing `controller`, `service`, `repository`, `entity`, and `config`
packages are the current implementation boundaries. New capabilities should be
kept cohesive within those areas; extracting feature modules should be incremental
and behavior-preserving.

## Environments

- The default `dev` profile is for local development only.
- The `test` profile contains test-only settings and must not contain real secrets.
- The `prod` profile requires database credentials, an OpenAI API key, a JWT
  signing secret, and an explicit CORS origin list. It disables schema creation
  and expects the database schema to be provisioned before deployment.

See [local setup](../development/local-setup.md) and
[deployment](../operations/deployment.md).
