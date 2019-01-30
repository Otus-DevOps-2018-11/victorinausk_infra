variable project {
  description = "Project ID"
}

variable region {
  description = "Region"
  default     = "europe-west1"
}

variable public_key_path {
  description = "Path to the public key used for ssh access"
}

variable private_key_path {
  description = "Path to the private key used for ssh access"
}

variable disk_image {
  description = "Disk image"
}

variable zone {
  description = "Zone"
  default     = "europe-west1-b"
}

variable count {
  description = "Count"
  default     = "1"
}

variable app_disk_image {
  description = "Disk image for reddit app"
  default     = "reddit-app-base-20181031-191304"
}

variable db_disk_image {
  description = "Disk image for reddit db"
  default     = "reddit-db-base-20181031-190426"
}

variable provision_var {
  description = "Set this var to 1 for provision runnig"
}

variable files_puma_service {
  description = "File for systemd puma service"
}

variable files_deploy_sh {
  description = "File for deploy puma service"
}
