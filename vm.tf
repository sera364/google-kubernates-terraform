resource "google_compute_instance" "private-vm"{
  name         = "private-vm"
  machine_type = "f1-micro"
  zone         = "asia-southeast1-a"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.subnet-managment.id
  }
  
  service_account {
    email  = google_service_account.cluster_admin.email
    scopes = ["cloud-platform"]
  }

}
