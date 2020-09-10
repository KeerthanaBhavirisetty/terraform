resource null_resource null1 {

  provisioner "local-exec" {
    command = "echo BUCKET ARN IS ${var.s3-arn} "
  }
}
