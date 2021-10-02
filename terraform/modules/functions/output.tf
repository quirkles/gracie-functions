output "functions_bucket_name" {
  value = google_storage_bucket.bucket.name
}

output "functions_zipfile_name" {
  value = google_storage_bucket_object.zip.name
}
