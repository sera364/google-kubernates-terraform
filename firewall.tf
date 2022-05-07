resource "google_compute_firewall" "ssh-rule" {
  name    = "ssh-rule"
  network = google_compute_network.vpc_network.id

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = ["35.235.240.0/20"] 
}
