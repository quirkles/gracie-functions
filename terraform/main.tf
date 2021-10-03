terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.5.0"
    }
  }
}

provider "google" {
  credentials = file("../credentials/gcp-terraform.json")
  project     = var.project
  region      = var.region
}

module "create_functions_bucket" {
  source = "./modules/buckets/function_code"
}

module "create_images_bucket" {
  source = "./modules/buckets/images"
}

module "deploy_functions" {
  source               = "./modules/functions"
  function_bucket_name = module.create_functions_bucket.bucket_name
  project              = var.project
}

module "schedule_file_delete" {
  source                 = "./modules/functions/deleteOldImages"
  project                = var.project
  functions_bucket_name  = module.create_functions_bucket.bucket_name
  functions_zipfile_name = module.deploy_functions.functions_zipfile_name
  function_entry_point   = "deleteOldImages"
}

module "new_image_handler" {
  source                 = "./modules/functions/newImageHandler"
  project                = var.project
  image_bucket_name      = module.create_images_bucket.bucket_name
  functions_bucket_name  = module.create_functions_bucket.bucket_name
  functions_zipfile_name = module.deploy_functions.functions_zipfile_name
  function_entry_point   = "newImageHandler"
}

module "upload_file" {
  source                 = "./modules/functions/uploadFile"
  project                = var.project
  functions_bucket_name  = module. create_functions_bucket.bucket_name
  function_entry_point   = "uploadFile"
  functions_zipfile_name = module.deploy_functions.functions_zipfile_name
}
