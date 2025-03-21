locals {
  project = trimprefix(var.project_id, "projects/")
  name    = join("-", [var.name_prefix, var.name_suffix])
}

resource "google_storage_bucket" "bucket" {
  project = local.project

  name          = local.name
  location      = var.location
  force_destroy = var.force_destroy

  versioning {
    enabled = var.versioning_enabled
  }
}

resource "google_storage_bucket_iam_binding" "readers" {
  bucket  = google_storage_bucket.bucket.name
  role    = "roles/storage.objectViewer"
  members = var.readers
}

resource "google_storage_bucket_iam_binding" "writers" {
  bucket  = google_storage_bucket.bucket.name
  role    = "roles/storage.objectUser"
  members = var.writers
}
