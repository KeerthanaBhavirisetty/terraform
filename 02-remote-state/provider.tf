provider "aws" {}

terraform {
  backend "s3" {
    bucket = "stateinfobucket"
    key    = "path/to/my/key"
    region = "us-east-1"
  }
}