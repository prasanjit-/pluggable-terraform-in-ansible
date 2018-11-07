output "public_dns" {
  value = "${aws_instance.foo-instance.public_dns}"
}
