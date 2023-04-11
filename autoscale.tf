#ASG

resource "aws_autoscaling_group" "cardapp-asg" {
  desired_capacity   = "${var.desired-instance-count}"
  max_size           = "${var.max-instance-count}"
  min_size           = "${var.min-instance-count}"
  vpc_zone_identifier = ["${aws_subnet.cardapp-subnet-1a-public.id}","${aws_subnet.cardapp-subnet-1b-public.id}"]

  launch_template {
    id      = aws_launch_template.cardapp-launch-template.id
    version = "$Latest"
  }
  target_group_arns = ["${aws_lb_target_group.cardapp-tg.arn}"]
}