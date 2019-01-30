resource "google_compute_http_health_check" "basic-check" {
  name               = "basic-check"
  check_interval_sec = 5
  timeout_sec        = 5
  request_path       = "/"
  port               = "9292"
}

resource "google_compute_target_pool" "www-network-lb" {
  name   = "www-network-lb"
  region = "${var.region}"

  instances = [
    "${google_compute_instance.app.*.self_link}",
  ]

  health_checks = [
    "${google_compute_http_health_check.basic-check.self_link}",
  ]
}

resource "google_compute_forwarding_rule" "www-rule" {
  name       = "www-rule"
  port_range = "9292"
  target     = "${google_compute_target_pool.www-network-lb.self_link}"
}
