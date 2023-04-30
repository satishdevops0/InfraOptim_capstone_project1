resource "aws_key_pair" "keypair1" {
  key_name   = "${var.stack}-keypairs"
  public_key = file(var.ssh_key)
}

resource "aws_instance" "ec2-master" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  key_name                    = aws_key_pair.keypair1.key_name
  vpc_security_group_ids      = [aws_security_group.web.id]
  subnet_id                   = aws_subnet.public1.id
  associate_public_ip_address = true

  tags = {
    Name = "EC2-Master"
  }
}
resource "aws_instance" "ec2-worker" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  key_name                    = aws_key_pair.keypair1.key_name
  vpc_security_group_ids      = [aws_security_group.web.id]
  subnet_id                   = aws_subnet.public1.id
  associate_public_ip_address = true

  tags = {
    Name = "EC2-WorkerNode"
  }
}
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

