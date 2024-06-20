function Write-ToFile {
    param (
        $cardForm
        )
        Add-Content -Path $fileOut -Value '----------------------------'
        Add-Content -Path $fileOut -Value "Código original:  $cardId"
        Add-Content -Path $fileOut -Value "Código convertido: $cardForm"
    }