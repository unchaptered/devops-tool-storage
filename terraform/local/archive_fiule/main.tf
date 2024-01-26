data "archive_file" "data" {
  type        = var.type        # "zip"
  source_dir  = var.source_dir  # "path/to/your/folder"
  output_path = var.output_path # "path/to/output/folder/my_folder.zip"
}
