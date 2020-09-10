resource null_resource null1 {

  provisioner "local-exec" {
    command = "echo ${var.s3-bucket} >> private_ips.txt"
  }
}
