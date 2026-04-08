using TypeSpec.Http;

@format("uuid")
@doc("UUID identifier. Storage Service uses UUIDv4 values.")
@example("e3bae040-7682-4457-aef8-20a419aed0bd")
scalar uuid extends string;

@doc("Uniform Resource Identifier, e.g. \"/api/v2/space/141593ff-2a27-44a1-9de1-917573fa0f4a/\".")
scalar uri extends string;

model ListOpQueries {
  @query("order_by")
  orderBy?: string;

  @query
  limit?: integer;

  @query
  offset?: integer;
}

model Pipeline {
  description: string;
  remote_name: string;
  resource_uri: string;
  uuid: uuid;
}

model PipelineList {
  ...ListResponse<Pipeline>;
}

enum LocationPurpose {
  AIP_RECOVERY: "AR",
  AIP_STORAGE: "AS",
  CURRENTLY_PROCESSING: "CP",
  DIP_STORAGE: "DS",
  SWORD_DEPOSIT: "SD",
  STORAGE_SERVICE_INTERNAL: "SS",
  BACKLOG: "BL",
  TRANSFER_SOURCE: "TS",
  REPLICATOR: "RP",
}

model Location {
  description: string;
  enabled: boolean;
  path: string;
  pipeline: string[];
  purpose: LocationPurpose;
  quota: integer | null;
  relative_path: string;
  resource_uri: string;
  space: string;
  used: integer;
  uuid: uuid;
}

model LocationList {
  ...ListResponse<Location>;
}

model MoveRequest {
  @doc("URI of the Location the files should be moved from.")
  origin_location: uri;

  @doc("URI of the pipeline.")
  pipeline: uri;

  @doc("List of objects containing `source` and `destination`. The source and destination are paths relative to their Location of the files to be moved.")
  files: moveFilesList;
}

alias moveFilesList = moveFile[];

model Package {
  uuid: uuid;
  current_full_path: string;
  current_location: uri;
  current_path: string;
  encrypted: boolean;
  origin_pipeline: uri;
  package_type: PackageType;
  related_packages: string[];
  replicas: string[];
  replicated_package: string | null;
  resource_uri: uri;
  size: int64;
  status: string;
  stored_date: utcDateTime | null;
}

model PackageMoveRequest {
  location_uuid: uuid;
}

// Storage Service persists arbitrary pickled task results and surfaces them via
// Tastypie once the job completes. Keep `result` broad because different async
// tasks may return different JSON shapes.
model AsyncTask {
  id: int32;
  resource_uri: uri;
  completed: boolean;
  was_error: boolean;
  created_time: utcDateTime;
  updated_time: utcDateTime;
  completed_time: utcDateTime | null;
  result?: unknown;
  error?: string;
}

model FixityResponse {
  success: boolean | null;
  message: string;
  timestamp: utcDateTime | null;
  failures?: FixityFailures;
}

model FixityFailures {
  files?: FixityFailureFiles;
}

model FixityFailureFiles {
  missing?: string[];
  changed?: string[];
  untracked?: string[];
}

model DeleteAipRequest {
  @doc("Explanation recorded with the deletion request.")
  event_reason: string;

  @doc("UUID of the pipeline creating the deletion request.")
  pipeline: uuid;

  @doc("Identifier of the user creating the deletion request.")
  user_id: int32;

  @doc("Email address of the user creating the deletion request.")
  user_email: string;
}

model DeleteAipAccepted {
  message: string;
  id: int32;
}

model DeleteAipAlreadyExists {
  error_message: string;
}

model DeleteAipNotAllowed {
  message: string;
}

model ReviewAipDeletionRequest {
  @doc("ID of the deletion request event to review.")
  event_id: int32;

  @doc("Decision to record. Accepted values are \"approve\" and \"reject\".")
  decision: ReviewAipDeletionDecision;

  @doc("Explanation that will be stored alongside the decision.")
  reason: string;
}

enum ReviewAipDeletionDecision {
  APPROVE: "approve";
  REJECT: "reject";
}

model ReviewAipDeletionSuccess {
  message: string;
  detail?: string;
}

model ReviewAipDeletionFailure {
  error_message: string;
  detail?: string;
}

model AvailabilityResponse {
  error: boolean;
  message: string;
}

enum PackageType {
  AIP: "AIP";
  AIC: "AIC";
  DIP: "DIP";
  TRANSFER: "transfer";
  SIP: "SIP";
  FILE: "file";
  DEPOSIT: "deposit";
}

model moveFile {
  source: string;
  destination: string;
}

model ListResponseMeta {
  limit: integer;
  next: string | null;
  offset: integer;
  previous: string | null;
  total_count: integer;
}

model ListResponse<Item> {
  meta: ListResponseMeta;
  objects: Item[];
}

@error
model Error {
  error: string;
}
