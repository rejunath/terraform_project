terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
     github = {
      source  = "integrations/github"
     }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "${var.region}"
}
