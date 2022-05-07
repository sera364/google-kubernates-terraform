resource "google_container_cluster" "GKE" {
  name     = "my-gke-cluster"
  location = "asia-southeast1"
  remove_default_node_pool = true
  initial_node_count       = 1
  network                  = google_compute_network.vpc_network.self_link
  subnetwork               = google_compute_subnetwork.subnet-restricted.self_link

  node_locations = [
    "asia-southeast1-b"
  ]
    master_authorized_networks_config {
        
        cidr_blocks{
            cidr_block = google_compute_subnetwork.subnet-managment.ip_cidr_range
            display_name = "Managment"
        }

    }
    ip_allocation_policy { //to prevent allocate public ip 
  }

  private_cluster_config {
    enable_private_nodes    = true //worker_node
    enable_private_endpoint = true //worker_node
    master_ipv4_cidr_block  = "192.168.1.0/28" //master_node
  }
}

resource "google_container_node_pool" "nodePool" {
  name       = "my-node-pool"
  location   = "asia-southeast1"
  cluster    = google_container_cluster.GKE.name
  node_count = 3

  node_config {
    preemptible  = true
    machine_type = "e2-small"

    service_account = google_service_account.node-acc.email
    oauth_scopes    = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}