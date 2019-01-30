variable public_key_path {
  description = "Path to the public key used for ssh access"
}

variable zone {
  description = "Zone"
  default     = "europe-west1-b"
}

variable app_disk_image {
  description = "Disk image for reddit app"
  default     = "reddit-app-base-1548870392"
}

variable "private_key_path" {
  description = "Path to the private key used for ssh access"
}

variable provision_var {
  description = "Set this var to 1 for provision runnig"
}

variable files_puma_service {
  description = "Var for puma systemd"
}

variable files_deploy_sh {
  description = "Var for puma start"
}

variable "db_internal_ip" {
  description = "mongo database internal ip from module db"
}
