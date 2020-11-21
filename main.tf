terraform {
  required_providers {
    docker = {
      source = "terraform-providers/docker"
    }
  }
}

provider "docker" {
  host    = "npipe:////.//pipe//docker_engine"
}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx-server" {
  name = "nginx-server"
  image = "${docker_image.nginx.latest}"
  ports {
    internal = 80
    external = 8000
  }
  volumes {
    container_path  = "/usr/share/nginx/html"
    host_path = "/C/Users/kevin/OneDrive/Escritorio/compartida"
    read_only = true
  }
}

