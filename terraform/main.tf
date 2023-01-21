locals {
  machine_type = "f1-micro"
  disk_image = "ubuntu-os-cloud/ubuntu-2204-lts"
  disk_size = "10"
  disk_type = "pd-standard"
}

provider "google" {
  project = var.project_id
  region = var.region
  zone = var.zone
  credentials = file("service-account.json")
}

# Create a single Compute Engine instance
resource "google_compute_instance" "default" {
  name         = var.instance_name
  machine_type = local.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image =  local.disk_image
      size  = local.disk_size
      type  = local.disk_type
    }
  }

  metadata = var.instance_metadata

  tags = ["${var.instance_name}-web"]

  network_interface {
    network = "default"

    access_config {
      // for Ephemeral public IP remove nat_ip
      nat_ip = google_compute_address.static.address
    }
  }

  # metadata_startup_script = <<EOT
  #   sudo apt update -y;
  #   sudo apt upgrade -y;
  # EOT
}

resource "google_compute_firewall" "default" {
  name          = "${var.instance_name}-web"
  network       = "default"
  description   = "allow access vpn server"

  priority      = 1000
  direction     = "INGRESS"

  allow {
    protocol    = "tcp"
    ports       = ["943", "443"]
  }

  allow {
    protocol    = "udp"
    ports       = ["1194"]
  }

  source_ranges = [
    "0.0.0.0/0"
  ]

  target_tags   = ["${var.instance_name}-web"]
}

resource "google_compute_address" "static" {
  name = "${var.instance_name}-ipv4"
  region = var.region
}
