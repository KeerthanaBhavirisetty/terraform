variable PROJECT_NAME {}
variable PROJECT_ENV {}
variable VPC_CIDR {}
variable AZ {
  type        = list
}

data "aws_caller_identity" "current" {}

data "aws_vpc" "current" {
  tags = {
    Name = "myapp-vpcs"
  }
}

data "aws_route_table" "selected" {
  vpc_id = "${data.aws_vpc.current.id}"
}


