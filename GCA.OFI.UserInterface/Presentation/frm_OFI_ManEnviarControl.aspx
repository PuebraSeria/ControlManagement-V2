﻿<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/frm_OFI_MasterPageOficina.Master" CodeBehind="frm_OFI_ManEnviarControl.aspx.vb" Inherits="GCA.OFI.UserInterface.frm_OFI_ManEnviarControl" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="js/jquery-2.2.4.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Conten2" ContentPlaceHolderID="titulo" runat="server">
    <h2>Enviar Control</h2>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="menu" runat="server">
    <!-- /. NAV TOP  -->
    <nav class="navbar-default navbar-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav" id="main-menu">
                <li>
                    <a href="frm_OFI_ConEstadoReportes.aspx"><i class="fa fa-desktop "></i>Estado de los controles</a>
                </li>

                <li class="active-link">
                    <a href="frm_OFI_ManEnviarControl.aspx"><i class="fa fa-table "></i>Enviar control</a>
                </li>
                <li>
                    <a href="blank.html"><i class="fa fa-edit "></i>Ayuda</a>
                </li>
                <li>
                    <a href="#"><i class="fa fa-qrcode "></i>Salir</a>
                </li>
            </ul>
        </div>

    </nav>
    <!-- /. NAV SIDE  -->
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="Body" runat="server">
    
    

     <form class="glyphicon-align-center">
        <div class="form-group">
            <div class="col-sm-10">
                <asp:Label ID="lblSeleccionarControl" runat="server" Text="Seleccione el control que desea entregar: " ></asp:Label>
            </div>
            <div class="col-sm-10">
                <asp:DropDownList ID="ddlControl" runat="server" OnSelectedIndexChanged="ddlControl_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
            </div>
        </div>
         <div class="form-group">
            <div class="col-sm-10">
                <asp:Label ID="lblSelPeriodo" runat="server" Text="Periodo: "></asp:Label>
            </div>
        </div>
         <div class="form-group">
            <div class="col-sm-10">
                <asp:Label ID="lblSeleccionarEvidencia" runat="server" Text="Seleccione la evidencia que desea cargar: "></asp:Label>
            </div>
            <div class="col-sm-10">
                <center><asp:FileUpload id="fileUpload" runat="server" /></center>
            </div>
        </div>
         <div class="form-group">
            <div class="col-sm-10">
                <asp:Button runat="server" id="btnSee" Text="Upload" OnClick="btnSee_Click"/>
            </div>
        </div>
         <div class="form-group">
            <div class="col-sm-10">
                <asp:Label ID="lblNotification" runat="server" Text=""></asp:Label>
            </div>
        </div>
    </form>
</asp:Content>

