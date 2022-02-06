variable cloud_id {
  description = "Cloud"
}
variable folder_id {
  description = "Folder"
}
variable zone {
  description = "Zone"
  default = "ru-central1-a"
}
variable public_key_path {
  description = "Path to the public key used for ssh access"
}
variable docker_disk_image {
  description = "Disk image for docker host"
  #default     = "fd8cbqs18n0hhkgjmtqc"
}
variable subnet_id {
  description = "Subnet"
}
variable service_account_key_file {
  description = "key .json"
}

variable provisioner_connection_private_key_path {
  description = "Path to private key for provisioner connection"
}

variable "instance_count" {
  description = "Numbers of docker hosts"
}