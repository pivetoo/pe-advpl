#Include 'Totvs.ch'

/*/{Protheus.doc} GEMXGRCVND
    P.E adicionado durante a grava��o dos dados no pedido de venda

    @author Rog�rio Piveto
    @since 04/04/2024
    @see https://tdn.totvs.com/pages/releaseview.action?pageId=6784609
/*/

User Function GEMXGRCVND()

    Local aArea   := FWGetArea()  // Salva a �rea de trabalho atual
    Local cEstado := ""           // Inicializa a vari�vel para o estado
    Local cObsAux := "CLIENTE DE SP ! "  // Define a observa��o a ser adicionada

    // Se for um pedido normal, busca o estado do cliente
    If SC5->C5_TIPO == "N"
        // Posiciona no registro do cliente e obt�m o estado
        cEstado := Posicione('SA1', 1, FWxFilial('SA1') + SC5->C5_CLIENTE + SC5->C5_LOJACLI, "A1_EST")

        // Se o cliente for de S�o Paulo e a observa��o ainda n�o estiver na nota
        If cEstado == "SP" .And. ! cObsAux $ Upper(SC5->C5_MENNOTA)
            // Adiciona a observa��o ao in�cio da mensagem da nota
            SC5->C5_MENNOTA := cObsAux + SC5->C5_MENNOTA
        EndIf
    EndIf

    FWRestArea(aArea)  // Restaura a �rea de trabalho anterior
    
Return
