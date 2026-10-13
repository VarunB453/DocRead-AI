# Backend boundaries

The backend remains at `src/main/java/com/substring/docread` until a dedicated
relocation change can move source, resources, tests, Maven metadata, and build
automation together.

Keep HTTP concerns in controllers and DTOs, application orchestration in services,
database access in repositories, persistence models in entities, and cross-cutting
configuration in `config`. Avoid putting business rules in controllers or exposing
JPA entities directly in API responses.

The document, chat, auth, and search capabilities in the requested target layout
are useful future feature boundaries. Introduce them incrementally with tests and
without duplicating existing functionality.
