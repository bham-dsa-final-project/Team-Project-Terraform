output "ecs_sg_id" {
  value = module.security_groups.security_group_ids[0]
}
