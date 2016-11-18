Imports System.Web.Configuration
Imports GCA.Business
Imports GCA.Domain

Public Class frm_SPV_CrearJefeOficina
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Dim conn As String = WebConfigurationManager.ConnectionStrings("GCAConnectionString").ToString()
            Dim oficina As New OficinaBusiness(conn)
            Dim dsResult As DataSet = oficina.obtenerOficinas()
            ddlOficina.DataSource = dsResult
            ddlOficina.DataTextField = "TC_Nombre_Oficina"
            ddlOficina.DataValueField = "TC_Codigo_Oficina"
            ddlOficina.DataBind()
        End If

        Dim cookie As HttpCookie = Request.Cookies("mensaje")
        If cookie IsNot Nothing Then
            lblMensaje.Text = Request.Cookies("mensaje").Value
        End If
    End Sub

    Protected Sub btnAccept_Click(sender As Object, e As EventArgs)
        Dim conn As String = WebConfigurationManager.ConnectionStrings("GCAConnectionString").ToString()
        Dim oficina As New OficinaBusiness(conn)
        Dim jefeB As New JefeOficinaBusiness(conn)
        If (jefeB.existeJefeOficinaV(txtCodigo.Text) = 0) Then
            Dim jefe As New JefeOficina()
            jefe.Codigo = txtCodigo.Text
            jefe.DNI = txtDni.Text
            jefe.Contraseña = txtContrasenna.Text
            jefe.Nombre = txtNombre.Text
            jefe.PrimerApellido = txtApellido1.Text
            jefe.SegundoApellido = txtApellido2.Text
            jefe.Email = txtEmail.Text
            Dim ofi As Oficina = oficina.obtenerOficinaCodigo(ddlOficina.SelectedValue)
            jefe.Oficina = ofi
            jefeB.insertarJefeOficina(jefe)
            Response.Cookies("mensaje").Value = "El jefe de oficina se creo correctamente."
            Response.Cookies("mensaje").Expires = DateTime.Now.AddSeconds(5)
            Response.Redirect("./frm_SPV_CrearJefeOficina.aspx")
        Else
            Response.Cookies("mensaje").Value = "El jefe de oficina ya existe."
            Response.Cookies("mensaje").Expires = DateTime.Now.AddSeconds(5)
            Response.Redirect("./frm_SPV_CrearJefeOficina.aspx")
        End If


    End Sub
End Class