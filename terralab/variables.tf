variable "aws_region" {
    description = "Región de AWS donde desplegaremos los servidores."
    default = "eu-west-2"
}

# Aquí habría que colocar el access_key real obtenido en AWS.
variable "access_key_id" {
    default = "4cc35-k3y"
}

# Aquí habría que colocar el secret_access_key real obtenido en AWS.
variable "secret_access_key" {
    default = "53cr3t-4cc35-k3y"
}

variable "aws_amis" {
    description = "AMIs de Ubuntu 16.04"
    default = {
        eu-west-1 = "ami-a8d2d7ce" // EU (Ireland)
        eu-west-2 = "ami-f1d7c395" // EU (London)
        eu-central-1 = "ami-060cde69" // EU (Frankfurt)
    }
}

variable "key_name" {
    description = "Nombres de los keypair SSH para usar en AWS."
    default = {
        eu-west-1 = ""
        eu-west-2 = "terraform-key-eu-west-2"
        eu-central-1 = ""
    }
}

variable "instance_type" {
    default = "t2.micro"
    description = "Tipo de instancia AWS"
}

variable "asg_min" {
    description = "Número mínimo de servidores en ASG"
    default = "1"
}

variable "asg_max" {
    description = "Número máximo de servidores en ASG"
    default = "8"
}

variable "asg_desired" {
    description = "Número deseado de servidores en ASG"
    default = "2"
}
