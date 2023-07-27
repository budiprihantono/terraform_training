terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.75.0"
    }

    random = {
      source = "hashicorp/random"
      version = "3.3.2"
    }

    local = {
      source  = "hashicorp/local"
      version = "2.2.3"
    }

    null = {
      source  = "hashicorp/null"
      version = "3.1.1"
    }

    template = {
      source  = "hashicorp/template"
      version = "2.2.0"
    }

    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "1.14"
    }

    helm = {
      source  = "hashicorp/helm"
      version = "2.10.1"
    }
  }
  required_version = "> 0.14"
}
