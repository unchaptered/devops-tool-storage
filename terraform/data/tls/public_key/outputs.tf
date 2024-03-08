output "id" {
  value = data.tls_public_key.datasource.id
}
output "algorithm" {
  value = data.tls_public_key.datasource.algorithm
}

output "private_key_pem" {
  value = data.tls_public_key.datasource.private_key_pem
}
output "private_key_openssh" {
  value = data.tls_public_key.datasource.private_key_openssh
}

output "public_key_fingerprint_md5" {
  value = data.tls_public_key.datasource.public_key_fingerprint_md5
}
output "public_key_fingerprint_sha256" {
  value = data.tls_public_key.datasource.public_key_fingerprint_sha256
}

output "public_key_openssh" {
  value = data.tls_public_key.datasource.public_key_openssh
}
output "public_key_pem" {
  value = data.tls_public_key.datasource.public_key_pem
}