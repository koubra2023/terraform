# Create a new GitLab Lightsail Instance
resource "aws_lightsail_instance" "example" {
  name              = "example-instance"
  availability_zone = "us-east-1"  # Change to your desired availability zone
  blueprint_id      = "amazon_linux_2"
  
  user_data = <<-EOF
              #!/bin/bash
              sudo yum install httpd -y
              sudo systemctl start httpd
              sudo systemctl enable httpd
              echo "<h1>This Server is created using Terraform</h1>" | sudo tee /var/www/html/index.html
              EOF
  tags = {
    Name = "exemple-instance"
  }
}

output "public_ip" {
  value = aws_lightsail_instance.example.public_ip_address
}


