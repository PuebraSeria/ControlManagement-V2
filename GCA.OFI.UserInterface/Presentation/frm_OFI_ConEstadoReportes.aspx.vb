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
            llenarDDLControl()
            llenarTabla()
        End If
    End Sub
    '**************************************** Llenar combos ********************************
    ''' <summary>
    ''' Función que nos permite llenar el DDL de Controles
    ''' </summary>
    ''' <returns></returns>
    Private Function llenarDDLControl()
        Dim oficinaBusiness As New GCA.Business.OficinaBusiness(Me.conexion)
        Dim informacion = oficinaBusiness.obtenerControlesOficina(Me.codOficina)

        For Each fila As DataRow In informacion.Tables(0).Rows()
            ddlControl.Items.Add(fila(1))
        Next
    End Function
    '**************************************** Llenar tabla ********************************
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
            If (Me.validaciones(fila(1))) Then
                todaInformacion = todaInformacion & Me.escribirFila(fila(1), fila(0))
            End If
        Next

        Return todaInformacion
    End Function
    ''' <summary>
    ''' Función que se encarga de escribir la fila que posteriormente vamos a agregar a la tabla
    ''' </summary>
    ''' <param name="nombreControl">Corresponde al nombre que tiene el control</param>
    ''' <returns></returns>
    Private Function escribirFila(nombreControl As String, codigoControl As String) As String
        Dim temp As String
        temp =
            "
                <tr>
                    <td>" + nombreControl + "</td>
                    <td><i class='fa fa-circle'></i></td>
                    <td>aun no</td>
                    <td><a href='frm_OFI_ManEnviarControl.aspx?control=" + codigoControl + "' class='btn btn-default'>Adjuntar</a></td>
                </tr>
            "
        Return temp
    End Function
    ''' <summary>
    ''' Función que se encarga de llevar a cabo las validaciones necesarias
    ''' </summary>
    ''' <param name="nombre">Corresponde a la fila actual del DataSet</param>
    ''' <returns>Boolean: Indicando si cumplió todos los requisitos o no</returns>
    Private Function validaciones(nombre As String) As Boolean
        Dim bandera As Boolean = True

        'Preguntamos que la opción seleccionada sea diferente a "Seleccione"
        If Not (ddlControl.SelectedItem.ToString() Like "Seleccione") Then
            'Preguntamos si es distinto al Item seleccionado de controles
            If Not (nombre Like ddlControl.SelectedItem.ToString()) Then
                bandera = False
            End If
        End If

        Return bandera
    End Function
    '**************************************** Eventos **************************************
    ''' <summary>
    ''' Función que se ejecuta cuando se cambia el control seleccionado
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    Protected Sub ddlControl_SelectedIndexChanged(sender As Object, e As EventArgs)
        Me.llenarTabla()
    End Sub
End Class