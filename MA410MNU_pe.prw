#Include 'Totvs.ch'

/*/{Protheus.doc} MA410MNU
    Ponto de entrada para adicionar bot�es no menu Outras A��es no Pedido de Venda

    @author Rog�rio Piveto
    @since 02/04/2024
    @see https://tdn.totvs.com/display/public/PROT/MA410MNU
/*/

User Function MA410MNU()

    Local aArea := GetArea()

    // Adiciona na vari�vel do Menu
    aAdd(aRotina, {"* Data e Hora Atual", "u_zPeMnu()", 0, 2, 0, Nil})

    RestArea(aArea)

Return

/*/{Protheus.doc} zPeMnu
    Função de teste adicionada no outras A��es do browse do pedido

    @author Rog�rio Piveto
    @since 02/04/2024
/*/

User Function zPeMnu()

    Local aArea     := FWGetArea()
    Local cMensagem := ""

    // Monta a mensagem e exibe
    cMensagem := "Voc� est� posicionado no pedido [" + SC5->C5_NUM + "]" + CRLF
    cMensagem += "" + CRLF
    cMensagem += "Hoje �:           [" + DToC(Date()) + "]" + CRLF
    cMensagem += "A hora atual �:   [" + Time() + "]" + CRLF
    ShowLog(cMensagem)

    FWRestArea(aArea)

Return
