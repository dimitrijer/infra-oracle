provider "oci" {
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  private_key_path = "/Users/dimitrijer/.oci/dimitrijer.pem"
  fingerprint      = "00:f8:35:a6:60:b2:c0:96:53:1d:e9:a1:ac:0e:61:1b"
  region           = var.region
}
