output "nat_gateway_ip" {
  value = aws_eip.eip_nat.public_ip
}