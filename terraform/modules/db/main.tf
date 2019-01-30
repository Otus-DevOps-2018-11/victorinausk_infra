resource "google_compute_instance" "db" {
  name         = "reddit-db"
  machine_type = "g1-small"
  zone         = "${var.zone}"
  tags         = ["reddit-db"]

  boot_disk {
    initialize_params {
      image = "${var.db_disk_image}"
    }
  }

  network_interface {
    network = "default"

    access_config = {}
  }

  metadata {
    ssh-keys = "appuser:${file(var.public_key_path)}"
  }
}

resource "null_resource" "db_provisioner" {
  count = "${var.provision_var}"

  connection {
    type        = "ssh"
    user        = "appuser"
    agent       = false
    private_key = "${file(var.private_key_path)}"
    host        = "${google_compute_instance.db.network_interface.0.access_config.0.nat_ip}"
  }

  provisioner "file" {
    source      = "./../files/startdb.sh"
    destination = "/tmp/startdb.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/startdb.sh",
      "/tmp/startdb.sh",
    ]
  }

  provisioner "remote-exec" {
    #    script = "files/mongodb.sh"
    inline = [
      "sudo systemctl restart mongod",
    ]
  }
}
