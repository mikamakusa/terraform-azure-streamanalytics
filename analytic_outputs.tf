resource "azurerm_stream_analytics_output_blob" "this" {
  count = (length(var.job) &&
    (length(var.resource_group) || var.resource_group_name != null) &&
  (length(var.storage_account) || var.storage_account_name != null)) == 0 ? 0 : length(var.output_blob)
  date_format  = lookup(var.output_blob[count.index], "date_format")
  name         = lookup(var.output_blob[count.index], "name")
  path_pattern = lookup(var.output_blob[count.index], "path_pattern")
  resource_group_name = try(
    var.resource_group_name != null ? data.azurerm_resource_group.this.name :
    element(azurerm_resource_group.this.*.name, lookup(var.output_blob[count.index], "resource_group_id"))
  )
  storage_account_name = try(
    var.storage_account_name != null ? data.azurerm_storage_account.this.name :
    element(module.storage.*.storage_account_name, lookup(var.output_blob[count.index], "storage_account_id"))
  )
  storage_container_name = try(
    var.storage_container_name != null ? data.azurerm_storage_container.this.name :
    element(module.storage.*.storage_account_name, lookup(var.output_blob[count.index], "storage_container_id"))
  )
  stream_analytics_job_name = try(
    element(azurerm_stream_analytics_job.this.*.name, lookup(var.output_blob[count.index], "stream_analytics_job_id"))
  )
  time_format         = lookup(var.output_blob[count.index], "time_format")
  authentication_mode = lookup(var.output_blob[count.index], "authentication_mode")
  batch_max_wait_time = lookup(var.output_blob[count.index], "batch_max_wait_time")
  batch_min_rows      = lookup(var.output_blob[count.index], "batch_min_rows")
  storage_account_key = lookup(var.output_blob[count.index], "storage_account_key")

  dynamic "serialization" {
    for_each = lookup(var.output_blob[count.index], "serialization") == null ? [] : ["serialization"]
    content {
      type            = lookup(serialization.value, "type")
      encoding        = lookup(serialization.value, "encoding")
      field_delimiter = lookup(serialization.value, "field_delimiter")
      format          = lookup(serialization.value, "format")
    }
  }
}

resource "azurerm_stream_analytics_output_cosmosdb" "this" {
  count = (length(var.job) &&
    length(var.cosmosdb_sql_container) &&
    (length(var.cosmosdb_account) || var.cosmosdb_account_name != null) &&
  (length(var.cosmosdb_sql_database) || var.cosmosdb_sql_database_name != null)) == 0 ? 0 : length(var.output_cosmosdb)
  container_name = try(
    element(module.cosmosdb.*.sql_container_name, lookup(var.output_cosmosdb[count.index], "container_id"))
  )
  cosmosdb_account_key = try(
    var.cosmosdb_account_name != null ? data.azurerm_cosmosdb_account.this.primary_key :
    element(module.cosmosdb.cosmosdb_account_primary_key, lookup(var.output_cosmosdb[count.index], "cosmosdb_account_id"))
  )
  cosmosdb_sql_database_id = try(
    var.cosmosdb_sql_database_name != null ? data.azurerm_cosmosdb_sql_database.this.id :
    element(module.cosmosdb.*.sql_database_id, lookup(var.output_cosmosdb[count.index], "cosmosdb_sql_database_id"))
  )
  name = lookup(var.output_cosmosdb[count.index], "name")
  stream_analytics_job_id = try(
    element(azurerm_stream_analytics_job.this.*.id, lookup(var.output_cosmosdb[count.index], "stream_analytics_job_id"))
  )
  document_id   = lookup(var.output_cosmosdb[count.index], "document_id")
  partition_key = lookup(var.output_cosmosdb[count.index], "partition_key")
}

resource "azurerm_stream_analytics_output_eventhub" "this" {
  count = (length(var.job) && (length(var.resource_group) || var.resource_group_name != null)) == 0 ? 0 : length(var.output_eventhub)
  eventhub_name = try(
    var.eventhub_name != null ? data.azurerm_eventhub.this.name : element(azurerm_eventhub.this.*.name, lookup(var.output_eventhub[count.index], "eventhub_id"))
  )
  name = lookup(var.output_eventhub[count.index], "name")
  resource_group_name = try(
    var.resource_group_name != null ? data.azurerm_resource_group.this.name : element(
      azurerm_resource_group.this.*.name, lookup(var.output_eventhub[count.index], "resource_group_id")
    )
  )
  servicebus_namespace = try(
    var.servicebus_namespace_name != null ? data.azurerm_servicebus_namespace.this.name : element(
    azurerm_servicebus_namespace.this.*.name, lookup(var.output_eventhub[count.index], "servicebus_namespace_id"))
  )
  stream_analytics_job_name = try(
    element(azurerm_stream_analytics_job.this.*.name, lookup(var.output_eventhub[count.index], "stream_analytics_job_id"))
  )
  shared_access_policy_key  = lookup(var.output_eventhub[count.index], "shared_access_policy_key")
  shared_access_policy_name = lookup(var.output_eventhub[count.index], "shared_access_policy_name")
  property_columns          = lookup(var.output_eventhub[count.index], "property_columns")
  authentication_mode       = lookup(var.output_eventhub[count.index], "authentication_mode")
  partition_key             = lookup(var.output_eventhub[count.index], "partition_key")

  dynamic "serialization" {
    for_each = lookup(var.output_eventhub[count.index], "serialization")
    content {
      type            = lookup(serialization.value, "type")
      encoding        = lookup(serialization.value, "encoding")
      field_delimiter = lookup(serialization.value, "field_delimiter")
      format          = lookup(serialization.value, "format")
    }
  }
}

resource "azurerm_stream_analytics_output_function" "this" {
  count = ((length(var.function_app) || var.function_app != null) &&
    (length(var.resource_group) || var.resource_group_name != null) &&
  length(var.job)) == 0 ? 0 : length(var.output_function)
  api_key = lookup(var.output_function[count.index], "api_key")
  function_app = try(
    var.function_app_name != null ? data.azurerm_function_app.this.name : element(
    azurerm_function_app.this.*.name, lookup(var.output_function[count.index], "function_id"))
  )
  function_name = lookup(var.output_function[count.index], "function_name")
  name          = lookup(var.output_function[count.index], "name")
  resource_group_name = try(
    var.resource_group_name != null ? data.azurerm_resource_group.this.name : element(
      azurerm_resource_group.this.*.name, lookup(var.output_function[count.index], "resource_group_id")
    )
  )
  stream_analytics_job_name = try(
    element(azurerm_stream_analytics_job.this.*.name, lookup(var.output_function[count.index], "stream_analytics_job_id"))
  )
  batch_max_count    = lookup(var.output_function[count.index], "batch_max_count")
  batch_max_in_bytes = lookup(var.output_function[count.index], "batch_max_in_bytes")
}

resource "azurerm_stream_analytics_output_mssql" "this" {
  count = ((length(var.sql_server) || var.sql_server_name != null) &&
    (length(var.job) &&
      (length(var.resource_group) || var.resource_group_name != null) &&
  (length(var.sql_database) || var.sql_database_name != null))) == 0 ? 0 : length(var.output_mssql)
  database = try(
    var.sql_database_name != null ? data.azurerm_sql_database.this.name : element(
    azurerm_sql_database.this.*.name, lookup(var.output_mssql[count.index], "database_id"))
  )
  name = lookup(var.output_mssql[count.index], "name")
  resource_group_name = try(
    var.resource_group_name != null ? data.azurerm_resource_group.this.name : element(
      azurerm_resource_group.this.*.name, lookup(var.output_mssql[count.index], "resource_group_id")
    )
  )
  server = try(
    var.sql_server_name != null ? data.azurerm_sql_server.this.*.name : element(
      azurerm_sql_server.this.*.fully_qualified_domain_name, lookup(var.output_mssql[count.index], "server_id")
    )
  )
  stream_analytics_job_name = try(
    element(azurerm_stream_analytics_job.this.*.name, lookup(var.output_function[count.index], "stream_analytics_job_id"))
  )
  table = try(
    var.sql_database_name != null ? data.azurerm_sql_database.this.name : element(azurerm_sql_database.this.*.name, lookup(var.output_mssql[count.index], "database_id"))
  )
  authentication_mode = lookup(var.output_mssql[count.index], "authentication_mode")
  max_batch_count     = lookup(var.output_mssql[count.index], "max_batch_count")
  max_writer_count    = lookup(var.output_mssql[count.index], "max_writer_count")
  password            = sensitive(lookup(var.output_mssql[count.index], "password"))
  user                = sensitive(lookup(var.output_mssql[count.index], "user"))
}

resource "azurerm_stream_analytics_output_powerbi" "this" {
  count                     = length(var.job) == 0 ? 0 : length(var.output_powerbi)
  dataset                   = lookup(var.output_powerbi[count.index], "dataset")
  group_id                  = lookup(var.output_powerbi[count.index], "group_id")
  group_name                = lookup(var.output_powerbi[count.index], "group_name")
  name                      = lookup(var.output_powerbi[count.index], "name")
  stream_analytics_job_id   = try(element(azurerm_stream_analytics_job.this.*.id, lookup(var.output_powerbi[count.index], "stream_analytics_job_id")))
  table                     = lookup(var.output_powerbi[count.index], "table")
  token_user_display_name   = lookup(var.output_powerbi[count.index], "token_user_display_name")
  token_user_principal_name = lookup(var.output_powerbi[count.index], "token_user_principal_name")
}

resource "azurerm_stream_analytics_output_servicebus_queue" "this" {
  count = ((length(var.servicebus_queue) || var.servicebus_queue_name != null) &&
    (length(var.job) &&
      (length(var.resource_group) || var.resource_group_name != null) &&
  (length(var.servicebus_namespace) || var.servicebus_namespace_name != null))) == 0 ? 0 : length(var.output_servicebus_queue)
  name = lookup(var.output_servicebus_queue[count.index], "name")
  queue_name = try(
    var.servicebus_queue_name != null ? data.azurerm_servicebus_queue.this.name : element(
    azurerm_servicebus_queue.this.*.name, lookup(var.output_servicebus_queue[count.index], "queue_id"))
  )
  resource_group_name = try(
    var.resource_group_name != null ? data.azurerm_resource_group.this.name : element(
    azurerm_resource_group.this.*.name, lookup(var.output_servicebus_queue[count.index], "resource_group_id"))
  )
  servicebus_namespace = try(
    var.servicebus_namespace_name != null ? data.azurerm_servicebus_namespace.this.name : element(
    azurerm_servicebus_namespace.this.*.name, lookup(var.output_servicebus_queue[count.index], "servicebus_namespace_id"))
  )
  stream_analytics_job_name = try(
    element(azurerm_stream_analytics_job.this.*.name, lookup(var.output_servicebus_queue[count.index], "stream_analytics_job_id"))
  )
  authentication_mode       = lookup(var.output_servicebus_queue[count.index], "authentication_mode")
  property_columns          = lookup(var.output_servicebus_queue[count.index], "property_columns")
  shared_access_policy_key  = sensitive(data.azurerm_servicebus_namespace.this.default_primary_key)
  shared_access_policy_name = lookup(var.output_servicebus_queue[count.index], "shared_access_policy_name")
  system_property_columns   = lookup(var.output_servicebus_queue[count.index], "system_property_columns")

  dynamic "serialization" {
    for_each = lookup(var.output_servicebus_queue[count.index], "serialization")
    content {
      type            = lookup(serialization.value, "type")
      encoding        = lookup(serialization.value, "encoding")
      field_delimiter = lookup(serialization.value, "field_delimiter")
      format          = lookup(serialization.value, "format")
    }
  }
}

resource "azurerm_stream_analytics_output_servicebus_topic" "this" {
  count = ((length(var.resource_group) || var.resource_group_name != null) &&
    length(var.job) && (length(var.servicebus_namespace) || var.servicebus_namespace_name != null) &&
  (length(var.servicebus_topic) || var.servicebus_topic_name != null)) == 0 ? 0 : length(var.output_servicebus_topic)
  name = lookup(var.output_servicebus_topic[count.index], "name")
  resource_group_name = try(
    var.resource_group_name != null ? data.azurerm_resource_group.this.name : element(
    azurerm_resource_group.this.*.name, lookup(var.output_servicebus_topic[count.index], "resource_group_id"))
  )
  servicebus_namespace = try(
    var.servicebus_namespace_name != null ? data.azurerm_servicebus_namespace.this.name : element(
    azurerm_servicebus_namespace.this.*.name, lookup(var.output_servicebus_topic[count.index], "servicebus_namespace_id"))
  )
  stream_analytics_job_name = try(
    element(azurerm_stream_analytics_job.this.*.name, lookup(var.output_servicebus_queue[count.index], "stream_analytics_job_id"))
  )
  topic_name = try(
    var.servicebus_topic_name != null ? data.azurerm_servicebus_topic.this.name : element(
    azurerm_servicebus_topic.this.*.name, lookup(var.output_servicebus_topic[count.index], "queue_id"))
  )
  authentication_mode       = lookup(var.output_servicebus_topic[count.index], "authentication_mode")
  property_columns          = lookup(var.output_servicebus_topic[count.index], "property_columns")
  shared_access_policy_key  = sensitive(data.azurerm_servicebus_namespace.this.default_primary_key)
  shared_access_policy_name = lookup(var.output_servicebus_topic[count.index], "shared_access_policy_name")
  system_property_columns   = lookup(var.output_servicebus_topic[count.index], "system_property_columns")

  dynamic "serialization" {
    for_each = lookup(var.servicebus_topic_name[count.index], "serialization")
    content {
      type            = lookup(serialization.value, "type")
      encoding        = lookup(serialization.value, "encoding")
      field_delimiter = lookup(serialization.value, "field_delimiter")
      format          = lookup(serialization.value, "format")
    }
  }
}

resource "azurerm_stream_analytics_output_synapse" "this" {
  count = (length(var.synapse_workspace) &&
    length(var.job) &&
  (length(var.resource_group) || var.resource_group_name != null)) == 0 ? 0 : length(var.output_synapse)
  database = lookup(var.output_synapse[count.index], "database")
  name     = lookup(var.output_synapse[count.index], "name")
  password = sensitive(try(element(azurerm_synapse_workspace.this.*.sql_administrator_login_password, lookup(var.output_synapse[count.index], "synapse_workspace_id"))))
  resource_group_name = try(
    var.resource_group_name != null ? data.azurerm_resource_group.this.name : element(azurerm_resource_group.this.*.name, lookup(var.output_synapse[count.index], "resource_group_id"))
  )
  server                    = try(element(azurerm_synapse_workspace.this.*.connectivity_endpoints["sqlOnDemand"], lookup(var.output_synapse[count.index], "synapse_workspace_id")))
  stream_analytics_job_name = try(element(azurerm_stream_analytics_job.this.*.name, lookup(var.output_synapse[count.index], "stream_analytics_job_id")))
  table                     = lookup(var.output_synapse[count.index], "table")
  user                      = sensitive(try(element(azurerm_synapse_workspace.this.*.sql_administrator_login, lookup(var.output_synapse[count.index], "synapse_workspace_id"))))
}

resource "azurerm_stream_analytics_output_table" "this" {
  count = (length(var.job) &&
    (length(var.storage_table) || var.storage_table_name != null) &&
  (length(var.resource_group) || var.resource_group_name != null)) == 0 ? 0 : length(var.output_table)
  batch_size    = lookup(var.output_table[count.index], "batch_size")
  name          = lookup(var.output_table[count.index], "name")
  partition_key = lookup(var.output_table[count.index], "partition_key")
  resource_group_name = try(
    var.resource_group_name != null ? data.azurerm_resource_group.this.name : element(
      azurerm_resource_group.this.*.name, lookup(var.output_table[count.index], "resource_group_id")
    )
  )
  row_key             = lookup(var.output_table[count.index], "row_key")
  storage_account_key = sensitive(data.azurerm_storage_account.this.primary_access_key)
  storage_account_name = try(
    var.storage_account_name != null ? data.azurerm_storage_account.this.name : element(
      module.storage.*.storage_account_name, lookup(var.output_table[count.index], "storage_account_id")
    )
  )
  stream_analytics_job_name = lookup(var.output_table[count.index], "stream_analytics_job_name")
  table = try(
    var.storage_table_name != null ? data.azurerm_storage_table.this.name : element(
      module.storage.*.table_name, lookup(var.output_table[count.index], "table_id")
    )
  )
  columns_to_remove = lookup(var.output_table[count.index], "columns_to_remove")
}