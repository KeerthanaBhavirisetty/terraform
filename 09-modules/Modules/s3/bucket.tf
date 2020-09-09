resource "aws_s3_bucket" "bucket_name" {
  bucket = "bukcet-keervlk"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}