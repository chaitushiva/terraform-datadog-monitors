# Global Terraform
variable "environment" {
  description = "Architecture Environment"
  type        = "string"
}

# Global DataDog
variable "evaluation_delay_service" {
  description = "Delay in seconds for the metric evaluation"
  default     = 15
}

variable "evaluation_delay_metric" {
  description = "Delay in seconds for the metric evaluation"
  default     = 600
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

# PHP FPM Middleware specific

variable "php_fpm_busy_silenced" {
  description = "Groups to mute for PHP FPM busy worker monitor"
  type        = "map"
  default     = {}
}

variable "php_fpm_busy_message" {
  description = "Custom message for PHP FPM busy worker monitor"
  type        = "string"
  default     = ""
}

variable "php_fpm_busy_threshold_warning" {
  description = "php fpm busy warning threshold"
  default     = 0.8
}

variable "php_fpm_busy_threshold_critical" {
  description = "php fpm busy critical threshold"
  default     = 0.9
}

variable "php_fpm_process_silenced" {
  description = "Groups to mute for PHP FPM process monitor"
  type        = "map"
  default     = {}
}

variable "php_fpm_process_message" {
  description = "Custom message for PHP FPM process monitor"
  type        = "string"
  default     = ""
}
