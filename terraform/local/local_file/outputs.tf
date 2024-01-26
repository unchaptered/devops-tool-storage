output "content" {
  sensitive = true
  value     = local_file.resource.content
}
