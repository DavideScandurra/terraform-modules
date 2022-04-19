variable "ami_id" {
  default = "ami-0d527b8c289b4af7f"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "subnet_id" {}

variable "environment" {
  default = "local"
}