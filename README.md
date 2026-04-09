# archivematica-storage-service-api-specification

Welcome to the repository for the Archivematica Storage Service API
specification. This repository defines the Storage Service API using
[TypeSpec.io], which we then use to generate an OpenAPI v3 specification.

From the OpenAPI specification, it is possible to generate clients, server
stubs, and documentation in multiple languages thanks to extensive community
support.

Although the Archivematica Storage Service API design may not always adhere to
best practices, we hope this repository provides a detailed and transparent
description of these imperfections.

The [Archivematica API] specification is also available.

## Usage

```
npm --prefix=typespec run compile
```

## OpenAPI specification

You can browse the OpenAPI specification in two forms:

- [Interactive OpenAPI docs][openapi-docs]
- [Raw OpenAPI YAML][openapi-schema]

The specification is still incomplete, and we expect to extend it over time as
we cover more of the API.

## Resources

- [Current documentation] - not entirely accurate.
- The Storage Service API is built with [Tastypie], which provides schema
  introspection endpoints such as
  `curl http://127.0.0.1:62081/api/v2/?fullschema=true`.
- An example of that output is available at [ss-schema.json]. That data has been
  useful as reference material while building the TypeSpec description, although
  it does not fully capture the deployed wire contract on its own.
- [django-tastypie-swagger] may be useful prior art if we want to expand
  coverage further, because it already maps Tastypie resources into
  Swagger-style schema data.

[typespec.io]: https://typespec.io
[archivematica api]: https://github.com/artefactual-labs/archivematica-api-specification
[openapi-docs]: https://editor.swagger.io/?url=https://raw.githubusercontent.com/archivematica/archivematica-storage-service-api-specification/main/typespec/tsp-output/%40typespec/openapi3/openapi.v1.yaml
[openapi-schema]: https://raw.githubusercontent.com/archivematica/archivematica-storage-service-api-specification/main/typespec/tsp-output/%40typespec/openapi3/openapi.v1.yaml
[current documentation]: https://www.archivematica.org/en/docs/latest/dev-manual/api/api-reference-storage-service/
[tastypie]: https://django-tastypie.readthedocs.io/
[django-tastypie-swagger]: https://github.com/concentricsky/django-tastypie-swagger
[ss-schema.json]: https://gist.github.com/sevein/379f101ab9305235844c1e5101eeba04
