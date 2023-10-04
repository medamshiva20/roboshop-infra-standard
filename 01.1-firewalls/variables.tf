variable "project_name" {
  default = "roboshop"
}

variable "env" {
  default = "Dev"
}

variable "common_tags" {
  default = {
    project = "roboshop"
    #Component = "Firewalls"
    Environment = "DEV"
    Terraform = "true"
  }
}