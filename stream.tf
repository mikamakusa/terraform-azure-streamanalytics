resource "azurerm_stream_analytics_stream_input_blob" "this" {
  count = (length(var.resource_group) &&
    (length(var.storage_account) || var.storage_account_name != null) &&
    (length(var.storage_container) || var.storage_container_name != null) &&
  length(var.job)) == 0 ? 0 : length(var.stream_input_blob)
  date_format  = lookup(var.stream_input_blob[count.index], "date_format")
  name         = lookup(var.stream_input_blob[count.index], "name")
  path_pattern = lookup(var.stream_input_blob[count.index], "path_pattern")
  resource_group_name = try(
    var.resource_group_name != null ? data.azurerm_resource_group.this.name :
    element(azurerm_resource_group.this.*.name, lookup(var.stream_input_blob[count.index], "resource_group_id"))
  )
  storage_account_key = try(
    var.storage_account_name != null ? sensitive(data.azurerm_storage_account.this.primary_access_key) :
    element(azurerm_storage_account.this.*.primary_access_key, lookup(var.stream_input_blob[count.index], "storage_account_id"))
  )
  storage_account_name = try(
    var.storage_account_name != null ? data.azurerm_storage_account.this.name :
    element(module.storage.*.storage_account_name, lookup(var.stream_input_blob[count.index], "storage_account_id"))
  )
  storage_container_name = try(
    var.storage_container_name != null ? data.azurerm_storage_container.this.name :
    element(module.storage.*.container_name, lookup(var.stream_input_blob[count.index], "storage_container_id"))
  )
  stream_analytics_job_name = try(
    element(azurerm_stream_analytics_job.this.*.name, lookup(var.stream_input_blob[count.index], "stream_analytics_job_id"))
  )
  time_format = lookup(var.stream_input_blob[count.index], "time_format")

  dynamic "serialization" {
    for_each = lookup(var.stream_input_blob[count.index], "serialization")
    content {
      type            = lookup(serialization.value, "type")
      encoding        = lookup(serialization.value, "encoding")
      field_delimiter = lookup(serialization.value, "field_delimiter")
    }
  }
}

resource "azurerm_stream_analytics_stream_input_eventhub" "this" {
  count = ((length(var.resource_group) || var.resource_group_name != null) &&
    (length(var.eventhub) || var.eventhub_name != null) &&
    (length(var.servicebus_namespace) || var.servicebus_namespace_name != null) &&
  length(var.job)) == 0 ? 0 : length(var.stream_input_eventhub)
  eventhub_name = try(
    var.eventhub_name != null ? data.azurerm_eventhub.this.name : element(
      azurerm_eventhub.this.*.name, lookup(var.stream_input_eventhub[count.index], "eventhub_id")
    )
  )
  name = lookup(var.stream_input_eventhub[count.index], "name")
  resource_group_name = try(
    var.resource_group_name != null ? data.azurerm_resource_group.this.name :
    element(azurerm_resource_group.this.*.name, lookup(var.stream_input_eventhub[count.index], "resource_group_id")
    )
  )
  servicebus_namespace = try(
    var.servicebus_namespace_name != null ? data.azurerm_servicebus_namespace.this.name : element(
      azurerm_servicebus_namespace.this.*.name, lookup(var.stream_input_eventhub[count.index], "servicebus_namespace_id")
    )
  )
  stream_analytics_job_name    = try(element(azurerm_stream_analytics_job.this.*.name, lookup(var.stream_input_eventhub[count.index], "stream_analytics_job_id")))
  authentication_mode          = lookup(var.stream_input_eventhub[count.index], "authentication_mode")
  eventhub_consumer_group_name = data.azurerm_eventhub_consumer_group.this.name
  partition_key                = lookup(var.stream_input_eventhub[count.index], "partition_key")
  shared_access_policy_key     = sensitive(data.azurerm_eventhub_namespace.this.default_primary_key)
  shared_access_policy_name    = lookup(var.stream_input_eventhub[count.index], "shared_access_policy_name")

  dynamic "serialization" {
    for_each = lookup(var.stream_input_eventhub[count.index], "serialization")
    content {
      type            = lookup(serialization.value, "type")
      encoding        = lookup(serialization.value, "encoding")
      field_delimiter = lookup(serialization.value, "field_delimiter")
    }
  }
}

resource "azurerm_stream_analytics_stream_input_iothub" "this" {
  count = ((length(var.resource_group) || var.resource_group_name != null) &&
  length(var.iothub)) == 0 ? 0 : length(var.stream_input_iothub)
  endpoint                     = lookup(var.stream_input_iothub[count.index], "endpoint")
  eventhub_consumer_group_name = lookup(var.stream_input_iothub[count.index], "eventhub_consumer_group_name")
  iothub_namespace             = try(element(module.iothub.*.iothub_name, lookup(var.stream_input_iothub[count.index], "iothub_id")))
  name                         = lookup(var.stream_input_iothub[count.index], "name")
  resource_group_name = try(
    var.resource_group_name != null ? data.azurerm_resource_group.this.name :
    element(azurerm_resource_group.this.*.name, lookup(var.stream_input_iothub[count.index], "resource_group_id"))
  )
  shared_access_policy_key  = try(element(module.iothub.*.iothub_dps_share_access_policy_id[0].primary_key, lookup(var.stream_input_iothub[count.index], "iothub_id")))
  shared_access_policy_name = try(element(module.iothub.*.iothub_dps_share_access_policy_name, lookup(var.stream_input_iothub[count.index], "iothub_id")))
  stream_analytics_job_name = try(element(azurerm_stream_analytics_job.this.*.name, lookup(var.stream_input_iothub[count.index], "stream_analytics_job_id")))

  dynamic "serialization" {
    for_each = lookup(var.stream_input_iothub[count.index], "serialization")
    content {
      type            = lookup(serialization.value, "type")
      encoding        = lookup(serialization.value, "encoding")
      field_delimiter = lookup(serialization.value, "field_delimiter")
    }
  }
}