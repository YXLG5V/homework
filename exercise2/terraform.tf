terraform {
  required_version = "~> 1.5.0"

  required_providers {
    aws = {
      version = "5.17.0"
      source  = "hashicorp/aws"
    }
  }
}
