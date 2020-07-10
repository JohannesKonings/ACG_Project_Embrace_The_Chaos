provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "chaos-admin-sg" {
  name        = "chaos-admin-sg"
  description = "Allow HTTP inbound traffic"

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "chaos-admin"
  }
}

resource "aws_instance" "Ec2Instance" {
  ami           = "ami-09d95fab7fff3776c"
  instance_type = "t2.micro"
  security_groups = [
    "${aws_security_group.chaos-admin-sg.name}"
  ]
  user_data = file("bootstrap.txt")
  tags = {
    Name = "chaos-admin"
  }
}
