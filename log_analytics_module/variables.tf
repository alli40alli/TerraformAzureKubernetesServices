#####variables 

variable "cluster_rg" {
  type = string
}
variable "cluster_location" {
  type = string
}

variable "resource_prefix" {
  type = string
}

variable "cluster_tags" {
  type = map
}

