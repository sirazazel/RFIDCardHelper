<#
.SYNOPSIS
Este script decodifica las tarjetas RFID para poder añadirlas directamente a la plataforma Electromaps.

.DESCRIPTION
Mediante el bloc de notas, rellenar línea a línea el fichero codigos.txt, con un código en cada línea.
Abrir la carpeta del script en Powershell, de manera que estemos situados en el directorio mediante el terminal.
Ejecutar el script: ./Format-CardCode.ps1

.PARAMETER cardId
Declarar si se quiere convertir únicamente un código

.PARAMETER fileIn, fileOut
Declarar si se quieren especificar rutas alternativas a los ficheros de E/S

.EXAMPLE
Expresando un único código
Format-CardCode -cardId 0123456
> 
Procesando un fichero
Format-CardCode -fileIn fichero.txt
> Procesado.

.NOTES
En el fichero se deben pasar únicamente códigos numéricos sin espacios, y separados línea a línea.
Ej.:
123456
123456
123456

.AUTHOR
F.Mut
#>