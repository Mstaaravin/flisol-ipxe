=== flisol-ipxe ===

Este repositorio tiene como finalidad hacer pública la configuración que se usará este año en Flisol CABA 2014

Contiene la configuración de los siguientes programas

* dnsmasq

* debmirror

* nginx

* firehol

* squid

* nfs-server



La configuración contempla que:

* La estructura de directorios será:
** /home/tftp (configuración y boot PXE)
** /home/mirrors (mirrors de las distribuciones)
* El segmente de IP privada a utilizar en la LAN el día del evento será 192.168.122.0/24
* El server tendrá 2 interfaces de red
** eth0 hacia internet cumpliendo la función de interfaz WAN
** eth1 hacia la red privada cumpliendo la función de interfaz LAN
* Para simplificar la configuración de iptables y nivelar los conocimientos de los distintos admins en las sedes de Flisol, decidí usar firehol [1] Aunque pueden usar lo que deseen (iptables, shorewall, etc)
* dnsmasq: cumplirá las funciones de DHCP, DNS Server y TFTP server
** DHCP en el rango 192.168.122.0/24
** DNS Server para resolver dominios como ftp.debian.org a la IP privada del server
** TFTP para enviar los archivos para el booteo PXE
* debmirror: con debmirror haremos una copia local completa de los repositorios de LinuxMint, Debian, Ubuntu, Huayra, etc.
* nginx: será el encargado de servir todos los paquetes de los mirrors y algunos que se necesitan para el booteo PXE
* squid: proxy caché para tráfico http
* nfs-server: se encargará de publicar x NFS algunas imágenes/archivos necesarios para el boot de los LiveCDs

----
En mi blog personal hay un post que explica cómo probar esta configuración virtualizando con kvm + libvirt [2] \\también pueden contactarme mediante Twitter: @mstaaravin o email: mstaaravin@gmail.com

También estoy por irc #sysarmy en la red de FreeNode

[1] http://firehol.sourceforge.net

[2] http://blog.ngen.com.ar/laboratorio-ipxe-flisol-2014/



