resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name = "main-vpc"
  }
}

resource "aws_subnet" "public" {
  count      = length(var.public_subnet_cidr_blocks)
  vpc_id     = aws_vpc.main.id
  cidr_block = element(var.public_subnet_cidr_blocks, count.index)

  tags = {
    Name = "public-subnet-${count.index}"
  }
}

resource "aws_subnet" "private" {
  count      = length(var.private_subnet_cidr_blocks)
  vpc_id     = aws_vpc.main.id
  cidr_block = element(var.private_subnet_cidr_blocks, count.index)

  tags = {
    Name = "private-subnet-${count.index}"
  }
}
