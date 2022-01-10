terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

resource "local_file" "kubeconfig" {
  content    = data.digitalocean_kubernetes_cluster.cluster.kube_config[0].raw_config
  filename   = "./kubeconfig"
  count = var.is_kubeconf == true ? 1 :0
}

resource "digitalocean_container_registry_docker_credentials" "registry" {
  registry_name = var.registry_name
}

provider "kubernetes" {
  host             = data.digitalocean_kubernetes_cluster.cluster.endpoint
  token            = data.digitalocean_kubernetes_cluster.cluster.kube_config[0].token
  cluster_ca_certificate = base64decode(
  data.digitalocean_kubernetes_cluster.cluster.kube_config[0].cluster_ca_certificate
  )
}

resource "kubernetes_secret" "docker-secret" {
  metadata {
    name = "docker-cfg"
  }
  data = {
    ".dockerconfigjson" = digitalocean_container_registry_docker_credentials.registry.docker_credentials
  }
  type = "kubernetes.io/dockerconfigjson"
}
