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

module "deploy_functions" {
  source  = "./modules/functions"
  project = var.project
}

module "uploadFile" {
  source                = "./modules/functions/uploadFile"
  project               = var.project
  functions_bucket_name = module.deploy_functions.functions_bucket_name
  function_entry_point = "uploadFile"
  functions_zipfile_name = module.deploy_functions.functions_zipfile_name
}
