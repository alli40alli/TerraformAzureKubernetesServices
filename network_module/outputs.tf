##### outputs

output "output_cluster_subnet_id" {
  value = azurerm_subnet.cluster_subnet["cluster"].id
}

