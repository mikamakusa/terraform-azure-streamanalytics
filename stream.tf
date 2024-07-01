resource "azurerm_stream_analytics_stream_input_blob" "this" {
  count        = (length(var.resource_group)) == 0 ? 0 : length(var.stream_input_blob)
  date_format  = ""
  name         = ""
  path_pattern = ""
  resource_group_name = try(
    var.resource_group_name != null ? data.azurerm_resource_group.this.name :
    element(azurerm_resource_group.this.*.name, lookup(var.stream_input_blob[count.index], "resource_group_id"))
  )
  storage_account_key       = ""
  storage_account_name      = ""
  storage_container_name    = ""
  stream_analytics_job_name = ""
  time_format               = ""
}

resource "azurerm_stream_analytics_stream_input_eventhub" "this" {
  count                     = (length(var.resource_group)) == 0 ? 0 : length(var.stream_input_eventhub)
  eventhub_name             = ""
  name                      = ""
  resource_group_name       = try(
      var.resource_group_name != null ? data.azurerm_resource_group.this.name :
      element(azurerm_resource_group.this.*.name, lookup(var.stream_input_eventhub[count.index], "resource_group_id"))
  )
  servicebus_namespace      = ""
  stream_analytics_job_name = ""
}

resource "azurerm_stream_analytics_stream_input_iothub" "this" {
  count                        = ((length(var.resource_group) || var.resource_group) && length(var.iothub)) == 0 ? 0 : length(var.stream_input_iothub)
  endpoint                     = ""
  eventhub_consumer_group_name = ""
  iothub_namespace             = ""
  name                         = ""
  resource_group_name = try(
    var.resource_group_name != null ? data.azurerm_resource_group.this.name :
    element(azurerm_resource_group.this.*.name, lookup(var.stream_input_iothub[count.index], "resource_group_id"))
  )
  shared_access_policy_key  = ""
  shared_access_policy_name = ""
  stream_analytics_job_name = ""
}