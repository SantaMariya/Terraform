resource "aws_instance" "example" {
  ami                         = "ami-0150ccaf51ab55a51" 
  instance_type               = "t2.micro"
  vpc_security_group_ids      = [aws_security_group.ssh_access.id]
  
  tags = {
    Name = "EC2WithSSH"
  }
}

resource "aws_security_group" "ssh_access" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"
  

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Be cautious in production
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


