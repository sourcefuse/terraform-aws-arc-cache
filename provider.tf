terraform {
  required_version = "~> 1.6"

  required_providers {
    aws = {
      version = ">= 4.0, < 6.0"
      source  = "hashicorp/aws"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.6.2"
    }
  }
}
