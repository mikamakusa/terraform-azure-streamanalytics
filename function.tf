resource "azurerm_stream_analytics_function_javascript_udf" "this" {
  count                     = (length(var.job) && (length(var.resource_group) || (var.resource_group_name ? 1 : 0))) == 0 ? 0 : length(var.function_javascript_udf)
  name                      = lookup(var.function_javascript_uda[count.index], "name")
  resource_group_name       = try(
      var.resource_group_name != null ? data.azurerm_resource_group.this.name :
      element(
        azurerm_resource_group.this.*.name,
        lookup(var.function_javascript_udf[count.index], "resource_group_id"))
  )
  script                    = lookup(var.function_javascript_uda[count.index], "script")
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
  count                   = length(var.job) == 0 ? 0 : length(var.function_javascript_uda)
  name                    = lookup(var.function_javascript_udf[count.index], "name")
  script                  = lookup(var.function_javascript_udf[count.index], "script")
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