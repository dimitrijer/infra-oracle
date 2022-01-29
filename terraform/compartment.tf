resource "oci_identity_compartment" "always_free" {
  compartment_id = var.compartment_ocid
  description    = "Compartment for Terraform resources."
  name           = "AlwaysFree"
}
