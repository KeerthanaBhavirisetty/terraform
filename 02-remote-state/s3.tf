resource "aws_s3_bucket" "b" {
  bucket = "keerthana-test-buck1"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}