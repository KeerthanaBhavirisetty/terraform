resource "aws_instance" "web" {
    count           = var.INSTANCE_COUNT
    ami             = data.aws_ami.myami.id
    instance_type   = var.INSTANCE_TYPE
    key_name        = var.KEYPAIR_NAME
    subnet_id

    tags = {
      Name = "HelloWorld"
    }
}