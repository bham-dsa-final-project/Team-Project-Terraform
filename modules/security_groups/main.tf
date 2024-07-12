module "security_groups" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "ecs-sg"
  description = "Allow ECS service to communicate"
  vpc_id      = var.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]

  ingress_rules = ["http-80-tcp", "https-443-tcp"]
  egress_rules  = ["all-all"]

  tags = var.tags
}

output "this_security_group_id" {
  value = module.security_groups.this_security_group_id
}
