provider "aws" {
  profile = "davide"
  region  = "eu-central-1"
}

module "my_vpc" {
  source = "../modules/vpc"  #Indicare dove va a prendere la risorsa, percorso Modules
  vpc_cidr = "190.0.0.0/16"  #Cambiamo la variabile per l'ambiente di dev
  vpc_id = "${module.my_vpc.vpc_id}"  #Recupero l'output di vpc_id dal modulo, e il nome del modulo appena creato
  subnet1_cidr = "190.0.2.0/24"
  subnet2_cidr = "190.0.3.0/24"
  environment = "production"
}

module "my_ec2" {
  source = "../modules/ec2"  #Indicare dove va a prendere la risorsa, percorso Modules
  ami_id = "ami-0d527b8c289b4af7f"
  instance_type = "t2.micro"
  subnet_id = "${module.my_vpc.subnet1_id}"
  environment = "production"
}