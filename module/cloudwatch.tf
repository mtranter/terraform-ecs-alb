resource "aws_cloudwatch_log_group" "ecs" {
  name = "${var.cloudwatch_ecs_loggroup_name}"
}
resource "aws_cloudwatch_log_group" "apps" {
  name = "${var.cloudwatch_apps_loggroup_name}"
}
