function ConvertTo-Hex {
    param (
        $cardId
        )
        $cardHex = "{0:X}" -f [long]$cardId
        return $cardHex
    }