El server que se usará en Flisol CABA 2014 usará Debian GNU/Linux como SO, por lo que el paquete debmirror está directamente disponible 
al igual que en distribuciones derivadas de Debian, tales como LinuxMint, Ubuntu, Huayra, Trisquel y un largo etc...

Para instalar el paquete debmirror

:~# aptitude install debmirror

TODA la configuración a utilizar contempla que el directorio donde se alojaran todos los mirrors de las distintas distribuciones será: 

/home/mirrors/
	     debian/
             debian-security/
	     linuxmint/
             trisquel/
 	     huayra/
             ubuntu/
