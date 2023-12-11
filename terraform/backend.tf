terraform {
  backend "gcs" {
    bucket  = "dynamic-camp-407313"
    prefix  = "terraform/state"
    project = "dynamic-camp-407313"
  }
}
