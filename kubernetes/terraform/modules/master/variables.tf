variable public_key_path {
  description = "Path to the public key used for ssh access"
}
variable disk_image {
  description = "Disk image for kuber master node"
}
variable subnet_id {
  description = "Subnets for modules"
}

variable provisioner_connection_private_key_path {
  description = "Path to private key for provisioner connection"
}

variable instance_count {
  description = "Numbers  of docker hosts"
}

