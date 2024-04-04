#Include 'Totvs.ch'

/*/{Protheus.doc} MT410TOK
    Ponto de entrada na valida��o ao clicar no bot�o Confirmar

    @author Rog�rio Piveto
    @since 03/04/2024
    @see https://tdn.totvs.com/pages/releaseview.action?pageId=6784353
/*/

User Function MT410TOK()

    Local aArea     := FWGetArea()
    Local lContinua := .T.
    Local cVendedor := ""
    Local cTipoPed  := ""

    // Pega o campo de vendedor e do tipo de pedido
    cVendedor   := M->C5_VEND1
    cTipoPed    := M->C5_TIPO

    // Se for um pedido normal (tipo N) e n�o tiver vendedor preenchido
    If cTipoPed == 'N' .And. Empty(cVendedor)
        ExibeHelp("HELP", "Para pedido do tipo normal (N), � obrigat�rio preencher o campo de c�digo do vendedor!", "Preencha a informa��o no campo C5_VEND1")
        lContinua := .F.
    EndIf

    FWRestArea(aArea)

Return lContinua
