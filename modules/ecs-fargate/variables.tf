variable "vpc_id" {
  description = "The VPC ID"
  type        = string
}

variable "security_group_ids" {
  description = "Security group IDs for the ECS service"
  type        = list(string)
}

variable "subnet_ids" {
  description = "Subnet IDs for the ECS service"
  type        = list(string)
}

variable "db_endpoint" {
  description = "RDS database endpoint"
  type        = string
}

variable "db_username" {
  description = "The username for the RDS instance"
  type        = string
}

variable "db_password" {
  description = "The password for the RDS instance"
  type        = string
  sensitive   = true
}

variable "ecs_service_name" {
  description = "The name of the ECS service"
  type        = string
}

variable "ecs_task_family" {
  description = "The family name of the ECS task definition"
  type        = string
}

variable "ecs_container_name" {
  description = "The name of the container in the ECS task definition"
  type        = string
}

variable "ecs_container_image" {
  description = "The image to use for the container in the ECS task definition"
  type        = string
}

variable "ecs_cpu" {
  description = "The CPU units to allocate for the container"
  type        = number
}

variable "ecs_memory" {
  description = "The amount of memory (in MiB) to allocate for the container"
  type        = number
}

variable "ecs_desired_count" {
  description = "The desired number of tasks for the ECS service"
  type        = number
}

variable "tags" {
  description = "A map of tags to assign to the resources"
  type        = map(string)
}
