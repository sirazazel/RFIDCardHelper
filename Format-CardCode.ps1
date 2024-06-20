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

# Parámetros default, si no se especifica el script busca IDs en los archivos .txt del mismo directorio.
[CmdletBinding()]
param (
    [Parameter()] [long]$cardId=0,
    [Parameter()] [string]$fileIn="codigos.txt",
    [Parameter()] [string]$fileOut="codigosOut.txt"
)

function Convert-FromParameter {
    param (
        $cardId
    )
    $cardHex = Get-CardHex($cardId)
    $cardForm = Format-CardHex($cardHex)
    Write-Host($cardForm)
}

function Convert-FromFile {
    try {
        foreach($cardId in Get-Content $fileIn) {
            $cardHex = Get-CardHex($cardId)
            $cardForm = Format-CardHex($cardHex)
            Write-ToFile($cardForm)
        }
        Write-Host "Procesado."
        Pause
    }
    catch{
       Write-Host "Error desconocido en el procesamiento del fichero. Revisa el fichero entrada y recréalo si es necesario."
       Pause
    }
}

function Get-CardHex {
    param (
        $cardId
        )
        $cardHex = "{0:X}" -f [long]$cardId
        return $cardHex
    }
    
# Guardamos dígitos en buffer de dos en dos, y vamos haciendo append al inicio del código final para 
# invertir cada bloque de 2 dígitos.
# Ej: Input: 3296822013 Hex: c48182fd Cód:FD8281C4
function Format-CardHex {
    param (
        $cardHex
        )
        $cardForm = ""
        $cardHexArray = $cardHex.ToCharArray()
        $counter = 0
        foreach ($character in $cardHexArray){
            $counter++
        if($counter -le 1){
            $buffer += $character
            continue
        } else {
            $buffer +=$character
            $cardForm = $buffer + $cardForm
            #Reset
            $buffer = "" 
            $counter = 0
        }
    }
    $cardForm = $buffer + $cardForm
    return $cardForm
}

function Write-ToFile {
    param (
        $cardForm
        )
        Add-Content -Path $fileOut -Value '----------------------------'
        Add-Content -Path $fileOut -Value "Código original:  $cardId"
        Add-Content -Path $fileOut -Value "Código convertido: $cardForm"
    }

# Start process
if($cardId -eq 0){
    Convert-FromFile;
} else {
    Convert-FromParameter($cardId);
}
