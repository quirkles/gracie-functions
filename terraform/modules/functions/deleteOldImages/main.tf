resource "google_pubsub_topic" "topic" {
  name = "delete-images-topic"
}

resource "google_cloud_scheduler_job" "job" {
  name        = "delete-images-job"
  description = "delete-images job"
  schedule    = "* */2 * * *"

  pubsub_target {
    # topic.id is the topic's full resource name.
    topic_name = google_pubsub_topic.topic.id
    data       = base64encode("test")
  }
}
# Create Cloud Function
resource "google_cloudfunctions_function" "function" {
  name    = var.function_name
  runtime = "nodejs14" # Switch to a different runtime if needed

  available_memory_mb   = 128
  source_archive_bucket = var.functions_bucket_name
  source_archive_object = var.functions_zipfile_name
  entry_point           = var.function_entry_point
  event_trigger {
    event_type = "google.pubsub.topic.publish"
    resource   = google_pubsub_topic.topic.name
  }
}

# Create IAM entry so all users can invoke the function
resource "google_cloudfunctions_function_iam_member" "invoker" {
  project        = google_cloudfunctions_function.function.project
  region         = google_cloudfunctions_function.function.region
  cloud_function = google_cloudfunctions_function.function.name

  role   = "roles/cloudfunctions.invoker"
  member = "allUsers"
}
