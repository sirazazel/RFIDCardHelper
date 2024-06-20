function Import-FromParameter {
    param (
        $cardId
    )
    $cardHex = Get-CardHex($cardId)
    $cardForm = Format-CardHex($cardHex)
    Write-ToConsole($cardForm)
}