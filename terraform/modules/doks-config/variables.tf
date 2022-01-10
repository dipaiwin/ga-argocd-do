variable "cluster_name" {
  type = string
  description = "k8s cluster name"
}

variable "cluster_id" {
  type = string
  description = "k8s cluster id"
}

variable "is_kubeconf" {
  type = bool
  default = false
  description = "Should generate kubeconfig?"
}

variable "registry_name" {
  type = string
  description = "Docker registry name"
}
