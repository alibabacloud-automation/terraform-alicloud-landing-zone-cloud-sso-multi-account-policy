locals {
  # If self-define filter condition is not set, using account name as default filter value.
  group_name_regex  = var.user_group_name_regex == "" ? format(".*%s", var.display_name) : var.user_group_name_regex
  this_directory_id = var.create_directory ? concat(alicloud_cloud_sso_directory.this.*.id, [""])[0] : var.directory_id
  this_account_id   = concat(alicloud_resource_manager_account.this.*.id, [""])[0]
  matched_groups    = data.alicloud_cloud_sso_groups.this.groups

  # Split all filtered group names and then using them to locate eligible access configurations
  matched_group_names_split     = distinct(flatten([for group in local.matched_groups : split(format("%s-", var.display_name), group.group_name)]))
  matched_access_configurations = [for ac in data.alicloud_cloud_sso_access_configurations.this.configurations : ac if contains(local.matched_group_names_split, ac.access_configuration_name)]
}

