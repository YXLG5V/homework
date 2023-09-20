output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.the-vpc.id
}

output "public_subnet_1_id" {
  description = "ID of the public subnet 1"
  value       = aws_subnet.public-subnet-1
}

output "public_subnet_2_id" {
  description = "ID of the public subnet 2"
  value       = aws_subnet.public-subnet-2
}

output "private_subnet_1_id" {
  description = "ID of the private subnet 1"
  value       = aws_subnet.private-subnet-1
}

output "private_subnet_2_id" {
  description = "ID of the private subnet 2"
  value       = aws_subnet.private-subnet-2
}

output "s3_vpc_endpoint_id" {
  description = "ID of the S3 VPC Endpoint"
  value       = aws_vpc_endpoint.s3.id
}