
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
  subnet_ids = var.PRIVATE_SUBNETS
  tags = {
     Name         = "${var.PROJECT_NAME}-${var.PROJECT_ENV}-SubnetGroup"
     created_by   = "Terraform"
     PROJECT_NAME = var.PROJECT_NAME
     ENVIRONMENT  = var.PROJECT_ENV
  }
}

resource "aws_security_group" "allow_rds" {
  name        = "mariadb_rds"
  description = "Allow RDS inbound traffic"
  vpc_id      = aws_vpc.current.id

  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.main.cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
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
  db_subnet_group_name = aws_db_subnet_group.default.id
  tags = {
     Name         = "${var.PROJECT_NAME}-${var.PROJECT_ENV}-RDS instance"
     created_by   = "Terraform"
     PROJECT_NAME = var.PROJECT_NAME
     ENVIRONMENT  = var.PROJECT_ENV
  }
}

resource "null_resource" "loading_schema" {
 
  provisioner "local-exec" {
    command = <<EOF
    uptime
    hostname
    ls
    EOF
  }
}