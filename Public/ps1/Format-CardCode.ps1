function Format-CardCode {
    # Parámetros default, si no se especifica el script busca IDs en los archivos .txt del mismo directorio.
    [CmdletBinding()]
    param (
        [Parameter()] [long]$cardId=0,
        [Parameter()] [string]$fileIn="codigos.txt",
        [Parameter()] [string]$fileOut="codigosOut.txt"
    )

    if($cardId -eq 0){
        Convert-FromFile;
    } else {
        Convert-FromParameter($cardId);
    }
}
