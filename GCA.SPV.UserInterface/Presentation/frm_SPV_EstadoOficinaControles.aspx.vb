'Importaciones necesarias
Imports System.Web.Configuration
Imports GCA.Business

Public Class frm_SPV_EstadoOficinaControles
    Inherits System.Web.UI.Page

    'Variables globales
    Private conexion As String

    ''' <summary>
    ''' Función constructora
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Me.conexion = WebConfigurationManager.ConnectionStrings("GCAConnectionString").ToString()

        'Preguntamos si es la primera vez en ingresar
        If Not IsPostBack Then
            llenarDDL()
            llenarTabla()
        End If
    End Sub
    '**************************************** Llenar combos ********************************
    ''' <summary>
    ''' Función que nos permite llenar los ddl de oficina y control
    ''' </summary>
    ''' <returns></returns>
    Private Function llenarDDL()
        Dim oficinaBusiness As New GCA.Business.OficinaBusiness(Me.conexion)
        Dim informacion = oficinaBusiness.obtenerOficinas()

        For Each fila As DataRow In informacion.Tables(0).Rows()
            ddlOficina.Items.Add(fila(1))
        Next

        Dim controlBusiness As New GCA.Business.DocControlBusiness(Me.conexion)
        informacion = controlBusiness.obtenerControles()

        For Each fila As DataRow In informacion.Tables(0).Rows()
            ddlControl.Items.Add(fila(0) + "-" + fila(1))
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
        Dim informacion = oficinaBusiness.obtenerOficinas()

        ' For Each que recorre las oficinas
        For Each fila As DataRow In informacion.Tables(0).Rows()
            'Se valida que la oficina se puede mostrar
            If (Me.validacionOficina(fila(1))) Then
                Dim controles = oficinaBusiness.obtenerControlesOficina(fila(0))

                'For Each que recorre los controles
                For Each filaControles As DataRow In controles.Tables(0).Rows()
                    If (Me.validacionControl(filaControles(0) + "-" + filaControles(1), filaControles(2), filaControles(5))) Then
                        todaInformacion = todaInformacion & Me.escribirFila(fila(1), filaControles(1), filaControles(2), filaControles(5))
                    End If
                Next
            End If
        Next

        Return todaInformacion
    End Function
    ''' <summary>
    ''' Función que se encarga de escribir la fila que posteriormente vamos a agregar a la tabla
    ''' </summary>
    ''' <param name="nombreOficina">Corresponde al nombre de la oficina</param>
    ''' <param name="nombreControl">Corresponde al nombre del control</param>
    ''' <param name="periodicidad">Corresponde al código de la periodicidad</param>
    ''' <param name="fechaAsignado">Corresponde a la fecha en que fue asignado el control a la oficina</param>
    ''' <returns>Un String con HTML</returns>
    Private Function escribirFila(nombreOficina As String, nombreControl As String, periodicidad As String, fechaAsignado As String) As String
        Dim temp As String
        Dim valores = (Me.obtenerValoresPeriodicidad(periodicidad, fechaAsignado)).Split(";")

        temp =
            "
                <tr>
                    <td>" & nombreOficina & "</td>
                    <td>" & nombreControl & "</td>
                    <td><i class='fa fa-circle' style='color:" + Me.obtenerColorPorcentaje(Integer.Parse(valores(0))) + "'></i></td>
                </tr>
            "
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
    '**************************************** Validaciones ********************************
    ''' <summary>
    ''' Función que se encarga de realizar las validaciones necesarias para mostrar los controles
    ''' indicados
    ''' </summary>
    ''' <param name="nombreControl">Corresponde a la combinación de "código control-nombre control"</param>
    ''' <param name="periodicidad">Corresponde a la períodicidad</param>
    ''' <param name="fechaAsignado">Corresponde a la fecha en que fue asignado el control</param>
    ''' <returns></returns>
    Private Function validacionControl(nombreControl As String, periodicidad As String, fechaAsignado As String) As Boolean
        Dim bandera As Boolean = True
        Dim valores = (Me.obtenerValoresPeriodicidad(periodicidad, fechaAsignado)).Split(";")

        'Preguntamos que la opción seleccionada sea diferente a "Seleccione"
        If Not (ddlControl.SelectedItem.ToString() Like "Seleccione") Then
            'Preguntamos si es distinto al Item seleccionado de controles
            If Not (nombreControl Like ddlControl.SelectedItem.ToString()) Then
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
    ''' Función que se encarga de validar la oficina
    ''' </summary>
    ''' <param name="nombreOficina">Corresponde al nombre de la oficina actual</param>
    ''' <returns>Boolean: Indicando si se cumple o no las condiciones</returns>
    Private Function validacionOficina(nombreOficina As String) As Boolean
        Dim bandera As Boolean = True

        'Preguntamos que la opción seleccionada sea diferente a "Seleccione"
        If Not (ddlOficina.SelectedItem.ToString() Like "Seleccione") Then
            'Preguntamos si es distinto al Item seleccionado de controles
            If Not (nombreOficina Like ddlOficina.SelectedItem.ToString()) Then
                bandera = False
            End If
        End If

        Return bandera
    End Function
    '**************************************** Eventos **************************************
    ''' <summary>
    ''' Función que se ejecuta cuando se cambia la oficina
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    Protected Sub ddlOficina_SelectedIndexChanged(sender As Object, e As EventArgs)
        Me.llenarTabla()
    End Sub
    ''' <summary>
    ''' Función que se ejecuta cuando se cambia el control
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    Protected Sub ddlControl_SelectedIndexChanged(sender As Object, e As EventArgs)
        Me.llenarTabla()
    End Sub
    ''' <summary>
    ''' Función que se ejecuta cuando se cambia el estado
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    Protected Sub ddlEstado_SelectedIndexChanged(sender As Object, e As EventArgs)
        Me.llenarTabla()
    End Sub

End Class