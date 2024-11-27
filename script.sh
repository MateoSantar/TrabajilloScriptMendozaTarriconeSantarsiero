
#!/bin/bash

RED='\e[1;31m'
GREEN='\e[1;32m'
CYAN='\e[1;36m'
ENDCOLOR='\e[0m'
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
			echo -e "${RED}Respaldo antiguo encontrado y eliminado!${ENDCOLOR}"
		fi
		zip -r $direct.zip $direct/
		mv $direct.zip respaldos/
		echo -e "Respaldo creado en ${GREEN}'respaldos'${ENDCOLOR} con el nombre de ${CYAN}$direct.zip${ENDCOLOR}"

	elif [ -e "$ruta" ]; then
		echo -e "${RED}$ruta es un archivo.${ENDCOLOR}"
	else
		echo -e "${RED}No existe $direct${ENDCOLOR}"
	fi
}
opcion2(){
	{
	echo " --- INFORME --- "
	echo -e "Fecha y Hora actual:$(date '+%F %T')"
	echo ""
	echo "Uso de CPU"
	echo ""
	top -bn1 | grep "Cpu(s)"
	echo ""
	echo "Uso de Memoria:"
	free -h
	echo ""

	echo "Uso de Disco:"
	df -h
	} > reporte.log
	echo -e "Reporte creado en ${GREEN}'reporte.log'${ENDCOLOR}"
}
opcion3(){
    echo -e "Ingrese el nombre del ${GREEN}nuevo usuario${ENDCOLOR}:"
    read nombre_usuario

    if id "$nombre_usuario" &>/dev/null; then
        echo -e "${RED}El usuario '$nombre_usuario' ya existe.${ENDCOLOR}"
        return 1
    fi

    sudo adduser "$nombre_usuario"

    if id "$nombre_usuario" &>/dev/null; then
        echo -e "${GREEN}El usuario '$nombre_usuario' se creó exitosamente.${ENDCOLOR}"

        echo -e "¿Desea añadir grupos al usuario? (${CYAN}s/n${ENDCOLOR}):"
        read agregar_grupos

        if [[ "$agregar_grupos" == "s" || "$agregar_grupos" == "S" ]]; then
            echo -e "Ingrese los nombres de los grupos separados por comas:"
            read grupos

            IFS=',' read -r -a grupos_array <<< "$grupos"

            for grupo in "${grupos_array[@]}"; do
                if ! getent group "$grupo" &>/dev/null; then
                    echo -e "${CYAN}El grupo '$grupo' no existe. Creándolo...${ENDCOLOR}"
                    sudo groupadd "$grupo"
                fi

                sudo usermod -aG "$grupo" "$nombre_usuario"
                echo -e "${GREEN}Añadido al grupo '$grupo'.${ENDCOLOR}"
            done
        fi

    else
        echo -e "${RED}Hubo un error al crear el usuario '$nombre_usuario'.${ENDCOLOR}"
    fi
}

opcion4(){
echo -e "${CYAN}Actualizando el Sistema${ENDCOLOR}..."
sudo apt update && sudo apt upgrade -y
echo -e "${CYAN}Sistema actualizado corrextamente.${ENDCOLOR}"
}
opcion5(){
echo -e "${CYAN}Eliminando archivos innecesarios y caché${ENDCOLOR}..."
sudo apt autoremove -y
sudo apt clean
sudo rm -rf /tmp/*
echo -e "${CYAN}Archivos y caché eliminados correctamente.${ENDCOLOR}"
}

echo ""
echo ""
echo "██████╗ ██╗███████╗███╗   ██╗██╗   ██╗███████╗███╗   ██╗██╗██████╗  ██████╗ "
echo "██╔══██╗██║██╔════╝████╗  ██║██║   ██║██╔════╝████╗  ██║██║██╔══██╗██╔═══██╗"
echo "██████╔╝██║█████╗  ██╔██╗ ██║██║   ██║█████╗  ██╔██╗ ██║██║██║  ██║██║   ██║"
echo "██╔══██╗██║██╔══╝  ██║╚██╗██║╚██╗ ██╔╝██╔══╝  ██║╚██╗██║██║██║  ██║██║   ██║"
echo "██████╔╝██║███████╗██║ ╚████║ ╚████╔╝ ███████╗██║ ╚████║██║██████╔╝╚██████╔╝"
echo "╚═════╝ ╚═╝╚══════╝╚═╝  ╚═══╝  ╚═══╝  ╚══════╝╚═╝  ╚═══╝╚═╝╚═════╝  ╚═════╝ "
echo ""                                                                           

while true;do
echo -e "${GREEN}1)${CYAN}Respaldo de un directorio${ENDCOLOR}"
echo -e "${GREEN}2)${CYAN}Generacion de un informe de especificaciones${ENDCOLOR}"
echo -e "${GREEN}3)${CYAN}Crear un usuario${ENDCOLOR}"
echo -e "${GREEN}4)${CYAN}Actualizar sistema${ENDCOLOR}"
echo -e "${GREEN}5)${CYAN}Eliminacion de archivos y cache${ENDCOLOR}"
echo -e "${GREEN}0)${RED}Salir${ENDCOLOR}"
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
	echo -e "${RED}Opcion no valida${ENDCOLOR}"
	;;
esac
read
clear
done

