variable public_key_path {
  description = "Path to the public key used for ssh access"
}

variable zone {
  description = "Zone"
  default     = "europe-west1-b"
}

variable db_disk_image {
  description = "Disk image for reddit db"
  default     = "reddit-db-base-1548870734"
}

variable "private_key_path" {
  description = "Path to the private key used for ssh access"
}

variable provision_var {
  description = "Set this var to 1 for provision runnig"
  default     = 1
}
