output "address" {
  value = "${aws_instance.foo-instance.public_dns}"
}
