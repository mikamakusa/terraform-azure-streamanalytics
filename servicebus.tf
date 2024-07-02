resource "azurerm_servicebus_namespace" "this" {
  count = (length(var.resource_group) || var.resource_group_name != null) == 0 ? 0 : length(var.servicebus_namespace)
  location = try(
    var.resource_group_name != null ? data.azurerm_resource_group.this.location : element(
      azurerm_resource_group.this.*.location, lookup(var.servicebus_namespace[count.index], "resource_group_id")
    )
  )
  name = lookup(var.servicebus_namespace[count.index], "name")
  resource_group_name = try(
    var.resource_group_name != null ? data.azurerm_resource_group.this.name : element(
      azurerm_resource_group.this.*.name, lookup(var.servicebus_namespace[count.index], "resource_group_id")
    )
  )
  sku = lookup(var.servicebus_namespace[count.index], "sku")
}

resource "azurerm_servicebus_queue" "this" {
  count = (length(var.servicebus_namespace) || var.servicebus_namespace_name != null) == 0 ? 0 : length(var.servicebus_queue)
  name  = lookup(var.servicebus_queue[count.index], "name")
  namespace_id = try(
    var.servicebus_namespace_name != null ? data.azurerm_servicebus_namespace.this.id : element(
    azurerm_servicebus_namespace.this.*.id, lookup(var.servicebus_queue[count.index], "namespace_id"))
  )
  auto_delete_on_idle                     = lookup(var.servicebus_queue[count.index], "auto_delete_on_idle")
  dead_lettering_on_message_expiration    = lookup(var.servicebus_queue[count.index], "dead_lettering_on_message_expiration")
  default_message_ttl                     = lookup(var.servicebus_queue[count.index], "default_message_ttl")
  duplicate_detection_history_time_window = lookup(var.servicebus_queue[count.index], "duplicate_detection_history_time_window")
  enable_partitioning                     = lookup(var.servicebus_queue[count.index], "enable_partitioning")
  enable_batched_operations               = lookup(var.servicebus_queue[count.index], "enable_batched_operations")
  enable_express                          = lookup(var.servicebus_queue[count.index], "enable_express")
  forward_dead_lettered_messages_to       = lookup(var.servicebus_queue[count.index], "forward_dead_lettered_messages_to")
  forward_to                              = lookup(var.servicebus_queue[count.index], "forward_to")
  lock_duration                           = lookup(var.servicebus_queue[count.index], "lock_duration")
  max_delivery_count                      = lookup(var.servicebus_queue[count.index], "max_delivery_count")
  max_message_size_in_kilobytes           = lookup(var.servicebus_queue[count.index], "max_message_size_in_kilobytes")
  max_size_in_megabytes                   = lookup(var.servicebus_queue[count.index], "max_size_in_megabytes")
  requires_duplicate_detection            = lookup(var.servicebus_queue[count.index], "requires_duplicate_detection")
  requires_session                        = lookup(var.servicebus_queue[count.index], "requires_session")
  status                                  = lookup(var.servicebus_queue[count.index], "status")
}

resource "azurerm_servicebus_topic" "this" {
  count                                   = (length(var.servicebus_namespace) || var.servicebus_namespace_name != null) == 0 ? 0 : length(var.servicebus_topic)
  name                                    = lookup(var.servicebus_topic[count.index], "name")
  namespace_id                            = try(
      var.servicebus_namespace_name != null ? data.azurerm_servicebus_namespace.this.id : element(
      azurerm_servicebus_namespace.this.*.id, lookup(var.servicebus_topic[count.index], "namespace_id"))
  )
  auto_delete_on_idle                     = lookup(var.servicebus_topic[count.index], "auto_delete_on_idle")
  default_message_ttl                     = lookup(var.servicebus_topic[count.index], "default_message_ttl")
  duplicate_detection_history_time_window = lookup(var.servicebus_topic[count.index], "duplicate_detection_history_time_window")
  enable_batched_operations               = lookup(var.servicebus_topic[count.index], "enable_batched_operations")
  enable_express                          = lookup(var.servicebus_topic[count.index], "enable_express")
  enable_partitioning                     = lookup(var.servicebus_topic[count.index], "enable_partitioning")
  max_message_size_in_kilobytes           = lookup(var.servicebus_topic[count.index], "max_message_size_in_kilobytes")
  max_size_in_megabytes                   = lookup(var.servicebus_topic[count.index], "max_size_in_megabytes")
  requires_duplicate_detection            = lookup(var.servicebus_topic[count.index], "requires_duplicate_detection")
  status                                  = lookup(var.servicebus_topic[count.index], "status")
  support_ordering                        = lookup(var.servicebus_topic[count.index], "support_ordering")
}