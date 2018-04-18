# Global Terraform
variable "environment" {
  description = "Architecture Environment"
  type        = "string"
}

# Global DataDog
variable "delay" {
  description = "Delay in seconds for the metric evaluation"
  default     = 15
}

variable "message" {
  description = "Message sent when an alert is triggered"
}

variable "filter_tags_use_defaults" {
  description = "Use default filter tags convention"
  default     = "true"
}

variable "filter_tags_custom" {
  description = "Tags used for custom filtering when filter_tags_use_defaults is false"
  default     = "*"
}

# Nginx Middleware specific

variable "nginx_connect_silenced" {
  description = "Groups to mute for Nginx process monitor"
  type        = "map"
  default     = {}
}

variable "nginx_connect_message" {
  description = "Custom message for Nginx process monitor"
  type        = "string"
  default     = ""
}