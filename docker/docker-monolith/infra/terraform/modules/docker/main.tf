resource "yandex_compute_instance" "docker" {
  name = "docker-host-${count.index + 1}"
  count = var.instance_count

  labels = {
    tags = "docker-host"
  }

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = var.docker_disk_image
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }

}

resource "local_file" "inventory" {
  content = templatefile("${path.module}/inventory.tpl",
    {
      docker = yandex_compute_instance.docker.*.network_interface.0.nat_ip_address
    }
  )
  filename = "${path.module}/../../../ansible/environments/stage/inventory"
}



