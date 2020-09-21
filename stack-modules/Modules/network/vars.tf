variable PROJECT_NAME {}
variable PROJECT_ENV {}
variable VPC_CIDR {}
variable AZ {
  type        = list
}

data "aws_caller_identity" "current" {}

data "aws_vpcs" "current" {
  tags = {
    Name = "default"
  }
}


