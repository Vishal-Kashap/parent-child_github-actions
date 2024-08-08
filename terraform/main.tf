provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "instance1" {
  ami           = "ami-0b72821e2f351e396"  # Replace with a valid Ubuntu AMI ID for your region
  instance_type = "t2.micro"

  # User data script to install Apache on Ubuntu
  user_data = <<-EOF
              #!/bin/bash
              apt-get update -y
              apt-get install -y apache2
              systemctl start apache2
              systemctl enable apache2
              EOF

  tags = { Name = "instance1-inst" }
}

output "instance_id" {
  value = aws_instance.instance1.id
}

output "instance_public_ip" {
  value = aws_instance.instance1.public_ip
}
