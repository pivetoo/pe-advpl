#Include 'Totvs.ch'

/*/{Protheus.doc} MA035BUT
    Ponto de entrada para adicionar bot�es no Outras a��es do Grupo de Produtos - M�dulo Faturamento

    @author Rog�rio Piveto
    @since 29/03/2024
    @see https://tdn.totvs.com/pages/releaseview.action?pageId=6087601
/*/

User Function MA035BUT()

    Local aArea     := FWGetArea()
    Local aBotoes   := {}

    // Adiciona bot�es no Outras A��es
    aAdd(aBotoes, {'BITMAP', {|| fBotao()}, "Bot�o Criado PE"})

    FWRestArea(aArea)

Return aBotoes

Static Function fBotao()

    Local aArea     := FWGetArea()
    Local aAReaSBM  := SBM->(FWGetArea())

    alert("Teste")
    dbSkip()

    FWRestArea(aAreaSBM)
    FwRestArea(aArea)

Return
