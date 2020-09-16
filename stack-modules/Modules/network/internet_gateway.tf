resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.studentapp-vpc.id

  tags = {
     Name         = "${var.PROJECT_NAME}-${var.PROJECT_ENV}-IGW"
     created_by   = "Terraform"
     PROJECT_NAME = var.PROJECT_NAME
     ENVIRONMENT  = var.PROJECT_ENV
    
  }
}