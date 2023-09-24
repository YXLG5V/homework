terraform {
  required_version = "~> 1.5.0"

  required_providers {
    aws = {
      version = "5.17.0"
      source  = "hashicorp/aws"
    }
  }
}

# Cretate VPC
resource "aws_vpc" "the-vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  tags = {
    Name = var.vpc_name
  }
}

#Create private subnets
resource "aws_subnet" "private-subnet-1" {
  vpc_id            = aws_vpc.the-vpc.id
  cidr_block        = var.private_subnet_1
  availability_zone = "eu-central-1a"
  tags = {
    Name = "private-subnet-1"
  }
}

resource "aws_subnet" "private-subnet-2" {
  vpc_id            = aws_vpc.the-vpc.id
  cidr_block        = var.private_subnet_2
  availability_zone = "eu-central-1b"
  tags = {
    Name = "private-subnet-2"
  }
}

#Create puplic subnets
resource "aws_subnet" "public-subnet-1" {
  vpc_id            = aws_vpc.the-vpc.id
  cidr_block        = var.public_subnet_1
  availability_zone = "eu-central-1a"
  tags = {
    Name = "public-subnet-1"
  }
}

resource "aws_subnet" "public-subnet-2" {
  vpc_id            = aws_vpc.the-vpc.id
  cidr_block        = var.public_subnet_2
  availability_zone = "eu-central-1b"
  tags = {
    Name = "public-subnet-2"
  }
}

#Create Internet gateway --> the-vpc
resource "aws_internet_gateway" "the-igw" {
  vpc_id = aws_vpc.the-vpc.id
  tags = {
    Name = "the-IGW"
  }
}

#Crate public route table
resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.the-vpc.id

  tags = {
    Name = "public-route-table"
  }
}

#Public route table --> IGW
resource "aws_route" "public-route" {
  route_table_id         = aws_route_table.public-route-table.id
  destination_cidr_block = "0.0.0.0/0" # Az internetre irányított forgalom
  gateway_id             = aws_internet_gateway.the-igw.id
}

# Public-subnet-1 --> public route table
resource "aws_route_table_association" "public-subnet-1-association" {
  subnet_id      = aws_subnet.public-subnet-1.id
  route_table_id = aws_route_table.public-route-table.id
}

# public-subnet-2 --> public route table
resource "aws_route_table_association" "public-subnet-2-association" {
  subnet_id      = aws_subnet.public-subnet-2.id
  route_table_id = aws_route_table.public-route-table.id
}


# Elastic IP for NAT gateway
resource "aws_eip" "nat-gw-eip" {
  domain = "vpc"
}

# NAT gateway with eip in private subnet 1
resource "aws_nat_gateway" "nat-gw" {
  allocation_id = aws_eip.nat-gw-eip.id
  subnet_id     = aws_subnet.private-subnet-1.id
  depends_on    = [aws_internet_gateway.the-igw]
}


resource "aws_eip" "nat-gw-eip-2" {
  domain = "vpc"
}

resource "aws_nat_gateway" "nat-gw-2" {
  allocation_id = aws_eip.nat-gw-eip-2.id
  subnet_id     = aws_subnet.private-subnet-2.id
  depends_on    = [aws_internet_gateway.the-igw]
}

# Private route table --> demo VPC
resource "aws_route_table" "private-route-table" {
  vpc_id = aws_vpc.the-vpc.id
}

# Private subnets --> private route table
resource "aws_route_table_association" "private-subnet-1-association" {
  subnet_id      = aws_subnet.private-subnet-1.id
  route_table_id = aws_route_table.private-route-table.id
}

resource "aws_route_table_association" "private-subnet-2-association" {
  subnet_id      = aws_subnet.private-subnet-2.id
  route_table_id = aws_route_table.private-route-table.id
}

# Private subnets --> NAT gateway --> Internet
resource "aws_route" "private-subnet-route" {
  route_table_id         = aws_route_table.private-route-table.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat-gw.id
}

resource "aws_route" "private-subnet-route-2" {
  route_table_id         = aws_route_table.private-route-table.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat-gw-2.id
}

resource "aws_vpc_endpoint" "s3" {
  vpc_id            = aws_vpc.the-vpc.id
  service_name      = "com.amazonaws.${var.region}.s3"
  vpc_endpoint_type = "Gateway"
  route_table_ids   = [aws_route_table.private-route-table.id]

  tags = {
    Name = "s3-${var.vpc_name}"
  }
}