
#!/bin/bash

opcion1(){
	echo $(ls)
	read -p "Que directorio desea respaldar? " direct
	ruta=$PWD/$direct
	if [ -d "$ruta" ]; then
		if [ ! -d "respaldos/" ];then
			mkdir respaldos
		fi

		if [ -e "respaldos/$direct.zip" ];then
			rm respaldos/$direct.zip
			echo "Respaldo antiguo encontrado y eliminado!"
		fi 
		zip -r $direct.zip $direct/
		mv $direct.zip respaldos/
		echo "Respaldo creado en 'respaldos' con el nombre de $direct.zip"

	elif [ -e "$ruta" ]; then
		echo "$ruta es un archivo."
	else
		echo "No existe $direct"
	fi
}
opcion2(){
	{
	echo " --- INFORME --- "
	echo "Fecha y Hora actual: $(date '+%F %T')"
	echo ""
	echo "Uso de CPU:"
	top -bn1 | grep "Cpu(s)"
	echo ""
	echo "Uso de Memoria:"
	free -h
	echo ""

	echo "Uso de Disco:"
	df -h
	} > reporte.log
	echo "Reporte creado en 'reporte.log'"
}
opcion3(){
	read -p "Ingrese el nombre del nuevo usuario: " nombre_usuario
	sudo adduser $nombre_usuario
	cat /etc/passwd | grep $nombre_usuario
}
#Esto es un comentario
opcion4(){
echo "Esta es la opcion 4"
}
opcion5(){
echo "Esta es la opcion 5"
}

while true;do
echo "1) Respaldo de un directorio"
echo "2) Generacion de un informe de especificaciones"
echo "3) Crear un usuario"
echo "4) Actualizar sistema"
echo "5) Eliminacion de archivos y cache"
echo "0) Salir"
read -p "Elige una opcion: " opcion

case $opcion in
	1)
	opcion1
	;;
	2)
	opcion2
	;;
	3)
	opcion3
	;;
 	4)
  	opcion4
   	;;
    	5)
     	opcion5
      	;;
	0)
	break
	;;
	*)
	echo "Opcion no valida"
	;;
esac
echo ""
done

