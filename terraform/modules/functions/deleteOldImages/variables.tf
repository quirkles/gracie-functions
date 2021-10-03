variable "project" {}
variable "function_name" {
  default = "delete_old_images"
}
variable "function_entry_point" {
  default = "main"
}
variable "functions_bucket_name" {}
variable "functions_zipfile_name" {}
