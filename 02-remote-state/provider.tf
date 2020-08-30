provider "aws" {}

terraform {
  backend "s3" {
    bucket = "stateInfoBucket"
    key    = "remote-state/terraform.tfstate"
    region = "us-east-1"
  }
}