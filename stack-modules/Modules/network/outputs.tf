output "private-subnets"{
    value=aws_subnet.private-subnets.*.id
}

output "studentapp_vpcid"{
    value=aws_vpc.studentapp_vpcid.id
}



