resource "aws_s3_bucket" "b" {
  bucket = "my-test-bucket1"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}