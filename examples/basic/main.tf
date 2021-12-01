provider "alicloud" {
  region = "cn-shanghai"
}

data "alicloud_cloud_sso_directories" "default" {}
variable "account_display_name" {
  default = "fooHelloWorldDev"
}

module "cloud_sso" {
  source                          = "../../"
  create_directory                = false
  directory_id                    = data.alicloud_cloud_sso_directories.default.ids.0
  create_resource_manager_account = true
  display_name                    = var.account_display_name
}