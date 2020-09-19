resource "aws_rds_cluster_parameter_group" "default" {
  name        = "mariadb_parameter_group"
  family      = "${var.DB_ENGINE}${var.DB_ENGINE_VERSION}"
  description = "RDS ${var.DB_ENGINE} cluster parameter group"
}

resource "aws_db_subnet_group" "default" {
  name       = "main"
  subnet_ids = var.PRIVATE_SUBNETS
  tags = {
    Name = "My DB subnet group"
  }
}

