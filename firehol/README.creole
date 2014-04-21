=== Firehol ===

Firehol es un simple wrapper para iptables que nos permite configurar fácilmente un muy simple o complejo firewall.
Se instala mediante:

{{{
:~# aptitude install firehol
}}}

En este ejemplo el archivo .conf incluido aqui debe reemplazar al original en /etc/firehol/firehol.conf es muy simple de interpretar y es autoexplicativo.

En sistemas Debian derivados, no deben olvidar habilitar el inicio de firehol

{{{
#To enable firehol at startup set START_FIREHOL=YES
START_FIREHOL=YES
FIREHOL_LOG_MODE=ULOG
}}}


==== /etc/firehol/firehol.conf ====
{{{
version 5
 
# configuracion proxy transparente
transparent_squid 3128 "root proxy" inface "eth1 src 192.168.122.0/24"

interface eth0 wan
      client all accept
 
interface eth1 lan
     policy accept
     server all accept
     client all accept
 

router wan-to-lan inface eth0 outface eth1
        route all accept

router lan-to-wan inface eth1 outface eth0
       masquerade
       route all accept
 
}}}


Para mas información/documentación sobre firehol: http://firehol.sourceforge.net

