#Include 'Totvs.ch'

/*/{Protheus.doc} MA410MNU
    Ponto de entrada para adicionar botões no menu Outras Ações no Pedido de Venda

    @author Rogério Piveto
    @since 02/04/2024
    @see https://tdn.totvs.com/display/public/PROT/MA410MNU
/*/

User Function MA410MNU()

    Local aArea := GetArea()

    // Adiciona na variável do Menu
    aAdd(aRotina, {"* Data e Hora Atual", "u_zPeMnu()", 0, 2, 0, Nil})

    RestArea(aArea)

Return

/*/{Protheus.doc} zPeMnu
    FunÃ§Ã£o de teste adicionada no outras Ações do browse do pedido

    @author Rogério Piveto
    @since 02/04/2024
/*/

User Function zPeMnu()

    Local aArea     := FWGetArea()
    Local cMensagem := ""

    // Monta a mensagem e exibe
    cMensagem := "Você está posicionado no pedido [" + SC5->C5_NUM + "]" + CRLF
    cMensagem += "" + CRLF
    cMensagem += "Hoje é:           [" + DToC(Date()) + "]" + CRLF
    cMensagem += "A hora atual é:   [" + Time() + "]" + CRLF
    ShowLog(cMensagem)

    FWRestArea(aArea)

Return
