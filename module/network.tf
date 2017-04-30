data "aws_availability_zones" "available" {}

resource "aws_vpc" "ecs-alb" {
  cidr_block = "${var.vpc_cidr_block}"
}

resource "aws_subnet" "ecs-alb" {
  count             = "${coalesce(var.az_count, length(data.aws_availability_zones.available.names))}"
  cidr_block        = "${cidrsubnet(aws_vpc.ecs-alb.cidr_block, 8, count.index)}"
  availability_zone = "${data.aws_availability_zones.available.names[count.index]}"
  vpc_id            = "${aws_vpc.ecs-alb.id}"
}

resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.ecs-alb.id}"
}

resource "aws_route_table" "r" {
  vpc_id = "${aws_vpc.ecs-alb.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }
}

resource "aws_route_table_association" "a" {
  count          = "${coalesce(var.az_count, length(data.aws_availability_zones.available.names))}"
  subnet_id      = "${element(aws_subnet.ecs-alb.*.id, count.index)}"
  route_table_id = "${aws_route_table.r.id}"
}
