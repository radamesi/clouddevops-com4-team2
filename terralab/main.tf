# Proveedor y detalles de acceso
provider "aws" {
    region = "${var.aws_region}"
    access_key = "${var.access_key_id}"
    secret_key = "${var.secret_access_key}"
}

# Security group por defecto para acceder por HTTP
resource "aws_security_group" "clouddevopsteam2_sg" {
    name = "clouddevops-team2-security-group"
    description = "Cloud DevOps Team2 - Security group"

    # Acceso HTTP desde cualquier lugar.
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"]
  }
  
  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = [
          "0.0.0.0/0"]
    }

  # Salida a Internet.
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [
      "0.0.0.0/0"]
  }
}

  # Retornar zonas de disponibilidad disponibles para la región
  data "aws_availability_zones" "all_zones" {}

  # Crear balanceador de carga para availability_zones
  resource "aws_elb" "clouddevopsteam2_elb" {
      name = "clouddevops-team2-elb"
      availability_zones = "${data.aws_availability_zones.all_zones.names}"
      security_groups = ["${aws_security_group.clouddevopsteam2_sg.id}"]

      listener {
          instance_port = 80
          instance_protocol = "http"
          lb_port = 80
          lb_protocol = "http"
      }

      health_check {
          healthy_threshold = 2
          unhealthy_threshold = 2
          timeout = 3
          target = "HTTP:80/"
          interval = 30
      }
  }

# Crear el configuration launcher
resource "aws_launch_configuration" "clouddevopsteam2_lc" {
    name = "clouddevopsteam2-lc"
    image_id = "${lookup(var.aws_amis, var.aws_region)}"
    instance_type = "${var.instance_type}"
    security_groups = ["${aws_security_group.clouddevopsteam2_sg.id}"]
    # Qué correr dentro
    user_data = "${file("provision.sh")}"
    # Llave SSH
    key_name = "${lookup(var.key_name, var.aws_region)}"
}

# Creamos el autoscaling group
resource "aws_autoscaling_group" "clouddevopsteam2_asg" {
    name = "clouddevopsteam2-asg"
    availability_zones = "${data.aws_availability_zones.all_zones.names}"
    max_size = "${var.asg_max}"
    min_size = "${var.asg_min}"
    desired_capacity = "${var.asg_desired}"
    force_delete = true
    # Qué hacer cada vez que escala
    launch_configuration = "${aws_launch_configuration.clouddevopsteam2_lc.name}"
    # Colocar nuevas instancias dentro del load balancer
    load_balancers = ["${aws_elb.clouddevopsteam2_elb.name}"]

    tag {
        key = "Name"
        value = "clouddevopsteam2-asg"
        propagate_at_launch = "true"
    }
}
