resource "aws_instance" "web" {
    count           = var.INSTANCE_COUNT
    ami             = data.aws_ami.myami.id
    instance_type   = var.INSTANCE_TYPE
    key_name        = var.KEYPAIR_NAME
    subnet_id       = element(var.PUBLIC_SUBNETS,count.index)

    tags = {
        Name         = "${var.PROJECT_NAME}-${var.PROJECT_ENV}-VPC"
        created_by   = "Terraform"
        PROJECT_NAME = var.PROJECT_NAME
        ENVIRONMENT  = var.PROJECT_ENV
    }
}