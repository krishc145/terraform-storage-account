variable "storage_account_name" {
  description = "Storage Account name (must be globally unique and 3-24 lowercase letters/numbers only)"
  type        = string
  default     = "demostgacct12345"
}

variable "account_tier" {
  description = "Storage account tier"
  type        = string
  default     = "Standard"
}

variable "replication_type" {
  description = "Replication type: LRS / GRS / RAGRS / ZRS / GZRS"
  type        = string
  default     = "LRS"
}

variable "account_kind" {
  description = "Storage account kind: StorageV2 is recommended"
  type        = string
  default     = "StorageV2"
}

variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}

variable "access_tier" {
  description = "Access tier: Hot / Cool"
  type        = string
  default     = "Hot"
}

variable "tags" {
  description = "Tags for all resources"
  type        = map(string)
  default = {
    environment = "dev"
    project     = "terraform-demo"
  }
}
