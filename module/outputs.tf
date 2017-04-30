output "alb_id" {
  value = "${aws_alb.ecs-alb.id}"
}

output "alb_arn" {
  value = "${aws_alb.ecs-alb.arn}"
}

output "alb_arn_suffix" {
  value = "${aws_alb.ecs-alb.arn_suffix}"
}

output "alb_dns_name" {
  value = "${aws_alb.ecs-alb.dns_name}"
}

output "alb_canonical_hosted_zone_id" {
  value = "${aws_alb.ecs-alb.canonical_hosted_zone_id}"
}

output "alb_zone_id" {
  value = "${aws_alb.ecs-alb.zone_id}"
}

output "ecs_cluster_id" {
  value = "${aws_ecs_cluster.main.id}"
}

output "vpc_id" {
  value = "${aws_vpc.ecs-alb.id}"
}

output "service_iam_role_arn" {
  value = "${aws_iam_role.ecs_service.arn}"
}
