##################################################
## Variables
##################################################

variable "force_destroy" {
  type = string
  default = "false"
}

variable "full_domain" {
  type = string
}

variable "allowed_ip" {
  type = string
}

variable routing_rules {
  type = string
  default = ""
}

variable index_document {
  type = string
  default = "index.html"
}

variable error_document {
  type = string
  default = "404.html"
}

variable "logging_bucket" {
  type = string
  default = ""
}

variable "tags" {
  type        = map(string)
  description = "Optional Tags"
  default     = {}
}
