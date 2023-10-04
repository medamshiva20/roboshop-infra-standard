variable "project_name" {
  default = "roboshop"
}

variable "env" {
  default = "Dev"
}

variable "common_tags" {
  default = {
    project = "roboshop"
    Component = "payment"
    Environment = "DEV"
    Terraform = "true"
  }
}

variable "target_group_port" {
  default = 8080
}

variable "target_group_protocol" {
  default = "HTTP"
}

variable "launch_template_tags" {
  default = [
    {
       resource_type = "instance"

    tags = {
      Name = "payment"
    }
},
{
  resource_type = "volume"

    tags = {
      Name = "payment"
    }
}
  ]
}

variable "autoscaling_tags" {
  default = [
    {
      key                 = "Name"
      value               = "payment"
      propagate_at_launch = true
    },
    {
      key                 = "Project"
      value               = "Roboshop"
      propagate_at_launch = true
    }
  ]
}

variable "host_header" {
  default = "payment.app.medamdevops.online"
}