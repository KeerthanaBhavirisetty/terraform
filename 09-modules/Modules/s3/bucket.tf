resource "aws_s3_bucket" "bucket_name" {
  bucket = "my-test-bukcet2"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}