# 1. Creare una VPC di Test
resource "aws_vpc" "vpc-test" {
  cidr_block = "${var.vpc_cidr}"
  tags = {
    Name = "vpc-${var.environment}"
    Environment = "${var.environment}"
   }
}

# 2. Creazione InternetGateway di test
resource "aws_internet_gateway" "internet-gateway-test" {
  vpc_id = aws_vpc.vpc-test.id

  tags = {
    Name = "internet-gateway-${var.environment}"
    Environment = "${var.environment}"
  }
}

# 3. Creazione RouteTable con InternetGateway
resource "aws_route_table" "routetable-public-test" {
  vpc_id = aws_vpc.vpc-test.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet-gateway-test.id
  }

  tags = {
    Name = "routetable-public-${var.environment}"
    Environment = "${var.environment}"
  }
}

# 4. Creazione Subnet public1
resource "aws_subnet" "subnet1" {
  vpc_id     = aws_vpc.vpc-test.id
  cidr_block = "${var.subnet1_cidr}"
  availability_zone = "eu-central-1a"
  tags = {
    Name = "subnet1-${var.environment}"
    Environment = "${var.environment}"
  }
}

# 5. Creazione Subnet public2
resource "aws_subnet" "subnet2" {
  vpc_id     = aws_vpc.vpc-test.id
  cidr_block = "${var.subnet2_cidr}"
  availability_zone = "eu-central-1b"
  tags = {
    Name = "subnet2-${var.environment}"
    Environment = "${var.environment}"
  }
}

output "vpc_id" {
  value = "${aws_vpc.vpc-test.id}"
}

output "subnet1_id" {
  value = "${aws_subnet.subnet1.id}"
}