﻿Public Class frm_OFI_ManEnviarControl
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        MsgBox(CType(Session("controlID"), String))
    End Sub

End Class