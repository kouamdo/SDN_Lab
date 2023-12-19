resource "aws_network_acl" "pub_sub_acl" {
    vpc_id = aws_vpc.core5g_vpc.id
    subnet_ids = [ aws_subnet.pub_subnet.id ]

    ingress {
            rule_no = 200
            to_port    = 22
            from_port = 22
            protocol = "tcp"
            action     = "allow"
            cidr_block = "0.0.0.0/0"
        }
    ingress {
            protocol = "tcp"
            rule_no = 300
            from_port = 0
            to_port    = 6553
            action     = "allow"
            cidr_block = "0.0.0.0/0"
        }

    egress {
        protocol   = "tcp"
        rule_no    = 300
        from_port  = 0
        to_port    = 65535
        action     = "allow"
        cidr_block = "0.0.0.0/0"
    }
    egress {
        protocol   = "tcp"
        rule_no    = 200
        from_port  = 80
        to_port    = 80
        action     = "allow"
        cidr_block = "0.0.0.0/0"
        }
    tags = {
    Name = "pub_sub_acl"
  }
}

resource "aws_network_acl" "k8s_sub_acl" {
    vpc_id = aws_vpc.core5g_vpc.id
    subnet_ids = [ aws_subnet.subnet_k8s_1.id ]

    ingress {
        protocol = "tcp"
        rule_no = 300
        from_port = 0
        to_port    = 6553
        action     = "allow"
        cidr_block = "0.0.0.0/0"
    }


    egress {
        protocol   = "tcp"
        rule_no    = 300
        from_port  = 0
        to_port    = 65535
        action     = "allow"
        cidr_block = "0.0.0.0/0"
    }
    tags = {
    Name = "k8s_sub_acl"
  }
}

resource "aws_network_acl" "dp_sub_acl" {
    vpc_id = aws_vpc.core5g_vpc.id
    subnet_ids = [ aws_subnet.subnet_dp_1.id , aws_subnet.subnet_dp_2.id ]

    ingress {
        protocol = "tcp"
        rule_no = 300
        from_port = 0
        to_port    = 6553
        action     = "allow"
        cidr_block = "0.0.0.0/0"
    }


    egress {
        protocol   = "tcp"
        rule_no    = 300
        from_port  = 0
        to_port    = 65535
        action     = "allow"
        cidr_block = "0.0.0.0/0"
    }
    tags = {
    Name = "dp_sub_acl"
  }
}

resource "aws_network_acl" "sig_sub_acl" {
    vpc_id = aws_vpc.core5g_vpc.id

    subnet_ids = [ aws_subnet.subnet_sig_1.id , aws_subnet.subnet_sig_2.id ]

    ingress {
        protocol = "tcp"
        rule_no = 300
        from_port = 0
        to_port    = 6553
        action     = "allow"
        cidr_block = "0.0.0.0/0"
    }


    egress {
        protocol   = "tcp"
        rule_no    = 300
        from_port  = 0
        to_port    = 65535
        action     = "allow"
        cidr_block = "0.0.0.0/0"
    }
    tags = {
    Name = "sig_sub_acl"
  }
}