provider "google" {
  project = "kubernetes-429102"
  region  = "us-central1"
  credentials = file("./key.json")
}

resource "google_container_cluster" "kube-cluster" {
  name               = "kubernetes"
  location           = "us-central1-a"
  initial_node_count = 1

  node_config {
    machine_type = "e2-small"
    disk_size_gb = 10
    disk_type = "pd-standard"
    image_type = "COS_CONTAINERD"
  }
}


resource "google_compute_disk" "disk" {
  name  = "persistentdisk"
  type  = "pd-standard"
  zone  = "us-central1-a" 
  size  = 10
}
