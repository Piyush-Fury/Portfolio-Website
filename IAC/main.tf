resource "aws_instance" "portfolio-piyush" {
  ami = var.ami
  instance_type = var.instance_type
  security_groups = [ aws_security_group.TF_SG.name ]
  tags = {
    name = "piyush-portfolio"
  }
  key_name = "learn"
}
resource "aws_security_group" "TF_SG" {
  name = "Security Group using terraform"
  description = "Security Group using terraform"
  vpc_id = "vpc-04e4c269966d55e15"

  ingress {
    description = "HTTPS"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
    ipv6_cidr_blocks = [ "::/0" ]
  }
  ingress {
    description = "SSH"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
    ipv6_cidr_blocks = [ "::/0" ]
  }
  ingress {
    description = "HTTP"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
    ipv6_cidr_blocks = [ "::/0" ]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
    ipv6_cidr_blocks = [ "::/0" ]
  }

  tags = {
    name = "TF_SG"
  }
}