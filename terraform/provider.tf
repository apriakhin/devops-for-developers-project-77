terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }

    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }

    datadog = {
      source  = "DataDog/datadog"
      version = "~> 3.0"
    }
  }
}

variable "do_token" {}

provider "digitalocean" {
  token = var.do_token
}

provider "datadog" {
  api_url = "https://app.datadoghq.eu"
}
