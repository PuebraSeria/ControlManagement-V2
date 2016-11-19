'Importaciones necesarias
Imports System.Web.Configuration
Imports GCA.Business
Imports System.IO
Imports iTextSharp.text
Imports iTextSharp.text.pdf

Public Class frm_SPV_Historial
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
            Session.Add("annoHistorial", Now.Year)
            llenarDDL()
            llenarLineaTiempo()
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
    ''' <summary>
    ''' Función que nos permite llenar la linea de tiempo
    ''' </summary>
    ''' <returns></returns>
    Private Function llenarLineaTiempo()
        divTimeLine.InnerHtml = Me.obtenerInformacion()
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
        Dim informacionOficinas = oficinaBusiness.obtenerOficinas()
        Dim posicion As Boolean = True

        ' For Each que recorre las oficinas
        For Each columnaOficina As DataRow In informacionOficinas.Tables(0).Rows()

            'Se valida que la oficina se puede mostrar
            If (Me.validacionOficina(columnaOficina(1))) Then
                Dim informacionControles = oficinaBusiness.obtenerControlesOficina(columnaOficina(0))

                'For Each que recorre los controles
                For Each columnaControles As DataRow In informacionControles.Tables(0).Rows()
                    If (Me.validacionControl(columnaControles(0) + "-" + columnaControles(1))) Then
                        Dim informacionEntrega = entregaBusines.obtenerUltimaEntregaControlOficina(columnaOficina(0), columnaControles(0))

                        'Recorremos la información de las entregas
                        For Each filaEntrega As DataRow In informacionEntrega.Tables(0).Rows()

                            'If de las posiciones
                            If (posicion) Then
                                todaInformacion = todaInformacion & Me.escribirHitoTiempo(columnaControles(0) + "-" + columnaControles(1), filaEntrega(1), "timeline-item", columnaOficina(1))
                                posicion = False
                            Else
                                todaInformacion = todaInformacion & Me.escribirHitoTiempo(columnaControles(0) + "-" + columnaControles(1), filaEntrega(1), "timeline-item inverted", columnaOficina(1))
                                posicion = True
                            End If

                        Next
                    End If
                Next
            End If
        Next

        todaInformacion = todaInformacion & "<h2>Fin</h2>"
        Return todaInformacion
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
    ''' <summary>
    ''' Función que se encarga de realizar las validaciones necesarias para mostrar los controles
    ''' indicados
    ''' </summary>
    ''' <param name="nombreControl">Corresponde a la combinación de "código control-nombre control"</param>
    ''' <returns></returns>
    Private Function validacionControl(nombreControl As String) As Boolean
        Dim bandera As Boolean = True

        'Preguntamos que la opción seleccionada sea diferente a "Seleccione"
        If Not (ddlControl.SelectedItem.ToString() Like "Seleccione") Then
            'Preguntamos si es distinto al Item seleccionado de controles
            If Not (nombreControl Like ddlControl.SelectedItem.ToString()) Then
                bandera = False
            End If
        End If

        Return bandera
    End Function
    ''' <summary>
    ''' Función que se encarga de escribir un punto en la línea de tiempo
    ''' </summary>
    ''' <param name="nombreControl">Corresponde a la combinación código control - nombre control</param>
    ''' <param name="fechaEntrega">Corresponde a la fecha en que se entregó el control</param>
    ''' <param name="posicion">Corresponde a la posición en la línea de tiempo</param>
    ''' <param name="nombreOficina">Corresponde al nombre de la oficina</param>
    ''' <returns>String: Contiene el código HTML necesario para la línea de tiempo</returns>
    Private Function escribirHitoTiempo(nombreControl As String, fechaEntrega As String, posicion As String, nombreOficina As String) As String
        Dim temp As String = ""
        Dim tempFecha As Integer = DatePart(DateInterval.Year, Date.Parse(fechaEntrega))

        If (tempFecha <> CType(Session("annoHistorial"), Integer)) Then
            Session.Item("annoHistorial") = tempFecha
            temp = "<h2>" & tempFecha & "</h2>"
        End If

        temp = temp & "
                <ul class='timeline-items'>
                    <li class='" & posicion & "'>
                        <h3>" & nombreOficina & ": " & nombreControl & "</h3>
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
    ''' Función que se ejecuta cuando se cambia la oficina seleccionada en el combo
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    Protected Sub ddlOficina_SelectedIndexChanged(sender As Object, e As EventArgs)
        Me.llenarLineaTiempo()
    End Sub
    ''' <summary>
    ''' Función que se ejecuta cuando se cambia el control seleccionado en el combo
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    Protected Sub ddlControl_SelectedIndexChanged(sender As Object, e As EventArgs)
        Me.llenarLineaTiempo()
    End Sub

    Public Sub GenerarReporteDatosEntrega()
        Dim oDoc As New iTextSharp.text.Document(PageSize.A4, 10, 10, 10, 10)
        Dim pdfw As iTextSharp.text.pdf.PdfWriter
        Dim cb As PdfContentByte
        Dim fuente As iTextSharp.text.pdf.BaseFont
        Dim NombreArchivo As String = "C:\Users\gollo\Documents\Documentos\UCR\Analisis\ProyectoVB\ControlManagement-V2\GCA.SPV.UserInterface\Reportes\Report" + Guid.NewGuid().ToString().Substring(0, 5) + ".pdf"
        Try
            pdfw = PdfWriter.GetInstance(oDoc, New FileStream(NombreArchivo,
            FileMode.Create, FileAccess.Write, FileShare.None))
            'Apertura del documento.
            oDoc.Open()
            cb = pdfw.DirectContent
            'Agregamos una pagina.
            oDoc.NewPage()
            'Iniciamos el flujo de bytes.
            cb.BeginText()
            'Seteamos el color del texto a escribir.
            cb.SetColorFill(iTextSharp.text.BaseColor.BLACK)

            Dim pHeader1 As New Paragraph(New Phrase("Organismo de investigación judicial", FontFactory.GetFont("ARIAL", 12, iTextSharp.text.Font.NORMAL)))
            pHeader1.Alignment = Element.ALIGN_RIGHT
            Dim pHeader2 As New Paragraph(New Phrase("Gestor de controles administrativos", FontFactory.GetFont("ARIAL", 12, iTextSharp.text.Font.NORMAL)))
            pHeader2.Alignment = Element.ALIGN_RIGHT

            Dim pSalto As New Paragraph(" ")

            Dim pReporte As New Paragraph(New Phrase("Reporte Historial cantidad reportes entregados de cada control por oficina: El presente  reporte proporciona" +
                                            " la información correspondiente a la cantidad cada tipo de reporte entregado por oficina, con una proyección histórica" +
                                            " tomando en consideración todos los reportes entregados.",
                                                     FontFactory.GetFont("ARIAL", 12, iTextSharp.text.Font.NORMAL)))
            pReporte.Alignment = Element.ALIGN_JUSTIFIED

            Dim marcaAgua As Image = Image.GetInstance("C:\Users\gollo\Documents\Documentos\UCR\Analisis\ProyectoVB\ControlManagement-V2\GCA.SPV.UserInterface\Image\OIJ.jpg")
            marcaAgua.SetAbsolutePosition(100, 300)
            marcaAgua.ScalePercent(75)

            Dim informationTable As New PdfPTable(2)
            informationTable.WidthPercentage = 100

            Dim clNameControl As New PdfPCell(New Phrase("Nombre del control", FontFactory.GetFont("ARIAL", 12, iTextSharp.text.Font.BOLD)))
            clNameControl.BorderWidth = 0.5F

            Dim clQuantity As New PdfPCell(New Phrase("Cantidad documentos entregados", FontFactory.GetFont("ARIAL", 12, iTextSharp.text.Font.BOLD)))
            clQuantity.BorderWidth = 0.5F

            informationTable.AddCell(clNameControl)
            informationTable.AddCell(clQuantity)

            Dim eb As New EntregaBusiness("Data Source=163.178.107.130;Initial Catalog=GCA;Persist Security Info=True;User ID=sqlserver;Password=saucr.12")
            Dim ds As DataSet = eb.obtenerCantidadControlesEntregados

            Dim dataRowCollection As DataRowCollection = ds.Tables(0).Rows
            For Each currentRow As DataRow In dataRowCollection
                Dim clNameControlTemp As New PdfPCell(New Phrase((currentRow(0).ToString()), FontFactory.GetFont("ARIAL", 12, iTextSharp.text.Font.NORMAL)))
                clNameControlTemp.BorderWidth = 0.5F

                Dim clQuantityTemp As New PdfPCell(New Phrase((currentRow(1).ToString()), FontFactory.GetFont("ARIAL", 12, iTextSharp.text.Font.NORMAL)))
                clQuantityTemp.BorderWidth = 0.5F

                informationTable.AddCell(clNameControlTemp)
                informationTable.AddCell(clQuantityTemp)
            Next

            Dim informationTable2 As New PdfPTable(2)
            informationTable2.WidthPercentage = 100

            Dim clNombreOficina As New PdfPCell(New Phrase("Nombre Oficina", FontFactory.GetFont("ARIAL", 12, iTextSharp.text.Font.BOLD)))
            clNombreOficina.BorderWidth = 0.5F

            Dim clCantidadOficina As New PdfPCell(New Phrase("Cantidad documentos entregados", FontFactory.GetFont("ARIAL", 12, iTextSharp.text.Font.BOLD)))
            clCantidadOficina.BorderWidth = 0.5F

            informationTable2.AddCell(clNombreOficina)
            informationTable2.AddCell(clCantidadOficina)

            ds = eb.obtenerCantidadControlesEntregadosCadaOficina

            dataRowCollection = ds.Tables(0).Rows
            For Each currentRow As DataRow In dataRowCollection
                Dim clNombreOficinaTemp As New PdfPCell(New Phrase(currentRow(0).ToString(), FontFactory.GetFont("ARIAL", 12, iTextSharp.text.Font.NORMAL)))
                clNombreOficinaTemp.BorderWidth = 0.5F

                Dim clCantidadOficinaTemp As New PdfPCell(New Phrase(currentRow(1).ToString(), FontFactory.GetFont("ARIAL", 12, iTextSharp.text.Font.NORMAL)))
                clCantidadOficinaTemp.BorderWidth = 0.5F

                informationTable2.AddCell(clNombreOficinaTemp)
                informationTable2.AddCell(clCantidadOficinaTemp)
            Next

            Dim informationTable3 As New PdfPTable(3)
            informationTable3.WidthPercentage = 100

            informationTable3.AddCell(clNombreOficina)
            informationTable3.AddCell(clNameControl)
            informationTable3.AddCell(clCantidadOficina)

            ds = eb.obtenerCantidadControlesEntregasCadaOficiaCadaDocControl

            dataRowCollection = ds.Tables(0).Rows
            For Each currentRow As DataRow In dataRowCollection
                Dim clNombreOficinaTemp As New PdfPCell(New Phrase(currentRow(0).ToString(), FontFactory.GetFont("ARIAL", 12, iTextSharp.text.Font.NORMAL)))
                clNombreOficinaTemp.BorderWidth = 0.5F

                Dim clDocControlTemp As New PdfPCell(New Phrase(currentRow(1).ToString(), FontFactory.GetFont("ARIAL", 12, iTextSharp.text.Font.NORMAL)))
                clDocControlTemp.BorderWidth = 0.5F

                Dim clCantidadOficinaTemp As New PdfPCell(New Phrase(currentRow(2).ToString(), FontFactory.GetFont("ARIAL", 12, iTextSharp.text.Font.NORMAL)))
                clCantidadOficinaTemp.BorderWidth = 0.5F

                informationTable3.AddCell(clNombreOficinaTemp)
                informationTable3.AddCell(clDocControlTemp)
                informationTable3.AddCell(clCantidadOficinaTemp)
            Next


            oDoc.Add(pHeader1)
            oDoc.Add(pHeader2)
            oDoc.Add(pSalto)
            oDoc.Add(pReporte)
            oDoc.Add(pSalto)
            oDoc.Add(marcaAgua)
            oDoc.Add(informationTable)
            oDoc.Add(pSalto)
            oDoc.Add(informationTable2)
            oDoc.Add(pSalto)
            oDoc.Add(informationTable3)
            oDoc.Add(pSalto)
            'Fin del flujo de bytes.
            cb.EndText()
            'Forzamos vaciamiento del buffer.
            pdfw.Flush()
            'Cerramos el documento.
            oDoc.Close()
        Catch ex As Exception
            'Si hubo una excepcion y el archivo existe ...
            If File.Exists(NombreArchivo) Then
                'Cerramos el documento si esta abierto.
                'Y asi desbloqueamos el archivo para su eliminacion.
                If oDoc.IsOpen Then oDoc.Close()
                '... lo eliminamos de disco.
                File.Delete(NombreArchivo)
            End If
            Throw New Exception("Error al generar archivo PDF")
        Finally
            cb = Nothing
            pdfw = Nothing
            oDoc = Nothing
        End Try

        Process.Start(NombreArchivo)

    End Sub

    Protected Sub generarReporte_Click(sender As Object, e As EventArgs) Handles generarReporte.Click
        GenerarReporteDatosEntrega()
    End Sub
End Class