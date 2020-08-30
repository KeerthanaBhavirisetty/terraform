provider "aws" {}

terraform {
  backend "s3" {
    bucket = "stateinfobucket"
    key    = "remote-state/terraform.tfstate"
    region = "us-east-1"
  }
}