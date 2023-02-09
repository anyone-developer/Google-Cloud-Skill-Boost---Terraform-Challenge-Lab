resource "google_storage_bucket" "auto-expire" {
  name          = "tf-bucket-198125"
  location      = "US"
  force_destroy = true
  uniform_bucket_level_access = true
}