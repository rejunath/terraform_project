variable "region" {
    type = string
    default = "us-east-2"
}

variable "ami" {
    type = string
    default = "ami-0a695f0d95cefc163"
}

variable "instance-type" {
    type = string
    default = "t2.micro"
}

variable "unique-key" {
    type = string
    default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDlJD3zPluPWNqWJ8ux6IiCvyPKuVq6muWesv7z+NYzO9QNt+97wuxvTfT7FzJWe6+4DcCBM21g7N288wUDlBLEzn/5J3DKUlbpTFN0nkAIrdqrCSeAW4kdMjMZcdIDHlQjWz6o5gr/ZGAu0yIt19peSWzGjwOwDXdXq+V5pcwu36sw53CS5PU9q8rgUqCd5nkgYLlHiwFboHY01HQTX+fPD3ExdyffCuty+qzwS8/v+Vw8xxPbpu+PHwCX2Xm0fCG4sVOLWU9w6rodcsM2G81YatYicS0IKJFMzBEx2S6IZY60ZQiWqlpaXfHwpQ/QlOhd1i1gnpHfRoU9NuEH7gFiRkeKOQJI71Fp4r1Rc+QI2v/Ocgwofq+BOVBuuemjHALoj6JGA7fdIaCYJvOitRNSJuJP64Ge3B2zmYOLzkKdeQ40cgmVJwGKXgMzJ5pVjVbcITy6ZRNFxhdDGK+/3G/J0jaH45cnLfCcCyRfeyJizPGdXvelZv8JVa8LNS912FM= reju1@LAPTOP-J6J9IVG5"
}

variable "desired-instance-count" {
    type = number
    default = 2 
}

variable "max-instance-count" {
    type = number
    default = 5  
}

variable "min-instance-count" {
    type = number
    default = 2  
}