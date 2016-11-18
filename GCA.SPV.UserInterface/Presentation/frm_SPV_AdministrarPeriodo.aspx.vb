Imports System.Web.Configuration
Imports GCA.Business
Imports GCA.Domain

Public Class frm_SPV_Administrar_Periodo
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            fillGrid()
        End If
    End Sub

    Public Sub fillGrid()
        Dim conn As String = WebConfigurationManager.ConnectionStrings("GCAConnectionString").ToString()
        Dim periodoB As New PeriodoBusiness(conn)
        Dim dataSet As DataSet = periodoB.obtenerPeriodos()
        gridPeriodo.DataSource = dataSet
        gridPeriodo.DataBind()

    End Sub

    Protected Sub gridPeriodo_RowCancelingEdit(sender As Object, e As GridViewCancelEditEventArgs)

        gridPeriodo.EditIndex = -1

        fillGrid()
    End Sub

    Protected Sub gridPeriodo_RowDeleting(sender As [Object], e As GridViewDeleteEventArgs)
        Dim row As GridViewRow = gridPeriodo.Rows(e.RowIndex)
        Dim conn As String = WebConfigurationManager.ConnectionStrings("GCAConnectionString").ToString()
        Dim periodoB As New PeriodoBusiness(conn)
        Dim id As Integer = Int32.Parse(gridPeriodo.Rows(row.DataItemIndex).Cells(1).Text)
        periodoB.eliminarPeriodo(id)
        fillGrid()

    End Sub



    Protected Sub gridPeriodo_PageIndexChanging(sender As Object, e As GridViewPageEventArgs)
        gridPeriodo.PageIndex = e.NewPageIndex
        fillGrid()
    End Sub

    Protected Sub gridPeriodo_RowUpdating(sender As Object, e As GridViewUpdateEventArgs)
        Dim row As GridViewRow = gridPeriodo.Rows(e.RowIndex)
        Dim conn As String = WebConfigurationManager.ConnectionStrings("GCAConnectionString").ToString()
        Dim periodo As New Periodo()
        Dim periodoB As New PeriodoBusiness(conn)
        Dim id As Integer = Int32.Parse(gridPeriodo.Rows(e.RowIndex).Cells(1).Text)
        Dim nombre As TextBox = DirectCast(gridPeriodo.Rows(e.RowIndex).Cells(2).Controls(0), TextBox)
        Dim dias As TextBox = DirectCast(gridPeriodo.Rows(e.RowIndex).Cells(3).Controls(0), TextBox)
        periodo.Id = id
        periodo.Nombre = nombre.Text
        periodo.Dias = Int32.Parse(dias.Text)
        periodoB.actualizarPeriodo(periodo)

        gridPeriodo.EditIndex = -1

        fillGrid()


    End Sub

    Protected Sub gridPeriodo_RowEditing(sender As Object, e As GridViewEditEventArgs)
        gridPeriodo.EditIndex = e.NewEditIndex
        fillGrid()
    End Sub

    Protected Sub gridPeriodo_RowDataBound(sender As Object, e As GridViewRowEventArgs)
        e.Row.Cells(1).Visible = False
    End Sub

End Class