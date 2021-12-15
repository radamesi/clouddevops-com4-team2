# Instalación de Docker e imagen hello-world

Esta parte de la actividad la resolvimos en el primer laboratorio de Docker. Véase https://github.com/radamesi/clouddevops-com4-team2/blob/main/dockerlab/laboratorio.md.

# Imagen apache

A continuación se muestran dos contenedores corriendo la imagen bitnami/apache y sus correspondientes binds de puertos. Ya que usamos Google Cloud Platform para este laboratorio, sobrescribimos los números de puertos para aprovechar el uso de los puertos 80 y 443, que ya estaban abiertos en la instancia.

![Contenedores de bitnami/apache](https://github.com/radamesi/clouddevops-com4-team2/blob/main/dockerlab2/docker-ps.png "Contenedores de bitnami/apache")

![Puertos de apache-1](https://github.com/radamesi/clouddevops-com4-team2/blob/main/dockerlab2/docker-port-apache-1.png "Puertos de apache-1")

![Puertos de apache-2](https://github.com/radamesi/clouddevops-com4-team2/blob/main/dockerlab2/docker-port-apache-2.png "Puertos de apache-2")

# Modificación de index.html e imagen personalizada

![Creación de imagen - Paso 1](https://github.com/radamesi/clouddevops-com4-team2/blob/main/dockerlab2/docker-creacion-imagen-1.png "Creación de imagen - Paso 1")

![Creación de imagen - Paso 2](https://github.com/radamesi/clouddevops-com4-team2/blob/main/dockerlab2/docker-creacion-imagen-2.png "Creación de imagen - Paso 2")

![Cómo se ve en el browser](https://github.com/radamesi/clouddevops-com4-team2/blob/main/dockerlab2/docker-browser.png "Cómo se ve en el browser")
