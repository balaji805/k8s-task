resource "helm_release" "balaji_app" {
  name         = "balaji-app"
  chart        = "."
  version      = "0.1.0"
  force_update = true

  values = [
    "${file("values.yaml")}"
  ]

  namespace                  = "default"
  disable_openapi_validation = true
}
