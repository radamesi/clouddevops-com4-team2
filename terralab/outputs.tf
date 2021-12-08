# Retornar lista de zonas de disponibilidad
output "availability_zones" {
    value = [
        "${data.aws_availability_zones.all_zones.names}"]
}

# Retornar LB dns
output "elb_dns" {
    value = "${aws_elb.clouddevopsteam2_elb.dns_name}"
}
