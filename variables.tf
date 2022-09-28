variable "resource_group_name" {
  description = "Resource group name where resources will reside."
  type        = string
}

variable "location" {
  description = "Location of resources to create."
  type        = string
}

variable "suffix" {
  description = "Suffix of resource names."
  type        = string
}