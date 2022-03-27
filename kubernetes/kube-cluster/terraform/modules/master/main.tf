resource "yandex_compute_instance" "master" {
  name = "master-host"
  hostname = "master"
  count = 1

  labels = {
    tags = "master-host"
  }

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = var.disk_image
      size = 15
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


