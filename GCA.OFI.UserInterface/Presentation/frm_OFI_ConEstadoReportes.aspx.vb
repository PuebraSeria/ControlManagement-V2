'Importaciones necesarias
Imports System.Web.Configuration
Imports GCA.Business

Public Class frm_OFI_ConEstadoReportes
    Inherits System.Web.UI.Page

    'Variables globales
    Private conexion As String
    Private codOficina As String

    ''' <summary>
    ''' Función constructora
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Me.conexion = WebConfigurationManager.ConnectionStrings("GCAConnectionString").ToString()

        'Preguntamos si existe la oficina
        If Session.Item("codigoOficina") Is Nothing Then
            Me.codOficina = "7"
        Else
            Me.codOficina = CType(Session("codigoOficina"), String)
        End If

        'Preguntamos si es la primera vez en ingresar
        If Not IsPostBack Then
            llenarTabla()
        End If
    End Sub
    ''' <summary>
    ''' Función que se encarga de llenar la tabla
    ''' </summary>
    ''' <returns></returns>
    Private Function llenarTabla()
        cuerpoTabla.InnerHtml = Me.obtenerInformacion
    End Function
    ''' <summary>
    ''' Función que nos permite obtener la información de los controles asignados a esta oficina
    ''' </summary>
    ''' <returns></returns>
    Private Function obtenerInformacion() As String
        Dim todaInformacion As String = ""
        Dim oficinaBusiness As New GCA.Business.OficinaBusiness(Me.conexion)
        Dim informacion = oficinaBusiness.obtenerControlesOficina(Me.codOficina)

        For Each fila As DataRow In informacion.Tables(0).Rows()
            todaInformacion = todaInformacion & Me.escribirFila(fila(1))
        Next

        Return todaInformacion
    End Function
    ''' <summary>
    ''' Función que se encarga de escribir la fila que posteriormente vamos a agregar a la tabla
    ''' </summary>
    ''' <param name="nombreControl">Corresponde al nombre que tiene el control</param>
    ''' <returns></returns>
    Private Function escribirFila(nombreControl As String) As String
        Dim temp As String
        temp =
            "
                <tr>
                    <td>" + nombreControl + "</td>
                    <td><i class='fa fa-circle'></i></td>
                    <td>aun no</td>
                    <td><input type='button' value='Adjuntar' onclick='redireccionar()' /></td>
                </tr>
            "
        Return temp
    End Function
End Class