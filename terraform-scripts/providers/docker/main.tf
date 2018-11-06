# Configure Docker provider and connect to the local Docker socket
provider "docker" {
  #host = "tcp://192.168.99.100:2376"
  host = "unix:///var/run/docker.sock"
  version = "~> 0.0"
}

# Create an Web Server container
resource "docker_container" "nginx" {
  image = "${docker_image.nginx.latest}"
  name  = "${var.instance_name}"
  ports {
    internal = 8011
    external = 8011
  }

  depends_on = ["docker_image.nginx"]
}

resource "docker_image" "nginx" {
  name = "nginx:latest"
}
