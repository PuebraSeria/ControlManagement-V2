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
        Dim informacion As DataSet
        informacion = oficinaBusiness.obtenerOficinas()

        ' For Each que recorre las oficinas
        For Each fila As DataRow In informacion.Tables(0).Rows()

            If (Not IsDBNull(fila(0))) Then
                'Se valida que la oficina se puede mostrar
                If (Me.validacionOficina(fila(1))) Then
                    Dim controles As DataSet
                    controles = oficinaBusiness.obtenerControlesOficina(fila(0))
                    'For Each que recorre los controles
                    For Each filaControles As DataRow In controles.Tables(0).Rows()
                        If (Me.validacionControl(filaControles)) Then
                            todaInformacion = todaInformacion & Me.escribirFila(fila(1), filaControles)
                            'todaInformacion = todaInformacion & Me.escribirFila(fila(1), filaControles(1), filaControles(2), filaControles(5))
                        End If
                        'If (Me.validacionControl(filaControles(0) + "-" + filaControles(1), filaControles(2), filaControles(5))) Then
                        '    todaInformacion = todaInformacion & Me.escribirFila(fila(1), filaControles(1), filaControles(2), filaControles(5))
                        'End If
                    Next
                End If
            End If
        Next

        Return todaInformacion
    End Function
    ''' <summary>
    ''' Función que nos permite escribir la fila en la tabla
    ''' </summary>
    ''' <param name="nombreOficina">Corresponde al nombre de la oficina</param>
    ''' <param name="filaControles">Corresponde a la información del control</param>
    ''' <returns>String: Contiene el código HTML necesario para ingresarlo en la tabla</returns>
    Private Function escribirFila(nombreOficina As String, filaControles As DataRow) As String
        Dim temp As String

        Dim valores

        'Preguntamos si tiene periodicidad o no
        If (Not IsDBNull(filaControles(2))) Then
            valores = (Me.obtenerValoresPeriodicidad(filaControles(2), filaControles(5), True)).Split(";")
        Else
            Dim fechaInicial As Date = filaControles(3).ToString()
            Dim fechaFinal As Date = filaControles(4).ToString()
            Dim diffDias As Integer = DateDiff(DateInterval.Day, fechaInicial, fechaFinal)
            valores = (Me.obtenerValoresPeriodicidad(diffDias, filaControles(5), False)).Split(";")
        End If
        Dim nombreControl = filaControles(0) & "-" & filaControles(1)
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
    ''' Función que nos permite obtener los valores de tiempo (porcentaje de tiempo que ha pasado)
    ''' y la fecha de entrega
    ''' </summary>
    ''' <param name="periodicidad">Corresponde al código de periodicidad</param>
    ''' <param name="fechaAsignado">Corresponde a la fecha en que fue asignado el control</param>
    ''' <param name="porPeriodo">Indica si es por periodos (True) o por fechas (False)</param>
    ''' <returns>String[]: Que contiene el porcentaje de tiempo que ha pasado y la fecha de
    ''' entrega</returns>
    Private Function obtenerValoresPeriodicidad(periodicidad As String, fechaAsignado As String, porPeriodo As Boolean) As String
        Dim controlBusiness As New GCA.Business.DocControlBusiness(Me.conexion)
        Dim valores As String

        If (porPeriodo) Then
            Dim periodoBusiness As New GCA.Business.PeriodoBusiness(Me.conexion)
            Dim periodo = periodoBusiness.obtenerPeriodoCodigo(Integer.Parse(periodicidad))
            Dim tempFecha As Date = fechaAsignado
            valores = controlBusiness.obtenerPorcentajeFecha(tempFecha.Day & "-" & tempFecha.Month & "-" & tempFecha.Year & "," & periodo.Dias)
        Else
            Dim tempFecha As Date = fechaAsignado
            valores = controlBusiness.obtenerPorcentajeFecha(tempFecha.Day & "-" & tempFecha.Month & "-" & tempFecha.Year & "," & periodicidad)
        End If
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
    ''' Función que se encarga de realizar las validaciones necesarias para mostrar o no
    ''' un control
    ''' </summary>
    ''' <param name="filaControles">Corresponde a la información del control</param>
    ''' <returns>Boolean: Indicando si cumple o no las condiciones</returns>
    Private Function validacionControl(filaControles As DataRow) As Boolean
        Dim bandera As Boolean = True
        Dim valores

        'Preguntamos si tiene periodicidad o no
        If (Not IsDBNull(filaControles(2))) Then
            valores = (Me.obtenerValoresPeriodicidad(filaControles(2), filaControles(5), True)).Split(";")
        Else
            Dim fechaInicial As Date = filaControles(3).ToString()
            Dim fechaFinal As Date = filaControles(4).ToString()
            Dim diffDias As Integer = DateDiff(DateInterval.Day, fechaInicial, fechaFinal)
            valores = (Me.obtenerValoresPeriodicidad(diffDias, filaControles(5), False)).Split(";")
        End If

        'Preguntamos que la opción seleccionada sea diferente a "Seleccione"
        If Not (ddlControl.SelectedItem.ToString() Like "Seleccione") Then
            'Preguntamos si es distinto al Item seleccionado de controles
            Dim nombreControl = filaControles(0) & "-" & filaControles(1)
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