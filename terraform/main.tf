terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
provider "aws" {
  region = "ap-northeast-2" 
}
resource "aws_security_group" "web_sg" {
  name        = "node-app-sg"
  description = "Allow SSH and HTTP traffic"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
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
resource "aws_instance" "web_server" {
  ami           = "ami-0ea4d4b8dc1e46212"
  instance_type = "t3.micro"
  key_name      = "devops"               
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  tags = {
    Name = "node-app-server-tf"
  }

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y docker
              systemctl start docker
              systemctl enable docker
              usermod -a -G docker ec2-user
              EOF
}            

output "public_ip" {
  value       = aws_instance.web_server.public_ip
  description = "43.200.176.120"
}