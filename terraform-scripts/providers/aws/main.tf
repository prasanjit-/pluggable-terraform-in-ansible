data "aws_vpc" "vpc" {
  tags  = {
    Name  = "fin-test-vpc"
  }
}

data "aws_subnet_ids" "public" {
  vpc_id  = "${data.aws_vpc.vpc.id}"
  tags {
    Group       = "fin"
    Environment = "test"
    Tier        = "Public"
  }
}

data "aws_security_group" "sg" {
  vpc_id  = "${data.aws_vpc.vpc.id}"
  name    = "fin-test-allow-all-sg"
}

resource "aws_instance" "foo-instance" {

  instance_type = "t3.nano"
  ami           = "ami-402f1a33"

  subnet_id                   = "${data.aws_subnet_ids.public.ids[0]}"
  vpc_security_group_ids      = ["${data.aws_security_group.sg.id}"]
  associate_public_ip_address = true

  key_name  = "devops"

  tags {
    Name        = "${var.instance_name}"
    Environment = "test"
  }
}
