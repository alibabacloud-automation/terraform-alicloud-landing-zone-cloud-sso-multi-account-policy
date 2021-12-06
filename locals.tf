locals {
  # If self-define filter condition is not set, using account name as default filter value.
  group_name_regex  = var.cloud_sso_group_name == "" ? format(".*%s", var.display_name) : var.cloud_sso_group_name
  this_directory_id = var.create_directory ? concat(alicloud_cloud_sso_directory.this.*.id, [""])[0] : var.directory_id
  this_account_id   = concat(alicloud_resource_manager_account.this.*.id, [""])[0]
  matched_groups    = data.alicloud_cloud_sso_groups.this.groups

  # Get a folder id from datasource
  this_folder_id = var.folder_name == "" ? "" : length(data.alicloud_resource_manager_folders.this.folders) > 0 ? concat(data.alicloud_resource_manager_folders.this.folders.*.folder_id, [""])[0] : var.create_resource_manager_folder ? concat(alicloud_resource_manager_folder.this.*.id, [""])[0] : ""

  # Split all filtered group names and then using them to locate eligible access configurations
  matched_group_names_split     = distinct(flatten([for group in local.matched_groups : split(format("%s-", var.display_name), group.group_name)]))
  matched_access_configurations = [for ac in data.alicloud_cloud_sso_access_configurations.this.configurations : ac if contains(local.matched_group_names_split, ac.access_configuration_name)]
}

