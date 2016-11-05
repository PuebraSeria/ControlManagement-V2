Imports System.Web.Configuration
Imports GCA.Business
Imports GCA.Domain

Public Class frm_SPV_AdministrarJefeOficina
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            fillGrid()
        End If
    End Sub

    Public Sub fillGrid()
        Dim conn As String = WebConfigurationManager.ConnectionStrings("GCAConnectionString").ToString()
        Dim jefesB As New JefeOficinaBusiness(conn)
        Dim dataSet As DataSet = jefesB.obtenerJefes()
        gridJefeOficina.DataSource = dataSet
        gridJefeOficina.DataBind()

    End Sub

    Protected Sub gridControl_RowCancelingEdit(sender As Object, e As GridViewCancelEditEventArgs)

        gridJefeOficina.EditIndex = -1

        fillGrid()
    End Sub

    Protected Sub gridControl_RowDeleting(sender As [Object], e As GridViewDeleteEventArgs)
        Dim row As GridViewRow = gridJefeOficina.Rows(e.RowIndex)
        Dim conn As String = WebConfigurationManager.ConnectionStrings("GCAConnectionString").ToString()
        Dim jefeB As New JefeOficinaBusiness(conn)
        Dim codigo As String = gridJefeOficina.Rows(row.DataItemIndex).Cells(1).Text
        jefeB.eliminarJefeOficina(codigo)
        fillGrid()

    End Sub



    Protected Sub gridControl_PageIndexChanging(sender As Object, e As GridViewPageEventArgs)
        gridJefeOficina.PageIndex = e.NewPageIndex
        fillGrid()
    End Sub

    Protected Sub gridControl_RowUpdating(sender As Object, e As GridViewUpdateEventArgs)
        Dim row As GridViewRow = gridJefeOficina.Rows(e.RowIndex)
        Dim conn As String = WebConfigurationManager.ConnectionStrings("GCAConnectionString").ToString()
        Dim jefeB As New JefeOficinaBusiness(conn)
        Dim jefe As New JefeOficina()
        Dim oficinaB As New OficinaBusiness(conn)
        Dim codigo As String = gridJefeOficina.Rows(e.RowIndex).Cells(1).Text
        Dim DNI As TextBox = DirectCast(gridJefeOficina.Rows(e.RowIndex).Cells(2).Controls(0), TextBox)
        Dim contrasenna As TextBox = DirectCast(gridJefeOficina.Rows(e.RowIndex).Cells(3).Controls(0), TextBox)
        Dim nombre As TextBox = DirectCast(gridJefeOficina.Rows(e.RowIndex).Cells(3).Controls(0), TextBox)
        Dim apellido1 As TextBox = DirectCast(gridJefeOficina.Rows(e.RowIndex).Cells(3).Controls(0), TextBox)
        Dim apellido2 As TextBox = DirectCast(gridJefeOficina.Rows(e.RowIndex).Cells(3).Controls(0), TextBox)
        Dim email As TextBox = DirectCast(gridJefeOficina.Rows(e.RowIndex).Cells(3).Controls(0), TextBox)
        Dim oficina As DropDownList = TryCast(gridJefeOficina.Rows(e.RowIndex).FindControl("ddlOficina"), DropDownList)
        jefe.Codigo = codigo
        jefe.DNI = Integer.Parse(DNI.Text)
        jefe.Contraseña = contrasenna.Text
        jefe.Nombre = nombre.Text
        jefe.PrimerApellido = apellido1.Text
        jefe.SegundoApellido = apellido2.Text
        jefe.Email = email.Text
        jefe.Oficina = oficinaB.obtenerOficinaCodigo(oficina.SelectedValue)
        jefeB.actualizarJefeOficina(jefe)

        gridJefeOficina.EditIndex = -1

        fillGrid()


    End Sub

    Protected Sub gridControl_RowEditing(sender As Object, e As GridViewEditEventArgs)
        gridJefeOficina.EditIndex = e.NewEditIndex

        fillGrid()
    End Sub

    Protected Sub gridControl_RowDataBound(sender As Object, e As GridViewRowEventArgs)
        e.Row.Cells(8).Visible = False

        If e.Row.RowType = DataControlRowType.DataRow Then
            If (e.Row.RowState And DataControlRowState.Edit) > 0 Then
                Dim ddlOficina As DropDownList = DirectCast(e.Row.FindControl("ddlOficina"), DropDownList)
                Dim conn As String = WebConfigurationManager.ConnectionStrings("GCAConnectionString").ToString()
                Dim oficinaB As New OficinaBusiness(conn)
                Dim dataSet As DataSet = oficinaB.obtenerOficinas()
                ddlOficina.DataSource = dataSet
                ddlOficina.DataTextField = "TC_Nombre_Oficina"
                ddlOficina.DataValueField = "TC_Codigo_Oficina"
                Dim oficina As Label = DirectCast(e.Row.FindControl("lblOficina"), Label)
                ddlOficina.SelectedValue = oficina.Text
                ddlOficina.DataBind()
            End If
        End If
    End Sub

End Class