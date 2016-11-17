Imports System.Web.Configuration
Imports GCA.Business
Imports GCA.Domain
Public Class frm_SPV_CrearControl
    Inherits System.Web.UI.Page

    'Atributos globales
    Public check As CheckBox
    Public label As Label
    ''' <summary>
    ''' Función constructora
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim conn As String = WebConfigurationManager.ConnectionStrings("GCAConnectionString").ToString()
        Dim periodo As New PeriodoBusiness(conn)
        Dim dsPeriodo As DataSet = periodo.obtenerPeriodos()
        ddlPeriocidad.DataSource = dsPeriodo
        ddlPeriocidad.DataTextField = "TC_Nombre_Periodo"
        ddlPeriocidad.DataValueField = "TN_Id_Periodo"
        ddlPeriocidad.DataBind()
        If Not Page.IsPostBack Then
            divPorFechas.Visible = False
        End If

        Dim cookie As HttpCookie = Request.Cookies("mensaje")
        If cookie IsNot Nothing Then
            lblMensaje.Text = Request.Cookies("mensaje").Value
        End If
    End Sub

    Protected Sub btnAccept_Click(sender As Object, e As EventArgs) Handles btnAccept.Click
        Dim conn As String = WebConfigurationManager.ConnectionStrings("GCAConnectionString").ToString()
        Dim controlB As New DocControlBusiness(conn)
        If (controlB.existeControl(txtCodigo.Text) = 0) Then
            Dim control As New DocControl()
            control.Codigo_DocControl = txtCodigo.Text
            control.Nombre_DocControl = txtNombre.Text
            Dim valor = Int32.Parse(ddlEscoge.SelectedValue)
            If (valor = 1) Then
                Dim periodoB As New PeriodoBusiness(conn)
                control.Periocidad_DocControl = periodoB.obtenerPeriodoCodigo(ddlPeriocidad.SelectedValue)
            ElseIf (valor = 2) Then
                Dim p As Periodo = New Periodo(-1, "Vacio", 0)
                control.Periocidad_DocControl = p
            End If

            control.FechaFinal_DocControl = Request.Form(txtFechaF.UniqueID)
            control.FechaInicio_DocControl = Request.Form(txtFechaI.UniqueID)


            controlB.crearControl(control)
            Response.Cookies("mensaje").Value = "El control se creo correctamente."
            Response.Cookies("mensaje").Expires = DateTime.Now.AddSeconds(5)
            Response.Redirect("./frm_SPV_CrearControl.aspx")
        Else
            Response.Cookies("mensaje").Value = "El control ya existe."
            Response.Cookies("mensaje").Expires = DateTime.Now.AddSeconds(5)
            Response.Redirect("./frm_SPV_CrearControl.aspx")
        End If
    End Sub
    ''' <summary>
    ''' Función que se ejecuta cuando se cambia el item seleccionado en el ddl de tipos de
    ''' controles
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    Protected Sub ddlEscoge_SelectedIndexChanged(sender As Object, e As EventArgs)
        Dim valor = Int32.Parse(ddlEscoge.SelectedValue)
        If (valor = 1) Then
            divPorFechas.Visible = False
            divPeriodicidad.Visible = True
        ElseIf (valor = 2) Then
            divPeriodicidad.Visible = False
            divPorFechas.Visible = True
        End If
    End Sub
End Class