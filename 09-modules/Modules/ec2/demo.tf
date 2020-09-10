resource null_resource null1 {

  provisioner "local-exec" {
    command = "echo ${var.s3-arn} >> private_ips.txt"
  }
}
