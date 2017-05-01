***Terraform ECS & ALB Module***

Usage:
```
module "ecs_alb" {
  source                  = "github.com/mtranter/terraform-ecs-alb?ref=v0.14//module"
  ecs-alb-log-bucket      = "mtranter.io"
  key_name                = "my-key"
  aws_region              = "eu-west-1"
}
```
