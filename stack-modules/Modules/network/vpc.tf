resource "aws_vpc" "studentapp-vpc" {
  cidr_block       = var.VPC_CIDR
  instance_tenancy = "default"

  tags = {
    Name = "${var.PROJECT_NAME}-${var.PROJECT_ENV}-VPC"
    created_by = "Terraform"
    PROJECT_NAME = var.PROJECT_NAME
     ENVIRONMENT  = var.PROJECT_ENV
    

  }
}