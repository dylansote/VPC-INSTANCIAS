terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}
#recurso , instancia , vpc
#tipo de recurso
resource "aws_vpc" "main" {

    cidr_block = "10.0.0.0/16" #segmento de la red
    instance_tenancy = "default"
    tags = { #nombre de la vpc y variables
      Name = var.vpc_name
    }

  
}


resource "aws_vpc" "main2" {

    cidr_block = "10.0.0.0/20" #segmento de la red
    instance_tenancy = "default"
    tags = { #nombre de la vpc y variables
      Name = var.vpc_name2
    }

  
}

#crear una instancia ligada a una VPC
#crear la instancia
resource "aws_subnet" "subnet1" {
   #Recursos
   count = 1
   #la subnet puede ser un arreglo
   vpc_id = aws_vpc.main.id
   #main , es el recurso con el terraform sabe que se hacer, eliminar o crear
   cidr_block = aws_vpc.main.cidr_block
}

#crear una instancia ligada a una VPC
#crear la instancia
resource "aws_subnet" "subnet2" {
   #Recursos
   count = 1
   #la subnet puede ser un arreglo
   vpc_id = aws_vpc.main2.id
   #main , es el recurso con el terraform sabe que se hacer, eliminar o crear
   cidr_block = aws_vpc.main2.cidr_block
}



#instancia 1

resource "aws_instance" "instance1" {
  ami = "ami-04e5276ebb8451442"
  instance_type = "t2.micro" #AWS solo nos permite utilizar esta
  subnet_id = aws_subnet.subnet1[0].id #acceder a la primera subnet que se creo 
  tags = {
    Name = var.instance_name
  }


}

#instancia 2

resource "aws_instance" "instance2" {
  ami = "ami-04e5276ebb8451442"
  instance_type = "t2.nano" #AWS solo nos permite utilizar esta
  subnet_id = aws_subnet.subnet2[0].id #acceder a la primera subnet que se creo 
  tags = {
    Name = var.instance_name2
  }
}