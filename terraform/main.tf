terraform {
  required_providers {
    oci = {
      source  = "hashicorp/oci"
      version = ">=4.41.0"
    }
  }
  required_version = ">= 1.0.0"
}

provider "oci" {
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  private_key_path = "/Users/dimitrijer/.oci/dimitrijer.pem"
  fingerprint      = "00:f8:35:a6:60:b2:c0:96:53:1d:e9:a1:ac:0e:61:1b"
  region           = var.region
}

data "oci_identity_availability_domains" "ads" {
  compartment_id = var.compartment_ocid
}
