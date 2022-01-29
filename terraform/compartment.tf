resource "oci_identity_compartment" "always_free" {
  compartment_id = "ocid1.tenancy.oc1..aaaaaaaad67tc34c4ewom6shamozbbiwc3eakmeanreimxthvodydnnmkagq"
  description    = "Compartment for Terraform resources."
  name           = "AlwaysFree"
}
