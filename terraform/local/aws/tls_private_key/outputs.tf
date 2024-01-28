output "private_key_pem" {
  value     = tls_private_key.resource.private_key_pem
  sensitive = true
}

output "public_key_pem" {
  value     = tls_private_key.resource.public_key_pem
  sensitive = true
}

output "public_key_openssh" {
  value     = tls_private_key.resource.public_key_openssh
  sensitive = true
}

output "id" {
  value     = tls_private_key.resource.id
  sensitive = true
}
