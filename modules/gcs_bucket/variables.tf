variable "project_id" {
  type = string
}

variable "environment" {
  type = string
}

variable "location" {
  type = string
}

variable "name_prefix" {
  default = "hndrewaall"
}

variable "name_suffix" {
  type = string
}

variable "force_destroy" {
  default = false
}

variable "versioning_enabled" {
  default = true
}

variable "readers" {
  type    = list(string)
  default = []
}

variable "writers" {
  type    = list(string)
  default = []
}
