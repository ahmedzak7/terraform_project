resource "aws_security_group" "private_security_group" {
  name        = "private"
  description = "Allow ssh traffic"
  vpc_id      = module.iti.vpc_id

  ingress {
    description = "ssh from my machine"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.cidr]
  }

  ingress {
    description = "to Web"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = [var.cidr]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "private"
  }
}

resource "aws_security_group" "public_security_group" {
  name        = "public"
  description = "Allow ssh traffic"
  vpc_id      = module.iti.vpc_id

#inbound
  ingress {
    description = "ssh from my machine"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.cidr]
  }
  #outbound
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "public"
  }
}