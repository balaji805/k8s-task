provider "helm" {
  kubernetes {
    load_config_file = true
    config_context   = "minikube"
  }
  helm_driver = "secret"
}
