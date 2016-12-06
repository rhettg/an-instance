provider "aws" {
  region = "${var.aws_region}"
}

resource "aws_instance" "test" {
  ami           = "ami-c80b0aa2"
  instance_type = "m3.medium"

  subnet_id              = "${var.subnet_id}"
  vpc_security_group_ids = ["${aws_security_group.main.id}"]

  key_name = "${var.key_name}"

  tags {
    Name = "${var.name}"
  }
}

resource "aws_security_group" "main" {
  name   = "${var.name}-main-sg"
  vpc_id = "${var.vpc_id}"

  tags {
    Name = "${var.name}-main-sg"
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "server_ip" {
  value = "${aws_instance.test.ip}"
}
