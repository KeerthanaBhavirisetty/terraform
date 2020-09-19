resource "aws_rds_cluster_parameter_group" "default" {
  name        = "${var.DB_ENGINE}_parameter_group"
  family      = format(var.DB_ENGINE,var.DB_ENGINE_VERSION)
  description = "RDS default cluster parameter group"

  parameter {
    name  = "character_set_server"
    value = "utf8"
  }

  parameter {
    name  = "character_set_client"
    value = "utf8"
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
  parameter_group_name = "default.mariadb10.4"
  skip_final_snapshot  = var.NEED_FINAL_SNAPSHOT
  identifier           = var.DB_NAME"-db"
}