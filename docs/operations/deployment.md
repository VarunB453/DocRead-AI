# Deployment

## Production configuration

Use the `prod` Spring profile. Provide the following through the deployment
platform's secret/configuration manager (do not commit them):

- `DB_USER`, `DB_PASSWORD`, and optionally `DATABASE_URL` or `DB_HOST`, `DB_PORT`,
  and `DB_NAME`
- `OPENAI_API_KEY`
- `JWT_SECRET` with at least 32 bytes of high-entropy random data
- `CORS_ALLOWED_ORIGINS` with the exact trusted frontend origins

The production profile validates the Hibernate schema rather than creating or
updating it and does not initialize the pgvector schema automatically. Apply
database schema changes through an approved migration process before deploying
the application.

## Build containers

From the repository root:

```sh
docker build -f infra/docker/backend.Dockerfile -t docread-backend .
docker build -f infra/docker/frontend.Dockerfile -t docread-frontend .
```

Run the frontend behind HTTPS at the deployment edge. Its Nginx configuration
serves the single-page application and forwards `/api/` to the `backend` service
on port `8081`; make sure that service name resolves on the container network.
Terminate TLS at a trusted ingress/load balancer, configure forwarded headers,
and apply resource limits and backups appropriate to the hosting platform.

## Operational requirements

- Keep database and signing-key backups/rotation procedures.
- Restrict network access to PostgreSQL and expose only the frontend/ingress.
- Monitor application logs, database health, disk usage, and AI provider errors.
- Set upload limits and retention policies in line with the deployment's data
  protection requirements.
