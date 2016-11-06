Imports System.Web.Configuration
Imports GCA.Business
Imports GCA.Domain

Public Class frm_Crear_Periodo
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim cookie As HttpCookie = Request.Cookies("mensaje")
        If cookie IsNot Nothing Then
            lblMensaje.Text = Request.Cookies("mensaje").Value
        End If
    End Sub

    Protected Sub btnAccept_Click(sender As Object, e As EventArgs)
        Dim conn As String = WebConfigurationManager.ConnectionStrings("GCAConnectionString").ToString()
        Dim periodoB As New PeriodoBusiness(conn)
        Dim periodo As New Periodo()
        periodo.Nombre = txtNombre.Text
        periodo.Dias = Int32.Parse(txtDias.Text)
        periodoB.insertarPeriodo(periodo)
        Response.Cookies("mensaje").Value = "El periodo se creo correctamente."
        Response.Cookies("mensaje").Expires = DateTime.Now.AddSeconds(5)
        Response.Redirect("./frm_SPV_CrearPeriodo.aspx")


    End Sub

End Class