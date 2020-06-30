cluster_location = "eastus"

resource_prefix = "cluster-aks"

cluster_address_space = "10.0.0.0/8"

cluster_dns_prefix = "manoetappa"

cluster_tags = { environment = "test", deployment = "terraform" }

#cluster_address_prefix = ["10.0.2.0/24", "10.0.1.0/24"]

cluster_subnets = {
  cluster = "10.240.0.0/16"
}

cluster_service_cidr = "10.2.0.0/24"

cluster_dns_service_ip = "10.2.0.10"

cluster_docker_bridge_cidr = "172.17.0.1/16"

###### for condition example
cluster_environment = "development"
######
cluster_username = "alli50alli"

cluster_sp_displayname = "spforaks"

cluster_count = 2
