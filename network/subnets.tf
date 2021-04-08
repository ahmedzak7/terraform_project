resource "aws_subnet" "public1" {
  vpc_id     = aws_vpc.iti.id
  cidr_block = var.public1_subnet_cidr
  map_public_ip_on_launch = "true" #make ay 7ga ttcreate in public take public ip by def
  availability_zone = var.az1

  tags = {
    Name = "public1"
  }
}

resource "aws_subnet" "public2" {
  vpc_id     = aws_vpc.iti.id
  cidr_block = var.public2_subnet_cidr
  availability_zone = var.az2
  map_public_ip_on_launch = "true"

  tags = {
    Name = "public2"
  }
}
resource "aws_subnet" "private1" {
  vpc_id     = aws_vpc.iti.id
  cidr_block = var.private1_subnet_cidr
  availability_zone = var.az1

  tags = {
    Name = "private1"
  }
}

resource "aws_subnet" "private2" {
  vpc_id     = aws_vpc.iti.id
  cidr_block = var.private2_subnet_cidr
  availability_zone = var.az2

  tags = {
    Name = "private2"
  }
}