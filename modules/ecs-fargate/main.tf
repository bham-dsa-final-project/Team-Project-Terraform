module "ecs" {
  source = "terraform-aws-modules/ecs/aws"

  cluster_name = "my-ecs-cluster"
  vpc_id       = var.vpc_id

  service = {
    name             = var.ecs_service_name
    task_definition  = "my-task-def"
    desired_count    = var.ecs_desired_count
    launch_type      = "FARGATE"
    platform_version = "LATEST"
    security_groups  = var.security_group_ids
    subnets          = var.subnet_ids
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
