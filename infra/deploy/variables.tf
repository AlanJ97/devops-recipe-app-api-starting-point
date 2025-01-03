variable "prefix" {
  description = "Prefix for resources in AWS"
  default     = "raa"
}

variable "project" {
  description = "Project name for tagging resources"
  default     = "recipe-app-api"
}

variable "contact" {
  description = "Contact email for tagging resources"
  default     = "alan02n@gmail.com"
}

variable "db_username" {
  description = "Userame for the recipe api database"
  default     = "recipeapp"
}

variable "db_password" {
  description = "Password for the Terraform database"

}

variable "ecr_proxy_image" {
  description = "Path to the ECR Repo with the proxy image"

}

variable "ecr_app_image" {
  description = "Path to the ECR Repo with the app image"

}

variable "django_secret_key" {
  description = "Secret key for Djnago"
}

variable "dns_zone_name" {
  description = "Name of the Route53 DNS zone"
  default     = "alandevopstests.com"
}

variable "subdomain" {
  description = "Subdomain for each environment"
  type        = map(string)

  default = {
    prod    = "api"
    staging = "api.staging"
    dev     = "api.dev"
  }
}