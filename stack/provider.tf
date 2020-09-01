provider "aws"{

}

terraform {
    
  backend "s3" {
    bucket = "state-info-bucket"
    key    = "remote-state/terraform.tfstate"
    region = "us-east-1"
  }
}