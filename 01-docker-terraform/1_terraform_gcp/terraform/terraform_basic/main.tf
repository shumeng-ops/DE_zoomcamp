terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.51.0"
    }
  }
}

provider "google" {
# Credentials only needs to be set if you do not have the GOOGLE_APPLICATION_CREDENTIALS set
  credentials = "./de-project-411822-448f5bd62d55.json"
  project = "de-project-411822"
  region  = "us-central1"
}



resource "google_storage_bucket" "tf_google_bucket" {
  name          = "de-project-411822-terrabucket"
  location      = "US"

  # Optional, but recommended settings:
  storage_class = "STANDARD"
  uniform_bucket_level_access = true

  versioning {
    enabled     = true
  }

  # lifecycle_rule {
  #   action {
  #     type = "Delete"
  #   }
  #   condition {
  #     age = 30  // days
  #   }
  # }

  force_destroy = true
}


resource "google_bigquery_dataset" "terraform_dataset" {
  dataset_id = "terraform_dataset"
  project    = "de-project-411822"
  location   = "US"
}