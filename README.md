# Script de Automatización en Bash
<p align="left">
  <a href="">
    <img src="https://skillicons.dev/icons?i=bash" />
  </a>
</p>

Este script en Bash proporciona varias funcionalidades útiles para la gestión del sistema, como respaldo de directorios, generación de informes, creación de usuarios, actualización del sistema y limpieza de archivos innecesarios y caché.

## Requisitos

Este script está diseñado para ser ejecutado en una distribución de Linux basada en Debian (en este caso RasperryOS). Se recomienda ser superusurio (root) o usar `sudo` para ejecutar algunas de las funciones.

## Funcionalidades

El script ofrece un menú interactivo que incluye las siguientes opciones:

### 1. **Respaldo de un directorio**
   - **Descripción**: Permite al usuario seleccionar un directorio del sistema para crear un respaldo comprimido en formato `.zip`. Si existe un respaldo previo con el mismo nombre, el respaldo antiguo será eliminado.
   - **Detalles**:
     - Si no existe el directorio `respaldos/`, este será creado automáticamente.
     - El respaldo será guardado en la carpeta `respaldos/` con el nombre del directorio seleccionado.
### 2. **Generación de un informe de especificaciones**
   - **Descripción**: Genera un informe detallado del sistema que incluye la fecha y hora actual, uso de CPU, uso de memoria y uso de disco.
   - **Salida**: El informe se guarda en un archivo llamado `reporte.log`.

### 3. **Crear un usuario**
   - **Descripción**: Solicita el nombre de un nuevo usuario y lo crea en el sistema utilizando el comando `adduser`. Luego, se verifica la creación del usuario mostrando los detalles en el archivo `/etc/passwd`.

### 4. **Actualizar sistema**
   - **Descripción**: Actualiza el sistema operativo utilizando los comandos `sudo apt update` y `sudo apt upgrade`. Esta opción descarga las últimas actualizaciones y las aplica sin intervención del usuario.
   - **Requerimiento**: Privilegios de administrador para ejecutar los comandos de actualización.

### 5. **Eliminación de archivos y caché**
   - **Descripción**: Elimina archivos innecesarios del sistema y limpia la caché de paquetes descargados. También borra los archivos temporales del directorio `/tmp/`.
   - **Comandos utilizados**:
     - `sudo apt autoremove`: Elimina paquetes no utilizados.
     - `sudo apt clean`: Limpia la caché de paquetes descargados.
     - `sudo rm -rf /tmp/*`: Borra los archivos temporales.

### 0. **Salir**
   - **Descripción**: Finaliza la ejecución del script.

## Ejecución

1. Para ejecutar este script, primero asegúrate de tener permisos de ejecución en el archivo:
   ```bash
   chmod +x script.sh
2. Ejecutar el script:
   ```bash
   ./script.sh

## Ejemplo

### Respaldo de un Directorio

```bash
DirectorioPrueba README.md script.sh
Que directorio desea respaldar? DirectorioPrueba
  adding: DirectorioPrueba/ (stored 0%)
Respaldo creado en 'respaldos' con el nombre de DirectorioPrueba.zip
```

### Generacion de Infome
```bash
 --- INFORME --- 
 Fecha y Hora actual: 2024-10-27 14:08:25

 Uso de CPU:
 %Cpu(s):  0,0 us,  6,2 sy,  0,0 ni, 93,8 id,  0,0 wa,  0,0 hi,  0,0 si,  0,0 st

 Uso de Memoria:
                total        used        free      shared  buff/cache   available
 Mem:           1,9Gi       259Mi       671Mi        25Mi       1,0Gi       1,5Gi
 Swap:          1,0Gi          0B       1,0Gi

 Uso de Disco:
 S.ficheros     Tamaño Usados  Disp Uso% Montado en
 udev             947M      0  947M   0% /dev
 tmpfs            199M   948K  198M   1% /run
 /dev/sda1         19G   7,9G  9,8G  45% /
 tmpfs            992M      0  992M   0% /dev/shm
 tmpfs            5,0M   4,0K  5,0M   1% /run/lock
 tmpfs            199M    28K  199M   1% /run/user/1000
```

### Creacion de Usuario
```bash
Ingrese el nombre del nuevo usuario: usuario
Añadiendo el usuario `usuario' ...
Añadiendo el nuevo grupo `usuario' (1001) ...
Añadiendo el nuevo usuario `usuario' (1001) con grupo `usuario' ...
Creando el directorio personal `/home/usuario' ...
Copiando los ficheros desde `/etc/skel' ...
Nueva contraseña: 
Vuelva a escribir la nueva contraseña: 
passwd: contraseña actualizada correctamente
Cambiando la información de usuario para usuario
Introduzca el nuevo valor, o pulse INTRO para usar el valor predeterminado
	Nombre completo []: 	
	Número de habitación []: 
	Teléfono del trabajo []: 
	Teléfono de casa []: 
	Otro []: 
¿Es correcta la información? [S/n] s
usuario:x:1001:1001:,,,:/home/usuario:/bin/bash
```

### Actualizacion de Sistema

```bash
Actualizando el Sistema...
Obj:1 http://deb.debian.org/debian bullseye InRelease
Obj:2 http://deb.debian.org/debian-security bullseye-security InRelease
Obj:3 http://deb.debian.org/debian bullseye-updates InRelease      
Err:4 https://cli.github.com/packages stable InRelease             
  Certificate verification failed: The certificate is NOT trusted. The certificate issuer is unknown.  Could not handshake: Error in the certificate verification. [IP: 185.199.110.153 443]
Obj:5 http://archive.raspberrypi.org/debian bullseye InRelease
Leyendo lista de paquetes... Hecho
Creando árbol de dependencias... Hecho
Leyendo la información de estado... Hecho
Se puede actualizar 1 paquete. Ejecute «apt list --upgradable» para verlo.
W: https://cli.github.com/packages/dists/stable/InRelease: No system certificates available. Try installing ca-certificates.
W: Fallo al obtener https://cli.github.com/packages/dists/stable/InRelease  Certificate verification failed: The certificate is NOT trusted. The certificate issuer is unknown.  Could not handshake: Error in the certificate verification. [IP: 185.199.110.153 443]
W: No se han podido descargar algunos archivos de índice, se han omitido, o se han utilizado unos antiguos en su lugar.
Leyendo lista de paquetes... Hecho
Creando árbol de dependencias... Hecho
Leyendo la información de estado... Hecho
Calculando la actualización... Hecho
El paquete indicado a continuación se instaló de forma automática y ya no es necesario.
  vim-runtime
Utilice «sudo apt autoremove» para eliminarlo.
Los siguientes paquetes se han retenido:
  linux-image-amd64:amd64
0 actualizados, 0 nuevos se instalarán, 0 para eliminar y 1 no actualizados.

```

### Eliminacion de Archivos Temporales y Cache

```bash
Eliminando archivos innecesarios y caché...
Leyendo lista de paquetes... Hecho
Creando árbol de dependencias... Hecho
Leyendo la información de estado... Hecho
Los siguientes paquetes se ELIMINARÁN:
  vim-runtime
0 actualizados, 0 nuevos se instalarán, 1 para eliminar y 1 no actualizados.
Se liberarán 32,9 MB después de esta operación.
(Leyendo la base de datos ... 186970 ficheros o directorios instalados actualmente.)
Desinstalando vim-runtime (2:8.2.2434-3+deb11u1) ...
Eliminando `desviación de /usr/share/vim/vim82/doc/help.txt a /usr/share/vim/vim82/doc/help.txt.vim-tiny por vim-runtime'
Eliminando `desviación de /usr/share/vim/vim82/doc/tags a /usr/share/vim/vim82/doc/tags.vim-tiny por vim-runtime'
Procesando disparadores para man-db (2.9.4-2) ...
Archivos y caché eliminados correctamente.
```

## Contribuciones

¡Las contribuciones son bienvenidas! Aquí tienes algunas pautas para colaborar en este script:

### Cómo Contribuir

1. **Fork del Repositorio**: Haz un fork de este repositorio.
2. **Crea una Nueva Rama**:
   ```bash
   git checkout -b mi-nueva-caracteristica
3. **Agrega las modificaciones**:
   ```bash
   git add .
5. **Commit a tus cambios**:
   ```bash
   git commit -m "Agrega nueva característica"
6. **Push a tu rama**:
   ```bash
   git push origin mi-nueva-caracteristica
7. **Crea un Pull Request**

Tus cambios seran revisados!

## Errores

No se genera el archivo .zip => Comprobar que esta instalado el paquete zip unzip

## Licencia

Este proyecto está bajo la **MIT License**

---

MIT License

Copyright (c) [2024] [Santarsiero Mateo, Mendoza Joaquín Pedro, Tarricone Thiago]

Se concede permiso, de forma gratuita, a cualquier persona que obtenga una copia
de este software,
para utilizar este software sin restricciones, incluyendo, pero no limitándose a,
los derechos a usar, copiar, modificar, fusionar, publicar, distribuir, sublicenciar
y/o vender copias del Software, y a permitir que las personas a las que se les
proporcione el Software lo hagan, bajo las siguientes condiciones:

1. El aviso de copyright anterior y este aviso de permiso se incluirán en todas
   las copias o partes sustanciales del Software.
