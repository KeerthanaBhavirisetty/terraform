variable PROJECT_NAME {}
variable PROJECT_ENV {}
variable VPC_CIDR {}
variable AZ {
  type        = list
}

data "aws_caller_identity" "current" {}

data "aws_vpcs" "foo" {
  tags = {
    Name = "default"
  }
}

output "foo" {
  value = data.aws_vpcs.foo.ids
}

