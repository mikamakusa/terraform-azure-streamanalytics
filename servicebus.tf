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