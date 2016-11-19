Imports System.Web.Configuration
Imports System.Web.Services
Imports GCA.Business
Imports GCA.Domain

Public Class frm_OFI_ManEnviarControl
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then
            Dim conn As String = WebConfigurationManager.ConnectionStrings("GCAConnectionString").ToString()
            Dim oficinaB As New OficinaBusiness(conn)
            Dim dsControles As DataSet = oficinaB.obtenerControlesOficina("1")
            ddlControl.DataSource = dsControles
            ddlControl.DataTextField = "TC_Nombre_DocControl"
            ddlControl.DataValueField = "TC_Codigo_DocControl"
            ddlControl.DataBind()

            lblSelPeriodo.Text = obtenerPeriodo()
            ddlControl.SelectedIndex = 0

        End If



        'Dim cookieDDL As HttpCookie = Request.Cookies("index")
        'Dim cookie As HttpCookie = Request.Cookies("mensaje")

        'If cookie IsNot Nothing Then
        '    lblSelPeriodo.Text = Request.Cookies("mensaje").Value
        'End If

        'If cookieDDL IsNot Nothing Then
        '    ddlControl.SelectedIndex = Int32.Parse(Request.Cookies("index").Value)
        'End If

    End Sub

    <WebMethod>
    Public Function obtenerPeriodo() As String
        Dim codPeriodo As Integer
        Dim conn As String = WebConfigurationManager.ConnectionStrings("GCAConnectionString").ToString()
        Dim oficinaB As New OficinaBusiness(conn)
        Dim dsControles As DataSet = oficinaB.obtenerControlesOficina("1")
        Dim dataRowCollection As DataRowCollection = dsControles.Tables(0).Rows
        For Each currentRow As DataRow In dataRowCollection
            If (currentRow("TC_Codigo_DocControl").ToString() = ddlControl.SelectedValue) Then
                codPeriodo = Int32.Parse(currentRow("TN_Periocidad_DocControl").ToString())
            End If
        Next
        Dim fechaAsignacion As String = oficinaB.obtenerFechaAsignacionControl("1", ddlControl.SelectedValue)
        Dim periodoB As PeriodoBusiness = New PeriodoBusiness(conn)
        Dim periodoD As Periodo = periodoB.obtenerPeriodoCodigo(codPeriodo)
        Dim cantDias As Integer = periodoD.Dias
        Dim partesFecha As String() = fechaAsignacion.Split("-")
        If (cantDias < 30) Then
            Dim mesAsignacion As Integer = Int32.Parse(partesFecha(1))
            Dim diaAsignacion As Integer = Int32.Parse(partesFecha(0))
            Dim annAsignacion As Integer = Int32.Parse(partesFecha(2))
            Dim fechaFinalPeriodo As System.DateTime = New System.DateTime(annAsignacion, mesAsignacion, diaAsignacion)
            fechaFinalPeriodo = fechaFinalPeriodo.AddDays(cantDias)
            Return fechaAsignacion + " - " + fechaFinalPeriodo.ToString("dd-MM-yyyy")
        ElseIf (cantDias >= 30 And cantDias < 360) Then
            Dim mesAsignacion As Integer = Int32.Parse(partesFecha(1))
            Dim cantMeses As Integer = cantDias / 30
            Dim periodo As Integer = cantMeses
            While (periodo < mesAsignacion)
                periodo += cantMeses
            End While
            periodo = periodo / cantMeses
            Return "Periodo " + periodo.ToString() + " - " + partesFecha(2)
        Else
            Dim cantAños = cantDias / 360
            Dim anAsignacion As Integer = Int32.Parse(partesFecha(2))
            Dim anFin As Integer = Int32.Parse(partesFecha(2)) + (cantAños - 1)
            If (anFin > anAsignacion) Then
                Return CStr(anAsignacion) + " - " + CStr(anFin)
            Else
                Return CStr(anFin)
            End If
        End If
    End Function

    Public Function obtenerNuevaFechaAsignacion() As String
        Dim codPeriodo As Integer
        Dim conn As String = WebConfigurationManager.ConnectionStrings("GCAConnectionString").ToString()
        Dim oficinaB As New OficinaBusiness(conn)
        Dim dsControles As DataSet = oficinaB.obtenerControlesOficina("1")
        Dim dataRowCollection As DataRowCollection = dsControles.Tables(0).Rows
        For Each currentRow As DataRow In dataRowCollection
            If (currentRow("TC_Codigo_DocControl").ToString() = ddlControl.SelectedValue) Then
                codPeriodo = Int32.Parse(currentRow("TN_Periocidad_DocControl").ToString())
            End If
        Next
        Dim fechaAsignacion As String = oficinaB.obtenerFechaAsignacionControl("1", ddlControl.SelectedValue)
        Dim periodoB As PeriodoBusiness = New PeriodoBusiness(conn)
        Dim periodoD As Periodo = periodoB.obtenerPeriodoCodigo(codPeriodo)
        Dim cantDias As Integer = periodoD.Dias
        Dim partesFecha As String() = fechaAsignacion.Split("-")
        Dim mesAsignacion As Integer = Int32.Parse(partesFecha(1))
        Dim diaAsignacion As Integer = Int32.Parse(partesFecha(0))
        Dim annAsignacion As Integer = Int32.Parse(partesFecha(2))
        Dim nuevaFAsignacion As System.DateTime = New System.DateTime(annAsignacion, mesAsignacion, diaAsignacion)
        If (cantDias < 30) Then
            nuevaFAsignacion = nuevaFAsignacion.AddDays(cantDias)
        ElseIf (cantDias >= 30 And cantDias < 360) Then
            nuevaFAsignacion = nuevaFAsignacion.AddMonths(cantDias / 30)
        Else
            nuevaFAsignacion = nuevaFAsignacion.AddYears(cantDias / 360)
        End If
        Return nuevaFAsignacion.ToString("dd-MM-yyyy")
    End Function

    Protected Sub ddlControl_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlControl.SelectedIndexChanged
        'Response.Cookies("mensaje").Value = obtenerPeriodo()
        'Response.Write(obtenerPeriodo())
        lblSelPeriodo.Text = obtenerPeriodo()
        'Response.Cookies("index").Value = ddlControl.SelectedIndex.ToString
        'Response.Redirect("./frm_OFI_ManEnviarControl.aspx")
    End Sub

    Protected Sub btnSee_Click(sender As Object, e As EventArgs) Handles btnSee.Click
        Dim path As String = Server.MapPath("~/UploadedFiles/")
        Dim fileOK As Boolean = False
        If fileUpload.HasFile Then
            Dim fileExtension As String
            fileExtension = System.IO.Path.
                GetExtension(fileUpload.FileName).ToLower()
            Dim allowedExtensions As String() =
                {".pdf", ".jpg", ".jpeg", ".png", ".gif"}
            For i As Integer = 0 To allowedExtensions.Length - 1
                If fileExtension = allowedExtensions(i) Then
                    fileOK = True
                End If
            Next
            If fileOK Then
                Try
                    fileUpload.PostedFile.SaveAs(path &
                         fileUpload.FileName)
                    Dim entrega As Entrega = New Entrega("1", ddlControl.SelectedValue, fileUpload.FileName, obtenerPeriodo())
                    Dim conn As String = WebConfigurationManager.ConnectionStrings("GCAConnectionString").ToString()
                    Dim entregaB As EntregaBusiness = New EntregaBusiness(conn)
                    Dim oficinaB As OficinaBusiness = New OficinaBusiness(conn)
                    oficinaB.ActualizarFechaOficinaAsignacion(obtenerNuevaFechaAsignacion(), "1", ddlControl.SelectedValue)
                    If entregaB.crearEntrega(entrega) = 1 Then
                        lblNotification.Text = "Evidencia agregada"
                    Else
                        lblNotification.Text = "Se ha producido un error en la base de datos"
                    End If
                Catch ex As Exception
                    lblNotification.Text = "Error al subir la evidencia"
                End Try
            Else
                lblNotification.Text = "Formato no soportado"
            End If
        End If
    End Sub
End Class