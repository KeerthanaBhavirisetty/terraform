module "s3" {
  source = "./Modules/s3"
  bucket_name = var.bucket_name
}