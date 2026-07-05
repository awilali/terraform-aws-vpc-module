# Create public route table and add public route
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0" #Destination is anywhere ie internet
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name        = "${var.project_name}-public-route-table"
    Environment = var.environment
  }
}

# Associate public subnet az1 to "public route table" above
resource "aws_route_table_association" "public_subnet_az1_rt_association" {
  subnet_id      = aws_subnet.public_subnet_az1.id
  route_table_id = aws_route_table.public_route_table.id
}

# Associate public subnet az2 to "public route table" above
resource "aws_route_table_association" "public_subnet_az2_rt_association" {
  subnet_id      = aws_subnet.public_subnet_az2.id
  route_table_id = aws_route_table.public_route_table.id
}


# Private Route Table for private app subnets
resource "aws_route_table" "private_app_route_table_az1" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_az1.id
  }

  tags = {
    Name        = "${var.project_name}-private-app-route-table-az1"
    Environment = var.environment
  }
}

# Private app Route Table Associations
resource "aws_route_table_association" "private_app_subnet_az1_rt_association" {
  subnet_id      = aws_subnet.private_app_subnet_az1.id
  route_table_id = aws_route_table.private_app_route_table_az1.id
}


# Private Route Table for private app subnets
resource "aws_route_table" "private_app_route_table_az2" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_az2.id
  }

  tags = {
    Name        = "${var.project_name}-private-app-route-table-az2"
    Environment = var.environment
  }
}
resource "aws_route_table_association" "private_app_subnet_az2_rt_association" {
  subnet_id      = aws_subnet.private_app_subnet_az2.id
  route_table_id = aws_route_table.private_app_route_table_az2.id
}


# Private data Route Table for private data subnets
resource "aws_route_table" "private_data_route_table" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name        = "${var.project_name}-private-data-route-table"
    Environment = var.environment
  }
}


# Private Route Table Associations
resource "aws_route_table_association" "private_data_subnet_az1_rt_association" {
  subnet_id      = aws_subnet.private_data_subnet_az1.id
  route_table_id = aws_route_table.private_data_route_table.id
}

resource "aws_route_table_association" "private_data_subnet_az2_rt_association" {
  subnet_id      = aws_subnet.private_data_subnet_az2.id
  route_table_id = aws_route_table.private_data_route_table.id
}
