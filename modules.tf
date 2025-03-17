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

module "cosmosdb" {
  source              = "./modules/terraform-azure-cosmosdb"
  resource_group_name = var.resource_group_name
  account             = var.cosmosdb_account
  sql_database        = var.cosmosdb_sql_database
  sql_container       = var.cosmosdb_sql_container
}