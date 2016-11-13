Imports System.Web.Configuration
Imports GCA.Business
Imports GCA.Domain

Public Class frm_SPV_AdministrarControl
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            fillGrid()
        End If
    End Sub


    Public Sub fillGrid()
        Dim conn As String = WebConfigurationManager.ConnectionStrings("GCAConnectionString").ToString()
        Dim controlB As New DocControlBusiness(conn)
        Dim dataSet As DataSet = controlB.obtenerControles()
        gridControl.DataSource = dataSet
        gridControl.DataBind()

    End Sub

    Protected Sub gridControl_RowCancelingEdit(sender As Object, e As GridViewCancelEditEventArgs)
        Response.Cookies("tipo").Value = 0
        Response.Cookies("tipo").Expires = DateTime.Now.AddSeconds(10)
        gridControl.EditIndex = -1
        fillGrid()
    End Sub

    Protected Sub gridControl_RowDeleting(sender As [Object], e As GridViewDeleteEventArgs)
        Dim row As GridViewRow = gridControl.Rows(e.RowIndex)
        Dim conn As String = WebConfigurationManager.ConnectionStrings("GCAConnectionString").ToString()
        Dim controlB As New DocControlBusiness(conn)
        Dim codigo As String = gridControl.Rows(row.DataItemIndex).Cells(1).Text
        controlB.eliminarControl(codigo)
        fillGrid()

    End Sub



    Protected Sub gridControl_PageIndexChanging(sender As Object, e As GridViewPageEventArgs)
        gridControl.PageIndex = e.NewPageIndex
        fillGrid()
    End Sub

    Protected Sub gridControl_RowUpdating(sender As Object, e As GridViewUpdateEventArgs)
        Dim row As GridViewRow = gridControl.Rows(e.RowIndex)
        Dim conn As String = WebConfigurationManager.ConnectionStrings("GCAConnectionString").ToString()
        Dim controlB As New DocControlBusiness(conn)
        Dim control As New DocControl()
        Dim codigo As String = gridControl.Rows(e.RowIndex).Cells(1).Text
        Dim nombre As TextBox = DirectCast(row.Cells(2).Controls(0), TextBox)
        Dim periocidad As DropDownList = TryCast(gridControl.Rows(e.RowIndex).FindControl("ddlPeriodo"), DropDownList)

        Dim fechaI As TextBox = TryCast(gridControl.Rows(e.RowIndex).FindControl("txtFechaI"), TextBox)
        Dim fechaF As TextBox = TryCast(gridControl.Rows(e.RowIndex).FindControl("txtFechaF"), TextBox)

        control.Codigo_DocControl = codigo
        control.Nombre_DocControl = nombre.Text
        Dim tipo As Integer = Request.Cookies("tipo").Value
        If (tipo = 1) Then
            Dim periodoB As New PeriodoBusiness(conn)
            control.Periocidad_DocControl = periodoB.obtenerPeriodoCodigo(periocidad.SelectedValue)
        ElseIf (tipo = 2) Then
            Dim p As Periodo = New Periodo(-1, "Vacio", 0)
            control.Periocidad_DocControl = p
        End If
        control.FechaInicio_DocControl = fechaI.Text
        control.FechaFinal_DocControl = fechaF.Text
        controlB.actualizarControl(control)
        gridControl.EditIndex = -1
        Response.Cookies("tipo").Value = 0
        Response.Cookies("tipo").Expires = DateTime.Now.AddSeconds(10)
        fillGrid()



    End Sub

    Protected Sub gridControl_RowEditing(sender As Object, e As GridViewEditEventArgs)
        gridControl.EditIndex = e.NewEditIndex
        fillGrid()
    End Sub

    Protected Sub gridControl_RowDataBound(sender As Object, e As GridViewRowEventArgs)
        e.Row.Cells(3).Visible = False
        If e.Row.RowType = DataControlRowType.DataRow Then
            If (e.Row.RowState And DataControlRowState.Edit) > 0 Then
                DirectCast(e.Row.FindControl("txtFechaI"), TextBox).Attributes.Add("readonly", "readonly")
                DirectCast(e.Row.FindControl("txtFechaF"), TextBox).Attributes.Add("readonly", "readonly")
                Dim ddl As DropDownList = DirectCast(e.Row.FindControl("ddlPeriodo"), DropDownList)
                Dim conn As String = WebConfigurationManager.ConnectionStrings("GCAConnectionString").ToString()
                Dim periodoB As New PeriodoBusiness(conn)
                Dim dataSet As DataSet = periodoB.obtenerPeriodos()
                ddl.DataSource = dataSet
                ddl.DataTextField = "TC_Nombre_Periodo"
                ddl.DataValueField = "TN_Id_Periodo"
                Dim periocidad As Label = DirectCast(e.Row.FindControl("labelPeriodo"), Label)
                If (Not String.IsNullOrEmpty(periocidad.Text)) Then
                    ddl.SelectedValue = periocidad.Text
                End If
                ddl.DataBind()
            End If
        End If
    End Sub

    Protected Sub gridControl_PreRender(sender As Object, e As EventArgs)
        If Me.gridControl.EditIndex <> -1 Then

            Dim periocidad As Label = DirectCast(gridControl.Rows(gridControl.EditIndex).FindControl("labelPeriodo"), Label)
            If (Not periocidad.Text.Equals("")) Then
                Response.Cookies("tipo").Value = 1
                Response.Cookies("tipo").Expires = DateTime.Now.AddSeconds(30)
                Dim tx As TextBox = DirectCast(gridControl.Rows(gridControl.EditIndex).FindControl("txtFechaI"), TextBox)
                tx.Enabled = False
                Dim tx1 As TextBox = DirectCast(gridControl.Rows(gridControl.EditIndex).FindControl("txtFechaF"), TextBox)
                tx1.Enabled = False
            Else
                Dim ddl As DropDownList = DirectCast(gridControl.Rows(gridControl.EditIndex).FindControl("ddlPeriodo"), DropDownList)
                Response.Cookies("tipo").Value = 2
                Response.Cookies("tipo").Expires = DateTime.Now.AddSeconds(30)
                ddl.Enabled = False
            End If
        End If
    End Sub
End Class