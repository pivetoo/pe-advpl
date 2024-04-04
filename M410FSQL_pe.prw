#Include 'Totvs.ch'

/*/{Protheus.doc} M410FSQL
    Ponto de entrada para filtrar um browse

    @author Rogério Piveto
    @since 02/04/2024
/*/

User Function M410FSQL()

    Local aArea     := FWGetArea()
    Local cFiltro   := ""
    Local aPergs    := {}
    Local cClieDe   := Space(TamSX3('A1_COD')[1])
    Local cClieAt   := StrTran(cClieDe, ' ', 'Z')
    Local dDataDe   := FirstDate(Date())
    Local dDataAt   := LastDate(Date())

    // Adiciona os parâmetros que serão exibidos
    aAdd(aPergs, {1, "Cliente de",  cClieDe, "", "Vazio() .Or. ExistCpo('SA1')",    "SA1", ".T.", 70, .F.}) // MV_PAR01
    aAdd(aPergs, {1, "Cliente até", cClieAt, "", "ExistCpo('SA1')",                 "SA1", ".T.", 70, .T.}) // MV_PAR02
    aAdd(aPergs, {1, "Data De",     dDataDe, "", ".T.",                             "",    ".T.", 80, .F.}) // MV_PAR03
    aAdd(aPergs, {1, "Data Até",    dDataAt, "", ".T.",                             "",    ".T.", 80, .T.}) // MV_PAR04

    // Se a pergunta for confirmada
    If ParamBox(aPergs, "Informe os parâmetros",,,,,,,,, .F., .F.)
        // Monta o filtro que será aplicado no browse
        cFiltro += " SC5->C5_CLIENTE >= '" + MV_PAR01       + "' .AND. "
        cFiltro += " SC5->C5_CLIENTE <= '" + MV_PAR02       + "' .AND. "
        cFiltro += " SC5->C5_EMISSAO >= StoD('" + DToS(MV_PAR03) + "') .AND. "
        cFiltro += " SC5->C5_EMISSAO <= StoD('" + DToS(MV_PAR04) + "') "
    EndIf

    FWRestArea(aArea)

Return cFiltro
