# 0001: Keep a modular monolith

- Status: accepted
- Date: 2026-10-13

## Context

The application has one Spring Boot backend, a React frontend, and a PostgreSQL
database with pgvector. Splitting into independently deployed services would add
operational complexity before separate scaling or ownership needs are established.

## Decision

Keep the backend as one deployable application, organize business capabilities
around clear module boundaries, and keep the frontend as a separately built
application. Keep the current root-level Maven project until relocation can be
performed as a complete build and deployment change.

## Consequences

- One backend artifact and one database remain straightforward to develop and ship.
- Module boundaries need to be maintained in code and API contracts.
- Future extraction into separately deployed services remains possible, but is not
  assumed by the current deployment.
