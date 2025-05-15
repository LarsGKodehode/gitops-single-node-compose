# The Server component
module "gitops_server" {
  source = "../../modules/hetzner-gitops-server"
  name   = "gitops-single-node-containers"

  # Server description
  location      = "hel1"
  instance_type = "cax11"

  # GitOps reference
  git_repo      = "https://github.com/LarsGKodehode/gitops-single-node-compose"
  git_branch    = "main"
  manifest_path = "manifests/compose.production.yaml"
  sync_interval = "*/1 * * * *"

  # Debugging key (with Root access)
  ssh_key_id = hcloud_ssh_key.gitops_server_key.id
}

# Upload a SSH access key
resource "hcloud_ssh_key" "gitops_server_key" {
  name       = "gitops-server-key"
  public_key = var.ssh_public_key
}
