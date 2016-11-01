﻿Imports System.Web.Configuration
Imports GCA.Business
Imports GCA.Domain

Public Class frm_SPV_CrearControl
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Dim conn As String = WebConfigurationManager.ConnectionStrings("GCAConnectionString").ToString()
            Dim periodo As New PeriodoBusiness(conn)
            Dim dsPeriodo As DataSet = periodo.obtenerPeriodos()
            ddlPeriocidad.DataSource = dsPeriodo
            ddlPeriocidad.DataTextField = "TC_Nombre_Periodo"
            ddlPeriocidad.DataValueField = "TN_Id_Periodo"
            ddlPeriocidad.DataBind()
        End If

        Dim cookie As HttpCookie = Request.Cookies("mensaje")
        If cookie IsNot Nothing Then
            lblMensaje.Text = Request.Cookies("mensaje").Value
        End If
    End Sub

    Protected Sub btnAccept_Click(sender As Object, e As EventArgs)
        Dim conn As String = WebConfigurationManager.ConnectionStrings("GCAConnectionString").ToString()
        Dim controlB As New DocControlBusiness(conn)
        If (controlB.existeControl(txtCodigo.Text) = 0) Then
            Dim control As New DocControl()
            control.Codigo_DocControl = txtCodigo.Text
            control.Nombre_DocControl = txtNombre.Text
            Dim periodoB As New PeriodoBusiness(conn)
            control.Periocidad_DocControl = periodoB.obtenerPeriodoCodigo(ddlPeriocidad.SelectedValue)
            control.FechaFinal_DocControl = txtFechaF.Text
            control.FechaInicio_DocControl = txtFechaI.Text
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
End Class