resource "azurerm_stream_analytics_reference_input_mssql" "this" {
  database                  = ""
  full_snapshot_query       = ""
  name                      = ""
  password                  = ""
  refresh_type              = ""
  resource_group_name       = ""
  server                    = ""
  stream_analytics_job_name = ""
  username                  = ""
}

resource "azurerm_stream_analytics_reference_input_blob" "this" {
  date_format               = ""
  name                      = ""
  path_pattern              = ""
  resource_group_name       = ""
  storage_account_name      = ""
  storage_container_name    = ""
  stream_analytics_job_name = ""
  time_format               = ""
}