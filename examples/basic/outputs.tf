output "resource_manager_account_id" {
  value = module.cloud_sso.this_account_id
}
output "cloud_sso_group_ids" {
  value = module.cloud_sso.this_group_ids
}
output "cloud_sso_group_names" {
  value = module.cloud_sso.this_group_names
}

output "cloud_sso_access_configuration_ids" {
  value = module.cloud_sso.this_access_configuration_ids
}
output "cloud_sso_access_configuration_names" {
  value = module.cloud_sso.this_access_configuration_names
}