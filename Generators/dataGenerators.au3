Func GerarNumero()
    ; Definir o tamanho do número
    Local $tamanho = 6

    ; Inicializar a variável para armazenar o número gerado
    Local $numero = ""

    ; Gerar números aleatórios e adicioná-los à string
    For $i = 1 To $tamanho
        $numero &= Random(0, 9, 1)
    Next

    ; Retornar o número gerado
    Return $numero
EndFunc

Func GerarDataAtual()
    ; Obter o ano, mês e dia atuais
    Local $ano = @YEAR
    Local $mes = @MON
    Local $dia = @MDAY

    ; Formatar a data atual no formato desejado (dd/mm/aaaa)
    Local $dataAtual = StringFormat("%02d/%02d/%04d", $dia, $mes, $ano)

    ; Retornar a data atual formatada
    Return $dataAtual
EndFunc