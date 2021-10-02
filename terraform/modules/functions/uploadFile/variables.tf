variable "project" {}
variable "function_name" {
  default = "upload_file"
}
variable "function_entry_point" {
  default = "main"
}
variable "functions_bucket_name" {}
variable "functions_zipfile_name" {}
variable "function_entrypoint_filename" {
  default = "main"
}
