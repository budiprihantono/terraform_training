resource "google_compute_global_forwarding_rule" "global_gke_neg_lb" {
  name                  = "global-gke-neg-lb"
  ip_protocol           = "TCP"
  load_balancing_scheme = "EXTERNAL_MANAGED"
  port_range            = "80"
  ip_address            = google_compute_global_address.gke_neg_ip_lb.address
  target                = google_compute_target_http_proxy.global_gke_neg_lb_proxy.id
}

resource "google_compute_target_http_proxy" "global_gke_neg_lb_proxy" {
  name             = "global-gke-neg-lb-proxy"
  url_map          = google_compute_url_map.global_gke_neg_lb_url.id
}

resource "google_compute_url_map" "global_gke_neg_lb_url" {
  name            = "global-gke-neg-lb-url"
  default_service = google_compute_backend_service.global_gke_neg_lb_backend.id

  host_rule {
    hosts        = ["gateway.devdomain.cloud"]
    path_matcher = "allpaths"
  }

  path_matcher {
    name            = "allpaths"
    default_service = google_compute_backend_service.global_gke_neg_lb_backend.id

    path_rule {
      paths   = ["/"]
      service = google_compute_backend_service.global_gke_neg_lb_backend.id
    }
  }
}

# backend service
resource "google_compute_backend_service" "global_gke_neg_lb_backend" {
  name                  = "global-gke-neg-lb-backend"
  protocol              = "HTTP"
  port_name             = "tcp"
  load_balancing_scheme = "EXTERNAL_MANAGED"
  timeout_sec           = 10
  health_checks         = [google_compute_health_check.gke_neg_backend_health_check.id]
  backend {
    balancing_mode        = "RATE"
    max_rate_per_endpoint = 100
    group                 = data.google_compute_network_endpoint_group.gke_zonal_network_endpoint_group_zone_a.id
  }
  backend {
    balancing_mode        = "RATE"
    max_rate_per_endpoint = 100
    group                 = data.google_compute_network_endpoint_group.gke_zonal_network_endpoint_group_zone_b.id
  }
  backend {
    balancing_mode        = "RATE"
    max_rate_per_endpoint = 100
    group                 = data.google_compute_network_endpoint_group.gke_zonal_network_endpoint_group_zone_c.id
  }
}

#health_check
resource "google_compute_health_check" "gke_neg_backend_health_check" {
  name               = "gke-neg-backend-health-check"
  timeout_sec        = 1
  check_interval_sec = 5
  tcp_health_check {
    port = 80
  }
}