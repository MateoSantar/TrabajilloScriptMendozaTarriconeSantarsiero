# Script de Automatización en Bash

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
