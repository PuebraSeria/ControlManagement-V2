Imports System.Web.Configuration
Imports GCA.Business
Imports GCA.Domain

Public Class frm_SPV_CrearOficina
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim cookie As HttpCookie = Request.Cookies("mensaje")
        If cookie IsNot Nothing Then
            lblMensaje.Text = Request.Cookies("mensaje").Value
        End If
    End Sub

    Protected Sub btnAccept_Click(sender As Object, e As EventArgs)
        Dim conn As String = WebConfigurationManager.ConnectionStrings("GCAConnectionString").ToString()
        Dim oficinaB As New OficinaBusiness(conn)
        If (oficinaB.existeOficina(txtCodigo.Text) = 0) Then
            Dim oficina As New Oficina()
            oficina.Codigo = txtCodigo.Text
            oficina.Nombre = txtNombre.Text
            oficinaB.insertarOficina(oficina)
            Response.Cookies("mensaje").Value = "La oficina se creo correctamente."
            Response.Cookies("mensaje").Expires = DateTime.Now.AddSeconds(5)
            Response.Redirect("./frm_SPV_CrearOficina.aspx")
        Else
            Response.Cookies("mensaje").Value = "La oficina ya existe."
            Response.Cookies("mensaje").Expires = DateTime.Now.AddSeconds(5)
            Response.Redirect("./frm_SPV_CrearOficina.aspx")
        End If


    End Sub


End Class