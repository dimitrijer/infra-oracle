resource "oci_core_instance" "tengu" {
  availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
  compartment_id      = oci_identity_compartment.always_free.id
  shape               = var.compute_shape
  shape_config {
    memory_in_gbs = 4
    ocpus         = 2
  }

  source_details {
    source_type = "image"
    source_id   = var.compute_image_aarch64_ocid
  }

  display_name = "tengu"

  create_vnic_details {
    subnet_id = oci_core_subnet.frontend.id
  }

  metadata = {
    ssh_authorized_keys = var.pubkey
  }

  is_pv_encryption_in_transit_enabled = false
}

resource "oci_core_instance" "kitsune" {
  availability_domain = data.oci_identity_availability_domains.ads.availability_domains[2].name
  compartment_id      = oci_identity_compartment.always_free.id
  shape               = var.compute_shape
  shape_config {
    memory_in_gbs = 10
    ocpus         = 1
  }

  source_details {
    source_type = "image"
    source_id   = var.compute_image_aarch64_ocid
  }

  display_name = "kitsune"

  create_vnic_details {
    subnet_id        = oci_core_subnet.backend.id
    assign_public_ip = false
  }

  metadata = {
    ssh_authorized_keys = var.pubkey
  }

  is_pv_encryption_in_transit_enabled = false
}

resource "oci_core_instance" "amaterasu" {
  availability_domain = data.oci_identity_availability_domains.ads.availability_domains[2].name
  compartment_id      = oci_identity_compartment.always_free.id
  shape               = var.compute_shape
  shape_config {
    memory_in_gbs = 10
    ocpus         = 1
  }

  source_details {
    source_type = "image"
    source_id   = var.compute_image_aarch64_ocid
  }

  display_name = "amaterasu"

  create_vnic_details {
    subnet_id        = oci_core_subnet.backend.id
    assign_public_ip = false
  }

  metadata = {
    ssh_authorized_keys = var.pubkey
  }

  is_pv_encryption_in_transit_enabled = false
}

resource "oci_core_instance" "kirin" {
  availability_domain = data.oci_identity_availability_domains.ads.availability_domains[1].name
  compartment_id      = oci_identity_compartment.always_free.id
  shape               = var.micro_compute_shape
  shape_config {
    memory_in_gbs = 1
    ocpus         = 1
  }

  source_details {
    source_type = "image"
    source_id   = var.compute_image_x86_ocid
  }

  display_name = "kirin"

  create_vnic_details {
    subnet_id        = oci_core_subnet.backend.id
    assign_public_ip = false
  }

  metadata = {
    ssh_authorized_keys = var.pubkey
  }

  is_pv_encryption_in_transit_enabled = false
}
