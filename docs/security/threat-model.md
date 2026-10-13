# Security threat model

## Assets

- Uploaded documents, extracted text, embeddings, and conversation history
- User identities, password hashes, and JWT signing material
- Database credentials and AI-provider API keys

## Trust boundaries and threats

- Browser-to-API traffic: stolen bearer tokens or cross-origin requests. Enforce
  HTTPS, narrowly scoped CORS origins, and short-lived JWTs.
- API-to-database traffic: credential exposure or unauthorized network access.
  Keep credentials in a secret manager and restrict database ingress.
- Uploaded files: oversized, malformed, or hostile content. Enforce request limits,
  validate file types/content in the ingestion path, and isolate parser workloads.
- AI-provider requests: accidental transmission of sensitive content. Define
  document consent, retention, and provider data-handling requirements.
- Build and deployment: vulnerable dependencies or leaked secrets. Run CI and
  dependency/security scans, review findings, and never commit `.env` files.

## Current limitations

This document is a baseline, not a security certification. Review authorization
and per-user document ownership, rate limiting, upload validation, audit logging,
data retention, and provider privacy settings before production launch. Production
must use the `prod` profile and must not use the local Compose credentials.
