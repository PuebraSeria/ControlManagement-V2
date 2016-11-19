'Importaciones necesarias
Imports System.Web.Configuration
Imports GCA.Business
Imports GCA.Domain

Public Class frm_IDX_Index
    Inherits System.Web.UI.Page

    'Variables globales
    Private connection As String

    ''' <summary>
    ''' Función constructora
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Me.connection = WebConfigurationManager.ConnectionStrings("GCAConnectionString").ToString()
        Dim cookie As HttpCookie = Request.Cookies("mensaje")
        If cookie IsNot Nothing Then
            lblMensaje.Text = Request.Cookies("mensaje").Value
            lblMensaje.Visible = True
        End If
    End Sub
    ''' <summary>
    ''' Función que se ejecuta cuando se hace clic
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    Protected Sub btnIngresar_Click(sender As Object, e As EventArgs)
        Dim code As String = txtCodigo.Text
        Dim password As String = txtContrasenna.Text

        Dim jefeOficinaBusiness As New JefeOficinaBusiness(Me.connection)
        Dim supervisorBusiness As New SupervisorBusiness(Me.connection)
        If (jefeOficinaBusiness.existeJefeOficina(txtCodigo.Text, txtContrasenna.Text)) Then
            'Obtenemos la oficina
            Dim jefeOficina As JefeOficina = jefeOficinaBusiness.obtenerJefeOficinaCodigo(txtCodigo.Text)
            Session.Add("codigoOficina", jefeOficina.Oficina().Codigo())
            Response.Redirect("http://localhost:49338/Presentation/frm_OFI_ConEstadoReportes.aspx")
        End If
        If (supervisorBusiness.existeSupervisor(txtCodigo.Text, txtContrasenna.Text)) Then
            Response.Redirect("http://localhost:49327/Presentation/frm_SPV_ConEstadoDeControles.aspx")
        End If
        Response.Cookies("mensaje").Value = "No existe este usuario."
        Response.Cookies("mensaje").Expires = DateTime.Now.AddSeconds(5)
        Response.Redirect("./frm_IDX_Index.aspx")
    End Sub
End Class