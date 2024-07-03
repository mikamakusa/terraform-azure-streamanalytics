resource "azurerm_stream_analytics_job" "this" {
  count = (length(var.resource_group) || (var.resource_group_name != null)) == 0 ? 0 : length(var.job)
  location = try(
    var.resource_group_name != null ? data.azurerm_resource_group.this.location :
    element(
      azurerm_resource_group.this.*.location,
    lookup(var.job[count.index], "resource_group_id"))
  )
  name = lookup(var.job[count.index], "name")
  resource_group_name = try(
    var.resource_group_name != null ? data.azurerm_resource_group.this.name :
    element(
      azurerm_resource_group.this.*.name,
    lookup(var.job[count.index], "resource_group_id"))
  )
  transformation_query                     = lookup(var.job[count.index], "transformation_query")
  compatibility_level                      = lookup(var.job[count.index], "compatibility_level")
  content_storage_policy                   = lookup(var.job[count.index], "content_storage_policy")
  data_locale                              = lookup(var.job[count.index], "data_locale")
  events_late_arrival_max_delay_in_seconds = lookup(var.job[count.index], "events_late_arrival_max_delay_in_seconds")
  events_out_of_order_max_delay_in_seconds = lookup(var.job[count.index], "events_out_of_order_max_delay_in_seconds")
  events_out_of_order_policy               = lookup(var.job[count.index], "events_out_of_order_policy")
  output_error_policy                      = lookup(var.job[count.index], "output_error_policy")
  stream_analytics_cluster_id = try(
    element(
      azurerm_stream_analytics_cluster.this.*.id,
      lookup(var.job[count.index], "stream_analytics_cluster_id")
    )
  )
  streaming_units = lookup(var.job[count.index], "streaming_units")
  tags            = merge(var.tags, lookup(var.job[count.index], "tags"))
  type            = lookup(var.job[count.index], "type")

  dynamic "identity" {
    for_each = lookup(var.job[count.index], "identity") == null ? [] : ["identity"]
    content {
      type         = lookup(identity.value, "type")
      identity_ids = lookup(identity.value, "identity_ids")
    }
  }

  dynamic "job_storage_account" {
    for_each = lookup(var.job[count.index], "job_storage_account") == null ? [] : ["job_storage_account"]
    content {
      account_key         = lookup(job_storage_account.value, "account_key")
      account_name        = lookup(job_storage_account.value, "account_name")
      authentication_mode = lookup(job_storage_account.value, "authentication_mode")
    }
  }
}

resource "azurerm_stream_analytics_job_schedule" "this" {
  count      = length(var.job) == 0 ? 0 : length(var.job_schedule)
  start_mode = lookup(var.job_schedule[count.index], "start_mode")
  start_time = lookup(var.job_schedule[count.index], "start_time")
  stream_analytics_job_id = try(
    element(azurerm_stream_analytics_job.this.*.id, lookup(var.job_schedule[count.index], "stream_analytics_job_id"))
  )
}