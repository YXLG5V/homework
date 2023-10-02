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
resource "aws_vpc" "the_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  tags = {
    Name = var.vpc_name
  }
}

#Create puplic subnets
resource "aws_subnet" "public_subnet" {
  count = length(var.public_subnets)

  vpc_id            = aws_vpc.the_vpc.id
  cidr_block        = var.public_subnets[count.index]
  availability_zone = var.availability_zones[count.index]
  tags = {
    Name = "public_subnet_${count.index + 1}"
  }
}


#Create private subnets
resource "aws_subnet" "private_subnet" {
  count = length(var.private_subnets)

  vpc_id            = aws_vpc.the_vpc.id
  cidr_block        = var.private_subnets[count.index]
  availability_zone = var.availability_zones[count.index]
  tags = {
    Name = "private_subnet_${count.index + 1}"
  }
}

#Create Internet gateway --> the_vpc
resource "aws_internet_gateway" "the_igw" {
  vpc_id = aws_vpc.the_vpc.id
  tags = {
    Name = "the_igw"
  }
}

#Crate public route table
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.the_vpc.id

  tags = {
    Name = "public_route_table"
  }
}

#Public route table --> IGW
resource "aws_route" "public_route" {
  route_table_id         = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0" # Az internetre irányított forgalom
  gateway_id             = aws_internet_gateway.the_igw.id
}

# public_subnet_1 --> public route table
resource "aws_route_table_association" "public_public_subnet_1_association" {
  subnet_id      = aws_subnet.public_subnet[0].id
  route_table_id = aws_route_table.public_route_table.id
}

# public_subnet_2 --> public route table
resource "aws_route_table_association" "public_subnet_2_association" {
  subnet_id      = aws_subnet.public_subnet[1].id
  route_table_id = aws_route_table.public_route_table.id
}


# Elastic IP for NAT gateway
resource "aws_eip" "nat_gw_eip" {
  domain = "vpc"
}

# NAT gateway with eip in private subnet 1
resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat_gw_eip.id
  subnet_id     = aws_subnet.public_subnet[0].id
  depends_on    = [aws_internet_gateway.the_igw]
}


resource "aws_eip" "nat_gw_eip_2" {
  domain = "vpc"
}

resource "aws_nat_gateway" "nat_gw_2" {
  allocation_id = aws_eip.nat_gw_eip_2.id
  subnet_id     = aws_subnet.public_subnet[1].id
  depends_on    = [aws_internet_gateway.the_igw]
}

# Private route table --> demo VPC
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.the_vpc.id
}

# Private subnets --> private route table
resource "aws_route_table_association" "private_subnet_1_association" {
  subnet_id      = aws_subnet.private_subnet[0].id
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_route_table_association" "private_subnet_2_association" {
  subnet_id      = aws_subnet.private_subnet[1].id
  route_table_id = aws_route_table.private_route_table.id
}

# Private subnets --> NAT gateway --> Internet
resource "aws_route" "private_subnet_route" {
  route_table_id         = aws_route_table.private_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_gw.id
}

resource "aws_route" "private_subnet_route_2" {
  route_table_id         = aws_route_table.private_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_gw_2.id
}

resource "aws_vpc_endpoint" "s3" {
  vpc_id            = aws_vpc.the_vpc.id
  service_name      = "com.amazonaws.${var.region}.s3"
  vpc_endpoint_type = "Gateway"
  route_table_ids   = [aws_route_table.private_route_table.id]

  tags = {
    Name = "s3_${var.vpc_name}"
  }
}