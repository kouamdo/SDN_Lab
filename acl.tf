resource "aws_network_acl" "pub_sub_acl" {
    vpc_id = aws_vpc.core5g_vpc.id

    ingress = [{
        type = "ssh"
        rule_no = 200
        to_port    = 22
        action     = "allow"
        cidr_block = "0.0.0.0/0"
    },
    {
        rule_no = 300
        from_port = "0-6553"
        to_port    = "0-6553"
        action     = "allow"
        cidr_block = "0.0.0.0/0"
    }
    ]

    egress = {
        rule_no = 300
        from_port = "0-6553"
        to_port    = "0-6553"
        action     = "allow"
        cidr_block = "0.0.0.0/0"
    }
}