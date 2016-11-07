Imports System.Web.Configuration
Imports GCA.Business
Imports GCA.Domain

Public Class frm_SPV_AsginarControl
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    'Public Function obtenerPeriodo() As String
    '    Dim codPeriodo As Integer
    '    Dim conn As String = WebConfigurationManager.ConnectionStrings("GCAConnectionString").ToString()
    '    Dim oficinaB As New OficinaBusiness(conn)
    '    Dim dsControles As DataSet = oficinaB.obtenerControlesOficina("1")
    '    Dim dataRowCollection As DataRowCollection = dsControles.Tables(0).Rows
    '    For Each currentRow As DataRow In dataRowCollection
    '        If (currentRow("TC_Codigo_DocControl").ToString() = ddlControl.SelectedValue) Then
    '            codPeriodo = Int32.Parse(currentRow("TN_Periocidad_DocControl").ToString())
    '        End If
    '    Next
    '    Dim fechaAsignacion As String = oficinaB.obtenerFechaAsignacionControl("1", ddlControl.SelectedValue)
    '    Dim periodoB As PeriodoBusiness = New PeriodoBusiness(conn)
    '    Dim periodoD As Periodo = periodoB.obtenerPeriodoCodigo(codPeriodo)
    '    Dim cantDias As Integer = periodoD.Dias
    '    Dim partesFecha As String() = fechaAsignacion.Split("-")
    '    If (cantDias < 30) Then
    '        Dim mesAsignacion As Integer = Int32.Parse(partesFecha(1))
    '        Dim diaAsignacion As Integer = Int32.Parse(partesFecha(0))
    '        Dim annAsignacion As Integer = Int32.Parse(partesFecha(2))
    '        Dim fechaFinalPeriodo As System.DateTime = New System.DateTime(annAsignacion, mesAsignacion, diaAsignacion)
    '        fechaFinalPeriodo = fechaFinalPeriodo.AddDays(cantDias)
    '        Return fechaAsignacion + " - " + fechaFinalPeriodo.ToString("dd-MM-yyyy")
    '    ElseIf (cantDias >= 30 And cantDias < 360) Then
    '        Dim mesAsignacion As Integer = Int32.Parse(partesFecha(1))
    '        Dim cantMeses As Integer = cantDias / 30
    '        Dim periodo As Integer = cantMeses
    '        While (periodo < mesAsignacion)
    '            periodo += cantMeses
    '        End While
    '        periodo = periodo / cantMeses
    '        Return "Periodo " + periodo.ToString() + " - " + partesFecha(2)
    '    Else
    '        Dim cantAños = cantDias / 360
    '        Dim anAsignacion As Integer = Int32.Parse(partesFecha(2))
    '        Dim anFin As Integer = Int32.Parse(partesFecha(2)) + (cantAños - 1)
    '        If (anFin > anAsignacion) Then
    '            Return CStr(anAsignacion) + " - " + CStr(anFin)
    '        Else
    '            Return CStr(anFin)
    '        End If
    '    End If
    'End Function

    'Public Function obtenerNuevaFechaAsignacion() As String
    '    Dim codPeriodo As Integer
    '    Dim conn As String = WebConfigurationManager.ConnectionStrings("GCAConnectionString").ToString()
    '    Dim oficinaB As New OficinaBusiness(conn)
    '    Dim dsControles As DataSet = oficinaB.obtenerControlesOficina("1")
    '    Dim dataRowCollection As DataRowCollection = dsControles.Tables(0).Rows
    '    For Each currentRow As DataRow In dataRowCollection
    '        If (currentRow("TC_Codigo_DocControl").ToString() = ddlControl.SelectedValue) Then
    '            codPeriodo = Int32.Parse(currentRow("TN_Periocidad_DocControl").ToString())
    '        End If
    '    Next
    '    Dim fechaAsignacion As String = oficinaB.obtenerFechaAsignacionControl("1", ddlControl.SelectedValue)
    '    Dim periodoB As PeriodoBusiness = New PeriodoBusiness(conn)
    '    Dim periodoD As Periodo = periodoB.obtenerPeriodoCodigo(codPeriodo)
    '    Dim cantDias As Integer = periodoD.Dias
    '    Dim partesFecha As String() = fechaAsignacion.Split("-")
    '    Dim mesAsignacion As Integer = Int32.Parse(partesFecha(1))
    '    Dim diaAsignacion As Integer = Int32.Parse(partesFecha(0))
    '    Dim annAsignacion As Integer = Int32.Parse(partesFecha(2))
    '    Dim nuevaFAsignacion As System.DateTime = New System.DateTime(annAsignacion, mesAsignacion, diaAsignacion)
    '    If (cantDias < 30) Then
    '        nuevaFAsignacion = nuevaFAsignacion.AddDays(cantDias)
    '    ElseIf (cantDias >= 30 And cantDias < 360) Then
    '        nuevaFAsignacion = nuevaFAsignacion.AddMonths(cantDias / 30)
    '    Else
    '        nuevaFAsignacion = nuevaFAsignacion.AddYears(cantDias / 360)
    '    End If
    '    Return nuevaFAsignacion.ToString("dd-MM-yyyy")
    'End Function

End Class