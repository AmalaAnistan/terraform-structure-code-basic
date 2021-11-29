resource "aws_instance" "app_server" {
  ami             = var.instance_ami
  instance_type   = var.instance_type
  key_name        = var.instance_key
  security_groups = ["launch-wizard-1"]

  user_data = <<-EOF
  #!/bin/bash
  echo "*** Installing apache2 server"
  sudo apt update -y
  sudo apt install apache2 -y
  echo "*** Completed Installing apache2 server"
  EOF

  tags = {
    Name = var.instance_tag
  }

  volume_tags = {
    Name = var.instance_tag
  }
}

resource "aws_eip_association" "eio_allpcation" {
  instance_id   = aws_instance.app_server.id
  allocation_id = var.instance_eip
}
