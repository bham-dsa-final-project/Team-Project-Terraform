variable "region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "eu-west-2"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnets" {
  description = "The CIDR blocks for the public subnets"
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24"]
}

variable "private_subnets" {
  description = "The CIDR blocks for the private subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
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

variable "db_instance_class" {
  description = "The instance class for the RDS instance"
  type        = string
  default     = "db.t3.micro"
}

variable "db_name" {
  description = "The name of the RDS database"
  type        = string
  default     = "mydb"
}

variable "ecs_service_name" {
  description = "The name of the ECS service"
  type        = string
  default     = "my-ecs-service"
}

variable "ecs_task_family" {
  description = "The family name of the ECS task definition"
  type        = string
  default     = "my-task-family"
}

variable "ecs_container_name" {
  description = "The name of the container in the ECS task definition"
  type        = string
  default     = "my-container"
}

variable "ecs_container_image" {
  description = "The image to use for the container in the ECS task definition"
  type        = string
  default     = "amazon/amazon-ecs-sample"
}

variable "ecs_cpu" {
  description = "The CPU units to allocate for the container"
  type        = number
  default     = 256
}

variable "ecs_memory" {
  description = "The amount of memory (in MiB) to allocate for the container"
  type        = number
  default     = 512
}

variable "ecs_desired_count" {
  description = "The desired number of tasks for the ECS service"
  type        = number
  default     = 1
}

variable "tags" {
  description = "A map of tags to assign to the resources"
  type        = map(string)
  default = {
    Terraform   = "true"
    Environment = "dev"
  }
}
