
output "vpc_id" {
  value = module.vpc.vpc_id
}

output "rds_endpoint" {
  value = module.rds.this_db_instance_address
}

output "ecs_cluster_id" {
  value = module.ecs_fargate.cluster_id
}
