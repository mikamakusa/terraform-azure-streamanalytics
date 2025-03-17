resource "azurerm_stream_analytics_function_javascript_udf" "this" {
  count = (length(var.job) && (length(var.resource_group) || (var.resource_group_name ? 1 : 0))) == 0 ? 0 : length(var.function_javascript_udf)
  name  = lookup(var.function_javascript_uda[count.index], "name")
  resource_group_name = try(
    var.resource_group_name != null ? data.azurerm_resource_group.this.name :
    element(
      azurerm_resource_group.this.*.name,
    lookup(var.function_javascript_udf[count.index], "resource_group_id"))
  )
  script = lookup(var.function_javascript_uda[count.index], "script")
  stream_analytics_job_name = try(
    element(
      azurerm_stream_analytics_job.this.*.id,
    lookup(var.function_javascript_uda[count.index], "stream_analytics_job_id"))
  )

  dynamic "input" {
    for_each = lookup(var.function_javascript_uda[count.index], "input") == null ? [] : ["input"]
    content {
      type                    = lookup(input.value, "type")
      configuration_parameter = lookup(input.value, "configuration_parameter")
    }
  }

  dynamic "output" {
    for_each = lookup(var.function_javascript_uda[count.index], "output") == null ? [] : ["output"]
    content {
      type = lookup(output.value, "type")
    }
  }
}

resource "azurerm_stream_analytics_function_javascript_uda" "this" {
  count  = length(var.job) == 0 ? 0 : length(var.function_javascript_uda)
  name   = lookup(var.function_javascript_udf[count.index], "name")
  script = lookup(var.function_javascript_udf[count.index], "script")
  stream_analytics_job_id = try(
    element(
      azurerm_stream_analytics_job.this.*.id,
    lookup(var.function_javascript_udf[count.index], "stream_analytics_job_id"))
  )

  dynamic "input" {
    for_each = lookup(var.function_javascript_udf[count.index], "input") == null ? [] : ["input"]
    content {
      type                    = lookup(input.value, "type")
      configuration_parameter = lookup(input.value, "configuration_parameter")
    }
  }

  dynamic "output" {
    for_each = lookup(var.function_javascript_udf[count.index], "output") == null ? [] : ["output"]
    content {
      type = lookup(output.value, "type")
    }
  }
}

resource "azurerm_app_service_plan" "this" {
  count               = (length(var.resource_group) || var.resource_group_name != null) == 0 ? 0 : length(var.app_service_plan)
  location            = try(
      var.resource_group_name != null ? data.azurerm_resource_group.this.name :
      element(
        azurerm_resource_group.this.*.name,
        lookup(var.app_service_plan[count.index], "resource_group_id"))
  )
  name                = lookup(var.app_service_plan[count.index], "name")
  resource_group_name = try(
      var.resource_group_name != null ? data.azurerm_resource_group.this.name :
      element(
        azurerm_resource_group.this.*.name,
        lookup(var.app_service_plan[count.index], "resource_group_id"))
  )
}

resource "azurerm_function_app" "this" {
  count = ((length(var.app_service_plan) || var.app_service_plan_name != null) &&
    (length(var.resource_group) || var.resource_group_name != null) &&
  (length(var.storage_account) || var.storage_account_name != null)) == 0 ? 0 : length(var.function_app)
  app_service_plan_id = try(
    var.app_service_plan_name != null ? data.azurerm_app_service_plan.this.id : element(
    azurerm_app_service_plan.this.*.id, lookup(var.function_app[count.index], "app_service_plan_id"))
  )
  location                   = try(
      var.resource_group_name != null ? data.azurerm_resource_group.this.location :
      element(
        azurerm_resource_group.this.*.location,
        lookup(var.function_app[count.index], "resource_group_id"))
  )
  name                       = lookup(var.function_app[count.index], "name")
  resource_group_name        = try(
      var.resource_group_name != null ? data.azurerm_resource_group.this.name :
      element(
        azurerm_resource_group.this.*.name,
        lookup(var.function_app[count.index], "resource_group_id"))
  )
  storage_account_access_key = try(
      var.storage_account_name != null ? data.azurerm_storage_account.this.primary_access_key :
      element(
        module.storage.*.storage_account_primary_access_key,
        lookup(var.function_app[count.index], "storage_account_id"))
  )
  storage_account_name       = try(
      var.storage_account_name != null ? data.azurerm_storage_account.this.name :
      element(
        module.storage.*.storage_account_name,
        lookup(var.function_app[count.index], "storage_account_id"))
  )
}