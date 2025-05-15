variable "name" {
  description = "Name of application"
  type        = string
}

variable "location" {
  description = "The servers location"
  type        = string
  nullable    = false
}

variable "instance_type" {
  description = "The type of machine to use"
  type        = string
  nullable    = false
}

variable "git_repo" {
  description = "URL to the Git repository"
  type        = string
  nullable    = false
}

variable "git_branch" {
  description = "Branch to sync with"
  type        = string
  nullable    = false
}

variable "manifest_path" {
  description = "Repo relative path to find the compose file at"
  type        = string
  nullable    = false
}

variable "sync_interval" {
  description = <<EOT
Cron-style expression that defines how frequently the deployment will be refreshed.

Format: [minute] [hour] [day_of_month] [month] [day_of_week]
Example: "*/30 * * * *" — every 30 minutes.

Field meanings:
- minute (0-59)
- hour (0-23)
- day_of_month (1-31)
- month (1-12 or JAN-DEC)
- day_of_week (0-6 or SUN-SAT, where Sunday=0)

Notes:
- This uses standard 5-field cron syntax (no seconds field).
- Timezone is determined by the runtime environment.
- Common shorthand expressions (e.g., @hourly, @daily) are not supported; use full cron expressions.

EOT
  type        = string
  nullable    = false
}

variable "ssh_key_id" {
  description = "ID of SSH key uploaded to Hetzner"
  type        = string
  nullable    = true
}
