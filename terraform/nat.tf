resource "oci_core_vnic_attachment" "nat_gateway_vnic" {
  create_vnic_details {
    # Set up as NAT
    subnet_id = oci_core_subnet.frontend.id
    private_ip = var.nat_gateway_ip
    hostname_label = "nat"
    skip_source_dest_check = true
  }
  instance_id = oci_core_instance.tengu.id
}

resource "oci_core_private_ip" "nat_gateway_ip" {
  display_name = "IP address of NAT Gateway in Frontend Subnet"
  vnic_id = oci_core_vnic_attachment.nat_gateway_vnic.vnic_id
}
