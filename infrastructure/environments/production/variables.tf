variable "hetzner_token" {
  sensitive   = true
  description = "Hetzner API token for Terraform access"
  type        = string
  nullable    = false
}

variable "ssh_public_key" {
  description = "The public part of the SSH key to use for server access"
  type        = string
  nullable    = false
}
