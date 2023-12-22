resource "aws_security_group" "pub_sec_group" {
  name        = "allow-ssh-and-internet-pub"
  description = "Allow SSH and Internet access inside host in pub subnet"
  vpc_id      = aws_vpc.core5g_vpc.id

  // Règle d'entrée pour la communication SSH à partir de 5.167.22.7
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["5.161.73.127/32"]
  }

  // Règle d'entrée pour la communication sur Internet
  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  // Règle de sortie autorisant tout le trafic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.2.6.0/24"]
  }
}


resource "aws_security_group" "priv_sec_group" {
  name        = "allow-ssh-and-internet-priv"
  description = "Allow SSH and Internet access"
  vpc_id      = aws_vpc.core5g_vpc.id

  // Règle d'entrée pour la communication SSH à partir de 5.167.22.7
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.subnet_pub]
  }

  // Règle d'entrée pour la communication sur Internet
  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  // Règle de sortie autorisant tout le trafic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}