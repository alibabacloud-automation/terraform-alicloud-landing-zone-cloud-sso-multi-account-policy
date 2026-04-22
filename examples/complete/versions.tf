terraform {
  required_version = ">= 0.13.1"

  required_providers {
    alicloud = {
      source  = "aliyun/alicloud"
      version = ">= 1.145.0"
    }
  }
}
