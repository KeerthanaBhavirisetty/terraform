resource "aws_instance" "web" {
    count                       = var.INSTANCE_COUNT
    ami                         = data.aws_ami.myami.id
    instance_type               = var.INSTANCE_TYPE
    key_name                    = var.KEYPAIR_NAME
    subnet_id                   = element(var.PUBLIC_SUBNETS,count.index)
    vpc_security_group_ids      =   [aws_security_group.allow_ec2.id]

    tags = {
        Name                    = "${var.PROJECT_NAME}-${var.PROJECT_ENV}-Instance-${count.index+1}"
        created_by              = "Terraform"
        PROJECT_NAME            = var.PROJECT_NAME
        ENVIRONMENT             = var.PROJECT_ENV
    }
}