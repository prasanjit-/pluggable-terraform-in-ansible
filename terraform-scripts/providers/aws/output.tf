output "public_dns" {
  value = "${aws_instance.new-instance.public_dns}"
}
