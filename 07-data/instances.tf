resource "aws_instance" "node" {
  count         = 2
  ami           = "ami-07d19c1aefc450697"
  instance_type = "t2.micro"
  key_name      = "key_28042020"
  for_each      = data.aws_subnet_ids.example.ids
  subnet_id     = each.value

  tags = {
    Name = "Instance-${count.index+1}"
  }
}
