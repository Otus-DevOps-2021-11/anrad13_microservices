output "external_ip_address" {
  value = yandex_compute_instance.worker[*].network_interface.0.nat_ip_address
}
