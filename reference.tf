resource "azurerm_stream_analytics_reference_input_mssql" "this" {
  count = ((length(var.resource_group) || var.resource_group_name != null) &&
    length(var.job) &&
  (length(var.sql_database) || var.sql_database_name != null)) == 0 ? 0 : length(var.reference_input_mssql)
  database = try(
    var.sql_database_name != null ? data.azurerm_sql_database.this.name : element(
      azurerm_sql_database.this.*.name, lookup(var.reference_input_mssql[count.index], "database_id")
    )
  )
  full_snapshot_query = lookup(var.reference_input_mssql[count.index], "full_snapshot_query")
  name                = lookup(var.reference_input_mssql[count.index], "name")
  password            = sensitive(lookup(var.reference_input_mssql[count.index], "password"))
  refresh_type        = lookup(var.reference_input_mssql[count.index], "refresh_type")
  resource_group_name = try(
    var.resource_group_name != null ? data.azurerm_resource_group.this.name : element(
    azurerm_resource_group.this.*.name, lookup(var.reference_input_mssql[count.index], "resource_group_id"))
  )
  server = try(
    var.sql_server_name != null ? data.azurerm_sql_server.this.fqdn : element(
      azurerm_sql_server.this.*.fully_qualified_domain_name, lookup(var.reference_input_mssql[count.index], "server_id")
    )
  )
  stream_analytics_job_name = try(element(azurerm_stream_analytics_job.this.*.name, lookup(var.reference_input_mssql[count.index], "stream_analytics_job_id")))
  username                  = sensitive(lookup(var.reference_input_mssql[count.index], "username"))
  refresh_interval_duration = lookup(var.reference_input_mssql[count.index], "refresh_interval_duration")
  delta_snapshot_query      = lookup(var.reference_input_mssql[count.index], "delta_snapshot_query")
  table                     = lookup(var.reference_input_mssql[count.index], "table")
}

resource "azurerm_stream_analytics_reference_input_blob" "this" {
  count = ((length(var.resource_group) || var.resource_group_name != null) &&
    (length(var.storage_account) || var.storage_account_name != null) &&
    (length(var.storage_container) || var.storage_container_name != null) &&
  length(var.job)) == 0 ? 0 : length(var.reference_input_blob)
  date_format  = lookup(var.reference_input_blob[count.index], "date_format")
  name         = lookup(var.reference_input_blob[count.index], "name")
  path_pattern = lookup(var.reference_input_blob[count.index], "path_pattern")
  resource_group_name = try(
    var.resource_group_name != null ? data.azurerm_resource_group.this.name : element(
      azurerm_resource_group.this.*.name, lookup(var.reference_input_blob[count.index], "resource_group_id")
    )
  )
  storage_account_name = try(
    var.storage_account_name != null ? data.azurerm_storage_account.this.name : element(
      module.storage.*.storage_account_name, lookup(var.reference_input_blob[count.index], "storage_account_id")
    )
  )
  storage_container_name = try(
    var.storage_container_name != null ? data.azurerm_storage_container.this.name : element(
      module.storage.*.container_name, lookup(var.reference_input_blob[count.index], "storage_container_id"))
  )
  stream_analytics_job_name = try(element(azurerm_stream_analytics_job.this.*.name, lookup(var.reference_input_blob[count.index], "stream_analytics_job_id")))
  time_format               = lookup(var.reference_input_blob[count.index], "time_format")
  storage_account_key = try(var.storage_account_name != null ? sensitive(data.azurerm_storage_account.this.primary_access_key) : element(sensitive(module.storage.*.storage_account_primary_access_key, lookup(var.reference_input_blob[count.index], "storage_account_id"))))
  authentication_mode = lookup(var.reference_input_blob[count.index], "authentication_mode")

  dynamic "serialization" {
    for_each = lookup(var.stream_input_blob[count.index], "serialization")
    content {
      type            = lookup(serialization.value, "type")
      encoding        = lookup(serialization.value, "encoding")
      field_delimiter = lookup(serialization.value, "field_delimiter")
    }
  }
}