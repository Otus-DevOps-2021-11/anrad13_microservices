provider "yandex" {
  service_account_key_file = var.service_account_key_file
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
}

module "docker" {
  source                                  = "../modules/docker"
  public_key_path                         = var.public_key_path
  docker_disk_image                       = var.docker_disk_image
  subnet_id                               = var.subnet_id
  provisioner_connection_private_key_path = var.provisioner_connection_private_key_path
  instance_count                          = var.instance_count
}
