terraform {
  backend "gcs" {
    bucket = "bucket-victorinausk"
    prefix = "terraform/state"
  }
}
