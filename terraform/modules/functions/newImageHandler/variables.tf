variable "image_bucket_name" {}
variable "project" {}
variable "function_name" {
  default = "new_image_handler"
}
variable "function_entry_point" {
  default = "main"
}
variable "functions_bucket_name" {}
variable "functions_zipfile_name" {}
