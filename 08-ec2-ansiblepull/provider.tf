provider "aws" {}


terraform {
    
  backend "s3" {
    bucket = "state-info-bucket"
    key    = "ansible-pull/terraform.tfstate"
    region = "us-east-1"
  }
}