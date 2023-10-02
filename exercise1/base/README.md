## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.5.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.17.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.17.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_eip.nat_gw_eip](https://registry.terraform.io/providers/hashicorp/aws/5.17.0/docs/resources/eip) | resource |
| [aws_eip.nat_gw_eip_2](https://registry.terraform.io/providers/hashicorp/aws/5.17.0/docs/resources/eip) | resource |
| [aws_internet_gateway.the_igw](https://registry.terraform.io/providers/hashicorp/aws/5.17.0/docs/resources/internet_gateway) | resource |
| [aws_nat_gateway.nat_gw](https://registry.terraform.io/providers/hashicorp/aws/5.17.0/docs/resources/nat_gateway) | resource |
| [aws_nat_gateway.nat_gw_2](https://registry.terraform.io/providers/hashicorp/aws/5.17.0/docs/resources/nat_gateway) | resource |
| [aws_route.private_subnet_route](https://registry.terraform.io/providers/hashicorp/aws/5.17.0/docs/resources/route) | resource |
| [aws_route.private_subnet_route_2](https://registry.terraform.io/providers/hashicorp/aws/5.17.0/docs/resources/route) | resource |
| [aws_route.public_route](https://registry.terraform.io/providers/hashicorp/aws/5.17.0/docs/resources/route) | resource |
| [aws_route_table.private_route_table](https://registry.terraform.io/providers/hashicorp/aws/5.17.0/docs/resources/route_table) | resource |
| [aws_route_table.public_route_table](https://registry.terraform.io/providers/hashicorp/aws/5.17.0/docs/resources/route_table) | resource |
| [aws_route_table_association.private_subnet_1_association](https://registry.terraform.io/providers/hashicorp/aws/5.17.0/docs/resources/route_table_association) | resource |
| [aws_route_table_association.private_subnet_2_association](https://registry.terraform.io/providers/hashicorp/aws/5.17.0/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public_public_subnet_1_association](https://registry.terraform.io/providers/hashicorp/aws/5.17.0/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public_subnet_2_association](https://registry.terraform.io/providers/hashicorp/aws/5.17.0/docs/resources/route_table_association) | resource |
| [aws_subnet.private_subnet](https://registry.terraform.io/providers/hashicorp/aws/5.17.0/docs/resources/subnet) | resource |
| [aws_subnet.public_subnet](https://registry.terraform.io/providers/hashicorp/aws/5.17.0/docs/resources/subnet) | resource |
| [aws_vpc.the_vpc](https://registry.terraform.io/providers/hashicorp/aws/5.17.0/docs/resources/vpc) | resource |
| [aws_vpc_endpoint.s3](https://registry.terraform.io/providers/hashicorp/aws/5.17.0/docs/resources/vpc_endpoint) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_availability_zones"></a> [availability\_zones](#input\_availability\_zones) | Availability zones | `list(string)` | n/a | yes |
| <a name="input_private_subnets"></a> [private\_subnets](#input\_private\_subnets) | private\_subnets | `list(string)` | n/a | yes |
| <a name="input_public_subnets"></a> [public\_subnets](#input\_public\_subnets) | public\_subnets | `list(string)` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | n/a | yes |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | n/a | `string` | n/a | yes |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_private_subnet_1_id"></a> [private\_subnet\_1\_id](#output\_private\_subnet\_1\_id) | ID of the private subnet 1 |
| <a name="output_private_subnet_2_id"></a> [private\_subnet\_2\_id](#output\_private\_subnet\_2\_id) | ID of the private subnet 2 |
| <a name="output_public_subnet_1_id"></a> [public\_subnet\_1\_id](#output\_public\_subnet\_1\_id) | ID of the public subnet 1 |
| <a name="output_public_subnet_2_id"></a> [public\_subnet\_2\_id](#output\_public\_subnet\_2\_id) | ID of the public subnet 2 |
| <a name="output_s3_vpc_endpoint_id"></a> [s3\_vpc\_endpoint\_id](#output\_s3\_vpc\_endpoint\_id) | ID of the S3 VPC Endpoint |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | ID of the VPC |