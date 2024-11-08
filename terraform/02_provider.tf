terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }

    # archive use for tflint
    archive = {
      source  = "hashicorp/archive"
      version = ">= 1.0.0"
    }
  }

  required_version = ">= 1.5"
}

provider "aws" {
  region = var.region
}
