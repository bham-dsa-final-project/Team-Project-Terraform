terraform {
  backend "s3" {
    bucket         = "infra-as-code2323"
    key            = "path/to/your/terraform.tfstate"
    region         = "eu-west-2"
    dynamodb_table = "table1"
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.58.0"
    }
  }
}

provider "aws" {
  region = var.region
}

module "vpc" {
  source = "modules/vpc"

  name = "my-vpc"
  cidr = var.vpc_cidr

  azs             = [for az in data.aws_availability_zones.available.names : az]
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = var.tags
}

module "security_groups" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "ecs-sg"
  description = "Allow ECS service to communicate"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]

  ingress_rules = ["http-80-tcp", "https-443-tcp"]
  egress_rules  = ["all-all"]

  tags = var.tags
}

module "rds" {
  source = "terraform-aws-modules/rds/aws"

  identifier     = "my-rds-instance"
  engine         = "mysql"
  instance_class = var.db_instance_class

  name     = var.db_name
  username = var.db_username
  password = var.db_password
  port     = "3306"

  vpc_security_group_ids = [module.security_groups.this_security_group_id]
  db_subnet_group_name   = module.vpc.database_subnet_group

  backup_retention_period = 7
  publicly_accessible     = false

  tags = var.tags
}

module "ecs_fargate" {
  source = "terraform-aws-modules/ecs/aws"

  cluster_name = "my-ecs-cluster"
  vpc_id       = module.vpc.vpc_id

  service = {
    name             = var.ecs_service_name
    task_definition  = "my-task-def"
    desired_count    = var.ecs_desired_count
    launch_type      = "FARGATE"
    platform_version = "LATEST"
    security_groups  = [module.security_groups.this_security_group_id]
    subnets          = module.vpc.private_subnets
  }

  task = {
    family                = var.ecs_task_family
    container_definitions = <<DEFINITION
[
  {
    "name": "${var.ecs_container_name}",
    "image": "${var.ecs_container_image}",
    "cpu": ${var.ecs_cpu},
    "memory": ${var.ecs_memory},
    "essential": true,
    "portMappings": [
      {
        "containerPort": 80,
        "hostPort": 80
      }
    ]
  }
]
DEFINITION
  }

  tags = var.tags
}
