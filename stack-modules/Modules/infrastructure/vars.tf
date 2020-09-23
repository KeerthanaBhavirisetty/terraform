variable PROJECT_NAME {}
variable PROJECT_ENV {}
variable VPC_CIDR {}

data "aws_caller_identity" "current" {}

data "aws_ami" "myami" {
  most_recent = true

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = [data.aws_caller_identity.current.account_id] # Canonical
}

variable INSTANCE_TYPE {}
variable INSTANCE_COUNT {}
variable KEYPAIR_NAME {}
variable PUBLIC_SUBNETS{
    type = list
}

variable VPC_ID {}
variable DEFAULT_VPC_CIDR {}

variable DB_USER {}
variable DB_NAME {}
variable DB_PASS {}
variable DB_HOST {}
variable AZ {
  type = list
}