resource "oci_core_volume" "cache" {
  compartment_id      = oci_identity_compartment.always_free.id
  availability_domain = oci_core_instance.kitsune.availability_domain

  display_name = "Cache"

  size_in_gbs = 50
}

resource "oci_core_volume_attachment" "cache_kitsune" {
  attachment_type = "paravirtualized"
  instance_id     = oci_core_instance.kitsune.id
  volume_id       = oci_core_volume.cache.id

  display_name = "Cache"
}
