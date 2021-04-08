resource "aws_vpc" "iti" {
  cidr_block       = var.cidr
  instance_tenancy = "default"

  tags = {
    Name = var.name
  }
}