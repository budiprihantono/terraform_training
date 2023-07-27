resource "helm_release" "nginx" {
  name       = "nginx-ingress-controller"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "nginx-ingress-controller"
  version    = "9.7.5"
  namespace  = "nginx"
  create_namespace = true
  values = [
    "${file("../helm/values_nginx_controller.yaml")}"
  ]
}