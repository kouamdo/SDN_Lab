resource "aws_route_table" "pub_table_route" {
  vpc_id = aws_vpc.core5g_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    name = "pub_table_route"
  }
}

resource "aws_route_table" "priv_table_route" {
  vpc_id = aws_vpc.core5g_vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_nat_gateway.nat_gw.id
    }

  tags = {
    name = "priv_table_route"
  }
}

resource "aws_route_table_association" "pub_rt" {
  subnet_id = aws_subnet.pub_subnet.id
  route_table_id = aws_route_table.pub_table_route.id
}

resource "aws_route_table_association" "priv_k8s1_rt" {
    subnet_id = aws_subnet.subnet_k8s_1.id
    route_table_id = aws_route_table.priv_table_route.id
}

resource "aws_route_table_association" "subnet_dp_2_rt" {
    subnet_id = aws_subnet.subnet_dp_2.id
    route_table_id = aws_route_table.priv_table_route.id
}

resource "aws_route_table_association" "subnet_dp_1_rt" {
    subnet_id = aws_subnet.subnet_dp_1.id
    route_table_id = aws_route_table.priv_table_route.id
}

resource "aws_route_table_association" "subnet_sig_1_rt" {
    subnet_id = aws_subnet.subnet_sig_1.id
    route_table_id = aws_route_table.priv_table_route.id
}

resource "aws_route_table_association" "subnet_sig_2_rt" {
    subnet_id = aws_subnet.subnet_sig_2.id
    route_table_id = aws_route_table.priv_table_route.id
}