provider "aws" {
  region = "us-east-1"  # Change to your desired AWS region latest
}

resource "aws_instance" "web" {
  ami                    = "ami-053a45fff0a704a47"  # Amazon Linux 2 AMI (Check AWS Console for latest)
  instance_type          = "t2.micro"  # Free-tier instance
 # key_name               = "my-key-pair"  # Replace with your AWS Key Pair name
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  tags = {
    Name = "Terraform-EC2-20-02-2025"
  }
}

resource "aws_security_group" "web_sg" {
  name        = "web-sg"
  description = "Allow SSH and HTTP traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow SSH from anywhere (change for security)
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow HTTP traffic
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}