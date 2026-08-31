variable "resource_group_name" {
  type        = string
  description = "name of resourcegroup"
}
variable "cluster_name" {
  type        = string
  description = "name of cluster"
}
variable "node_count" {
  type        = number
  description = "number of nodes"
}

variable "vnet_address_space" {
  type        = string
  description = "address space for the vnet"
}
variable "subnet_address_prefix" {
  type        = string
  description = "address prefix for the subnet"
}
variable "acr_name" {
  type        = string
  description = "Name of the Azure Container Registry"
}
variable "Application_Client_ID" {
  type      = string
  sensitive = true
}

variable "client_secret" {
  type      = string
  sensitive = true
}