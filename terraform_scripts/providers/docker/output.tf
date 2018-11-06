output "public_dns" {
  value = "${docker_container.nginx.ip_address}"
}
