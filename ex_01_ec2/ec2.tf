## Create instance - will use defaults for parameters not specified (e.g. VPC, security group)
data "aws_ami_ids" "ubuntu" {
  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["ubuntu/images/ubuntu-*-*-amd64-server-*"]
  }
}

resource "aws_instance" "server1" {
  ami           = data.aws_ami.ubuntu_22_04.id
  instance_type = var.instance_type
  subnet_id = data.aws_subnets.def_vpc_subnets.ids[0]
  vpc_security_group_ids = [aws_security_group.sec_web.id]
 
  tags = {
    name = "${var.Project}-new"
  }
}

resource "aws_instance" "server2" {
  ami           = data.aws_ami.ubuntu_22_04.id
  instance_type = var.instance_type
  subnet_id = data.aws_subnets.def_vpc_subnets.ids[1]
  vpc_security_group_ids = [aws_security_group.sec_web.id]
 
  tags = {
    name = "${var.Project}-new"
  }
}

resource "aws_instance" "server3" {
  ami           = data.aws_ami.ubuntu_22_04_r2.id
  instance_type = var.instance_type
  subnet_id = data.aws_subnets.def_vpc_subnets.ids[0]
  vpc_security_group_ids = [aws_security_group.sec_web.id]
  provider = aws.central
 
  tags = {
    name = "${var.Project}-new"
  }
}

resource "aws_instance" "server4" {
  ami           = data.aws_ami.ubuntu_22_04.id
  instance_type = var.instance_type
  subnet_id = data.aws_subnets.def_vpc_subnets.ids[1]
  vpc_security_group_ids = [aws_security_group.sec_web.id]
  provider = aws.central
 
  tags = {
    name = "${var.Project}-new"
  }
}

resource "aws_instance" "server6" {
  ami           = data.aws_ami.ubuntu_22_04.id
  instance_type = var.instance_type
  subnet_id = data.aws_subnets.def_vpc_subnets.ids[1]
  vpc_security_group_ids = [aws_security_group.sec_web.id]
  provider = aws.central
  count = var.instance_count
 
  tags = {
    Name  = "Terraform-${count.index + 1}"
  }
}



