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