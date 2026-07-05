
# Internet Gateway block
# IGW = gives VPC internet entry/exit point
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name        = "${var.project_name}-internet-gateway"
    Environment = var.environment
  }
}

# Static Elastic IP attached to the NAT Gateway so private app subnets can access the internet
#Static ip address AZ1
resource "aws_eip" "nat_static_ip_az1" {
  domain = "vpc"

  tags = {
    Name        = "${var.project_name}-static-ip-address-az1"
    Environment = var.environment
  }
}

#Static ip address AZ2
resource "aws_eip" "nat_static_ip_az2" {
  domain = "vpc"

  tags = {
    Name        = "${var.project_name}-static-ip-address-az2"
    Environment = var.environment
  }
}

#NAT Gateway az1 = allows private subnets outbound internet only
resource "aws_nat_gateway" "nat_az1" {
  allocation_id = aws_eip.nat_static_ip_az1.id
  subnet_id     = aws_subnet.public_subnet_az1.id

  depends_on = [
    aws_internet_gateway.igw, #it cant access without the internet gateway
    aws_eip.nat_static_ip_az1 #it needs the public ip
  ]

  tags = {
    Name        = "${var.project_name}-nat-gateway-az1"
    Environment = var.environment
  }
}

#NAT Gateway az2 = allows private subnets outbound internet only
resource "aws_nat_gateway" "nat_az2" {
  allocation_id = aws_eip.nat_static_ip_az2.id
  subnet_id     = aws_subnet.public_subnet_az2.id

  depends_on = [
    aws_internet_gateway.igw, #it cant access without the internet gateway
    aws_eip.nat_static_ip_az2 #it needs the public ip
  ]

  tags = {
    Name        = "${var.project_name}-nat-gateway-az2"
    Environment = var.environment
  }
}
