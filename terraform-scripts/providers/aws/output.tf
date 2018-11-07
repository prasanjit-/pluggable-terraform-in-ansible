output "public_dns" {
  value = "${aws_instance.foo_instance.public_dns}"
}
