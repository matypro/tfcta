terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
      # version = "< 4.0"
    }
  }
  required_version = ">= 1.3.0"
  # required_version = "< 1.3"
}

provider "aws" {
  profile = "cta"
  region  = "eu-west-1"
}

provider "aws" {
  profile = "cta"
  alias = "central"
  region  = "eu-central-1"
}


