output "id" {
  value = data.tls_certificate.datasource.id
}

output "url" {
  value = data.tls_certificate.datasource.url
}

output "content" {
  value = data.tls_certificate.datasource.content
}

output "certificates" {
  value = data.tls_certificate.datasource.certificates
}

output "verify_chain" {
  value = data.tls_certificate.datasource.verify_chain
}
