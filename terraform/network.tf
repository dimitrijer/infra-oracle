resource "oci_core_virtual_network" "vcn" {
  cidr_blocks     = [var.vcn_cidr]
  compartment_id = oci_identity_compartment.always_free.id
  display_name   = "Internal"
  dns_label      = "internal"
}

resource "oci_core_nat_gateway" "nat_gateway" {
  compartment_id = oci_identity_compartment.always_free.id
  vcn_id         = oci_core_virtual_network.vcn.id
  # No NAT gateways in Always Free tier any more...
  count          = 0
}

resource "oci_core_internet_gateway" "internet_gateway" {
  compartment_id = oci_identity_compartment.always_free.id
  vcn_id         = oci_core_virtual_network.vcn.id
}

resource "oci_core_route_table" "frontend_route_table" {
  compartment_id = oci_identity_compartment.always_free.id
  vcn_id = oci_core_virtual_network.vcn.id
  route_rules {
    destination = var.everywhere_cidr
    destination_type = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.internet_gateway.id
  }
}

data "oci_core_private_ips" "nat_vnic_ip_addresses" {
  vnic_id = oci_core_vnic_attachment.nat_gateway_vnic.vnic_id
}

resource "oci_core_route_table" "backend_route_table" {
  compartment_id = oci_identity_compartment.always_free.id
  vcn_id = oci_core_virtual_network.vcn.id
  route_rules {
    destination = var.everywhere_cidr
    destination_type = "CIDR_BLOCK"
    network_entity_id = data.oci_core_private_ips.nat_vnic_ip_addresses.private_ips[0].id
  }
}

resource "oci_core_subnet" "frontend" {
  compartment_id             = oci_identity_compartment.always_free.id
  vcn_id                     = oci_core_virtual_network.vcn.id
  cidr_block                 = var.frontend_cidr
  display_name               = "Frontend"
  dns_label                  = "frontend"
  security_list_ids          = [oci_core_security_list.public.id]
  route_table_id             = oci_core_route_table.frontend_route_table.id
  dhcp_options_id            = oci_core_virtual_network.vcn.default_dhcp_options_id
  prohibit_public_ip_on_vnic = false
}

resource "oci_core_subnet" "backend" {
  compartment_id             = oci_identity_compartment.always_free.id
  vcn_id                     = oci_core_virtual_network.vcn.id
  cidr_block                 = var.backend_cidr
  display_name               = "Backend"
  dns_label                  = "backend"
  security_list_ids          = [oci_core_security_list.isolated.id]
  route_table_id             = oci_core_route_table.backend_route_table.id
  dhcp_options_id            = oci_core_virtual_network.vcn.default_dhcp_options_id
  prohibit_public_ip_on_vnic = true
}
