Imports System.Web.Configuration
Imports GCA.Business
Imports GCA.Domain

Public Class frm_SPV_AdministrarSupervisor
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            fillGrid()
        End If
    End Sub

    Public Sub fillGrid()
        Dim conn As String = WebConfigurationManager.ConnectionStrings("GCAConnectionString").ToString()
        Dim superB As New SupervisorBusiness(conn)
        Dim dataSet As DataSet = superB.obtenerSupervisores()
        gridSupervisor.DataSource = dataSet
        gridSupervisor.DataBind()

    End Sub

    Protected Sub gridSupervisor_RowCancelingEdit(sender As Object, e As GridViewCancelEditEventArgs)

        gridSupervisor.EditIndex = -1

        fillGrid()
    End Sub

    Protected Sub gridSupervisor_RowDeleting(sender As [Object], e As GridViewDeleteEventArgs)
        Dim row As GridViewRow = gridSupervisor.Rows(e.RowIndex)
        Dim conn As String = WebConfigurationManager.ConnectionStrings("GCAConnectionString").ToString()
        Dim superB As New SupervisorBusiness(conn)
        Dim codigo As String = gridSupervisor.Rows(row.DataItemIndex).Cells(1).Text
        superB.eliminarSupervisor(codigo)
        fillGrid()

    End Sub



    Protected Sub gridControl_PageIndexChanging(sender As Object, e As GridViewPageEventArgs)
        gridSupervisor.PageIndex = e.NewPageIndex
        fillGrid()
    End Sub

    Protected Sub gridSupervisor_RowUpdating(sender As Object, e As GridViewUpdateEventArgs)
        Dim row As GridViewRow = gridSupervisor.Rows(e.RowIndex)
        Dim conn As String = WebConfigurationManager.ConnectionStrings("GCAConnectionString").ToString()
        Dim superB As New SupervisorBusiness(conn)
        Dim super As New Supervisor()
        Dim codigo As String = gridSupervisor.Rows(e.RowIndex).Cells(1).Text
        Dim DNI As TextBox = DirectCast(gridSupervisor.Rows(e.RowIndex).Cells(2).Controls(0), TextBox)
        Dim contrasenna As TextBox = DirectCast(gridSupervisor.Rows(e.RowIndex).Cells(3).Controls(0), TextBox)
        Dim nombre As TextBox = DirectCast(gridSupervisor.Rows(e.RowIndex).Cells(4).Controls(0), TextBox)
        Dim apellido1 As TextBox = DirectCast(gridSupervisor.Rows(e.RowIndex).Cells(5).Controls(0), TextBox)
        Dim apellido2 As TextBox = DirectCast(gridSupervisor.Rows(e.RowIndex).Cells(6).Controls(0), TextBox)
        Dim email As TextBox = DirectCast(gridSupervisor.Rows(e.RowIndex).Cells(7).Controls(0), TextBox)
        super.Codigo = codigo
        super.DNI = Integer.Parse(DNI.Text)
        super.Contraseña = contrasenna.Text
        super.Nombre = nombre.Text
        super.PrimerApellido = apellido1.Text
        super.SegundoApellido = apellido2.Text
        super.Email = email.Text
        superB.actualizarSupervisor(super)

        gridSupervisor.EditIndex = -1

        fillGrid()


    End Sub

    Protected Sub gridSupervisor_RowEditing(sender As Object, e As GridViewEditEventArgs)
        gridSupervisor.EditIndex = e.NewEditIndex

        fillGrid()
    End Sub

End Class