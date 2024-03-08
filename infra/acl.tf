# --- Pub acl rules ---
resource "aws_network_acl_rule" "pub_any_out_rule" {
    network_acl_id = aws_network_acl.pub_sub_acl.id
    rule_number    = 300
    protocol       = "-1"
    rule_action    = "allow"
    egress         = true
    cidr_block     = "0.0.0.0/0"
    from_port      = 0
    to_port        = 0
}

resource "aws_network_acl_rule" "pub_any_in_rule" {
    network_acl_id = aws_network_acl.pub_sub_acl.id
    rule_number    = 300
    protocol       = "-1"
    rule_action    = "allow"
    egress         = false
    cidr_block     = "0.0.0.0/0"
    from_port      = 0
    to_port        = 0
}

resource "aws_network_acl" "pub_sub_acl" {
    vpc_id = aws_vpc.core5g_vpc.id
    subnet_ids = [ aws_subnet.pub_subnet.id]
    tags = {
    Name = "pub_sub_acl"
  }
}

# --- ---



# --- k8s acl rules ---

resource "aws_network_acl_rule" "k8s_any_out_rule" {
    network_acl_id = aws_network_acl.k8s_sub_acl.id
    rule_number    = 300
    protocol       = "-1"
    rule_action    = "allow"
    egress         = true
    cidr_block     = "0.0.0.0/0"
    from_port      = 0
    to_port        = 0
}

resource "aws_network_acl_rule" "k8s_ssh_in_rule" {
    network_acl_id = aws_network_acl.k8s_sub_acl.id
    rule_number    = 300
    protocol       = "tcp"
    rule_action    = "allow"
    egress         = false
    cidr_block     = var.subnet_pub
    from_port      = 22
    to_port        = 22
}

resource "aws_network_acl_rule" "k8s_internet_in_rule" {
    network_acl_id = aws_network_acl.k8s_sub_acl.id
    rule_number    = 310
    protocol       = "tcp"
    rule_action    = "allow"
    egress         = false
    cidr_block     = "0.0.0.0/0"
    from_port      = 0
    to_port        = 65535
}

resource "aws_network_acl" "k8s_sub_acl" {
    vpc_id = aws_vpc.core5g_vpc.id
    subnet_ids = [ aws_subnet.subnet_k8s_1.id ]
    tags = {
    Name = "k8s_sub_acl"
  }
}

# --- ---


# --- dp acl rules ---
resource "aws_network_acl_rule" "dp_sub_internet_in_rule" {
    network_acl_id = aws_network_acl.dp_sub_acl.id
    rule_number    = 310
    protocol       = "tcp"
    rule_action    = "allow"
    egress         = false
    cidr_block     = "0.0.0.0/0"
    from_port      = 0
    to_port        = 65535
}

resource "aws_network_acl_rule" "dp_sub_ssh_rule" {
    network_acl_id = aws_network_acl.dp_sub_acl.id
    rule_number    = 200
    protocol       = "tcp"
    rule_action    = "allow"
    egress         = false
    cidr_block     = var.subnet_pub
    from_port      = 22
    to_port        = 22
}

resource "aws_network_acl_rule" "dp_any_out_rule" {
    network_acl_id = aws_network_acl.dp_sub_acl.id
    rule_number    = 300
    protocol       = "-1"
    rule_action    = "allow"
    egress         = true
    cidr_block     = "0.0.0.0/0"
    from_port      = 0
    to_port        = 0
}

resource "aws_network_acl" "dp_sub_acl" {
    vpc_id = aws_vpc.core5g_vpc.id
    subnet_ids = [ aws_subnet.subnet_dp_1.id , aws_subnet.subnet_dp_2.id ]

    tags = {
    Name = "dp_sub_acl"
  }
}

# --- ---

# --- sig acl rules ---

resource "aws_network_acl_rule" "sig_sub_internet_in_rule" {
    network_acl_id = aws_network_acl.sig_sub_acl.id
    rule_number    = 300
    protocol       = "tcp"
    rule_action    = "allow"
    egress         = false
    cidr_block     = "0.0.0.0/0"
    from_port      = 0
    to_port        = 65535
}

resource "aws_network_acl_rule" "sig_sub_ssh_rule" {
    network_acl_id = aws_network_acl.sig_sub_acl.id
    rule_number    = 200
    protocol       = "tcp"
    rule_action    = "allow"
    egress         = false
    cidr_block     = var.subnet_pub
    from_port      = 22
    to_port        = 22
}

resource "aws_network_acl_rule" "sig_any_out_rule" {
    network_acl_id = aws_network_acl.sig_sub_acl.id
    rule_number    = 300
    protocol       = "-1"
    rule_action    = "allow"
    egress         = true
    cidr_block     = "0.0.0.0/0"
    from_port      = 0
    to_port        = 0
}

resource "aws_network_acl" "sig_sub_acl" {
    vpc_id = aws_vpc.core5g_vpc.id

    subnet_ids = [ aws_subnet.subnet_sig_1.id , aws_subnet.subnet_sig_2.id ]
    tags = {
    Name = "sig_sub_acl"
  }
}

# --- ---