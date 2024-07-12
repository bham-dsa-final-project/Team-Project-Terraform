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
}

variable "db_name" {
  description = "The name of the RDS database"
  type        = string
}

variable "vpc_id" {
  description = "The VPC ID"
  type        = string
}

variable "db_subnet_group" {
  description = "The subnet group for RDS"
  type        = string
}

variable "security_group_id" {
  description = "The security group ID for RDS"
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the resources"
  type        = map(string)
}
