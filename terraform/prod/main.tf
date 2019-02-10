# Provider google

provider "google" {
  version = "1.4.0"
  project = "${var.project}"
  region  = "${var.region}"
}

module "app" {
  source             = "../modules/app"
  public_key_path    = "${var.public_key_path}"
  zone               = "${var.zone}"
  app_disk_image     = "${var.app_disk_image}"
  private_key_path   = "${var.private_key_path}"
  provision_var      = "${var.provision_var}"
  files_deploy_sh    = "${var.files_deploy_sh}"
  files_puma_service = "${var.files_puma_service}"
  db_internal_ip     = "${module.db.db_internal_ip}"
}

module "db" {
  source           = "../modules/db"
  public_key_path  = "${var.public_key_path}"
  zone             = "${var.zone}"
  db_disk_image    = "${var.db_disk_image}"
  private_key_path = "${var.private_key_path}"
  provision_var    = "${var.provision_var}"
}

module "vpc" {
  source        = "../modules/vpc"
  source_ranges = ["0.0.0.0/0"]
}
