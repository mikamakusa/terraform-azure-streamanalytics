resource "azurerm_iothub" "this" {
  count               = (length(var.resource_group) || var.resource_group_name != null) == 0 ? 0 : length(var.iothub)
  location            = try(
      var.resource_group_name != null ? data.azurerm_resource_group.this.location :
      element(azurerm_resource_group.this.*.location, lookup(var.iothub[count.index], "resource_group_id"))
  )
  name                = ""
  resource_group_name = try(
      var.resource_group_name != null ? data.azurerm_resource_group.this.name :
      element(azurerm_resource_group.this.*.name, lookup(var.iothub[count.index], "resource_group_id"))
  )
}