resource "aws_instance" "bastion_server" {
  ami           = var.ami
  instance_type = "t2.micro"
  key_name = aws_key_pair.key_pair.key_name
  subnet_id = module.iti.public1_id
  vpc_security_group_ids = [aws_security_group.public_security_group.id]
  provisioner "local-exec"{
    command = "echo ${self.public_ip}"

  }
  tags = {
    Name = "bastion_server"
  }
}

resource "aws_instance" "application" {
  ami           = var.ami
  instance_type = "t2.micro"
  key_name = aws_key_pair.key_pair.key_name
  subnet_id = module.iti.public1_id
  vpc_security_group_ids = [aws_security_group.private_security_group.id]

  tags = {
    Name = "nginx_sever"
  }
}