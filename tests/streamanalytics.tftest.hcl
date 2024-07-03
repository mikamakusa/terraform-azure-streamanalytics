run "setup_tests" {
  module {
    source = "./tests/setup"
  }
}

run "Stream-Analytics-Cluster-cosmosdb-output" {
  command = [init,plan,apply]

  variables {
    resource_group = [
      {
        id = 0
        name     = "example-resources"
        location = "West Europe"
      }
    ]
    cluster = [
      {
        id = 0
        name                = "examplestreamanalyticscluster"
        resource_group_id   = 0
        streaming_capacity  = 36
      }
    ]
    storage_account = [
      {
        id = 0
        name                     = "examplestorageacc"
        resource_group_id        = 0
        account_tier             = "Standard"
        account_replication_type = "LRS"
        account_kind             = "StorageV2"
      }
    ]
    managed_private_endpoint = [
      {
        id = 0
        name                          = "exampleprivateendpoint"
        resource_group_id             = 0
        stream_analytics_cluster_id   = 0
        target_resource_id            = 0
        subresource_name              = "blob"
      }
    ]
    job = [
      {
        id = 0
        name                                     = "example-job"
        resource_group_id                        = 0
        compatibility_level                      = "1.2"
        data_locale                              = "en-GB"
        events_late_arrival_max_delay_in_seconds = 60
        events_out_of_order_max_delay_in_seconds = 50
        events_out_of_order_policy               = "Adjust"
        output_error_policy                      = "Drop"
        streaming_units                          = 3
      }
    ]
    cosmosdb_account = [
      {
        id = 0
        name                = "exampledb"
        resource_group_id   = 0
        offer_type          = "Standard"
        kind                = "GlobalDocumentDB"
        consistency_policy = [
          {
            consistency_level       = "BoundedStaleness"
            max_interval_in_seconds = 10
            max_staleness_prefix    = 200
          }
        ]
        geo_location = [
          {
            resource_group_id = 0
            failover_priority = 0
          }
        ]
      }
    ]
    cosmosdb_sql_database = [
      {
        id = 0
        name                = "cosmos-sql-db"
        resource_group_id = 0
        throughput          = 400
      }
    ]
    cosmosdb_sql_container = [
      {
        id = 0
        name                = "examplecontainer"
        resource_group_id   = 0
        account_id          = 0
        database_id         = 0
        partition_key_path  = "foo"
      }
    ]
    output_cosmosdb = [
      {
        id = 0
        name                      = "output-to-cosmosdb"
        stream_analytics_job_id   = 0
        cosmosdb_account_id       = 0
        cosmosdb_sql_database_id  = 0
        container_id              = 0
        document_id               = "exampledocumentid"
      }
    ]
  }
}