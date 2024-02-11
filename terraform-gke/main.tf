provider "google" {
    project = var.project
    credentials = file(var.credentials_file)
    region = var.region
    zone = var.zone
}

variable "credentials_file" {
  description = "Path to the JSON file used to describe your account credentials"
}

variable "project" {
  description = "Google Cloud project ID"
}

variable "zone" {
  description = "Google Cloud region"
}

variable "region" {
  description = "Google Cloud region"
}

variable "cluster_name" {
  description = "The name of the GKE Autopilot cluster"
}

variable "machine_type" {
    description = "Virtual machine istance type"
}

variable "image" {
  description = "Virtual machine image"
}

resource "google_container_cluster" "autopilot" {
  
  name       = var.cluster_name
  location   = var.region
  project    = var.project

  deletion_protection = false
  enable_autopilot = true
}

output "cluster_endpoint" {
  value       = google_container_cluster.autopilot.endpoint
  description = "The IP address of this cluster's master endpoint"
}