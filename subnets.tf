resource "oci_core_subnet" "frontend" {
  compartment_id = oci_identity_compartment.always_free.id
  vcn_id         = module.vcn.vcn_id
  cidr_block     = var.frontend_cidr

  # Use route table from the internet gateway.
  route_table_id    = module.vcn.ig_route_id
  security_list_ids = [oci_core_security_list.public.id]
  display_name      = "Frontend"
}

resource "oci_core_subnet" "backend" {
  compartment_id = oci_identity_compartment.always_free.id
  vcn_id         = module.vcn.vcn_id
  cidr_block     = var.backend_cidr

  # Use route table from the NAT gateway.
  route_table_id             = module.vcn.nat_route_id
  security_list_ids          = [oci_core_security_list.isolated.id]
  display_name               = "Backend"
  prohibit_public_ip_on_vnic = true
}
