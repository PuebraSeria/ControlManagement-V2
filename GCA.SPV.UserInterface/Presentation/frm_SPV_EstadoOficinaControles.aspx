﻿<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/frm_SPV_MasterPageSupervisor.Master" CodeBehind="frm_SPV_EstadoOficinaControles.aspx.vb" Inherits="GCA.SPV.UserInterface.frm_SPV_EstadoOficinaControles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../DESARROLLO/Estilos/font-awesome-4.6.3/css/font-awesome.min.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="menu" runat="server">
    <!-- /. NAV TOP  -->
    <nav class="navbar-default navbar-side" role="navigation">
        <div class="sidebar-collapse">
           <ul class="nav" id="main-menu">
                <li>
                    <a href="frm_SPV_ConEstadoDeControles.aspx"><i class="fa fa-desktop"></i>Estado de los controles</a>
                </li>
                <li >
                    <a href="frm_SPV_CrearControl.aspx"><i class="fa fa-table "></i>Crear control</a>
                </li>
                <li class="active-link">
                    <a href="frm_SPV_AdministrarControl.aspx"><i class="fa fa-qrcode "></i>Gestionar Controles</a>
                </li>
                 <li>
                    <a href="frm_SPV_AsignarControl.aspx"><i class="fa fa-edit "></i>Asignar control</a>
                </li>
                 <li>
                    <a href="frm_SPV_CrearJefeOficina.aspx"><i class="fa fa-table "></i>Crear Jefe de Oficina</a>
                </li>
                 <li>
                    <a href="frm_SPV_AdministrarJefeOficina.aspx"><i class="fa fa-qrcode "></i>Gestionar Jefes de Oficina</a>
                </li>
                 <li>
                    <a href="frm_SPV_CrearSupervisor.aspx"><i class="fa fa-table "></i>Crear Supervisor</a>
                </li>
                 <li>
                    <a href="frm_SPV_AdministrarSupervisor.aspx"><i class="fa fa-qrcode "></i>Gestionar Supervisores</a>
                </li>
                  <li>
                    <a href="frm_SPV_CrearOficina.aspx"><i class="fa fa-table "></i>Crear Oficina</a>
                </li>
                 <li>
                    <a href="frm_SPV_AdministrarOficina.aspx"><i class="fa fa-qrcode "></i>Gestionar Oficinas</a>
                </li>
                   <li>
                    <a href="frm_SPV_CrearPeriodo.aspx"><i class="fa fa-table "></i>Crear Periodo</a>
                </li>
                 <li>
                    <a href="frm_SPV_AdministrarPeriodo.aspx"><i class="fa fa-qrcode "></i>Gestionar Periodos</a>
                </li>
                <li>
                    <a href="frm_SPV_ConGenerarReporte.aspx"><i class="fa fa-bar-chart-o"></i>Generar reportes</a>
                </li>
                <li>
                    <a href="#"><i class="fa fa-edit "></i>Ayuda</a>
                </li>
                <li>
                    <a href="#"><i class="fa fa-table "></i>Salir</a>
                </li>
            </ul>
        </div>
    </nav>
    <!-- /. NAV SIDE  -->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="titulo" runat="server">
    Estado de los Controles
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Body" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <asp:Label ID="lblOficina" runat="server" Text="Oficina:" AssociatedControlID="ddlOficina"></asp:Label>
                    <asp:DropDownList ID="ddlOficina" runat="server" ForeColor="Black" AutoPostBack="true" OnSelectedIndexChanged="ddlOficina_SelectedIndexChanged">
                        <asp:ListItem Value="0">Seleccione</asp:ListItem>
                    </asp:DropDownList>
                    <asp:Label ID="lblControl" runat="server" Text="Control:" AssociatedControlID="ddlControl"></asp:Label>
                    <asp:DropDownList ID="ddlControl" runat="server" ForeColor="Black" AutoPostBack="true" OnSelectedIndexChanged="ddlControl_SelectedIndexChanged">
                        <asp:ListItem Value="0">Seleccione</asp:ListItem>
                    </asp:DropDownList>
                    <asp:Label ID="lblEstado" runat="server" Text="Estado:" AssociatedControlID="ddlEstado"></asp:Label>
                    <asp:DropDownList ID="ddlEstado" runat="server" ForeColor="Black" AutoPostBack="true" OnSelectedIndexChanged="ddlEstado_SelectedIndexChanged">
                        <asp:ListItem Value="-1">Seleccione</asp:ListItem>
                        <asp:ListItem Value="0">0%</asp:ListItem>
                        <asp:ListItem Value="1">75%</asp:ListItem>
                        <asp:ListItem Value="2">90%</asp:ListItem>
                        <asp:ListItem Value="3">100%</asp:ListItem>
                        <asp:ListItem Value="4">+100%</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="panel-body" style="max-height:500px; overflow-y: scroll;">
                    <table class="table table-condensed">
                        <thead>
                            <tr>
                                <th>Oficina:</th>
                                <th>Control:</th>
                                <th>Estado:</th>
                            </tr>
                        </thead>
                        <tbody id="cuerpoTabla" runat="server">
                        </tbody>
                    </table>
                    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                        <ProgressTemplate>
                            <div class="text-center">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <i class="fa fa-spinner fa-pulse fa-3x fa-fw"></i>
                                    <span class="sr-only">Loading...</span>
                                </div>
                            </div>
                        </ProgressTemplate>
                    </asp:UpdateProgress>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <!-- BOOTSTRAP SCRIPTS -->
    <script src="../DESARROLLO/JS/bootstrap.min.js"></script>
    <!-- CUSTOM SCRIPTS -->
    <script src="../DESARROLLO/JS/custom.js"></script>
    <!-- JQUERY SCRIPTS -->
    <script src="DESARROLLO/JS/jquery-1.10.2.js"></script>
</asp:Content>
