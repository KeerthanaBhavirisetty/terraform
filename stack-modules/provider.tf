provider "aws"{}


terraform {
    
  backend "s3" {
    bucket = "state-info-bucket"
    key    = "stack-modules/terraform.tfstate"
    region = "us-east-1"
  }
}