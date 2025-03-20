variable "resource_group_name" {
  type = string
}

variable "storage_account_name" {
  type    = string
  default = null
}

variable "storage_container_name" {
  type    = string
  default = null
}

variable "cosmosdb_account_name" {
  type    = string
  default = null
}

variable "cosmosdb_sql_database_name" {
  type    = string
  default = null
}

variable "storage_table_name" {
  type    = string
  default = null
}

variable "storage_table" {
  type    = any
  default = []
}

variable "eventhub_consumer_group_name" {
  type    = string
  default = null
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "resource_group" {
  type = list(object({
    id       = number
    location = string
    name     = string
  }))
  default = []
}

variable "storage_account" {
  type    = any
  default = []
}

variable "storage_container" {
  type    = any
  default = []
}

variable "data_lake_gen2_filesystem" {
  type    = any
  default = []
}

variable "cosmosdb_account" {
  type    = any
  default = []
}

variable "cosmosdb_sql_database" {
  type    = any
  default = []
}

variable "cluster" {
  type = list(object({
    id                 = number
    name               = string
    streaming_capacity = number
    tags               = optional(map(string))
  }))
  default     = []
  description = <<EOF
EOF
}

variable "function_javascript_uda" {
  type = list(object({
    id                      = number
    name                    = string
    script                  = string
    stream_analytics_job_id = number
    input = optional(list(object({
      type                    = string
      configuration_parameter = optional(bool)
    })), [])
    output = optional(list(object({
      type = string
    })), [])
  }))
  default     = []
  description = <<EOF
EOF
}

variable "function_javascript_udf" {
  type = list(object({
    id                      = number
    name                    = string
    script                  = string
    stream_analytics_job_id = number
    input = optional(list(object({
      type                    = string
      configuration_parameter = optional(bool)
    })), [])
    output = optional(list(object({
      type = string
    })), [])
  }))
  default = []
}

variable "job" {
  type = list(object({
    id                                       = number
    name                                     = string
    transformation_query                     = string
    compatibility_level                      = optional(string)
    content_storage_policy                   = optional(string)
    data_locale                              = optional(string)
    events_late_arrival_max_delay_in_seconds = optional(number)
    events_out_of_order_max_delay_in_seconds = optional(number)
    events_out_of_order_policy               = optional(string)
    output_error_policy                      = optional(string)
    stream_analytics_cluster_id              = optional(number)
    streaming_units                          = optional(number)
    tags                                     = optional(map(string))
    type                                     = optional(string)
    identity = optional(list(object({
      type         = string
      identity_ids = optional(list(string))
    })), [])
    job_storage_account = optional(list(object({
      account_key         = string
      account_name        = string
      authentication_mode = optional(string)
    })), [])
  }))
  default     = []
  description = <<EOF
EOF
}

variable "job_schedule" {
  type = list(object({
    id                      = number
    start_mode              = string
    stream_analytics_job_id = number
    start_time              = optional(string)
  }))
  default     = []
  description = <<EOF
EOF
}

variable "managed_private_endpoint" {
  type = list(object({
    id                          = number
    name                        = string
    stream_analytics_cluster_id = number
    subresource_name            = string
    target_resource_id          = optional(number)
    resource_group_id           = optional(number)
  }))
  default     = []
  description = <<EOF
EOF
}

variable "output_blob" {
  type = list(object({
    id                      = number
    date_format             = string
    name                    = string
    path_pattern            = string
    stream_analytics_job_id = number
    time_format             = string
    authentication_mode     = optional(string)
    batch_max_wait_time     = optional(string)
    batch_min_rows          = optional(number)
    storage_account_key     = optional(string)
    resource_group_id       = optional(number)
    storage_account_id      = optional(number)
    storage_container_id    = optional(number)
    serialization = list(object({
      type            = string
      encoding        = optional(string)
      field_delimiter = optional(string)
      format          = optional(string)
    }))
  }))
  default     = []
  description = <<EOF
  EOF
}

variable "cosmosdb_sql_container" {
  type        = any
  default     = []
  description = <<EOF
  EOF
}

variable "output_cosmosdb" {
  type = list(object({
    id                       = number
    container_id             = number
    name                     = string
    stream_analytics_job_id  = number
    document_id              = string
    partition_key            = string
    cosmosdb_account_id      = optional(number)
    cosmosdb_sql_database_id = optional(number)
    resource_group_id        = optional(number)
  }))
  default     = []
  description = <<EOF
  EOF
}

variable "eventhub_namespace_name" {
  type    = string
  default = null
}

variable "eventhub_name" {
  type    = string
  default = null
}

variable "output_eventhub" {
  type = list(object({
    id                        = number
    name                      = string
    stream_analytics_job_id   = number
    eventhub_id               = optional(number)
    servicebus_namespace_id   = optional(number)
    shared_access_policy_key  = optional(string)
    shared_access_policy_name = optional(string)
    property_columns          = optional(list(string))
    authentication_mode       = optional(string)
    partition_key             = optional(string)
    resource_group_id         = optional(number)
    serialization = list(object({
      type            = string
      encoding        = optional(string)
      field_delimiter = optional(string)
      format          = optional(string)
    }))
  }))
  default     = []
  description = <<EOF
EOF
}

variable "function_app_name" {
  type    = string
  default = null
}

variable "output_function" {
  type = list(object({
    id                      = number
    api_key                 = string
    function_name           = string
    function_id             = optional(number)
    name                    = string
    stream_analytics_job_id = number
    batch_max_count         = optional(number)
    batch_max_in_bytes      = optional(number)
    resource_group_id       = optional(number)
  }))
  default     = []
  description = <<EOF
EOF
}

variable "sql_server_name" {
  type    = string
  default = null
}
variable "sql_database_name" {
  type    = string
  default = null
}

variable "output_mssql" {
  type = list(object({
    id                      = number
    name                    = string
    stream_analytics_job_id = number
    table                   = string
    authentication_mode     = optional(string)
    max_batch_count         = optional(number)
    max_writer_count        = optional(number)
    password                = optional(string)
    user                    = optional(string)
    resource_group_id       = optional(number)
    server_id               = optional(number)
    database_id             = optional(number)
  }))
  default     = []
  description = <<EOF
EOF
}

variable "servicebus_namespace_name" {
  type    = string
  default = null
}

variable "servicebus_queue_name" {
  type    = string
  default = null
}

variable "servicebus_topic_name" {
  type    = string
  default = null
}

variable "output_powerbi" {
  type = list(object({
    id                        = number
    dataset                   = string
    group_id                  = string
    group_name                = string
    name                      = string
    stream_analytics_job_id   = number
    table                     = string
    token_user_display_name   = optional(string)
    token_user_principal_name = optional(string)
  }))
  default     = []
  description = <<EOF
  EOF
}

variable "output_servicebus_queue" {
  type = list(object({
    id                        = number
    name                      = string
    queue_id                  = optional(number)
    stream_analytics_job_id   = number
    authentication_mode       = optional(string)
    resource_group_id         = optional(number)
    servicebus_namespace_id   = optional(number)
    property_columns          = optional(list(string))
    shared_access_policy_name = optional(string)
    system_property_columns   = optional(map(string))
    serialization = list(object({
      type            = string
      encoding        = optional(string)
      field_delimiter = optional(string)
      format          = optional(string)
    }))
  }))
  default     = []
  description = <<EOF
  EOF
}

variable "output_servicebus_topic" {
  type = list(object({
    id                        = number
    name                      = string
    stream_analytics_job_id   = number
    resource_group_id         = optional(number)
    servicebus_namespace_id   = optional(number)
    queue_id                  = optional(number)
    authentication_mode       = optional(string)
    property_columns          = optional(list(string))
    shared_access_policy_name = optional(string)
    system_property_columns   = optional(map(string))
    serialization = list(object({
      type            = string
      encoding        = optional(string)
      field_delimiter = optional(string)
      format          = optional(string)
    }))
  }))
  default     = []
  description = <<EOF
EOF
}

variable "synapse_workspace" {
  type = list(object({
    id                                   = number
    name                                 = string
    storage_data_lake_gen2_filesystem_id = any
    sql_administrator_login              = optional(string)
    sql_administrator_login_password     = optional(string)
  }))
  default     = []
  description = <<EOF
EOF
}

variable "output_synapse" {
  type = list(object({
    id                      = number
    database                = string
    name                    = string
    synapse_workspace_id    = number
    stream_analytics_job_id = number
    table                   = string
    resource_group_id       = optional(number)
  }))
  default     = []
  description = <<EOF
EOF
}

variable "output_table" {
  type = list(object({
    id                      = number
    batch_size              = number
    name                    = string
    partition_key           = string
    row_key                 = string
    stream_analytics_job_id = number
    columns_to_remove       = optional(list(string))
    resource_group_id       = optional(number)
    storage_account_id      = optional(number)
    table_id                = optional(number)
  }))
  default     = []
  description = <<EOF
EOF
}

variable "reference_input_blob" {
  type = list(object({
    id                      = number
    date_format             = string
    name                    = string
    path_pattern            = string
    stream_analytics_job_id = number
    time_format             = string
    authentication_mode     = optional(string)
    resource_group_id       = optional(number)
    database_id             = optional(number)
    server_id               = optional(number)
    serialization = list(object({
      type            = string
      encoding        = optional(string)
      field_delimiter = optional(string)
    }))
  }))
  default     = []
  description = <<EOF
EOF
}

variable "reference_input_mssql" {
  type = list(object({
    id                        = number
    full_snapshot_query       = string
    name                      = string
    password                  = string
    refresh_type              = string
    stream_analytics_job_id   = number
    username                  = string
    refresh_interval_duration = optional(string)
    delta_snapshot_query      = optional(string)
    table                     = optional(string)
  }))
  default     = []
  description = <<EOF
EOF
}

variable "stream_input_blob" {
  type = list(object({
    id                      = number
    date_format             = string
    name                    = string
    path_pattern            = string
    time_format             = string
    resource_group_id       = optional(number)
    storage_account_id      = optional(number)
    storage_container_id    = optional(number)
    stream_analytics_job_id = optional(number)
    serialization = list(object({
      type            = string
      encoding        = optional(string)
      field_delimiter = optional(string)
    }))
  }))
  default     = []
  description = <<EOF
  EOF
}

variable "stream_input_eventhub" {
  type = list(object({
    id                        = number
    name                      = string
    stream_analytics_job_id   = number
    authentication_mode       = optional(string)
    partition_key             = optional(string)
    shared_access_policy_key  = optional(string)
    shared_access_policy_name = optional(string)
    serialization = list(object({
      type            = string
      encoding        = optional(string)
      field_delimiter = optional(string)
    }))
  }))
  default     = []
  description = <<EOF
  EOF
}

variable "iothub" {
  type        = any
  default     = []
  description = <<EOF
  EOF
}

variable "stream_input_iothub" {
  type = list(object({
    id                           = number
    iothub_id                    = number
    name                         = string
    stream_analytics_job_id      = number
    endpoint                     = string
    eventhub_consumer_group_name = string
    shared_access_policy_name    = string
    serialization = list(object({
      type            = string
      encoding        = optional(string)
      field_delimiter = optional(string)
    }))
  }))
  default     = []
  description = <<EOF
  EOF
}

variable "eventhub" {
  type = list(object({
    id                = number
    name              = string
    namespace_name    = string
    partition_count   = number
    resource_group_id = optional(number)
  }))
  default = []
}

variable "servicebus_namespace" {
  type = list(object({
    id                = number
    name              = string
    resource_group_id = optional(number)
    sku               = string
  }))
  default = []
}

variable "app_service_plan" {
  type = list(object({
    id                = number
    name              = string
    resource_group_id = optional(number)
  }))
  default = []
}

variable "function_app" {
  type = list(object({
    id                  = number
    app_service_plan_id = optional(number)
    name                = string
    resource_group_id   = optional(number)
    storage_account_id  = optional(number)
  }))
  default = []
}

variable "app_service_plan_name" {
  type    = string
  default = null
}

variable "sql_server" {
  type    = any
  default = []
}

variable "sql_database" {
  type    = any
  default = []
}

variable "servicebus_queue" {
  type = list(object({
    id                                      = number
    name                                    = string
    namespace_id                            = optional(number)
    auto_delete_on_idle                     = optional(string)
    dead_lettering_on_message_expiration    = optional(bool)
    default_message_ttl                     = optional(string)
    duplicate_detection_history_time_window = optional(string)
    enable_partitioning                     = optional(bool)
    enable_batched_operations               = optional(bool)
    enable_express                          = optional(bool)
    forward_dead_lettered_messages_to       = optional(string)
    forward_to                              = optional(string)
    lock_duration                           = optional(string)
    max_delivery_count                      = optional(number)
    max_message_size_in_kilobytes           = optional(number)
    max_size_in_megabytes                   = optional(number)
    requires_duplicate_detection            = optional(bool)
    requires_session                        = optional(bool)
    status                                  = optional(string)
  }))
  default = []
}

variable "servicebus_topic" {
  type = list(object({
    id                                      = number
    name                                    = string
    namespace_id                            = optional(number)
    auto_delete_on_idle                     = optional(string)
    default_message_ttl                     = optional(string)
    duplicate_detection_history_time_window = optional(string)
    enable_batched_operations               = optional(bool)
    enable_express                          = optional(bool)
    enable_partitioning                     = optional(bool)
    max_message_size_in_kilobytes           = optional(number)
    max_size_in_megabytes                   = optional(number)
    requires_duplicate_detection            = optional(bool)
    status                                  = optional(string)
    support_ordering                        = optional(bool)
  }))
  default = []
}