provider "aws" {
  region = var.region
  shared_credentials_file = "/home/jj/.aws/credentials"
}


resource "aws_vpc" "demo_vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
  tags = {
    Name = "demo_vpc"
  }
}
resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.demo_vpc.id
  cidr_block        = var.public_subnet
  availability_zone = "${var.region}${var.available_zone}"
  tags = {
    Name = "demo-public"
  }
}

resource "aws_internet_gateway" "demo_gateway" {
  vpc_id = aws_vpc.demo_vpc.id
  tags = {
    Name = "demo_gateway"
  }
}

resource "aws_route_table_association" "demo_route_table_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.demo_route.id
}

resource "aws_route_table" "demo_route" {
  vpc_id = aws_vpc.demo_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.demo_gateway.id
  }
  tags = {
    Name = "demo_route_public"
  }
}


resource "aws_security_group" "nat_security_group" {
  name        = "vpc_nat"
  description = "jenkins Security Group"
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  vpc_id = aws_vpc.demo_vpc.id
  tags   = {
    Name = "Security Group"
  }
}

resource "aws_key_pair" "key" {
  key_name   = "auth_key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDv61l/9/cRSkJJJGGCM9t0ExhelOJfdBIEGQ5i6+U6PbLW3T0f8w0zcleYiRuSnys3EcobzlMU0NLF2EMzMZGpl7qiIDBsmzRGD365bZu+pjZAuEbQhYQe2jPDBxdL2Gc8ogrXNNdsoZu74ryWx//26rz/RvNf9ZPt13vR1yUz5cCUVQ9yWrgcQacA1RUH2u8JbqYkqRrqhEnC53JlSk6L7uxusgUoY/YLwvPVne+3sm4AnP4cmGIRUp2nppRJk0KwI5YAsKrut2czyhSpvXeDuCisH2M1vNZoCZfEgPAgBWgeyeEDnZcL9FgtoQw0BFSGfV7E6fBm+mCgyqDvosaL jj@xps"
  # public_key = "${file("key/auth.pub")}"
}

resource "aws_instance" "instance" {
  ami                         = "ami-04b9e92b5572fa0d1"
  availability_zone           = "${var.region}${var.available_zone}"
  instance_type               = "t2.medium"
  key_name                    = aws_key_pair.key.key_name
  vpc_security_group_ids      = ["${aws_security_group.nat_security_group.id}"]
  subnet_id                   = aws_subnet.public_subnet.id
  associate_public_ip_address = true
  source_dest_check           = false
  count                       = var.instance_count
  user_data = <<-EOF
		#!/bin/bash
		sudo apt-get update
		sudo apt-get install -y python
  EOF

  tags = {
    Name  = "jenkins-server"
	}

    provisioner "local-exec" {
        command = "echo ${self.public_ip} >> hosts" 
    }
}



resource "null_resource" "example1" {
  provisioner "local-exec" {
    command = "sleep 180; ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u ubuntu --private-key key/auth -i hosts ../ansible/jenkins.yml"
    }
}
