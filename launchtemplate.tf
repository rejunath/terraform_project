#launch Template
resource "aws_launch_template" "cardapp-launch-template" {
  name = "cardapp-launch-template"
  image_id = "${var.ami}"
  instance_type = "${var.instance-type}"
  key_name = aws_key_pair.cardapp-key-pair.id
  vpc_security_group_ids = ["${aws_security_group.sg-asg-instance.id}"]

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "cardapp"
    }
  }

  user_data = filebase64("data.sh")
}

#key pair
resource "aws_key_pair" "cardapp-key-pair" {
  key_name   = "cardapp-key-pair"
  public_key = "${var.unique-key}"
}