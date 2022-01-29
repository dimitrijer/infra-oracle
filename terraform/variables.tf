variable "region" {
  type    = string
  default = "eu-frankfurt-1"
}

variable "tenancy_ocid" {
  type    = string
  default = "ocid1.tenancy.oc1..aaaaaaaad67tc34c4ewom6shamozbbiwc3eakmeanreimxthvodydnnmkagq"
}

variable "user_ocid" {
  type    = string
  default = "ocid1.user.oc1..aaaaaaaatmiycrni3hup7j4eixnc3q74udchdmgs5o27h4l4azktwwf4s27a"
}

variable "vcn_cidr" {
  type    = string
  default = "192.168.0.0/16"
}

variable "backend_cidr" {
  type    = string
  default = "192.168.0.0/24"
}

variable "frontend_cidr" {
  type    = string
  default = "192.168.1.0/24"
}

variable "everywhere_cidr" {
  type    = string
  default = "0.0.0.0/0"
}

variable "compute_shape" {
  type    = string
  default = "VM.Standard.A1.Flex"
}

variable "compute_image_ocid" {
  type = string
  # Oracle Linux 8.3 aarch64
  # https://cloud.oracle.com/compute/images/ocid1.image.oc1.eu-frankfurt-1.aaaaaaaafw77tp7hx2x2u3ogz427hqkgh3vln3znwlkzau3p7edrlb7x6tda?region=eu-frankfurt-1
  default = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaafw77tp7hx2x2u3ogz427hqkgh3vln3znwlkzau3p7edrlb7x6tda"
}

variable "pubkey" {
  type    = string
  default = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJExlztyJfbsdPkZHkzmCQj+NOfpiRaqVj8Qn/fXRN69 dimitrijer@dimitrijer-mbp17.local"
}
