resource "azurerm_iothub" "this" {
  count               = (length(var.resource_group) || var.resource_group_name != null) == 0 ? 0 : length(var.iothub)
  location            = try(
      var.resource_group_name != null ? data.azurerm_resource_group.this.location :
      element(azurerm_resource_group.this.*.location, lookup(var.iothub[count.index], "resource_group_id"))
  )
  name                = lookup(var.iothub[count.index], "name")
  resource_group_name = try(
      var.resource_group_name != null ? data.azurerm_resource_group.this.name :
      element(azurerm_resource_group.this.*.name, lookup(var.iothub[count.index], "resource_group_id"))
  )
  local_authentication_enabled  = lookup(var.iothub[count.index], "local_authentication_enabled")
  event_hub_partition_count     = lookup(var.iothub[count.index], "event_hub_partition_count")
  event_hub_retention_in_days   = lookup(var.iothub[count.index], "event_hub_retention_in_days")
  endpoint                      = lookup(var.iothub[count.index], "endpoint")
  public_network_access_enabled = lookup(var.iothub[count.index], "public_network_access_enabled")
  min_tls_version               = lookup(var.iothub[count.index], "min_tls_version")
  tags                          = merge(
    var.tags,
    lookup(var.iothub[count.index], "tags")
  )

  dynamic "sku" {
    for_each = lookup(var.iothub[count.index], "sku")
    content {
      name     = lookup(sku.value, "name")
      capacity = lookup(sku.value, "capacity")
    }
  }

  dynamic "cloud_to_device" {
    for_each = try(lookup(var.iothub[count.index], "cloud_to_device")) == null ? [] : ["cloud_to_device"]
    content {
      default_ttl        = lookup(cloud_to_device.value, "default_ttl")
      max_delivery_count = lookup(cloud_to_device.value, "max_delivery_count")

      dynamic "feedback" {
        for_each = lookup(cloud_to_device.value, "feedback") == null ? [] : ["feedback"]
        content {
          time_to_live       = lookup(feedback.value, "time_to_live")
          max_delivery_count = lookup(feedback.value, "max_delivery_count")
          lock_duration      = lookup(feedback.value, "lock_duration")
        }
      }
    }
  }

  dynamic "endpoint" {
    for_each = try(lookup(var.iothub[count.index], "endpoint")) == null ? [] : ["endpoint"]
    content {
      authentication_type        = lookup(endpoint.value, "authentication_type")
      batch_frequency_in_seconds = lookup(endpoint.value, "batch_frequency_in_seconds")
      connection_string          = lookup(endpoint.value, "connection_string")
      container_name             = lookup(endpoint.value, "container_name")
      encoding                   = lookup(endpoint.value, "encoding")
      endpoint_uri               = lookup(endpoint.value, "endpoint_uri")
      entity_path                = lookup(endpoint.value, "entity_path")
      file_name_format           = lookup(endpoint.value, "file_name_format")
      identity_id                = lookup(endpoint.value, "identity_id")
      max_chunk_size_in_bytes    = lookup(endpoint.value, "max_chunk_size_in_bytes")
      name                       = lookup(endpoint.value, "name")
      resource_group_name        = lookup(endpoint.value, "resource_group_name")
      type                       = lookup(endpoint.value, "type")
    }
  }

  dynamic "enrichment" {
    for_each = try(lookup(var.iothub[count.index], "enrichment")) == null ? [] : ["enrichment"]
    content {
      key            = lookup(enrichment.value, "key")
      value          = lookup(enrichment.value, "value")
      endpoint_names = lookup(enrichment.value, "endpoint_names")
    }
  }

  dynamic "fallback_route" {
    for_each = try(lookup(var.iothub[count.index], "fallback_route")) == null ? [] : ["fallback_route"]
    content {
      source         = lookup(fallback_route.value, "source")
      condition      = lookup(fallback_route.value, "condition")
      enabled        = lookup(fallback_route.value, "enabled")
      endpoint_names = lookup(fallback_route.value, "endpoint_names")
    }
  }

  dynamic "file_upload" {
    for_each = try(lookup(var.iothub[count.index], "file_upload")) == null ? [] : ["file_upload"]
    content {
      connection_string   = lookup(file_upload.value, "connection_string")
      container_name      = lookup(file_upload.value, "container_name")
      authentication_type = lookup(file_upload.value, "authentication_type")
      default_ttl         = lookup(file_upload.value, "default_ttl")
      lock_duration       = lookup(file_upload.value, "lock_duration")
      max_delivery_count  = lookup(file_upload.value, "max_delivery_count")
      notifications       = lookup(file_upload.value, "notifications")
      sas_ttl             = lookup(file_upload.value, "sas_ttl")
    }
  }

  dynamic "identity" {
    for_each = try(lookup(var.iothub[count.index], "identity")) == null ? [] : ["identity"]
    content {
      type         = lookup(identity.value, "type")
      identity_ids = lookup(identity.value, "identity_ids")
    }
  }

  dynamic "network_rule_set" {
    for_each = try(lookup(var.iothub[count.index], "network_rule_set")) == null ? [] : ["network_rule_set"]
    content {
      default_action                     = lookup(network_rule_set.value, "default_action")
      apply_to_builtin_eventhub_endpoint = lookup(network_rule_set.value, "apply_to_builtin_eventhub_endpoint")

      dynamic "ip_rule" {
        for_each = lookup(network_rule_set.value, "ip_rule") == null ? [] : ["ip_rule"]
        content {
          ip_mask = lookup(ip_rule.value, "ip_mask")
          name    = lookup(ip_rule.value, "name")
          action  = lookup(ip_rule.value, "action")
        }
      }
    }
  }

  dynamic "route" {
    for_each = try(lookup(var.iothub[count.index], "route")) == null ? [] : ["route"]
    content {
      name           = lookup(route.value, "name")
      source         = lookup(route.value, "source")
      condition      = lookup(route.value, "condition")
      endpoint_names = lookup(route.value, "endpoint_names")
      enabled        = lookup(route.value, "enabled")
    }
  }
}