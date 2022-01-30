resource "oci_core_vnic_attachment" "nat_gateway_vnic" {
  create_vnic_details {
    # Set up as NAT
    display_name = "NAT VNIC"
    # Only one public IP may be assigned per instance, and it's already assigned
    # on the first NIC.
    assign_public_ip = false
    private_ip = var.nat_gateway_ip
    subnet_id = oci_core_subnet.frontend.id
    hostname_label = "nat"
    skip_source_dest_check = true
  }
  instance_id = oci_core_instance.tengu.id
}
