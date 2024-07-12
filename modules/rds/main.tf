module "rds" {
  source = "terraform-aws-modules/rds/aws"

  identifier     = "my-rds-instance"
  engine         = "mysql"
  instance_class = var.db_instance_class

  name     = var.db_name
  username = var.db_username
  password = var.db_password
  port     = "3306"

  vpc_security_group_ids = [var.security_group_id]
  db_subnet_group_name   = var.db_subnet_group

  backup_retention_period = 7
  publicly_accessible     = false

  tags = var.tags
}
