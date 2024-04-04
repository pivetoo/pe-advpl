#Include 'Totvs.ch'

/*/{Protheus.doc} GEMXGRCVND
    P.E adicionado durante a gravação dos dados no pedido de venda

    @author Rogério Piveto
    @since 04/04/2024
    @see https://tdn.totvs.com/pages/releaseview.action?pageId=6784609
/*/

User Function GEMXGRCVND()

    Local aArea   := FWGetArea()  // Salva a área de trabalho atual
    Local cEstado := ""           // Inicializa a variável para o estado
    Local cObsAux := "CLIENTE DE SP ! "  // Define a observação a ser adicionada

    // Se for um pedido normal, busca o estado do cliente
    If SC5->C5_TIPO == "N"
        // Posiciona no registro do cliente e obtém o estado
        cEstado := Posicione('SA1', 1, FWxFilial('SA1') + SC5->C5_CLIENTE + SC5->C5_LOJACLI, "A1_EST")

        // Se o cliente for de São Paulo e a observação ainda não estiver na nota
        If cEstado == "SP" .And. ! cObsAux $ Upper(SC5->C5_MENNOTA)
            // Adiciona a observação ao início da mensagem da nota
            SC5->C5_MENNOTA := cObsAux + SC5->C5_MENNOTA
        EndIf
    EndIf

    FWRestArea(aArea)  // Restaura a área de trabalho anterior
    
Return
