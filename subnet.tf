resource "google_compute_subnetwork" "subnet-managment" {
  name          = "subnet-managment"
  ip_cidr_range = "10.0.0.0/24"
  region        = "asia-southeast1"
  network       = google_compute_network.vpc_network.id
  
}

resource "google_compute_subnetwork" "subnet-restricted" {
  name          = "subnet-restricted"
  ip_cidr_range = "10.0.1.0/24"
  region        = "asia-southeast1"
  network       = google_compute_network.vpc_network.id
  
}

