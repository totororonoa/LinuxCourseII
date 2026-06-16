#!/bin/bash

# Nos movemos al working directory
cd /var/www/proyecto

# Agregamos a los grupos correspondientes a alice y bob
sudo usermod -aG webdevs alice
sudo usermod -aG webdevs bob

# Validamos esto en groups
cat /etc/group | grep alice
cat /etc/group | grep bob

# No modificamos al owner, pues de facto es root
# por lo tanto unicamente hay que modificar permisos a los
# directorios.
sudo chmod 775 public/
sudo chmod 700 private/
sudo chmod 754 logs/
sudo chmod 775 shared/
sudo chmod 755 release/

# Ahora modificamos el grupo de los directorios.
sudo chgrp webdevs public/
sudo chgrp root private/
sudo chgrp webdevs logs/
sudo chgrp webdevs shared/
sudo chgrp root release/
