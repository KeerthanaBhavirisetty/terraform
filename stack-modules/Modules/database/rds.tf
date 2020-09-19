
resource "aws_db_parameter_group" "default" {
  name   = "${var.DB_ENGINE}-parameter-group"
  family = "${var.DB_ENGINE}${var.DB_ENGINE_VERSION}"
  tags = {
     Name         = "${var.PROJECT_NAME}-${var.PROJECT_ENV}-Parameter Group"
     created_by   = "Terraform"
     PROJECT_NAME = var.PROJECT_NAME
     ENVIRONMENT  = var.PROJECT_ENV
  }
}

resource "aws_db_subnet_group" "default" {
  name       = "main"
  subnet_ids = [var.PRIVATE_SUBNETS]
  tags = {
     Name         = "${var.PROJECT_NAME}-${var.PROJECT_ENV}-SubnetGroup"
     created_by   = "Terraform"
     PROJECT_NAME = var.PROJECT_NAME
     ENVIRONMENT  = var.PROJECT_ENV
  }
}

resource "aws_db_instance" "default" {
  allocated_storage    = var.DB_SIZE
  storage_type         = "gp2"
  engine               = var.DB_ENGINE
  engine_version       = var.DB_ENGINE_VERSION
  instance_class       = var.DB_INSTANCE
  name                 = var.DB_NAME
  username             = var.DB_USER
  password             = var.DB_PASS
  parameter_group_name = aws_db_parameter_group.default.id
  skip_final_snapshot  = !var.NEED_FINAL_SNAPSHOT
  identifier           = "${var.DB_NAME}-db"
  tags = {
     Name         = "${var.PROJECT_NAME}-${var.PROJECT_ENV}-RDS instance"
     created_by   = "Terraform"
     PROJECT_NAME = var.PROJECT_NAME
     ENVIRONMENT  = var.PROJECT_ENV
  }
}