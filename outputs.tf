output "vpc_name" {

    description = "arn de la vpc"
    value = aws_vpc.main.arn
    
  
}

output "instance_arn" {

    description = "arn de la instancia"
    value = aws_instance.instance1.arn
    
}

#arn de la nueva instancia creada

output "vpc_name2" {

    description = "arn de la vpc"
    value = aws_vpc.main2.arn
  
}

output "instance_arn2" {
    description = "arn de la instancia"
    value = aws_instance.instance2.arn
   
}