# Creating the VPC 

resource "aws_vpc" "cardapp-vpc" {
  cidr_block       = "10.10.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "cardapp-VPC"
  }
}


#creating subnet
#public subnet in us-east-2a
resource "aws_subnet" "cardapp-subnet-1a-public" {
  vpc_id     = aws_vpc.cardapp-vpc.id
  cidr_block = "10.10.0.0/24"
  availability_zone = "us-east-2a"
  map_public_ip_on_launch = true

  tags = {
    Name = "Cardapp-subnet-1A-public"
  }
}

#private subnet in us-east-2a
resource "aws_subnet" "cardapp-subnet-1a-private" {
  vpc_id     = aws_vpc.cardapp-vpc.id
  cidr_block = "10.10.1.0/24"
  availability_zone = "us-east-2a"

  tags = {
    Name = "Cardapp-subnet-1A-private"
  }
}


#public subnet in us-east-2b
resource "aws_subnet" "cardapp-subnet-1b-public" {
  vpc_id     = aws_vpc.cardapp-vpc.id
  cidr_block = "10.10.2.0/24"
  availability_zone = "us-east-2b"
  map_public_ip_on_launch = true

  tags = {
    Name = "Cardapp-subnet-1B-public"
  }
}

#private subnet in us-east-2b
resource "aws_subnet" "cardapp-subnet-1b-private" {
  vpc_id     = aws_vpc.cardapp-vpc.id
  cidr_block = "10.10.3.0/24"
  availability_zone = "us-east-2b"

  tags = {
    Name = "Cardapp-subnet-1B-private"
  }
}

# Internet GW

resource "aws_internet_gateway" "cardapp-igw" {
  vpc_id = aws_vpc.cardapp-vpc.id

  tags = {
    Name = "cardapp-IGW"
  }
}

# Route Table

resource "aws_route_table" "cardapp-RT" {
  vpc_id = aws_vpc.cardapp-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.cardapp-igw.id
  }

  tags = {
    Name = "cardapp-RT"
  }
}

resource "aws_route_table_association" "webapp-rt-association-public-subnet-1a" {
  subnet_id      = aws_subnet.cardapp-subnet-1a-public.id
  route_table_id = aws_route_table.cardapp-RT.id
}


resource "aws_route_table_association" "webapp-rt-association-public-subnet-1b" {
  subnet_id      = aws_subnet.cardapp-subnet-1b-public.id
  route_table_id = aws_route_table.cardapp-RT.id
}