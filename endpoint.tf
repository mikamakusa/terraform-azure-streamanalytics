resource "azurerm_stream_analytics_managed_private_endpoint" "this" {
  count = (length(var.cluster) &&
    (length(var.resource_group) || var.resource_group_name != null) &&
  (length(var.storage_account) || var.storage_account_name != null)) == 0 ? 0 : length(var.managed_private_endpoint)
  name = lookup(var.managed_private_endpoint[count.index], "name")
  resource_group_name = try(
    var.resource_group_name != null ? data.azurerm_resource_group.this.name :
    element(azurerm_resource_group.this.*.name, lookup(var.managed_private_endpoint[count.index], "resource_group_id"))
  )
  stream_analytics_cluster_name = try(
    element(azurerm_stream_analytics_cluster.this.*.name, lookup(var.managed_private_endpoint[count.index], "stream_analytics_cluster_id"))
  )
  subresource_name = lookup(var.managed_private_endpoint[count.index], "subresource_name")
  target_resource_id = try(
    var.storage_account_name != null ? data.azurerm_storage_account.this.id :
    element(module.storage.*.storage_account_id, lookup(var.managed_private_endpoint[count.index], "target_resource_id"))
  )
}