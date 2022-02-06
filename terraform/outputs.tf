output "tengu_instance_public_ip" {
  value = oci_core_instance.tengu.public_ip
}

output "tengu_instance_private_ip" {
  value = oci_core_instance.tengu.private_ip
}
output "tengu_instance_state" {
  value = oci_core_instance.tengu.state
}

output "tengu_instance_time_created" {
  value = oci_core_instance.tengu.time_created
}

output "kitsune_instance_public_ip" {
  value = oci_core_instance.kitsune.public_ip
}

output "kitsune_instance_private_ip" {
  value = oci_core_instance.kitsune.private_ip
}

output "kitsune_instance_state" {
  value = oci_core_instance.kitsune.state
}

output "kitsune_instance_time_created" {
  value = oci_core_instance.kitsune.time_created
}

output "amaterasu_instance_public_ip" {
  value = oci_core_instance.amaterasu.public_ip
}

output "amaterasu_instance_private_ip" {
  value = oci_core_instance.amaterasu.private_ip
}

output "amaterasu_instance_state" {
  value = oci_core_instance.amaterasu.state
}

output "amaterasu_instance_time_created" {
  value = oci_core_instance.amaterasu.time_created
}

output "kirin_instance_public_ip" {
  value = oci_core_instance.kirin.public_ip
}

output "kirin_instance_private_ip" {
  value = oci_core_instance.kirin.private_ip
}

output "kirin_instance_state" {
  value = oci_core_instance.kirin.state
}

output "kirin_instance_time_created" {
  value = oci_core_instance.kirin.time_created
}

resource "local_file" "ansible_inventory" {
  content = templatefile("inventory.tmpl", {
    tengu_public_ip = oci_core_instance.tengu.public_ip
    nat_ip = var.nat_gateway_ip
  })
  filename = "../ansible/inventories/hosts.ini"
}
