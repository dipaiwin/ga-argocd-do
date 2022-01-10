variable "cluster_version" {
  default = "1.21"
}

variable "worker_count" {
  default = 2
  description = "count of k8s worker nodes"
}

variable "worker_size" {
  default = "s-1vcpu-2gb"
  description = "size of worker node"
}

variable "cluster_name" {
  default = "prod-cluster"
}

variable "registry_name" {
  default = "dp-registry"
  description = "name of docker registry"
}
