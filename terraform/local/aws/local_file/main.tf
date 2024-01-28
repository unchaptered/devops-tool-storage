resource "local_file" "resource" {
  content  = var.content
  filename = var.filename
}
