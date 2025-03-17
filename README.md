## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.8.5 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.109.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 3.109.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cosmosdb"></a> [cosmosdb](#module\_cosmosdb) | ./modules/terraform-azure-cosmosdb | n/a |
| <a name="module_iothub"></a> [iothub](#module\_iothub) | ./modules/terraform-azure-iothub | n/a |
| <a name="module_storage"></a> [storage](#module\_storage) | ./modules/terraform-azure-storage | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_app_service_plan.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/app_service_plan) | resource |
| [azurerm_eventhub.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventhub) | resource |
| [azurerm_function_app.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/function_app) | resource |
| [azurerm_resource_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_servicebus_namespace.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/servicebus_namespace) | resource |
| [azurerm_servicebus_queue.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/servicebus_queue) | resource |
| [azurerm_servicebus_topic.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/servicebus_topic) | resource |
| [azurerm_sql_database.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/sql_database) | resource |
| [azurerm_sql_server.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/sql_server) | resource |
| [azurerm_stream_analytics_cluster.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/stream_analytics_cluster) | resource |
| [azurerm_stream_analytics_function_javascript_uda.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/stream_analytics_function_javascript_uda) | resource |
| [azurerm_stream_analytics_function_javascript_udf.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/stream_analytics_function_javascript_udf) | resource |
| [azurerm_stream_analytics_job.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/stream_analytics_job) | resource |
| [azurerm_stream_analytics_job_schedule.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/stream_analytics_job_schedule) | resource |
| [azurerm_stream_analytics_managed_private_endpoint.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/stream_analytics_managed_private_endpoint) | resource |
| [azurerm_stream_analytics_output_blob.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/stream_analytics_output_blob) | resource |
| [azurerm_stream_analytics_output_cosmosdb.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/stream_analytics_output_cosmosdb) | resource |
| [azurerm_stream_analytics_output_eventhub.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/stream_analytics_output_eventhub) | resource |
| [azurerm_stream_analytics_output_function.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/stream_analytics_output_function) | resource |
| [azurerm_stream_analytics_output_mssql.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/stream_analytics_output_mssql) | resource |
| [azurerm_stream_analytics_output_powerbi.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/stream_analytics_output_powerbi) | resource |
| [azurerm_stream_analytics_output_servicebus_queue.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/stream_analytics_output_servicebus_queue) | resource |
| [azurerm_stream_analytics_output_servicebus_topic.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/stream_analytics_output_servicebus_topic) | resource |
| [azurerm_stream_analytics_output_synapse.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/stream_analytics_output_synapse) | resource |
| [azurerm_stream_analytics_output_table.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/stream_analytics_output_table) | resource |
| [azurerm_stream_analytics_reference_input_blob.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/stream_analytics_reference_input_blob) | resource |
| [azurerm_stream_analytics_reference_input_mssql.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/stream_analytics_reference_input_mssql) | resource |
| [azurerm_stream_analytics_stream_input_blob.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/stream_analytics_stream_input_blob) | resource |
| [azurerm_stream_analytics_stream_input_eventhub.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/stream_analytics_stream_input_eventhub) | resource |
| [azurerm_stream_analytics_stream_input_iothub.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/stream_analytics_stream_input_iothub) | resource |
| [azurerm_synapse_workspace.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/synapse_workspace) | resource |
| [azurerm_app_service_plan.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/app_service_plan) | data source |
| [azurerm_cosmosdb_account.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/cosmosdb_account) | data source |
| [azurerm_cosmosdb_sql_database.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/cosmosdb_sql_database) | data source |
| [azurerm_eventhub.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/eventhub) | data source |
| [azurerm_eventhub_consumer_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/eventhub_consumer_group) | data source |
| [azurerm_eventhub_namespace.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/eventhub_namespace) | data source |
| [azurerm_function_app.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/function_app) | data source |
| [azurerm_resource_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |
| [azurerm_servicebus_namespace.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/servicebus_namespace) | data source |
| [azurerm_servicebus_queue.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/servicebus_queue) | data source |
| [azurerm_servicebus_topic.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/servicebus_topic) | data source |
| [azurerm_sql_database.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/sql_database) | data source |
| [azurerm_sql_server.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/sql_server) | data source |
| [azurerm_storage_account.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/storage_account) | data source |
| [azurerm_storage_container.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/storage_container) | data source |
| [azurerm_storage_table.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/storage_table) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_service_plan"></a> [app\_service\_plan](#input\_app\_service\_plan) | n/a | <pre>list(object({<br/>    id                = number<br/>    name              = string<br/>    resource_group_id = optional(number)<br/>  }))</pre> | `[]` | no |
| <a name="input_app_service_plan_name"></a> [app\_service\_plan\_name](#input\_app\_service\_plan\_name) | n/a | `string` | `null` | no |
| <a name="input_cluster"></a> [cluster](#input\_cluster) | n/a | <pre>list(object({<br/>    id                 = number<br/>    name               = string<br/>    streaming_capacity = number<br/>    tags               = optional(map(string))<br/>  }))</pre> | `[]` | no |
| <a name="input_cosmosdb_account"></a> [cosmosdb\_account](#input\_cosmosdb\_account) | n/a | `any` | `[]` | no |
| <a name="input_cosmosdb_account_name"></a> [cosmosdb\_account\_name](#input\_cosmosdb\_account\_name) | n/a | `string` | `null` | no |
| <a name="input_cosmosdb_sql_container"></a> [cosmosdb\_sql\_container](#input\_cosmosdb\_sql\_container) | n/a | `any` | `[]` | no |
| <a name="input_cosmosdb_sql_database"></a> [cosmosdb\_sql\_database](#input\_cosmosdb\_sql\_database) | n/a | `any` | `[]` | no |
| <a name="input_cosmosdb_sql_database_name"></a> [cosmosdb\_sql\_database\_name](#input\_cosmosdb\_sql\_database\_name) | n/a | `string` | `null` | no |
| <a name="input_data_lake_gen2_filesystem"></a> [data\_lake\_gen2\_filesystem](#input\_data\_lake\_gen2\_filesystem) | n/a | `any` | `[]` | no |
| <a name="input_eventhub"></a> [eventhub](#input\_eventhub) | n/a | <pre>list(object({<br/>    id                = number<br/>    name              = string<br/>    namespace_name    = string<br/>    partition_count   = number<br/>    resource_group_id = optional(number)<br/>  }))</pre> | `[]` | no |
| <a name="input_eventhub_consumer_group_name"></a> [eventhub\_consumer\_group\_name](#input\_eventhub\_consumer\_group\_name) | n/a | `string` | `null` | no |
| <a name="input_eventhub_name"></a> [eventhub\_name](#input\_eventhub\_name) | n/a | `string` | `null` | no |
| <a name="input_eventhub_namespace_name"></a> [eventhub\_namespace\_name](#input\_eventhub\_namespace\_name) | n/a | `string` | `null` | no |
| <a name="input_function_app"></a> [function\_app](#input\_function\_app) | n/a | <pre>list(object({<br/>    id                  = number<br/>    app_service_plan_id = optional(number)<br/>    name                = string<br/>    resource_group_id   = optional(number)<br/>    storage_account_id  = optional(number)<br/>  }))</pre> | `[]` | no |
| <a name="input_function_app_name"></a> [function\_app\_name](#input\_function\_app\_name) | n/a | `string` | `null` | no |
| <a name="input_function_javascript_uda"></a> [function\_javascript\_uda](#input\_function\_javascript\_uda) | n/a | <pre>list(object({<br/>    id                      = number<br/>    name                    = string<br/>    script                  = string<br/>    stream_analytics_job_id = number<br/>    input = optional(list(object({<br/>      type                    = string<br/>      configuration_parameter = optional(bool)<br/>    })), [])<br/>    output = optional(list(object({<br/>      type = string<br/>    })), [])<br/>  }))</pre> | `[]` | no |
| <a name="input_function_javascript_udf"></a> [function\_javascript\_udf](#input\_function\_javascript\_udf) | n/a | <pre>list(object({<br/>    id                      = number<br/>    name                    = string<br/>    script                  = string<br/>    stream_analytics_job_id = number<br/>    input = optional(list(object({<br/>      type                    = string<br/>      configuration_parameter = optional(bool)<br/>    })), [])<br/>    output = optional(list(object({<br/>      type = string<br/>    })), [])<br/>  }))</pre> | `[]` | no |
| <a name="input_iothub"></a> [iothub](#input\_iothub) | n/a | `any` | `[]` | no |
| <a name="input_job"></a> [job](#input\_job) | n/a | <pre>list(object({<br/>    id                                       = number<br/>    name                                     = string<br/>    transformation_query                     = string<br/>    compatibility_level                      = optional(string)<br/>    content_storage_policy                   = optional(string)<br/>    data_locale                              = optional(string)<br/>    events_late_arrival_max_delay_in_seconds = optional(number)<br/>    events_out_of_order_max_delay_in_seconds = optional(number)<br/>    events_out_of_order_policy               = optional(string)<br/>    output_error_policy                      = optional(string)<br/>    stream_analytics_cluster_id              = optional(number)<br/>    streaming_units                          = optional(number)<br/>    tags                                     = optional(map(string))<br/>    type                                     = optional(string)<br/>    identity = optional(list(object({<br/>      type         = string<br/>      identity_ids = optional(list(string))<br/>    })), [])<br/>    job_storage_account = optional(list(object({<br/>      account_key         = string<br/>      account_name        = string<br/>      authentication_mode = optional(string)<br/>    })), [])<br/>  }))</pre> | `[]` | no |
| <a name="input_job_schedule"></a> [job\_schedule](#input\_job\_schedule) | n/a | <pre>list(object({<br/>    id                      = number<br/>    start_mode              = string<br/>    stream_analytics_job_id = number<br/>    start_time              = optional(string)<br/>  }))</pre> | `[]` | no |
| <a name="input_managed_private_endpoint"></a> [managed\_private\_endpoint](#input\_managed\_private\_endpoint) | n/a | <pre>list(object({<br/>    id                          = number<br/>    name                        = string<br/>    stream_analytics_cluster_id = number<br/>    subresource_name            = string<br/>    target_resource_id          = optional(number)<br/>    resource_group_id           = optional(number)<br/>  }))</pre> | `[]` | no |
| <a name="input_output_blob"></a> [output\_blob](#input\_output\_blob) | n/a | <pre>list(object({<br/>    id                      = number<br/>    date_format             = string<br/>    name                    = string<br/>    path_pattern            = string<br/>    stream_analytics_job_id = number<br/>    time_format             = string<br/>    authentication_mode     = optional(string)<br/>    batch_max_wait_time     = optional(string)<br/>    batch_min_rows          = optional(number)<br/>    storage_account_key     = optional(string)<br/>    resource_group_id       = optional(number)<br/>    storage_account_id      = optional(number)<br/>    storage_container_id    = optional(number)<br/>    serialization = list(object({<br/>      type            = string<br/>      encoding        = optional(string)<br/>      field_delimiter = optional(string)<br/>      format          = optional(string)<br/>    }))<br/>  }))</pre> | `[]` | no |
| <a name="input_output_cosmosdb"></a> [output\_cosmosdb](#input\_output\_cosmosdb) | n/a | <pre>list(object({<br/>    id                       = number<br/>    container_id             = number<br/>    name                     = string<br/>    stream_analytics_job_id  = number<br/>    document_id              = string<br/>    partition_key            = string<br/>    cosmosdb_account_id      = optional(number)<br/>    cosmosdb_sql_database_id = optional(number)<br/>    resource_group_id        = optional(number)<br/>  }))</pre> | `[]` | no |
| <a name="input_output_eventhub"></a> [output\_eventhub](#input\_output\_eventhub) | n/a | <pre>list(object({<br/>    id                        = number<br/>    name                      = string<br/>    stream_analytics_job_id   = number<br/>    eventhub_id               = optional(number)<br/>    servicebus_namespace_id   = optional(number)<br/>    shared_access_policy_key  = optional(string)<br/>    shared_access_policy_name = optional(string)<br/>    property_columns          = optional(list(string))<br/>    authentication_mode       = optional(string)<br/>    partition_key             = optional(string)<br/>    resource_group_id         = optional(number)<br/>    serialization = list(object({<br/>      type            = string<br/>      encoding        = optional(string)<br/>      field_delimiter = optional(string)<br/>      format          = optional(string)<br/>    }))<br/>  }))</pre> | `[]` | no |
| <a name="input_output_function"></a> [output\_function](#input\_output\_function) | n/a | <pre>list(object({<br/>    id                      = number<br/>    api_key                 = string<br/>    function_name           = string<br/>    function_id             = optional(number)<br/>    name                    = string<br/>    stream_analytics_job_id = number<br/>    batch_max_count         = optional(number)<br/>    batch_max_in_bytes      = optional(number)<br/>    resource_group_id       = optional(number)<br/>  }))</pre> | `[]` | no |
| <a name="input_output_mssql"></a> [output\_mssql](#input\_output\_mssql) | n/a | <pre>list(object({<br/>    id                      = number<br/>    name                    = string<br/>    stream_analytics_job_id = number<br/>    table                   = string<br/>    authentication_mode     = optional(string)<br/>    max_batch_count         = optional(number)<br/>    max_writer_count        = optional(number)<br/>    password                = optional(string)<br/>    user                    = optional(string)<br/>    resource_group_id       = optional(number)<br/>    server_id               = optional(number)<br/>    database_id             = optional(number)<br/>  }))</pre> | `[]` | no |
| <a name="input_output_powerbi"></a> [output\_powerbi](#input\_output\_powerbi) | n/a | <pre>list(object({<br/>    id                        = number<br/>    dataset                   = string<br/>    group_id                  = string<br/>    group_name                = string<br/>    name                      = string<br/>    stream_analytics_job_id   = number<br/>    table                     = string<br/>    token_user_display_name   = optional(string)<br/>    token_user_principal_name = optional(string)<br/>  }))</pre> | `[]` | no |
| <a name="input_output_servicebus_queue"></a> [output\_servicebus\_queue](#input\_output\_servicebus\_queue) | n/a | <pre>list(object({<br/>    id                        = number<br/>    name                      = string<br/>    queue_id                  = optional(number)<br/>    stream_analytics_job_id   = number<br/>    authentication_mode       = optional(string)<br/>    resource_group_id         = optional(number)<br/>    servicebus_namespace_id   = optional(number)<br/>    property_columns          = optional(list(string))<br/>    shared_access_policy_name = optional(string)<br/>    system_property_columns   = optional(map(string))<br/>    serialization = list(object({<br/>      type            = string<br/>      encoding        = optional(string)<br/>      field_delimiter = optional(string)<br/>      format          = optional(string)<br/>    }))<br/>  }))</pre> | `[]` | no |
| <a name="input_output_servicebus_topic"></a> [output\_servicebus\_topic](#input\_output\_servicebus\_topic) | n/a | <pre>list(object({<br/>    id                        = number<br/>    name                      = string<br/>    stream_analytics_job_id   = number<br/>    resource_group_id         = optional(number)<br/>    servicebus_namespace_id   = optional(number)<br/>    queue_id                  = optional(number)<br/>    authentication_mode       = optional(string)<br/>    property_columns          = optional(list(string))<br/>    shared_access_policy_name = optional(string)<br/>    system_property_columns   = optional(map(string))<br/>    serialization = list(object({<br/>      type            = string<br/>      encoding        = optional(string)<br/>      field_delimiter = optional(string)<br/>      format          = optional(string)<br/>    }))<br/>  }))</pre> | `[]` | no |
| <a name="input_output_synapse"></a> [output\_synapse](#input\_output\_synapse) | n/a | <pre>list(object({<br/>    id                      = number<br/>    database                = string<br/>    name                    = string<br/>    synapse_workspace_id    = number<br/>    stream_analytics_job_id = number<br/>    table                   = string<br/>    resource_group_id       = optional(number)<br/>  }))</pre> | `[]` | no |
| <a name="input_output_table"></a> [output\_table](#input\_output\_table) | n/a | <pre>list(object({<br/>    id                      = number<br/>    batch_size              = number<br/>    name                    = string<br/>    partition_key           = string<br/>    row_key                 = string<br/>    stream_analytics_job_id = number<br/>    columns_to_remove       = optional(list(string))<br/>    resource_group_id       = optional(number)<br/>    storage_account_id      = optional(number)<br/>    table_id                = optional(number)<br/>  }))</pre> | `[]` | no |
| <a name="input_reference_input_blob"></a> [reference\_input\_blob](#input\_reference\_input\_blob) | n/a | <pre>list(object({<br/>    id                      = number<br/>    date_format             = string<br/>    name                    = string<br/>    path_pattern            = string<br/>    stream_analytics_job_id = number<br/>    time_format             = string<br/>    authentication_mode     = optional(string)<br/>    resource_group_id       = optional(number)<br/>    database_id             = optional(number)<br/>    server_id               = optional(number)<br/>    serialization = list(object({<br/>      type            = string<br/>      encoding        = optional(string)<br/>      field_delimiter = optional(string)<br/>    }))<br/>  }))</pre> | `[]` | no |
| <a name="input_reference_input_mssql"></a> [reference\_input\_mssql](#input\_reference\_input\_mssql) | n/a | <pre>list(object({<br/>    id                        = number<br/>    full_snapshot_query       = string<br/>    name                      = string<br/>    password                  = string<br/>    refresh_type              = string<br/>    stream_analytics_job_id   = number<br/>    username                  = string<br/>    refresh_interval_duration = optional(string)<br/>    delta_snapshot_query      = optional(string)<br/>    table                     = optional(string)<br/>  }))</pre> | `[]` | no |
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group) | n/a | <pre>list(object({<br/>    id       = number<br/>    location = string<br/>    name     = string<br/>  }))</pre> | `[]` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | n/a | `string` | n/a | yes |
| <a name="input_servicebus_namespace"></a> [servicebus\_namespace](#input\_servicebus\_namespace) | n/a | <pre>list(object({<br/>    id                = number<br/>    name              = string<br/>    resource_group_id = optional(number)<br/>    sku               = string<br/>  }))</pre> | `[]` | no |
| <a name="input_servicebus_namespace_name"></a> [servicebus\_namespace\_name](#input\_servicebus\_namespace\_name) | n/a | `string` | `null` | no |
| <a name="input_servicebus_queue"></a> [servicebus\_queue](#input\_servicebus\_queue) | n/a | <pre>list(object({<br/>    id                                      = number<br/>    name                                    = string<br/>    namespace_id                            = optional(number)<br/>    auto_delete_on_idle                     = optional(string)<br/>    dead_lettering_on_message_expiration    = optional(bool)<br/>    default_message_ttl                     = optional(string)<br/>    duplicate_detection_history_time_window = optional(string)<br/>    enable_partitioning                     = optional(bool)<br/>    enable_batched_operations               = optional(bool)<br/>    enable_express                          = optional(bool)<br/>    forward_dead_lettered_messages_to       = optional(string)<br/>    forward_to                              = optional(string)<br/>    lock_duration                           = optional(string)<br/>    max_delivery_count                      = optional(number)<br/>    max_message_size_in_kilobytes           = optional(number)<br/>    max_size_in_megabytes                   = optional(number)<br/>    requires_duplicate_detection            = optional(bool)<br/>    requires_session                        = optional(bool)<br/>    status                                  = optional(string)<br/>  }))</pre> | `[]` | no |
| <a name="input_servicebus_queue_name"></a> [servicebus\_queue\_name](#input\_servicebus\_queue\_name) | n/a | `string` | `null` | no |
| <a name="input_servicebus_topic"></a> [servicebus\_topic](#input\_servicebus\_topic) | n/a | <pre>list(object({<br/>    id                                      = number<br/>    name                                    = string<br/>    namespace_id                            = optional(number)<br/>    auto_delete_on_idle                     = optional(string)<br/>    default_message_ttl                     = optional(string)<br/>    duplicate_detection_history_time_window = optional(string)<br/>    enable_batched_operations               = optional(bool)<br/>    enable_express                          = optional(bool)<br/>    enable_partitioning                     = optional(bool)<br/>    max_message_size_in_kilobytes           = optional(number)<br/>    max_size_in_megabytes                   = optional(number)<br/>    requires_duplicate_detection            = optional(bool)<br/>    status                                  = optional(string)<br/>    support_ordering                        = optional(bool)<br/>  }))</pre> | `[]` | no |
| <a name="input_servicebus_topic_name"></a> [servicebus\_topic\_name](#input\_servicebus\_topic\_name) | n/a | `string` | `null` | no |
| <a name="input_sql_database"></a> [sql\_database](#input\_sql\_database) | n/a | <pre>list(object({<br/>    id                = number<br/>    name              = string<br/>    resource_group_id = optional(number)<br/>    server_id         = optional(number)<br/>  }))</pre> | `[]` | no |
| <a name="input_sql_database_name"></a> [sql\_database\_name](#input\_sql\_database\_name) | n/a | `string` | `null` | no |
| <a name="input_sql_server"></a> [sql\_server](#input\_sql\_server) | n/a | <pre>list(object({<br/>    id                           = number<br/>    administrator_login          = string<br/>    administrator_login_password = string<br/>    name                         = string<br/>    resource_group_id            = optional(number)<br/>    version                      = string<br/>  }))</pre> | `[]` | no |
| <a name="input_sql_server_name"></a> [sql\_server\_name](#input\_sql\_server\_name) | n/a | `string` | `null` | no |
| <a name="input_storage_account"></a> [storage\_account](#input\_storage\_account) | n/a | `any` | `[]` | no |
| <a name="input_storage_account_name"></a> [storage\_account\_name](#input\_storage\_account\_name) | n/a | `string` | `null` | no |
| <a name="input_storage_container"></a> [storage\_container](#input\_storage\_container) | n/a | `any` | `[]` | no |
| <a name="input_storage_container_name"></a> [storage\_container\_name](#input\_storage\_container\_name) | n/a | `string` | `null` | no |
| <a name="input_storage_table"></a> [storage\_table](#input\_storage\_table) | n/a | `any` | `[]` | no |
| <a name="input_storage_table_name"></a> [storage\_table\_name](#input\_storage\_table\_name) | n/a | `string` | `null` | no |
| <a name="input_stream_input_blob"></a> [stream\_input\_blob](#input\_stream\_input\_blob) | n/a | <pre>list(object({<br/>    id                      = number<br/>    date_format             = string<br/>    name                    = string<br/>    path_pattern            = string<br/>    time_format             = string<br/>    resource_group_id       = optional(number)<br/>    storage_account_id      = optional(number)<br/>    storage_container_id    = optional(number)<br/>    stream_analytics_job_id = optional(number)<br/>    serialization = list(object({<br/>      type            = string<br/>      encoding        = optional(string)<br/>      field_delimiter = optional(string)<br/>    }))<br/>  }))</pre> | `[]` | no |
| <a name="input_stream_input_eventhub"></a> [stream\_input\_eventhub](#input\_stream\_input\_eventhub) | n/a | <pre>list(object({<br/>    id                        = number<br/>    name                      = string<br/>    stream_analytics_job_id   = number<br/>    authentication_mode       = optional(string)<br/>    partition_key             = optional(string)<br/>    shared_access_policy_key  = optional(string)<br/>    shared_access_policy_name = optional(string)<br/>    serialization = list(object({<br/>      type            = string<br/>      encoding        = optional(string)<br/>      field_delimiter = optional(string)<br/>    }))<br/>  }))</pre> | `[]` | no |
| <a name="input_stream_input_iothub"></a> [stream\_input\_iothub](#input\_stream\_input\_iothub) | n/a | <pre>list(object({<br/>    id                           = number<br/>    iothub_id                    = number<br/>    name                         = string<br/>    stream_analytics_job_id      = number<br/>    endpoint                     = string<br/>    eventhub_consumer_group_name = string<br/>    shared_access_policy_name    = string<br/>    serialization = list(object({<br/>      type            = string<br/>      encoding        = optional(string)<br/>      field_delimiter = optional(string)<br/>    }))<br/>  }))</pre> | `[]` | no |
| <a name="input_synapse_workspace"></a> [synapse\_workspace](#input\_synapse\_workspace) | n/a | <pre>list(object({<br/>    id                               = number<br/>    name                             = string<br/>    storage_data_lake_gen2_filesystem_id = any<br/>    sql_administrator_login          = optional(string)<br/>    sql_administrator_login_password = optional(string)<br/>  }))</pre> | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(string)` | `{}` | no |

## Outputs

No outputs.
