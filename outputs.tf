output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "vpc_tag" {
  value = aws_vpc.vpc.tags
}

output "internet_gateway_id" {
  value = aws_internet_gateway.igw.id
}

output "nat_az1_id" {
  value = aws_nat_gateway.nat_az1.id
}

output "nat_az2_id" {
  value = aws_nat_gateway.nat_az2.id
}

# public subnets outputs
output "public_subnet_az1_id" {
  value = aws_subnet.public_subnet_az1.id
}

output "public_subnet_az2_id" {
  value = aws_subnet.public_subnet_az2.id
}

# private app subnets outputs
output "private_app_subnet_az1_id" {
  value = aws_subnet.private_app_subnet_az1.id
}

output "private_app_subnet_az2_id" {
  value = aws_subnet.private_app_subnet_az2.id
}

# private data subnets outputs
output "private_data_subnet_az1_id" {
  value = aws_subnet.private_data_subnet_az1.id
}

output "private_data_subnet_az2_id" {
  value = aws_subnet.private_data_subnet_az2.id
}

