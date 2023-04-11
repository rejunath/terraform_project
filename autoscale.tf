#ASG

resource "aws_autoscaling_group" "cardapp-asg" {
  desired_capacity   = 2
  max_size           = 5
  min_size           = 2
  vpc_zone_identifier = ["${aws_subnet.cardapp-subnet-1a-public.id}","${aws_subnet.cardapp-subnet-1b-public.id}"]

  launch_template {
    id      = aws_launch_template.cardapp-launch-template.id
    version = "$Latest"
  }
  target_group_arns = ["${aws_lb_target_group.cardapp-tg.arn}"]
}