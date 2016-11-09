
Imports System.Web.Configuration
Imports System.Web.Services
Imports GCA.Business
Public Class frm_SPV_ConEstadoDeControles
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    <WebMethod>
    Public Shared Function obtenerInformacionEstadoControles() As String

        Dim conn As String = WebConfigurationManager.ConnectionStrings("GCAConnectionString").ToString()
        Dim control As New DocControlBusiness(conn)
        Return control.obtenerInformacionControlesAsignados()

    End Function


End Class