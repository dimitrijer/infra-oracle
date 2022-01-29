module "vcn" {
  source         = "oracle-terraform-modules/vcn/oci"
  version        = "1.0.4"
  compartment_id = oci_identity_compartment.always_free.id
  region         = var.region
  vcn_name       = "Internal"
  vcn_dns_label  = "internal"

  internet_gateway_enabled = true
  nat_gateway_enabled      = true
  service_gateway_enabled  = true
  vcn_cidr                 = var.vcn_cidr
}
