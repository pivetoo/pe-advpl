#Include 'Totvs.ch'

/*/{Protheus.doc} MA035BUT
    Ponto de entrada para adicionar botões no Outras ações do Grupo de Produtos - Módulo Faturamento

    @author Rogério Piveto
    @since 29/03/2024
    @see https://tdn.totvs.com/pages/releaseview.action?pageId=6087601
/*/

User Function MA035BUT()

    Local aArea     := FWGetArea()
    Local aBotoes   := {}

    // Adiciona botões no Outras Ações
    aAdd(aBotoes, {'BITMAP', {|| fBotao()}, "Botão Criado PE"})

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
