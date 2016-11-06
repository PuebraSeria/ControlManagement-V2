Imports System.Web.Configuration
Imports GCA.Business
Imports GCA.Domain

Public Class frm_SPV_AdministrarOficina
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            fillGrid()
        End If
    End Sub

    Public Sub fillGrid()
        Dim conn As String = WebConfigurationManager.ConnectionStrings("GCAConnectionString").ToString()
        Dim oficinaB As New OficinaBusiness(conn)
        Dim dataSet As DataSet = oficinaB.obtenerOficinas()
        gridOficina.DataSource = dataSet
        gridOficina.DataBind()

    End Sub

    Protected Sub gridOficina_RowCancelingEdit(sender As Object, e As GridViewCancelEditEventArgs)

        gridOficina.EditIndex = -1

        fillGrid()
    End Sub

    Protected Sub gridOficina_RowDeleting(sender As [Object], e As GridViewDeleteEventArgs)
        Dim row As GridViewRow = gridOficina.Rows(e.RowIndex)
        Dim conn As String = WebConfigurationManager.ConnectionStrings("GCAConnectionString").ToString()
        Dim oficinaB As New OficinaBusiness(conn)
        Dim codigo As String = gridOficina.Rows(row.DataItemIndex).Cells(1).Text
        oficinaB.eliminarOficina(codigo)
        fillGrid()

    End Sub



    Protected Sub gridOficina_PageIndexChanging(sender As Object, e As GridViewPageEventArgs)
        gridOficina.PageIndex = e.NewPageIndex
        fillGrid()
    End Sub

    Protected Sub gridOficina_RowUpdating(sender As Object, e As GridViewUpdateEventArgs)
        Dim row As GridViewRow = gridOficina.Rows(e.RowIndex)
        Dim conn As String = WebConfigurationManager.ConnectionStrings("GCAConnectionString").ToString()
        Dim oficina As New Oficina()
        Dim oficinaB As New OficinaBusiness(conn)
        Dim codigo As String = gridOficina.Rows(e.RowIndex).Cells(1).Text
        Dim nombre As TextBox = DirectCast(gridOficina.Rows(e.RowIndex).Cells(2).Controls(0), TextBox)

        oficina.Codigo = codigo
        oficina.Nombre = nombre.Text
        oficinaB.actualizarOficina(oficina)

        gridOficina.EditIndex = -1

        fillGrid()


    End Sub

    Protected Sub gridOficina_RowEditing(sender As Object, e As GridViewEditEventArgs)
        gridOficina.EditIndex = e.NewEditIndex

        fillGrid()
    End Sub



End Class