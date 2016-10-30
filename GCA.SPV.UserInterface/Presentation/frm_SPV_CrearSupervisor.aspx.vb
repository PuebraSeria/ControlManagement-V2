Imports System.Web.Configuration
Imports GCA.Business
Imports GCA.Domain

Public Class frm_SPV_CrearSupervisor
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim cookie As HttpCookie = Request.Cookies("mensaje")
        If cookie IsNot Nothing Then
            lblMensaje.Text = Request.Cookies("mensaje").Value
        End If
    End Sub

    Protected Sub btnAccept_Click(sender As Object, e As EventArgs)
        Dim conn As String = WebConfigurationManager.ConnectionStrings("GCAConnectionString").ToString()
        Dim superB As New SupervisorBusiness(conn)
        If (superB.existeSupervisor(txtCodigo.Text) = 0) Then
            Dim supervisor As New Supervisor()
            supervisor.Codigo = txtCodigo.Text
            supervisor.DNI = txtDni.Text
            supervisor.Contraseña = txtContrasenna.Text
            supervisor.Nombre = txtNombre.Text
            supervisor.PrimerApellido = txtApellido1.Text
            supervisor.SegundoApellido = txtApellido2.Text
            supervisor.Email = txtEmail.Text
            superB.insertarSupervisor(supervisor)
            Response.Cookies("mensaje").Value = "El supervisor  se creo correctamente."
            Response.Cookies("mensaje").Expires = DateTime.Now.AddSeconds(5)
            Response.Redirect("./frm_SPV_CrearSupervisor.aspx")
        Else
            Response.Cookies("mensaje").Value = "El supervisor ya existe."
            Response.Cookies("mensaje").Expires = DateTime.Now.AddSeconds(5)
            Response.Redirect("./frm_SPV_CrearSupervisor.aspx")
        End If

    End Sub
End Class