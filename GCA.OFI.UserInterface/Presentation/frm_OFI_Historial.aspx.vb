'Importaciones necesarias
Imports System.Web.Configuration
Imports GCA.Business

Public Class frm_OFI_Historial
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
            Session.Add("annoHistorial", Now.Year)
            llenarDDLControl()
            llenarLineaTiempo()
        End If
    End Sub
    ''' <summary>
    ''' Función que se encarga de llenar los ddl
    ''' </summary>
    ''' <returns></returns>
    Private Function llenarDDLControl()
        Dim oficinaBusiness As New GCA.Business.OficinaBusiness(Me.conexion)
        Dim informacion = oficinaBusiness.obtenerControlesOficina(Me.codOficina)

        For Each fila As DataRow In informacion.Tables(0).Rows()
            ddlControl.Items.Add(fila(0) + "-" + fila(1))
        Next
    End Function
    ''' <summary>
    ''' Función que nos permite llenar la linea de tiempo
    ''' </summary>
    ''' <returns></returns>
    Private Function llenarLineaTiempo()
        divTimeLine.InnerHtml = Me.obtenerInformacion
    End Function
    ''' <summary>
    ''' Función que consulta a la base de datos para obtener la información para mostrarle al 
    ''' cliente
    ''' </summary>
    ''' <returns>String: Contiene código HTML que se va a inyectar en la línea de tiempo</returns>
    Private Function obtenerInformacion() As String
        Dim todaInformacion As String = "<h2>" & CType(Session("annoHistorial"), Integer) & "</h2>"

        Dim oficinaBusiness As New GCA.Business.OficinaBusiness(Me.conexion)
        Dim entregaBusines As New GCA.Business.EntregaBusiness(Me.conexion)
        Dim informacionControles = oficinaBusiness.obtenerControlesOficina(Me.codOficina)
        Dim posicion As Boolean = True

        'Recorremos la información de los controles
        For Each filaControles As DataRow In informacionControles.Tables(0).Rows()
            'Validamos si se puede o no mostrar
            If (Me.validaciones(filaControles(0) + "-" + filaControles(1))) Then
                Dim informacionEntrega = entregaBusines.obtenerUltimaEntregaControlOficina(Me.codOficina, filaControles(0))

                'Recorremos la información de las entregas
                For Each filaEntrega As DataRow In informacionEntrega.Tables(0).Rows()

                    'If de las posiciones
                    If (posicion) Then
                        todaInformacion = todaInformacion & Me.escribirHitoTiempo(filaControles(0) + "-" + filaControles(1), filaEntrega(1), "timeline-item")
                        posicion = False
                    Else
                        todaInformacion = todaInformacion & Me.escribirHitoTiempo(filaControles(0) + "-" + filaControles(1), filaEntrega(1), "timeline-item inverted")
                        posicion = True
                    End If

                Next
            End If
        Next
        todaInformacion = todaInformacion & "<h2>Fin</h2>"
        Return todaInformacion
    End Function
    ''' <summary>
    ''' Función que nos permite validar los controles a mostrar según los criterios del cliente
    ''' </summary>
    ''' <param name="nombre">Corresponde a la combinación de código y nombre del control</param>
    ''' <returns>Boolean: Indicando si se puede mostrar (true) o no (false)</returns>
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
    ''' <summary>
    ''' Función que se encarga de escribir el código HTML necesario para cada control en la 
    ''' línea de tiempo
    ''' </summary>
    ''' <param name="nombreControl">Corresponde a la combinación código del control - nombre del 
    ''' control</param>
    ''' <param name="fechaEntrega">Corresponde a la fecha en que se entregó</param>
    ''' <param name="posicion">Corresponde a la posición que debe tener en la línea de tiempo</param>
    ''' <returns>Un String con código HTML</returns>
    Private Function escribirHitoTiempo(nombreControl As String, fechaEntrega As String, posicion As String) As String
        Dim temp As String = ""
        Dim tempFecha As Integer = DatePart(DateInterval.Year, Date.Parse(fechaEntrega))

        If (tempFecha <> CType(Session("annoHistorial"), Integer)) Then
            Session.Item("annoHistorial") = tempFecha
            temp = "<h2>" & tempFecha & "</h2>"
        End If

        temp = temp & "
                <ul class='timeline-items'>
                    <li class='" & posicion & "'>
                        <h3>" & nombreControl & "</h3>
                        <div>
                            <hr>
                            <time>" & fechaEntrega & "</time>
                        </div>
                    </li>
                </ul>
                "

        Return temp
    End Function
    ''' <summary>
    ''' Función que se ejecuta cuando se cambia el control en el combo
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    Protected Sub ddlControl_SelectedIndexChanged(sender As Object, e As EventArgs)
        Me.llenarLineaTiempo()
    End Sub
End Class