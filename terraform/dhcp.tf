resource "oci_core_dhcp_options" "this" {
  compartment_id = oci_identity_compartment.always_free.id
  vcn_id         = module.vcn.vcn_id

  options {
    type        = "DomainNameServer"
    server_type = "VcnLocalPlusInternet"
  }

  display_name = "Default"
}
