resource "aws_instance" "app" {
  ami           = var.ami
  instance_type = var.instance_type

  # Startup script to install Docker on instance launch
  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install -y docker.io
              systemctl start docker
              EOF

  tags = {
    Name = "TerraformAppInstance"
  }
}