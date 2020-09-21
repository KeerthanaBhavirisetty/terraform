output "private-subnets"{
    value=aws_subnet.private-subnets.*.id
}

output "studentapp_vpcid"{
    value=aws_vpc.studentapp-vpc.id
}

output "studentapp_CIDR"{
    value=aws_vpc.studentapp-vpc.cidr_block
}



