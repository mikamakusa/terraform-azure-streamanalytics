resource "azurerm_stream_analytics_cluster" "this" {
  count = (length(var.resource_group) || var.resource_group_name != null) == 0 ? 0 : length(var.cluster)
  location = try(
    var.resource_group_name != null ? data.azurerm_resource_group.this.location :
    element(azurerm_resource_group.this.*.location, lookup(var.cluster[count.index], "resource_group_id"))
  )
  name = lookup(var.cluster[count.index], "name")
  resource_group_name = try(
    var.resource_group_name != null ? data.azurerm_resource_group.this.name :
    element(azurerm_resource_group.this.*.name, lookup(var.cluster[count.index], "resource_group_id"))
  )
  streaming_capacity = lookup(var.cluster[count.index], "streaming_capacity")
  tags               = merge(var.tags, lookup(var.cluster[count.index], "tags"))
}
