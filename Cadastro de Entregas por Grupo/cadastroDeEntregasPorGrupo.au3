; include usada para chamar o arquivo dataGenerators
ConsoleWrite(@ScriptDir & "\Generators\dataGenerators.au3" & @CRLF)

#include "autoit\Generators\dataGenerators.au3"

; incluse usada para chamar o arquivo settings
#include "autoit\Settings\settings.au3"

; Abre a aplicação Delphi
Run($caminhoExecutavel)

; Esperar até que a janela principal esteja ativa
WinWaitActive("Projeto Teste", "", 10)

Func CadastroDeEntregasPorGrupo()
    ; Clica no botão 'Cadastro Entregas'
    ControlClick("Projeto Teste", "", "[TEXT:Cadastro Entregas]")
    
    ; Espera até que a janela 'Cadastro de Entregas por Grupo' esteja ativa
    WinWaitActive("Cadastro de Entregas por Grupo", "", 10)
    
    ; Preenche o campo 'Grupo' com o número gerado
    ControlSetText("Cadastro de Entregas por Grupo", "", "[CLASS:TEditSerieGrupo]", GerarNumero())
    Sleep(3000)
    
    ; Preenche os campos de data com a data atual
    ControlSetText("Cadastro de Entregas por Grupo", "", "[CLASS:TMaskEdit; INSTANCE:1]", GerarDataAtual())
    Sleep(3000)
    ControlSetText("Cadastro de Entregas por Grupo", "", "[CLASS:TMaskEdit; INSTANCE:2]", GerarDataAtual())
    Sleep(3000)
    
    ; Clica no botão 'Selecionar'
    ControlClick("Cadastro de Entregas por Grupo", "", "[TEXT:&Selecionar]")
    
    ; Obtém o texto do resultado
    $texto = ControlGetText("Cadastro de Entregas por Grupo", "", "[CLASS:TDBCtrlGrid]")
    
    ; Verifica se o texto tem resultado
    If $texto = "" Then
        ConsoleWrite("ERRO! Nenhum Resultado Foi Encontrado")
    Else
        ConsoleWrite("PASSOU! Um Resultado Foi Encontrado")
    EndIf
EndFunc

; Chamando a função para realizar o cadastro de entregas
CadastroDeEntregasPorGrupo()


; Fechar a janela da tela cadastro de entregar por grupo 
WinClose("Cadastro de Entregas por Grupo")

;; Fecha a janela principal
WinClose("Projeto Teste")