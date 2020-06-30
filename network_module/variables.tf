#####variables 

variable "cluster_location" {
  type = string
}

variable "cluster_rg" {
  type = string
}

variable "resource_prefix" {
  type = string
}

variable "cluster_address_space" {
  type = string
}

variable "cluster_subnets" {
  type = map
}

variable "cluster_tags" {
  type = map
}


