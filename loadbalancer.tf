# ALB TG with ASG

resource "aws_lb_target_group" "cardapp-tg" {
  name     = "Cardapp-TG"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.cardapp-vpc.id
}


# LB Listener with ASG

resource "aws_lb_listener" "cardapp-listener" {
  load_balancer_arn = aws_lb.cardapp-lb.arn
  port              = "80"
  protocol          = "HTTP"
 
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.cardapp-tg.id
  }
}


#load balancer with ASG

resource "aws_lb" "cardapp-lb" {
  name               = "cardapp-LB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["${aws_security_group.sg-asg-instance.id}"]
  subnets            = ["${aws_subnet.cardapp-subnet-1a-public.id}","${aws_subnet.cardapp-subnet-1b-public.id}"]

}