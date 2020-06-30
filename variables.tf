#####variables 

variable "cluster_location" {
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

variable "cluster_service_cidr" {
  type = string
}

variable "cluster_dns_service_ip" {
  type = string
}

variable "cluster_docker_bridge_cidr" {
  type = string
}

variable "cluster_count" {
  type = number
}

variable "cluster_dns_prefix" {
  type = string
}

variable "cluster_tags" {
  type = map
}

variable "cluster_environment" {
  type = string
}

variable "cluster_username" { #
  type = string
}

variable "cluster_sp_displayname" { #
  type = string
}

