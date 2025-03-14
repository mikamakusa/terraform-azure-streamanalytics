module "storage" {
  source                    = "./modules/terraform-azure-storage"
  resource_group_name       = var.resource_group_name
  account                   = var.storage_account
  container                 = var.storage_container
  table                     = var.storage_table
  data_lake_gen2_filesystem = var.data_lake_gen2_filesystem
}

module "iothub" {
  source              = "./modules/terraform-azure-iothub"
  resource_group_name = var.resource_group_name
  iothub              = var.iothub
}