# Create bucket that will host the source code
resource "google_storage_bucket" "bucket" {
  name = var.bucket_name
  cors {
    max_age_seconds = 3600
    method          = [
      "PUT"
    ]
    origin          = [
      "*",
    ]
    response_header = [
      "*",
    ]
  }
}
