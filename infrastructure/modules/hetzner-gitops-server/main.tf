terraform {
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "~> 1.45"
    }
  }
}

locals {
  app_path = "/app"
}

locals {
  cloud_init = templatefile("${path.module}/cloud-init.tftpl", {
    app_path      = local.app_path
    git_repo      = var.git_repo
    git_branch    = var.git_branch
    manifest_path = var.manifest_path
    sync_interval = var.sync_interval
  })
}

resource "hcloud_server" "server" {
  name        = "${var.name}-server"
  image       = "debian-12"
  server_type = var.instance_type
  location    = var.location

  # Setup the initialization steps
  user_data = local.cloud_init

  # Specify networking configuration
  public_net {
    ipv4_enabled = true
    ipv6_enabled = false
  }

  ssh_keys = [var.ssh_key_id]
}
