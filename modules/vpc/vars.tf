variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "vpc_id" {}

variable "subnet1_cidr" {
  default = "10.0.0.0/24"
}

variable "subnet2_cidr" {
  default = "10.0.1.0/24"
}

variable "environment" {
  default = "local"
}