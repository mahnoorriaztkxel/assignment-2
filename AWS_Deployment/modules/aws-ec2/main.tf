# ---------------------------
# Security Group for EC2
# ---------------------------
resource "aws_security_group" "ec2_sg" {
  name        = "ec2-sg"
  description = "Allow SSH and HTTP"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ec2-sg"
  }
}


# Create a new AWS Key Pair

resource "tls_private_key" "generated" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = "terraform-key-${random_id.key_suffix.hex}"
  public_key = tls_private_key.generated.public_key_openssh
}

resource "random_id" "key_suffix" {
  byte_length = 4
}

# Save the private key locally (for SSH access)
resource "local_file" "private_key_pem" {
  content  = tls_private_key.generated.private_key_pem
  filename = "${path.module}/terraform-key.pem"
  file_permission = "0600"
}



# EC2 Instance
resource "aws_instance" "web" {
  ami                    = var.ec2_ami
  instance_type          = var.ec2_instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  key_name               = aws_key_pair.generated_key.key_name  # optional: for SSH access

  tags = {
    Name = "web-server"
  }
}

