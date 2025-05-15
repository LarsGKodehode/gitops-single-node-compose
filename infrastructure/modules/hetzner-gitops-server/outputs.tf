output "server_info" {
  value = {
    ipv4_address = hcloud_server.server.ipv4_address
  }
}
