output "private-subnets"{
    value=aws_subnet.private-subnets.*.id
}

output "studentapp_vpcid"{
    value=aws_vpc.studentapp-vpc.id
}

output "default_vpc_cidr" {
    value=data.aws_vpc.current.cidr_block
}

output "public-subnets"{
    value=aws_subnet.public-subnets.*.id
}

