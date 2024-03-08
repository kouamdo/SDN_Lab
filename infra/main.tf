#Create VPC
resource "aws_vpc" "core5g_vpc" {
  cidr_block = "10.2.0.0/16"

  tags = {
    name = "core5g_vpc"
  }
}

#Create igw

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.core5g_vpc.id
  tags = {
    name = "igw_core5g"
  }
}

#----create nat_gw------

resource "aws_nat_gateway" "nat_gw" {
  subnet_id = aws_subnet.pub_subnet.id
  allocation_id = aws_eip.eip_nat.id

  tags = {
    name = "nat_gw"
  }

  depends_on = [ aws_internet_gateway.igw , aws_eip.eip_nat ]
}

#create eip for nat_gw
resource "aws_eip" "eip_nat" {
  vpc = true
}

output "nat_gateway_ip" {
  value = aws_eip.eip_nat.public_ip
}

#----


#----Create subnets----

#Create subnet for signaling
resource "aws_subnet" "subnet_sig_1" {
  vpc_id = aws_vpc.core5g_vpc.id
  cidr_block = var.subnet_sig_1
  availability_zone = var.av-1

  tags = {
    name = "signaling_subnet1"
  }
}
resource "aws_subnet" "subnet_sig_2" {
  vpc_id = aws_vpc.core5g_vpc.id
  cidr_block = var.subnet_sig_2
  availability_zone = var.av-2

  tags = {
    name = "signaling_subnet2"
  }
}

#Create subnet for data_plan
resource "aws_subnet" "subnet_dp_1" {
  vpc_id = aws_vpc.core5g_vpc.id
  cidr_block = var.subnet_dp_1
  availability_zone = var.av-1

  tags = {
    name = "dp_subnet1"
  }
}
resource "aws_subnet" "subnet_dp_2" {
  vpc_id = aws_vpc.core5g_vpc.id
  cidr_block = var.subnet_dp_2
  availability_zone = var.av-2

  tags = {
    name = "dp_subnet2"
  }
}

#Create subnet for k8s
resource "aws_subnet" "subnet_k8s_1" {
  vpc_id = aws_vpc.core5g_vpc.id
  cidr_block = var.subnet_k8s_1
  availability_zone = var.av-1

  tags = {
    name = "k8s_subnet"
  }
}

#Create public subnet
resource "aws_subnet" "pub_subnet" {
  vpc_id = aws_vpc.core5g_vpc.id
  cidr_block = var.subnet_pub
  availability_zone = var.av-1

  tags = {
    name = "pub_subnet"
  }
}
