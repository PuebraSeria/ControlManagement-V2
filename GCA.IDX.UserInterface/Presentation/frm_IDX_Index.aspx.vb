Public Class frm_IDX_Index
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnIngresar_Click(sender As Object, e As EventArgs)
        Dim id As String = txtID.Text
        Dim password As String = txtContrasenna.Text

        ' Verificamos si es un supervisor
        If (id Like "123") And (password Like "ofi") Then
            MyClass.Response.Redirect("http://localhost:49338/Presentation/frm_OFI_ConEstadoReportes.aspx", True)
        ElseIf (id Like "123") And (password Like "sup") Then
            MyClass.Response.Redirect("http://localhost:49327/Presentation/frm_SPV_ConEstadoDeControles.aspx", True)
        End If
    End Sub
End Class