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
	echo "Opcion 2 elegida"
}

while true;do
echo "1) Respaldo de un directorio"
echo "1) Opcion 2"
echo "3) Salir"
read -p "Elige una opcion: " opcion

case $opcion in 
	1)
	opcion1
	;;
	2)
	opcion2
	;;
	3)
	break
	;;
	*)
	echo "Opcion no valida"
	;;
esac
echo ""
done

