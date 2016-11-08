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
            Me.codOficina = "1"
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
            If (Me.validaciones(fila(1), fila(2), fila(5))) Then
                todaInformacion = todaInformacion & Me.escribirFila(fila(1), fila(0), fila(2), fila(5))
            End If
        Next

        Return todaInformacion
    End Function
    ''' <summary>
    ''' Función que se encarga de escribir la fila que posteriormente vamos a agregar a la tabla
    ''' </summary>
    ''' <param name="nombreControl">Corresponde al nombre que tiene el control</param>
    ''' <returns></returns>
    Private Function escribirFila(nombreControl As String, codigoControl As String, periodicidad As String, fechaAsignado As String) As String
        Dim temp As String
        Dim valores = (Me.obtenerValoresPeriodicidad(periodicidad, fechaAsignado)).Split(";")
        temp = "
                <tr>
                    <td>" + nombreControl + "</td>
                    <td><i class='fa fa-circle' style='color:" + Me.obtenerColorPorcentaje(Integer.Parse(valores(0))) + "'></i></td>
                    <td>" + valores(1) + "</td>
                    <td><a href='frm_OFI_ManEnviarControl.aspx?control=" + codigoControl + "' class='btn btn-default'>Adjuntar</a></td>
                </tr>"
        Return temp
    End Function
    ''' <summary>
    ''' Función que nos permite obtener la períodicidad de un control
    ''' </summary>
    ''' <param name="periodicidad">Corresponde a código de períodicidad que tiene el control</param>
    ''' <param name="fechaAsignado">Corresponde a la fecha en que se asignó el control a la oficina</param>
    ''' <returns>String: Que contiene el porcentaje de tiempo que ha pasado, y la fecha en que debe entregar el control</returns>
    Private Function obtenerValoresPeriodicidad(periodicidad As String, fechaAsignado As String) As String
        Dim periodoBusiness As New GCA.Business.PeriodoBusiness(Me.conexion)
        Dim periodo = periodoBusiness.obtenerPeriodoCodigo(Integer.Parse(periodicidad))
        Dim controlBusiness As New GCA.Business.DocControlBusiness(Me.conexion)
        Dim tempFecha As Date = fechaAsignado
        Dim valores As String = controlBusiness.obtenerPorcentajeFecha(tempFecha.Day & "-" & tempFecha.Month & "-" & tempFecha.Year & "," & periodo.Dias)
        Return valores
    End Function
    ''' <summary>
    ''' Función que se encarga de llevar a cabo las validaciones necesarias
    ''' </summary>
    ''' <param name="nombre">Corresponde a la fila actual del DataSet</param>
    ''' <returns>Boolean: Indicando si cumplió todos los requisitos o no</returns>
    Private Function validaciones(nombre As String, periodicidad As String, fechaAsignado As String) As Boolean
        Dim bandera As Boolean = True
        Dim valores = (Me.obtenerValoresPeriodicidad(periodicidad, fechaAsignado)).Split(";")

        'Preguntamos que la opción seleccionada sea diferente a "Seleccione"
        If Not (ddlControl.SelectedItem.ToString() Like "Seleccione") Then
            'Preguntamos si es distinto al Item seleccionado de controles
            If Not (nombre Like ddlControl.SelectedItem.ToString()) Then
                bandera = False
            End If
        End If

        'Preguntamos que la opción seleccionada sea diferente a "Seleccione"
        If Not (ddlEstado.SelectedItem.ToString() Like "Seleccione") Then
            Dim valorDDL As String = ""
            'Switch del ddlControl
            Select Case ddlEstado.SelectedItem.ToString()
                Case "0%"
                    valorDDL = 0
                Case "75%"
                    valorDDL = 1
                Case "90%"
                    valorDDL = 2
                Case "100%"
                    valorDDL = 3
                Case "+100%"
                    valorDDL = 4
            End Select
            'Preguntamos si es distinto al Item seleccionado de controles
            If Not (valores(0) Like valorDDL) Then
                bandera = False
            End If
        End If

        Return bandera
    End Function
    ''' <summary>
    ''' Función que nos retorna el color que debemos mostrarle al cliente con base en el 
    ''' porcentaje del control
    ''' </summary>
    ''' <param name="porcentaje">Corresponde a un Integer que va a representar los diversos 
    ''' estados temporales que puede tener el control</param>
    ''' <returns>Un string: Que posee el color a implementar</returns>
    Private Function obtenerColorPorcentaje(porcentaje As Integer) As String
        Dim color As String = ""

        'Inicio del switch
        Select Case porcentaje
            Case 0
                color = "green"
            Case 1
                color = "yellow"
            Case 2
                color = "orange"
            Case 3
                color = "red"
            Case 4
                color = "purple"
        End Select
        Return color
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
    ''' <summary>
    ''' Función que se ejecuta cuando se cambia el estado seleccionado
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    Protected Sub ddlEstado_SelectedIndexChanged(sender As Object, e As EventArgs)
        Me.llenarTabla()
    End Sub
End Class