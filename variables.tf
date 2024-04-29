variable "vpc_name" {

    type = string 
    description = "nombre de la vpc" 

}


variable "instance_name" {
  type = string
  description = "nombre de la instancia"
  default = "Instancia1"
}

#########

variable "vpc_name2" {

    type = string 
    description = "nombre de la vpc 2" 

}

variable "instance_name2" {
  type = string
  description = "nombre de la instancia 2"
  default = "Instancia2"
}