## Create instance - will use defaults for parameters not specified (e.g. VPC, security group)
data "aws_vpc" "def_vpc" {
  default = true
}

data "aws_subnets" "def_vpc_subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.def_vpc.id]
  }
}