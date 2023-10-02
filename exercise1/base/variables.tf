variable "region" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "vpc_name" {
  type = string
}


variable "public_subnets" {
  description = "public_subnets"
  type        = list(string)
}

variable "private_subnets" {
  description = "private_subnets"
  type        = list(string)
}

variable "availability_zones" {
  description = "Availability zones"
  type        = list(string)
}
