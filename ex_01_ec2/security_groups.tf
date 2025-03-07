# Security group for web server behind ALB  (or in public subnet - in this case use "cidr_blocks"

resource "aws_security_group" "sec_web" {
  vpc_id = data.aws_vpc.def_vpc.id
  name   = "${var.project}-sec-web"

  # ingress {
  #   description = "Ping from specific addresses"
  #   from_port   = 8 # ICMP Code 8 - echo  (0 is echo reply)
  #   to_port     = 0
  #   protocol    = "icmp"
  #   cidr_blocks = var.sec_allowed_external
  # }

  ingress {
    description = "TCP Port 80 from specific addresses"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    # cidr_blocks = var.sec_allowed_external
  }

  ingress {
    description = "TCP Port 443 from specific addresses"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name =  "${var.project}-sec-web"
  }
}
