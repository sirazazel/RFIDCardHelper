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
