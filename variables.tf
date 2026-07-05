variable "vpc_cidr" {
  type        = string
  description = "VPC cidr block"
}

variable "region" {
  type        = string
  description = "VPC cidr block"
}

variable "environment" {
  type        = string
  description = "Environment"
}
variable "project_name" {
  type        = string
  description = "Name of the project"
}
variable "public_subnet_az1_cidr" {
  type        = string
  description = "CIDR block for the public subnet in AZ1"
}
variable "public_subnet_az2_cidr" {
  type        = string
  description = "CIDR block for the public subnet in AZ2"
}
variable "private_app_subnet_az1_cidr" {
  type        = string
  description = "CIDR block for the private app subnet in AZ1"
}
variable "private_app_subnet_az2_cidr" {
  type        = string
  description = "CIDR block for the private app subnet in AZ2"
}
variable "private_data_subnet_az1_cidr" {
  type        = string
  description = "CIDR block for the private data subnet in AZ1"
}
variable "private_data_subnet_az2_cidr" {
  type        = string
  description = "CIDR block for the private data subnet in AZ2"
}
