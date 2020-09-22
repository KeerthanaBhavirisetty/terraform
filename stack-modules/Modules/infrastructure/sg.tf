resource "aws_security_group" "allow_rds" {
  name              = "mariadb_rds"
  description       = "Allow RDS inbound traffic"
  vpc_id            = var.VPC_ID

  ingress {
    description     = "RDS from VPC"
    from_port       = 3306
    to_port         = 3306
    protocol        = "TCP"
    cidr_blocks     = [var.VPC_CIDR, var.DEFAULT_VPC_CIDR]
  }

  tags = {
     Name                     = "${var.PROJECT_NAME}-${var.PROJECT_ENV}-SecurityGroup"
     created_by               = "Terraform"
     PROJECT_NAME             = var.PROJECT_NAME
     ENVIRONMENT              = var.PROJECT_ENV
  }
}