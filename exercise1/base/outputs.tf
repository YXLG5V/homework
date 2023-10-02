output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.the_vpc.id
}

output "public_subnet_1_id" {
  description = "ID of the public subnet 1"
  value       = aws_subnet.public_subnet[0]
}

output "public_subnet_2_id" {
  description = "ID of the public subnet 2"
  value       = aws_subnet.public_subnet[1]
}

output "private_subnet_1_id" {
  description = "ID of the private subnet 1"
  value       = aws_subnet.private_subnet[0]
}

output "private_subnet_2_id" {
  description = "ID of the private subnet 2"
  value       = aws_subnet.private_subnet[1]
}

output "s3_vpc_endpoint_id" {
  description = "ID of the S3 VPC Endpoint"
  value       = aws_vpc_endpoint.s3.id
}