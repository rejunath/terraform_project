#launch Template
resource "aws_launch_template" "cardapp-launch-template" {
  name = "cardapp-launch-template"
  image_id = "ami-0a695f0d95cefc163"
  instance_type = "t2.micro"
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
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDlJD3zPluPWNqWJ8ux6IiCvyPKuVq6muWesv7z+NYzO9QNt+97wuxvTfT7FzJWe6+4DcCBM21g7N288wUDlBLEzn/5J3DKUlbpTFN0nkAIrdqrCSeAW4kdMjMZcdIDHlQjWz6o5gr/ZGAu0yIt19peSWzGjwOwDXdXq+V5pcwu36sw53CS5PU9q8rgUqCd5nkgYLlHiwFboHY01HQTX+fPD3ExdyffCuty+qzwS8/v+Vw8xxPbpu+PHwCX2Xm0fCG4sVOLWU9w6rodcsM2G81YatYicS0IKJFMzBEx2S6IZY60ZQiWqlpaXfHwpQ/QlOhd1i1gnpHfRoU9NuEH7gFiRkeKOQJI71Fp4r1Rc+QI2v/Ocgwofq+BOVBuuemjHALoj6JGA7fdIaCYJvOitRNSJuJP64Ge3B2zmYOLzkKdeQ40cgmVJwGKXgMzJ5pVjVbcITy6ZRNFxhdDGK+/3G/J0jaH45cnLfCcCyRfeyJizPGdXvelZv8JVa8LNS912FM= reju1@LAPTOP-J6J9IVG5"
}