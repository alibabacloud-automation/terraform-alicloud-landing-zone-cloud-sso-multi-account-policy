output "this_directory" {
  description = "The id of cloud sso directory of this module used."
  value       = local.this_directory_id
}
output "this_account_id" {
  description = "The id of resource account."
  value       = local.this_account_id
}
output "this_group_ids" {
  description = "List of ids of cloud sso user group."
  value       = local.matched_groups.*.group_id
}
output "this_group_names" {
  description = "List of names of cloud sso user group."
  value       = local.matched_groups.*.group_name
}

output "this_access_configuration_ids" {
  description = "List of ids of cloud sso access configuration."
  value       = local.matched_access_configurations.*.access_configuration_id
}
output "this_access_configuration_names" {
  description = "List of names of cloud sso access configuration."
  value       = local.matched_access_configurations.*.access_configuration_name
}