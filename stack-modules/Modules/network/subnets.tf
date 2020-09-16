resource "aws_subnet" "public-subnets" {
    count                   = 4
    vpc_id                  = aws_vpc.studentapp-vpc.id
    cidr_block              = cidrsubnet(var.VPC_CIDR, 3, count.index)
    availability_zone       = element(var.AZ,count.index)
    map_public_ip_on_launch = true

  tags = {
     Name         = "Public-Subnet-${count.index+1}"
     PROJECT_NAME = var.PROJECT_NAME
     ENVIRONMENT  = var.PROJECT_ENV
     CREATED_BY   = "Terraform"
  }
}

resource "aws_subnet" "private-subnets" {
    count             = 4
    vpc_id            = aws_vpc.studentapp-vpc.id
    cidr_block        = cidrsubnet(var.VPC_CIDR, 3, count.index+4)
    availability_zone = element(var.AZ,count.index)

  tags = {
     Name         = "Private-Subnet-${count.index+1}"
     PROJECT_NAME = var.PROJECT_NAME
     ENVIRONMENT  = var.PROJECT_ENV
     CREATED_BY   = "Terraform"
  }
}

resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.studentapp-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  route {
    ipv6_cidr_block        = "::/0"
    egress_only_gateway_id = aws_egress_only_internet_gateway.foo.id
  }

  tags = {
    Name = "main"
  }
}