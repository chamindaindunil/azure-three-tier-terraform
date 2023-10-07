module "vnet" {
    source = "./modules/vnet"
    environment = var.environment
    location = var.location
    resource_group_name = "${var.environment}-rg"
    vnet_name = "${var.environment}-vnet"
    vnet_address_space = var.vnet_address_space
    subnet_list = var.subnet_list
    nsg_list = var.nsg_list
    nsg_rule_list = var.nsg_rule_list
    tags = {
        environment = var.environment
        terraform = "true"
    }
}

module "aks" {
    source = "./modules/aks"
    environment = var.environment
    location = var.location
    resource_group_name = module.vnet.resource_group_name
    aks_name = "${var.environment}-aks"
    kubernetes_version = var.kubernetes_version
    node_count = var.node_count
    node_size = var.node_size
    vnet_subnet_id = module.vnet.subnet_ids.app_subnet_id
    service_principal_id = var.service_principal_id
    service_principal_secret = var.service_principal_secret
    tags = {
        environment = var.environment
        terraform = "true"
    }
}

module "mysql" {
    source = "./modules/mysql"
    environment = var.environment
    location = var.location
    resource_group_name = module.vnet.resource_group_name
    mysql_name = "${var.environment}-mysql"
    mysql_sku_name = var.mysql_sku_name
    mysql_version = var.mysql_version
    mysql_storage_mb = var.mysql_storage_mb
    mysql_backup_retention_days = var.mysql_backup_retention_days
    mysql_admin_username = var.mysql_admin_username
    mysql_admin_password = var.mysql_admin_password
    vnet_subnet_id = module.vnet.subnet_ids.data_subnet_id
    tags = {
        environment = var.environment
        terraform = "true"
    }
}

module "redis" {
    source = "./modules/redis"
    environment = var.environment
    location = var.location
    resource_group_name = module.vnet.resource_group_name
    redis_name = "${var.environment}-redis"
    redis_sku_name = var.redis_sku_name
    redis_version = var.redis_version
    redis_capacity = var.redis_capacity
    vnet_subnet_id = module.vnet.subnet_ids.data_subnet_id
}

module "storage-account" {
    source = "./modules/storage-account"
    environment = var.environment
    location = var.location
    resource_group_name = module.vnet.resource_group_name
    storage_account_name = "${var.environment}storage"
    storage_account_tier = var.storage_account_tier
    storage_account_replication_type = var.storage_account_replication_type
    storage_account_kind = var.storage_account_kind
    storage_account_access_tier = var.storage_account_access_tier
    storage_account_enable_https_traffic_only = var.storage_account_enable_https_traffic_only
    storage_account_enable_hierarchical_namespace = var.storage_account_enable_hierarchical_namespace
    storage_account_minimum_tls_version = var.storage_account_minimum_tls_version
    storage_account_allow_blob_public_access = var.storage_account_allow_blob_public_access
    storage_account_allow_container_public_access = var.storage_account_allow_container_public_access
    storage_account_allow_table_public_access = var.storage_account_allow_table_public_access
    storage_account_allow_queue_public_access = var.storage_account_allow_queue_public_access
    storage_account_allow_file_public_access = var.storage_account_allow_file_public_access
    storage_account_enable_large_file_share = var.storage_account_enable_large_file_share
    storage_account_enable_file_aad_auth = var.storage_account_enable_file_aad_auth
    storage_account_enable_file_aad_only = var.storage_account_enable_file_aad_only
    storage_account_enable_file_active_directory_domain_service = var.storage_account_enable_file_active_directory_domain_service
    storage_account_enable_file_active_directory_domain_service = var.storage_account_enable_file_active_directory_domain_service
    storage_account_enable_file_active_directory_domain_service = var.storage_account_enable_file_active_directory_domain_service
    storage_account_enable_file_active_directory_domain_service = var.storage_account_enable_file_active_directory_domain_service
    storage_account_enable_file_active_directory_domain_service = var.storage_account_enable_file_active_directory_domain_service
    storage_account_enable_file_active_directory_domain_service = var.storage_account_enable_file_active_directory_domain_service
    storage_account_enable_file_active_directory_domain_service = var.storage_account_enable_file_active_directory_domain_service
    storage_account_enable_file_active_directory_domain_service = var.storage_account_enable_file_active_directory_domain_service
    storage_account_enable_file_active_directory_domain_service = var.storage_account_enable_file_active_directory_domain_service
    storage_account_enable_file_active_directory_domain_service = var.storage_account_enable_file_active_directory_domain_service
    tags = {
        environment = var.environment
        terraform = "true"
    }
}

module "key-vault" {
    source = "./modules/key-vault"
    environment = var.environment
    location = var.location
    resource_group_name = module.vnet.resource_group_name
    key_vault_name = "${var.environment}-key-vault"
    sku_name = var.sku_name
    sku_tier = var.sku_tier
    sku_family = var.sku_family
    enable_soft_delete = var.enable_soft_delete
    enable_purge_protection = var.enable_purge_protection
    enable_rbac_authorization = var.enable_rbac_authorization
    enable_virtual_network = var.enable_virtual_network
    enable_private_endpoint = var.enable_private_endpoint
    enable_private_dns_zone = var.enable_private_dns_zone
    enable_private_service_endpoint = var.enable_private_service_endpoint
    enable_private_service_connection = var.enable_private_service_connection
    enable_private_endpoint_network_policies = var.enable_private_endpoint_network_policies
    enable_private_endpoint_subnet_id = var.enable_private_endpoint_subnet_id
    enable_private_endpoint_ip_address_id = var.enable_private_endpoint_ip_address_id
    enable_private_endpoint_custom_dns_configs = var.enable_private_endpoint_custom_dns_configs
    enable_private_endpoint_custom_dns_configs_name = var.enable_private_endpoint_custom_dns_configs_name
    enable_private_endpoint_custom_dns_configs_ip_address = var.enable_private_endpoint_custom_dns_configs_ip_address
    enable_private_endpoint_custom_dns_configs_fqdn = var.enable_private_endpoint_custom_dns_configs_fqdn
    enable_private_endpoint_custom_dns_configs_ip_address_id = var.enable_private_endpoint_custom_dns_configs_ip_address_id
    enable_private_endpoint_custom_dns_configs_fqdn_id = var.enable_private_endpoint_custom_dns_configs_fqdn_id
    enable_private_endpoint_custom_dns_configs_ip_address_id = var.enable_private_endpoint_custom_dns_configs_ip_address_id
    enable_private_endpoint_custom_dns_configs_fqdn_id = var.enable_private_endpoint_custom_dns_configs_fqdn_id
    enable_private_endpoint_custom_dns_configs_ip_address_id = var.enable_private_endpoint_custom_dns_configs_ip_address_id
    enable_private_endpoint_custom_dns_configs_fqdn_id = var.enable_private_endpoint_custom_dns_configs_fqdn_id
    enable_private_endpoint_custom_dns_configs_ip_address_id = var.enable_private_endpoint_custom_dns_configs_ip_address_id
    enable_private_endpoint_custom_dns_configs_fqdn_id = var.enable_private_endpoint_custom_dns_configs_fqdn_id
    enable_private_endpoint_custom_dns_configs_ip_address_id = var.enable_private_endpoint_custom_dns_configs_ip_address_id
    tags = {
        environment = var.environment
        terraform = "true"
    }
}

module "api-manager" {
    source = "./modules/api-manager"
    environment = var.environment
    location = var.location
    resource_group_name = module.vnet.resource_group_name
    api_manager_name = "${var.environment}-apim"
    publisher_name = var.publisher_name
    publisher_email = var.publisher_email
    sku_name = var.sku_name
    sku_capacity = var.sku_capacity
    virtual_network_type = var.virtual_network_type
    virtual_network_resource_group_name = module.vnet.resource_group_name
    virtual_network_name = module.vnet.vnet_name
    subnet_name = module.vnet.subnet_ids.app_subnet_name
    subnet_prefix = module.vnet.subnet_ids.app_subnet_prefix
    subnet_prefix_length = module.vnet.subnet_ids.app_subnet_prefix_length
    enable_managed_identity = var.enable_managed_identity
    enable_virtual_network = var.enable_virtual_network
    enable_public_network = var.enable_public_network
    enable_private_network = var.enable_private_network
    enable_app_insights = var.enable_app_insights
    enable_redis_cache = var.enable_redis_cache
    enable_storage_account = var.enable_storage_account
    enable_key_vault = var.enable_key_vault
    enable_event_hub = var.enable_event_hub
    enable_service_bus = var.enable_service_bus
    enable_cosmos_db = var.enable_cosmos_db
    enable_sql_db = var.enable_sql_db
    enable_logic_app = var.enable_logic_app
    enable_api_management = var.enable_api_management
    enable_function_app = var.enable_function_app
    enable_app_service_plan = var.enable_app_service_plan
    enable_app_service = var.enable_app_service
    enable_container_registry = var.enable_container_registry
    enable_container_instance = var.enable_container_instance
    enable_kubernetes_service = var.enable_kubernetes_service
    enable_service_fabric = var.enable_service_fabric
    enable_application_insights = var.enable_application_insights
    enable_virtual_machine = var.enable_virtual_machine
    enable_virtual_machine_scale_set
}

module "event-hub" {
    source = "./modules/event-hub"
    environment = var.environment
    location = var.location
    resource_group_name = module.vnet.resource_group_name
    event_hub_name = "${var.environment}-event-hub"
    event_hub_sku_name = var.event_hub_sku_name
    event_hub_partition_count = var.event_hub_partition_count
    event_hub_message_retention_days = var.event_hub_message_retention_days
    event_hub_capture_enabled = var.event_hub_capture_enabled
    event_hub_capture_interval_in_seconds = var.event_hub_capture_interval_in_seconds
    event_hub_capture_size_limit_in_bytes = var.event_hub_capture_size_limit_in_bytes
    event_hub_enable_auto_inflate = var.event_hub_enable_auto_inflate
    event_hub_maximum_throughput_units = var.event_hub_maximum_throughput_units
    event_hub_enable_kafka = var.event_hub_enable_kafka
    event_hub_enable_zone_redundant = var.event_hub_enable_zone_redundant
    event_hub_enable_geo_redundant = var.event_hub_enable_geo_redundant
    event_hub_enable_dedicated_cluster = var.event_hub_enable_dedicated_cluster
    event_hub_dedicated_cluster_name = var.event_hub_dedicated_cluster_name
    event_hub_dedicated_cluster_capacity = var.event_hub_dedicated_cluster_capacity
    event_hub_dedicated_cluster_sku_name = var.event_hub_dedicated_cluster_sku_name
    event_hub_dedicated_cluster_sku_tier = var.event_hub_dedicated_cluster_sku_tier
    event_hub_dedicated_cluster_sku_capacity = var.event_hub_dedicated_cluster_sku_capacity
    event_hub_dedicated_cluster_auto_inflate_enabled = var.event_hub_dedicated_cluster_auto_inflate_enabled
    event_hub_dedicated_cluster_auto_inflate_mode = var.event_hub_dedicated_cluster_auto_inflate_mode
    event_hub_dedicated_cluster_auto_inflate_max_throughput_units = var.event_hub_dedicated_cluster_auto_inflate_max_throughput_units
    event_hub_dedicated_cluster_auto_inflate_max_workers = var.event_hub_dedicated_cluster_auto_inflate_max_workers
    event_hub_dedicated_cluster_auto_inflate_max_workers_per_cpu = var.event_hub_dedicated_cluster_auto_inflate_max_workers_per_cpu
    event_hub_dedicated_cluster_auto_inflate_enabled = var.event_hub_dedicated_cluster_auto_inflate_enabled
    event_hub_dedicated_cluster = var.event_hub_dedicated_cluster
}

module "front-door" {
    source = "./modules/front-door"
    environment = var.environment
    location = var.location
    resource_group_name = module.vnet.resource_group_name
    front_door_name = "${var.environment}-front-door"
    front_door_sku_name = var.front_door_sku_name
    front_door_session_affinity_enabled = var.front_door_session_affinity_enabled
    front_door_session_affinity_ttl_seconds = var.front_door_session_affinity_ttl_seconds
    front_door_enabled = var.front_door_enabled
    front_door_enabled_state = var.front_door_enabled_state
    front_door_frontend_endpoint_name = var.front_door_frontend_endpoint_name
    front_door_frontend_endpoint_host_name = var.front_door_frontend_endpoint_host_name
    front_door_frontend_endpoint_session_affinity_enabled = var.front_door_frontend_endpoint_session_affinity_enabled
    front_door_frontend_endpoint_session_affinity_ttl_seconds = var.front_door_frontend_endpoint_session_affinity_ttl_seconds
    front_door_frontend_endpoint_enabled = var.front_door_frontend_endpoint_enabled
    front_door_frontend_endpoint_enabled_state = var.front_door_frontend_endpoint_enabled_state
    front_door_frontend_endpoint_session_affinity_enabled = var.front_door_frontend_endpoint_session_affinity_enabled
    front_door_frontend_endpoint_session_affinity_ttl_seconds = var.front_door_frontend_endpoint_session_affinity_ttl_seconds
    front_door_frontend_endpoint_enabled = var.front_door_frontend_endpoint_enabled
    front_door_frontend_endpoint_enabled_state = var.front_door_frontend_endpoint_enabled_state
    front_door_frontend_endpoint_session_affinity_enabled = var.front_door_frontend_endpoint_session_affinity_enabled
    front_door_frontend_endpoint_session_affinity_ttl_seconds = var.front_door_frontend_endpoint_session_affinity_ttl_seconds
    front_door_frontend_endpoint_enabled = var.front_door_frontend_endpoint_enabled
    front_door_frontend_endpoint_enabled_state = var.front_door_frontend_endpoint_enabled_state
    front_door_frontend_endpoint_session_affinity_enabled = var.front_door_frontend_endpoint_session_affinity_enabled
    front_door_frontend_endpoint_session_affinity_ttl_seconds = var.front_door_frontend_endpoint_session_affinity_ttl_seconds
    front_door_frontend_endpoint_enabled = var.front_door_frontend_endpoint_enabled
    front_door_frontend_endpoint_enabled_state = var.front_door_frontend_endpoint_enabled_state
    front_door_frontend_endpoint_session_affinity_enabled = var.front_door_frontend_endpoint_session_affinity_enabled
    front_door_frontend_endpoint_session_affinity_ttl_seconds = var.front_door_frontend_endpoint_session_affinity_ttl_seconds
    front_door_frontend_endpoint_enabled = var.front_door_frontend_endpoint_enabled
    front_door_frontend_endpoint_enabled_state = var.front_door_frontend_endpoint

    depends_on = [
        module.waf
    ]
}

module "waf" {
    source = "./modules/waf"
    environment = var.environment
    location = var.location
    resource_group_name = module.vnet.resource_group_name
    waf_name = "${var.environment}-waf"
    waf_sku_name = var.waf_sku_name
    waf_sku_capacity = var.waf_sku_capacity
    waf_sku_tier = var.waf_sku_tier
    waf_sku_family = var.waf_sku_family
    waf_sku_capacity = var.waf_sku_capacity
    waf_sku_tier = var.waf_sku_tier
    waf_sku_family = var.waf_sku_family
    waf_sku_capacity = var.waf_sku_capacity
    waf_sku_tier = var.waf_sku_tier
    waf_sku_family = var.waf_sku_family
    waf_sku_capacity = var.waf_sku_capacity
    waf_sku_tier = var.waf_sku_tier
    waf_sku_family = var.waf_sku_family
    waf_sku_capacity = var.waf_sku_capacity
    waf_sku_tier = var.waf_sku_tier
    waf_sku_family = var.waf_sku_family
    waf_sku_capacity = var.waf_sku_capacity
    waf_sku_tier = var.waf_sku_tier
    waf_sku_family = var.waf_sku_family
    waf_sku_capacity = var.waf_sku_capacity
    waf_sku_tier = var.waf_sku_tier
    waf_sku_family = var.waf_sku_family
}