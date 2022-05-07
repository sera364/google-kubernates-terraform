resource "google_compute_network" "vpc_network" {
  project                 = "helical-gist-348512"
  name                    = "vpc-network"
  auto_create_subnetworks = false
  mtu                     = 1460
}