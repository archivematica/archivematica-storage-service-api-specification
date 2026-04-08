# archivematica-storage-service-api-specification

Welcome to the repository for the Archivematica Storage Service API
specification. This repository describes the Storage Service API using
[TypeSpec.io], which we then use to generate the OpenAPI v3 specification.

From the OpenAPI specification, it is possible to create clients, servers or
documentation in multiple languages thanks to extensive support from the
community.

Although the Archivematica Storage Service API design may not always adhere to
best practices, we hope this repository provides a detailed and transparent
description of these imperfections.

The Archivematica API specification is also available. Please visit this
[link][am-api-spec].

## Usage

```
npm --prefix=typespec run compile
```

## OpenAPI specification

We use [TypeSpec.io] to describe the Storage Service API as an OpenAPI schema.

You can browse the schema in two forms:

- [Interactive OpenAPI docs][openapi-docs]
- [Raw OpenAPI YAML][openapi-schema]

The description is still incomplete, and we expect to extend it over time as we
cover more of the API.

## Notes

The Storage Service API itself is built with [Tastypie], which provides schema
introspection endpoints such as:

```sh
curl http://127.0.0.1:62081/api/v2/?fullschema=true
```

An example of that output is available at [ss-schema.json]. That data has been
useful as reference material while building the TypeSpec description, although
it does not fully capture the deployed wire contract on its own.

If we want to expand coverage further, [django-tastypie-swagger] may be useful
prior art because it already maps Tastypie resources into Swagger-style schema
data.

[am-api-spec]: https://github.com/artefactual-labs/archivematica-api-specification
[django-tastypie-swagger]: https://github.com/concentricsky/django-tastypie-swagger
[openapi-docs]: https://editor.swagger.io/?url=https://raw.githubusercontent.com/archivematica/archivematica-storage-service-api-specification/main/typespec/tsp-output/%40typespec/openapi3/openapi.v1.yaml
[openapi-schema]: https://raw.githubusercontent.com/archivematica/archivematica-storage-service-api-specification/main/typespec/tsp-output/%40typespec/openapi3/openapi.v1.yaml
[ss-schema.json]: https://gist.github.com/sevein/379f101ab9305235844c1e5101eeba04
[tastypie]: https://django-tastypie.readthedocs.io/
[typespec.io]: https://typespec.io
