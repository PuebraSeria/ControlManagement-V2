Imports System.Web.Configuration
Imports GCA.Business
Imports GCA.Domain

Public Class frm_SPV_AsginarControl
    Inherits System.Web.UI.Page
    Shared controles As New List(Of DocControl)()
    Shared asignados As New List(Of Boolean)()
    Shared checkBox As New List(Of CheckBox)()
    Shared labels As New List(Of Label)()
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then
            Dim conn As String = WebConfigurationManager.ConnectionStrings("GCAConnectionString").ToString()
            Dim oficina As New OficinaBusiness(conn)
            Dim dsResult As DataSet = oficina.obtenerOficinas()
            ddlOficina.DataSource = dsResult
            ddlOficina.DataTextField = "TC_Nombre_Oficina"
            ddlOficina.DataValueField = "TC_Codigo_Oficina"
            ddlOficina.DataBind()
            Dim cookieO As HttpCookie = Request.Cookies("seleccionado")
            If cookieO IsNot Nothing Then
                ddlOficina.SelectedValue = Request.Cookies("seleccionado").Value
            End If
            crearTabla()
        Else
            Dim postback As String = Page.Request.Params("__EVENTTARGET")
            If (Not postback.Equals("ctl00$Body$ddlOficina")) Then
                recrearTabla()
            End If
        End If

        Dim cookie As HttpCookie = Request.Cookies("mensaje")
        If cookie IsNot Nothing Then
            lblMensaje.Text = Request.Cookies("mensaje").Value
        End If


    End Sub

    Public Sub recrearTabla()
        For i As Integer = 0 To controles.Count - 1
            Dim t As New HtmlTableRow()
            Dim c0 As New HtmlTableCell()
            Dim c1 As New HtmlTableCell()
            c0.Style.Add("border", "1px solid #214761")
            c1.Style.Add("border", "1px solid #214761")
            c0.Controls.Add(labels(i))
            c1.Controls.Add(checkBox(i))
            t.Cells.Add(c0)
            t.Cells.Add(c1)
            tablaControles.Rows.Add(t)
        Next
    End Sub

    Public Sub crearTabla()
        controles.Clear()
        asignados.Clear()
        checkBox.Clear()
        labels.Clear()
        Dim conn As String = WebConfigurationManager.ConnectionStrings("GCAConnectionString").ToString()
        Dim controlB As New DocControlBusiness(conn)
        Dim dsControles As DataSet = controlB.obtenerControles()
        Dim oficinaB As New OficinaBusiness(conn)
        Dim periodoB As New PeriodoBusiness(conn)
        Dim dsAsignados = oficinaB.obtenerControlesOficina(ddlOficina.SelectedValue)
        Dim cantidad As Integer = 0
        For Each row As DataRow In dsControles.Tables(0).Rows
            Dim codigo As String = row("TC_Codigo_DocControl")
            Dim nombre As String = row("TC_Nombre_DocControl")
            Dim periodo As Periodo
            If (IsDBNull(row("TN_Periocidad_DocControl"))) Then
                periodo = New Periodo(-1, "Vacio", -1)
            Else
                periodo = periodoB.obtenerPeriodoCodigo(Integer.Parse(row("TN_Periocidad_DocControl")))
            End If
            Dim fechaI As String
            Dim fechaF As String
            If (IsDBNull(row("TF_FechaInicio_DocControl")) Or IsDBNull(row("TF_FechaFinal_DocControl"))) Then
                fechaI = ""
                fechaF = ""
            Else
                fechaI = row("TF_FechaInicio_DocControl")
                fechaF = row("TF_FechaFinal_DocControl")
            End If

            controles.Add(New DocControl(codigo, nombre, periodo, fechaI, fechaF))
            Dim check As CheckBox = New CheckBox()
            check.ID = "check" + cantidad.ToString

            Dim label As Label = New Label()
            label.Text = nombre

            For Each row1 As DataRow In dsAsignados.Tables(0).Rows
                Dim cod As String = row1("TC_Codigo_DocControl")
                If (cod.Equals(codigo)) Then
                    check.Checked = True
                    Exit For
                End If
            Next
            asignados.Add(check.Checked)
            checkBox.Add(check)
            labels.Add(label)
            Dim t As New HtmlTableRow()
            Dim c0 As New HtmlTableCell()
            Dim c1 As New HtmlTableCell()
            c0.Style.Add("border", "1px solid #214761")
            c1.Style.Add("border", "1px solid #214761")
            c0.Controls.Add(label)
            c1.Controls.Add(check)
            t.Cells.Add(c0)
            t.Cells.Add(c1)
            tablaControles.Rows.Add(t)
            cantidad += 1
        Next

    End Sub

    Protected Sub ddlOficina_SelectedIndexChanged(sender As Object, e As EventArgs)
        crearTabla()
    End Sub

    Protected Sub btnAsignar_Click(sender As Object, e As EventArgs)
        Dim conn As String = WebConfigurationManager.ConnectionStrings("GCAConnectionString").ToString()
        Dim oficinaB As New OficinaBusiness(conn)
        For i As Integer = 0 To controles.Count - 1
            Dim check As CheckBox = checkBox(i)
            If (check.Checked) Then

                If (Not asignados(i)) Then
                    If (controles(i).Periocidad_DocControl.Id <> -1) Then
                        Dim dias As Integer = controles(i).Periocidad_DocControl.Dias
                        Dim fechaAhora As Date = Date.Now
                        Dim periodo As Boolean = True
                        Dim fechaI As Date = New DateTime(fechaAhora.Year, 1, 1)
                        While periodo

                            Dim fechaF As Date = fechaI.AddDays(dias)
                            Dim resultado = Date.Compare(fechaAhora, fechaF)
                        If (resultado < 1) Then
                                Exit While
                            End If
                            fechaI = fechaF
                        End While
                        oficinaB.asignarControl(controles(i).Codigo_DocControl, ddlOficina.SelectedValue, fechaI)
                    Else
                        oficinaB.asignarControl(controles(i).Codigo_DocControl, ddlOficina.SelectedValue, controles(i).FechaInicio_DocControl)
                    End If
                End If
            Else
                If (asignados(i)) Then
                    oficinaB.desvincularControl(controles(i).Codigo_DocControl, ddlOficina.SelectedValue)
                End If

            End If
        Next

        Response.Cookies("mensaje").Value = "La actualizacion fue exitosa."
        Response.Cookies("mensaje").Expires = DateTime.Now.AddSeconds(5)
        Response.Cookies("seleccionado").Value = ddlOficina.SelectedValue
        Response.Cookies("seleccionado").Expires = DateTime.Now.AddSeconds(5)
        Response.Redirect("./frm_SPV_AsignarControl.aspx")

    End Sub

End Class