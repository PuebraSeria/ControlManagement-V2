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

        'If (txtCodigo.Text Like "Ofi") Then
        If (jefeOficinaBusiness.existeJefeOficina(txtCodigo.Text)) Then
            'Obtenemos la oficina
            Dim jefeOficina As JefeOficina = jefeOficinaBusiness.obtenerJefeOficinaCodigo(txtCodigo.Text)
            Session.Add("codigoOficina", jefeOficina.Oficina().Codigo())
            MyClass.Response.Redirect("http://localhost:49338/Presentation/frm_OFI_ConEstadoReportes.aspx", True)
        End If

        'If (txtCodigo.Text Like "Sup") Then
        If (supervisorBusiness.existeSupervisor(txtCodigo.Text)) Then
            MyClass.Response.Redirect("http://localhost:49327/Presentation/frm_SPV_ConEstadoDeControles.aspx", True)
        End If
    End Sub
End Class