terraform {
  backend "gcs" {
    bucket  = "final-task"
  }
}
provider "google" {
  project     = "helical-gist-348512"
  region      = "asia-southeast1 "
}