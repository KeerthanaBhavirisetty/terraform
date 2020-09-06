data "aws_subnet_ids" "subnets"{
    var.vpc_id = vpc_id
}