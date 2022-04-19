# 1. Creazione EC2 test
resource "aws_instance" "ec2-test" {
  ami           = "${var.ami_id}"
  instance_type = "${var.instance_type}"
  availability_zone = "eu-central-1a"
  key_name = "testlab"
  subnet_id = "${var.subnet_id}"

  tags = {
    Name = "ec2-${var.environment}"
    Environmet = "${var.environment}"
  }
}
