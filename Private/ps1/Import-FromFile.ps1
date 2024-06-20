
function Import-FromFile {
    try {
        foreach($cardId in Get-Content $fileIn) {
            $cardHex = ConvertTo-Hex($cardId)
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
