resource "aws_autoscaling_group" "ecs-alb-asg" {
  name                 = "ecs-alb-asg"
  vpc_zone_identifier  = ["${aws_subnet.ecs-alb.*.id}"]
  min_size             = "${var.min_instances}"
  max_size             = "${var.max_instances}"
  desired_capacity     = "${var.desired_instances}"
  launch_configuration = "${aws_launch_configuration.ecs-alb-lc.name}"
}

data "template_file" "ecs_config" {
  template = "${file("${path.module}/userdata.sh")}"

  vars {
    ecs_cluster_name   = "${aws_ecs_cluster.main.name}"
    ecs_log_level      = "${var.ecs_log_level}"
    ecs_agent_version  = "latest"
  }
}

resource "aws_launch_configuration" "ecs-alb-lc" {
  security_groups = [
    "${aws_security_group.instance_sg.id}"
  ]

  name_prefix                 = "${var.instance_name_prefix}"
  key_name                    = "${var.key_name}"
  image_id                    = "${coalesce(var.image_id, var.images[var.aws_region])}"
  instance_type               = "${var.instance_type}"
  iam_instance_profile        = "${aws_iam_instance_profile.ecs-alb-app.name}"
  user_data                   = "${data.template_file.ecs_config.rendered}"
  associate_public_ip_address = true

  lifecycle {
    create_before_destroy = true
  }
}
