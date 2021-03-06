resource "aws_instance" "node" {
  count         = 2
  ami           = "ami-07d19c1aefc450697"
  instance_type = "t2.micro"
  key_name      = "key_28042020"
  subnet_id     = sort(data.aws_subnet_ids.subnets.ids)[count.index]
  #subnet_id     = sort(data.terraform_remote_state.network.outputs.public_subnet_list)[count.index]

  tags = {
    Name = "Instance-${count.index+1}"
  }
}
