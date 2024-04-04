#Include 'Totvs.ch'

/*/{Protheus.doc} MT410ACE
    Ponto de entrada usado ao acessar uma tela
    
    @author Rog�rio Piveto
    @since 02/04/2024
    @see https://tdn.totvs.com/pages/releaseview.action?pageId=6784346
/*/

User Function MT410ACE()
    Local aArea     := FWGetArea()
    Local lContinua := .T.
    Local nOpcao    := PARAMIXB[1]

    //Se for antes das 8h da manh�, n�o permite prosseguir
    If Time() <= "08:30:00"
        lContinua := .F.

        //Mas se for um usu�rio administrador, mostra a pergunta se deseja abrir mesmo assim
        If ! IsBlind() .And. FWIsAdmin()
            lContinua := FWAlertYesNo("Pedidos n�o podem ser manipulados antes das 8h30, mas voc� como Administrador, deseja continuar?", "Continua (Op��o " + cValToChar(nOpcao) + ")?")
        EndIf
    EndIf

    FWRestArea(aArea)
Return lContinua

