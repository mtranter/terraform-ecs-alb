variable "ecs_cluster_name" {
  default = "ecs-alb-cluster"
}

variable "with_cloudwatch" {
  default = "true"
}

variable "alb_name" {
  default = "ecs-alb-front-end"
}

variable "instance_name_prefix" {
  default = ""
}

variable "ecs-alb-log-bucket" {
}

variable "min_instances" {
  default = 2
}

variable "max_instances" {
    default = 2
}

variable "desired_instances" {
    default = 2
}

# <crit>|<error>|<warn>|<info>|<debug>
variable "ecs_log_level" {
  default = "info"
}

variable "key_name" {}

variable "aws_region" {}

variable "images" {
  type = "map"

  default = {
    us-east-1 = "ami-275ffe31"
    us-east-2 = "ami-62745007"
    us-west-1 = "ami-689bc208"
    us-west-2 = "ami-62d35c02"
    eu-west-1 = "ami-95f8d2f3"
    eu-west-2 = "ami-bf9481db"
    eu-central-1 = "ami-085e8a67"
    ap-northeast-1 = "ami-f63f6f91"
    ap-southeast-1 = "ami-b4ae1dd7"
    ap-southeast-2 = "ami-fbe9eb98"
    ca-central-1 = "ami-ee58e58a"
  }
}

variable "instance_type" {
  default     = "t2.small"
  description = "AWS instance type"
}

variable "image_id" {
  default = ""
}

variable "cloudwatch_ecs_loggroup_name" {
  default = "ecs-alb-group/ecs-agent"
}

variable "cloudwatch_apps_loggroup_name" {
  default = "ecs-alb-group/apps"
}

variable "vpc_cidr_block" {
  default = "10.10.0.0/16"
}

variable "az_count" {
    default = ""
}

variable "admin_cidr_ingress" {
  description = "CIDR to allow tcp/22 ingress to EC2 instance"
}

variable "launch_config_name_prefix" {
  default = "ecs-alb-lc"
}
