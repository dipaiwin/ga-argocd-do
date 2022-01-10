module "doks-cluster" {
  source             = "./modules/doks-cluster"
  cluster_name       = var.cluster_name
  cluster_region     = "fra1"
  cluster_version    = var.cluster_version

  worker_size        = var.worker_size
  worker_count       = var.worker_count
}

resource "digitalocean_container_registry" "dp-registry" {
  name                   = var.registry_name
  subscription_tier_slug = "starter"
}

module "doks-config" {
  source = "./modules/doks-config"
  cluster_name = var.cluster_name
  cluster_id = module.doks-cluster.cluster_id
  registry_name = var.registry_name
}
