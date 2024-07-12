variable "vpc_id" {
  description = "The VPC ID"
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the resources"
  type        = map(string)
}
