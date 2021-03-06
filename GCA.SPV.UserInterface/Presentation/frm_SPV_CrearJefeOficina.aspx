﻿<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/frm_SPV_MasterPageSupervisor.Master" CodeBehind="frm_SPV_CrearJefeOficina.aspx.vb" Inherits="GCA.SPV.UserInterface.frm_SPV_CrearJefeOficina" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../DESARROLLO/Estilos/font-awesome-4.6.3/css/font-awesome.min.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="menu" runat="server">
    <!-- /. NAV TOP  -->
    <nav class="navbar-default navbar-side" role="navigation">
        <div class="sidebar-collapse">
           <ul class="nav" id="main-menu">
               <!-- Controles-->
                <li>
                    <a class="btn" style="text-align:left" data-toggle="collapse" data-target="#dtControles"><i class="fa fa-book" aria-hidden="true"></i> Controles</a>
                    <ul id="dtControles" class="collapse nav" style="padding-top:0px">
                        <li>
                            <a href="frm_SPV_ConEstadoDeControles.aspx">Gráfico Estado de los Controles</a>
                        </li>
                        <li>
                            <a href="frm_SPV_EstadoOficinaControles.aspx">Estado de los Controles</a>
                        </li>
                        <li >
                            <a href="frm_SPV_CrearControl.aspx">Crear control</a>
                        </li>
                         <li >
                            <a href="frm_SPV_AdministrarControl.aspx">Gestionar Controles</a>
                        </li>
                         <li>
                            <a href="frm_SPV_AsignarControl.aspx">Asignar control</a>
                        </li>
                         <li>
                            <a href="frm_SPV_Historial.aspx">Historial de Controles Entregados</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a class="btn" style="text-align:left" data-toggle="collapse" data-target="#dtJefeOficina"><i class="fa fa-user" aria-hidden="true"></i> Jefe Oficina</a>
                    <ul id="dtJefeOficina" class="collapse nav" style="padding-top:0px">
                        <li>
                            <a href="frm_SPV_CrearJefeOficina.aspx">Crear Jefe de Oficina</a>
                        </li>
                        <li>
                            <a href="frm_SPV_AdministrarJefeOficina.aspx">Gestionar Jefes de Oficina</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a class="btn" style="text-align:left" data-toggle="collapse" data-target="#dtSupervisor"><i class="fa fa-user" aria-hidden="true"></i> Supervisor</a>
                    <ul id="dtSupervisor" class="collapse nav" style="padding-top:0px">
                        <li>
                            <a href="frm_SPV_CrearSupervisor.aspx">Crear Supervisor</a>
                        </li>
                        <li>
                            <a href="frm_SPV_AdministrarSupervisor.aspx">Gestionar Supervisores</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a class="btn" style="text-align:left" data-toggle="collapse" data-target="#dtOficina"><i class="fa fa-university" aria-hidden="true"></i> Oficina</a>
                    <ul id="dtOficina" class="collapse nav" style="padding-top:0px">
                        <li>
                            <a href="frm_SPV_CrearOficina.aspx">Crear Oficina</a>
                        </li>
                        <li>
                            <a href="frm_SPV_AdministrarOficina.aspx">Gestionar Oficinas</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a class="btn" style="text-align:left" data-toggle="collapse" data-target="#dtPeriodo"><i class="fa fa-clock-o" aria-hidden="true"></i> Período</a>
                    <ul id="dtPeriodo" class="collapse nav" style="padding-top:0px">
                        <li>
                            <a href="frm_SPV_CrearPeriodo.aspx">Crear Periodo</a>
                        </li>
                        <li>
                            <a href="frm_SPV_AdministrarPeriodo.aspx">Gestionar Periodos</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#"><i class="fa fa-question-circle" aria-hidden="true"></i> Ayuda</a>
                </li>
                <li>
                    <a href="http://localhost:51014/Presentation/frm_IDX_Index.aspx"><i class="fa fa-sign-out" aria-hidden="true"></i> Salir</a>
                </li>
            </ul>
        </div>
    </nav>
    <!-- /. NAV SIDE  -->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="titulo" runat="server">Crear Jefe de Oficina</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Body" runat="server">
    <form id="crearJefeOficina" runat="server" class="form-horizontal">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <asp:Button ID="btnAccept" runat="server" OnClick="btnAccept_Click"  Text ="Crear" 
                            CssClass="btn btn-default" />
                        <input id="btnResert" type="reset" value="Limpiar" class="btn btn-default"/>
                    </div>
                    <div class="panel-body">
                        <div class="form-group">
                            <asp:Label ForeColor="Red"  ID="lblMensaje" runat="server" Text=""
                                CssClass="control-label col-sm-2"></asp:Label>
                        </div>
                        <!-- Código -->
                        <div class="form-group">
                            <asp:Label runat="server" Text="Código:" CssClass="control-label col-sm-2"></asp:Label>
                            <div class="col-sm-10">
                                <asp:TextBox ID="txtCodigo" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="codigoVacio" runat="server" 
                                    ControlToValidate="txtCodigo" Display="Dynamic" Text="Este campo es obligatorio."
                                    CssClass="alert alert-danger">
                                </asp:RequiredFieldValidator>
                            </div>
                        </div>

                        <!-- DNI -->
                        <div class="form-group">
                            <asp:Label runat="server" Text="DNI:"
                                CssClass="control-label col-sm-2"></asp:Label>
                            <div class="col-sm-10">
                                <asp:TextBox ID="txtDni" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="dniVacio" runat="server" 
                                    ControlToValidate="txtDni" Display="Dynamic" Text="Este campo es obligatorio." 
                                    CssClass="alert alert-danger">
                                </asp:RequiredFieldValidator>
                                 <asp:RegularExpressionValidator ID="txtDniEx" runat="server" ErrorMessage="Solo se permiten numeros."
                                    ControlToValidate="txtDni" ValidationExpression="^^\d+$" Display="Dynamic"
                                     CssClass="alert alert-danger"></asp:RegularExpressionValidator>
                            </div>
                        </div>
                        <!-- Contraseña -->
                        <div class="form-group">
                            <asp:Label runat="server" Text="Contraseña:" CssClass="control-label col-sm-2"></asp:Label>
                            <div class="col-sm-10">
                                <asp:TextBox ID="txtContrasenna" TextMode="Password" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="contrasennaVacio" runat="server" 
                                    ControlToValidate="txtContrasenna" Display="Dynamic" Text="Este campo es obligatorio."
                                    CssClass="alert alert-danger">
                                </asp:RequiredFieldValidator>
                            </div>
                        </div>

                        <!-- Nombre -->
                        <div class="form-group">
                            <asp:Label runat="server" Text="Nombre:" CssClass="control-label col-sm-2"></asp:Label>
                            <div class="col-sm-10">
                                <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="nombreVacio" runat="server" 
                                    ControlToValidate="txtNombre" Display="Dynamic" Text="Este campo es obligatorio." CssClass="alert alert-danger">
                                </asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="txtNombreEx" runat="server" ErrorMessage="Solo se permiten letras."
                                    ControlToValidate="txtNombre" ValidationExpression="^[a-zA-Z\s]*$" Display="Dynamic"
                                    CssClass="alert alert-danger">
                                </asp:RegularExpressionValidator>
                            </div>
                        </div>

                        <!-- 1er apellido -->
                        <div class="form-group">
                            <asp:Label runat="server" Text="Primer Apellido:"
                                 CssClass="control-label col-sm-2"></asp:Label>
                            <div class="col-sm-10">
                                <asp:TextBox ID="txtApellido1" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="apellido1Vacio" runat="server" 
                                    ControlToValidate="txtApellido1" Display="Dynamic" Text="Este campo es obligatorio." CssClass="alert alert-danger">
                                </asp:RequiredFieldValidator>
                                 <asp:RegularExpressionValidator ID="txtApellido1Ex" runat="server" ErrorMessage="Solo se permiten letras."
                                    ControlToValidate="txtApellido1" ValidationExpression="^[a-zA-Z\s]*$" Display="Dynamic"
                                     CssClass="alert alert-danger">
                                </asp:RegularExpressionValidator>
                            </div>
                        </div>

                        <!-- 2do apellido -->
                        <div class="form-group">
                            <asp:Label runat="server" Text="Segundo Apellido:"
                                CssClass="control-label col-sm-2"></asp:Label>
                            <div class="col-sm-10">
                                <asp:TextBox ID="txtApellido2" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="apellido2Vacio" runat="server" 
                                    ControlToValidate="txtApellido2" Display="Dynamic" Text="Este campo es obligatorio." CssClass="alert alert-danger">
                                </asp:RequiredFieldValidator>
                                 <asp:RegularExpressionValidator ID="txtApellido2Ex" runat="server" ErrorMessage="Solo se permiten letras."
                                    ControlToValidate="txtApellido2" ValidationExpression="^[a-zA-Z\s]*$" Display="Dynamic"
                                     CssClass="alert alert-danger">
                                </asp:RegularExpressionValidator>
                            </div>
                        </div>

                        <!-- Email -->
                        <div class="form-group">
                            <asp:Label runat="server" Text="Email:" 
                                CssClass="control-label col-sm-2"></asp:Label>
                            <div class="col-sm-10">
                                <asp:TextBox ID="txtEmail" TextMode="Email" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="emailVacio" runat="server" 
                                    ControlToValidate="txtEmail" Display="Dynamic" Text="Este campo es obligatorio." 
                                    CssClass="alert alert-danger">
                                </asp:RequiredFieldValidator>
                            </div>
                        </div>

                        <!-- Oficina -->
                        <div class="form-group">
                            <asp:Label runat="server" Text="Oficina:" CssClass="control-label col-sm-2"></asp:Label>
                            <div class="col-sm-10">
                                <asp:DropDownList ID="ddlOficina" runat="server" CssClass="form-control"></asp:DropDownList>
                            </div>
                        </div>
                        <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                            <ProgressTemplate>
                                <div class="form-group">
                                    <div class="text-center">
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
    </form>
    <!-- Scripts necesarios -->
    <script src="../DESARROLLO/JS/jquery-1.10.2.js"></script>
    <script src="../DESARROLLO/JS/bootstrap.min.js"></script>
    <script src="../DESARROLLO/JS/custom.js"></script>
</asp:Content>
