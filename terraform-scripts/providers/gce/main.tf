variable "machine_type" {
  default = "n1-standard-1"
}

variable "image" {
  default = "centos-7-v20171213"
}

provider "google" {
  credentials = "${file("account.json")}"
  project     = "bright-cccccccc-1111111"
  region      = "asia-northeast1"
}

resource "google_compute_instance" "default" {
  name         = "test"
  machine_type = "${var.machine_type}"
  zone         = "asia-northeast1-a"
  tags         = ["sample"]

  boot_disk {
    initialize_params {
      image = "${var.image}"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }
}
