resource "oci_core_security_list" "isolated" {
  compartment_id = oci_identity_compartment.always_free.id
  vcn_id         = module.vcn.vcn_id

  display_name = "Isolated"

  # Allow all egress.
  egress_security_rules {
    stateless        = false
    destination      = "0.0.0.0/0"
    destination_type = "CIDR_BLOCK"
    protocol         = "all"
  }

  # Allow SSH ingress from VCN only.
  ingress_security_rules {
    stateless   = false
    source      = var.vcn_cidr
    source_type = "CIDR_BLOCK"
    # TCP is 6
    # https://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml
    protocol = "6"
    tcp_options {
      min = 22
      max = 22
    }
  }

  # Allow kubelet traffic ingress from VCN only (server is in frontend subnet).
  ingress_security_rules {
    stateless   = false
    source      = var.vcn_cidr
    source_type = "CIDR_BLOCK"
    protocol    = "6"
    tcp_options {
      min = 10250
      max = 10250
    }
  }

  # Allow Flannel UDP traffic.
  ingress_security_rules {
    stateless   = false
    source      = var.vcn_cidr
    source_type = "CIDR_BLOCK"
    protocol    = "17"
    udp_options {
      min = 8472
      max = 8472
    }
  }

  # Allow ICMP ingress.
  ingress_security_rules {
    stateless   = false
    source      = var.everywhere_cidr
    source_type = "CIDR_BLOCK"
    # ICMP is 1
    protocol = "1"
    # For ICMP type and code see: https://www.iana.org/assignments/icmp-parameters/icmp-parameters.xhtml
    icmp_options {
      type = 3
      code = 4
    }
  }

  ingress_security_rules {
    stateless   = false
    source      = var.vcn_cidr
    source_type = "CIDR_BLOCK"
    protocol    = "1"
    icmp_options {
      type = 3
    }
  }

  # Allow ping requests from VCN only.
  ingress_security_rules {
    stateless   = false
    source      = var.vcn_cidr
    source_type = "CIDR_BLOCK"
    protocol    = "1"
    icmp_options {
      type = 8
    }
  }
}

resource "oci_core_security_list" "public" {
  compartment_id = oci_identity_compartment.always_free.id
  vcn_id         = module.vcn.vcn_id

  display_name = "Public"

  # Allow all egress.
  egress_security_rules {
    stateless        = false
    destination      = var.everywhere_cidr
    destination_type = "CIDR_BLOCK"
    protocol         = "all"
  }

  # Allow ingress SSH from anywhere.
  ingress_security_rules {
    stateless   = false
    source      = var.everywhere_cidr
    source_type = "CIDR_BLOCK"
    protocol    = "6"
    tcp_options {
      min = 22
      max = 22
    }
  }

  # Allow ingress HTTPS to Kubernetes from anywhere.
  ingress_security_rules {
    stateless   = false
    source      = var.everywhere_cidr
    source_type = "CIDR_BLOCK"
    protocol    = "6"
    tcp_options {
      min = 443
      max = 443
    }
  }

  # Allow kubectl from VCN only.
  ingress_security_rules {
    stateless   = false
    source      = var.vcn_cidr
    source_type = "CIDR_BLOCK"
    protocol    = "6"
    tcp_options {
      min = 6443
      max = 6443
    }
  }

  # Allow kubelet traffic ingress from VCN only (server is in frontend subnet).
  ingress_security_rules {
    stateless   = false
    source      = var.vcn_cidr
    source_type = "CIDR_BLOCK"
    protocol    = "6"
    tcp_options {
      min = 10250
      max = 10250
    }
  }

  # Allow Flannel UDP traffic.
  ingress_security_rules {
    stateless   = false
    source      = var.vcn_cidr
    source_type = "CIDR_BLOCK"
    protocol    = "17"
    udp_options {
      min = 8472
      max = 8472
    }
  }

  ingress_security_rules {
    stateless   = false
    source      = var.everywhere_cidr
    source_type = "CIDR_BLOCK"
    protocol    = "1"
    icmp_options {
      type = 3
      code = 4
    }
  }

  ingress_security_rules {
    stateless   = false
    source      = var.vcn_cidr
    source_type = "CIDR_BLOCK"
    protocol    = "1"
    icmp_options {
      type = 3
    }
  }

  # Allow ping requests from VCN only.
  ingress_security_rules {
    stateless   = false
    source      = var.vcn_cidr
    source_type = "CIDR_BLOCK"
    protocol    = "1"
    icmp_options {
      type = 8
    }
  }
}
