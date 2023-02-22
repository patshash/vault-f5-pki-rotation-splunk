


resource "vault_generic_endpoint" "pki" {
  path = "${var.pki_intermediate_path}/issue/${var.pki_role}"
  disable_read = true
  data_json = <<EOT
  {
    "common_name": "${var.common_name}"
  }
  EOT

} 

output "secret_json" {
    value = resource.vault_generic_endpoint.pki.data_json
    sensitive = true
  
}