#Include 'Totvs.ch'

/*/{Protheus.doc} MTA410T
    Ponto de entrada dispara um email ap�s a grava��o do pedido de venda

    @author Rog�rio Piveto
    @since 04/04/2024
    @see https://tdn.totvs.com/display/public/PROT/MTA410T
/*/

User Function MTA410T()

    Local aArea     := FWGetArea()
    Local cCorpo    := ""
    Local cAssunto  := ""
    Local cPara     := ""
    Local nPosProd  := GDFieldPos("C6_PRODUTO")
    Local nPosDesc  := GDFieldPos("C6_DESCRI")
    Local nPosQtde  := GDFieldPos("C6_QTDVEN")
    Local nPosVlUn  := GDFieldPos("C6_PRCVEN")
    Local nPosVtot  := GDFieldPos("C6_VALOR")
    Local nAtual    := 0

    // Se for uma inclus�o ou c�pia e o tipo do pedido for normal
    If (INCLUI .Or. FWIsInCallStack("a410PCopia")) .And. SC5->C5_TIPO == "N"
        // Dispara uma mensagem de email
        cCorpo := '<p>Ol�.</p>'
        cCorpo += '<p>Foi incluido um novo pedido de venda no sistema, abaixo as informa��es:</p>'
        cCorpo += '<p><b>Pedido:</b> '             + SC5->C5_NUM + '</p>'
        cCorpo += '<p><b>Cliente:</b> '            + SC5->C5_CLIENTE + SC5->C5_LOJACLI + ' (' + Alltrim(Posicione('SA1', 1, FWxFilial('SA1') + SC5->C5_CLIENTE + SC5->C5_LOJACLI, 'A1_NOME')) + ')</p>'
        cCorpo += '<p><b>Vendedor:</b> '           + SC5->C5_VEND1 + ' (' + Alltrim(Posicione('SA3', 1, FWxFilial('SA3') + SC5->C5_VEND1, 'A3_NOME')) + ')</p>'
        cCorpo += '<p><b>Condi��o Pagamento:</b> ' + SC5->C5_CONDPAG + ' (' + Alltrim(Posicione('SE4', 1, FWxFilial('SE4') + SC5->C5_CONDPAG, 'E4_DESCRI')) + ')</p>'
        cCorpo += '<p><b>Itens:</b> </p>'
        cCorpo += '<center>'
        cCorpo += '<table>'
        cCorpo += '<tr>'
        cCorpo += '<td><b>Produto</b></td>'
        cCorpo += '<td><b>Descri��o</b></td>'
        cCorpo += '<td><b>Qtde</b></td>'
        cCorpo += '<td><b>Vlr. Unit.</b></td>'
        cCorpo += '<td><b>Vlr. Total</b></td>'
        cCorpo += '</tr>'

        For nAtual := 1 To Len(aCols)
            cCorpo += '<tr>'
            cCorpo += '<td>' + aCols[nAtual][nPosProd] + '</td>'
            cCorpo += '<td>' + aCols[nAtual][nPosDesc] + '</td>'
            cCorpo += '<td>' + Transform(aCols[nAtual][nPosQtde], "@E 999,999.99") + '</td>'
            cCorpo += '<td>' + Transform(aCols[nAtual][nPosVlUn], "@E 999,999.99") + '</td>'
            cCorpo += '<td>' + Transform(aCols[nAtual][nPosVtot], "@E 999,999.99") + '</td>'
            cCorpo += '</tr>'
        Next
        cCorpo += '</table>'
        cCorpo += '</center>'
        cCorpo += '<p>Mensagem disparada na data <em>' + DToC(Date()) + '</em> �s <em>' + Time() + '</em>.</p>'

        cAssunto := "Pedido #" + SC5->C5_NUM
        cPara    := "pivetorogerio@gmail.com"
        GPEMail(cAssunto, cCorpo, cPara, /*aAnexos*/, /*lExibeHelp*/)    
    EndIf

    FWRestArea(aArea)

Return
