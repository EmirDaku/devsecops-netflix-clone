variable "resource_group_name" {
  type = string
  description = "name of resourcegroup"
}
variable "cluster_name" {
  description = "The name of the Kubernetes cluster."
  type        = string
}
variable "dns_prefix" {
  description = "The DNS prefix for the Kubernetes cluster."
  type        = string
}
variable "ssh_key_path" {
  description = "The file path to the SSH public key."
  type        = string
}
variable "node_count" {
  description = "The number of nodes in the default node pool."
  type        = number
}


### acr variables ##

#network variables ##3

variable "vnet_name" {
  type        = string
  description = "name of the vnet "
}
variable "vnet_address_space" {
  type        = string
  description = "adress of vnet"
}
variable "subnet_name" {
  type        = string
  description = "name of the subnet"
}
variable "subnet_prefix" {
  type        = string
  description = "prefix of subnet"
}