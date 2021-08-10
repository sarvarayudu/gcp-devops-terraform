# This is the provider used to spin up the gcloud instance
provider "google" {
  credentials = file("terraform.json")
  project = "nasa7733-lab"
  region  = "us-east1"
  
}

resource "google_compute_instance" "vm-instance" {
  name         = "local-exec"
  machine_type = "f1-micro"
  zone         = "us-east1-b"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
  
  provisioner "local-exec" {
    command = "gcloud compute instances create hello --zone us-central1-a"
  }

   
  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }
}


