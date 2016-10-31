Imports System.Web.Configuration
Imports GCA.Business
Imports GCA.Domain

Public Class frm_SPV_CrearControl
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnAccept_Click(sender As Object, e As EventArgs)
        Dim conn As String = WebConfigurationManager.ConnectionStrings("GCAConnectionString").ToString()
        Dim controlB As New DocControlBusiness(conn)

        Dim control As New DocControl()
        control.Codigo_DocControl = txtCodigo.Text
        control.Nombre_DocControl = txtNombre.Text
        control.Periocidad_DocControl = ddlPeriocidad.SelectedValue
        control.FechaFinal_DocControl = txtFechaF.Text
        control.FechaInicio_DocControl = txtFechaI.Text
        controlB.crearControl(control)
        Response.Cookies("mensaje").Value = "El control se creo correctamente."
        Response.Cookies("mensaje").Expires = DateTime.Now.AddSeconds(5)
        Response.Redirect("./frm_SPV_CrearJefeOficina.aspx")
    End Sub
End Class