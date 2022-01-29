output "availability_domains" {
  description = "Availability domains in tenancy"
  value       = data.oci_identity_availability_domains.ads.availability_domains
}

output "always_free_compartment_name" {
  description = "Compartment name"
  value       = oci_identity_compartment.always_free.name
}

output "always_free_compartment_ocid" {
  description = "Compartment OCID"
  value       = oci_identity_compartment.always_free.id
}

output "internal_vcn_ocid" {
  description = "Internal VCN OCID"
  value       = module.vcn.vcn_id
}

output "internal_internet_gateway_route_table_ocid" {
  description = "OCID of the internet-route table. This route table has an internet gateway to be used for public subnets"
  value       = module.vcn.ig_route_id
}

output "internal_nat_gateway_ocid" {
  description = "NAT gateway OCID"
  value       = module.vcn.nat_gateway_id
}

output "internal_internet_gateway_ocid" {
  description = "Internet gateway OCID"
  value       = module.vcn.internet_gateway_id
}

output "internal_nat_gateway_route_table_ocid" {
  description = "OCID of the nat-route table - This route table has a nat gateway to be used for private subnets. This route table also has a service gateway."
  value       = module.vcn.nat_route_id
}

output "isolated_security_list_name" {
  value = oci_core_security_list.isolated.display_name
}

output "isolated_security_list_ocid" {
  value = oci_core_security_list.isolated.id
}

output "public_security_list_name" {
  value = oci_core_security_list.public.display_name
}

output "public_security_list_ocid" {
  value = oci_core_security_list.public.id
}

output "backend_subnet_name" {
  value = oci_core_subnet.backend.display_name
}

output "backend_subnet_ocid" {
  value = oci_core_subnet.backend.id
}

output "frontend_subnet_name" {
  value = oci_core_subnet.frontend.display_name
}

output "frontend_subnet_id" {
  value = oci_core_subnet.frontend.id
}

output "dhcp_options_name" {
  value = oci_core_dhcp_options.this.display_name
}

output "dhcp_options_ocid" {
  value = oci_core_dhcp_options.this.id
}

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
