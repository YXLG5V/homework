## Example usage

```terraform
module "base" {  
  source = "./base"  
  region = "eu-central-1"  
  vpc_cidr = "10.0.0.0/16"  
  vpc_name = "demo-vpc"  
  public_subnet_1 = "10.0.1.0/24"  
  public_subnet_2 = "10.0.2.0/24"  
  private_subnet_1 = "10.0.3.0/24"  
  private_subnet_2 = "10.0.4.0/24"  
}
```
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_base"></a> [base](#module\_base) | ./base | n/a |

## Resources

No resources.

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | n/a |