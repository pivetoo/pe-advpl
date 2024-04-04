#Include 'Totvs.ch'

/*/{Protheus.doc} MT410TOK
    Ponto de entrada na validação ao clicar no botão Confirmar

    @author Rogério Piveto
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

    // Se for um pedido normal (tipo N) e não tiver vendedor preenchido
    If cTipoPed == 'N' .And. Empty(cVendedor)
        ExibeHelp("HELP", "Para pedido do tipo normal (N), é obrigatório preencher o campo de código do vendedor!", "Preencha a informação no campo C5_VEND1")
        lContinua := .F.
    EndIf

    FWRestArea(aArea)

Return lContinua
