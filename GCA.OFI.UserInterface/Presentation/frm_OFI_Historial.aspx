<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/frm_OFI_MasterPageOficina.Master" CodeBehind="frm_OFI_Historial.aspx.vb" Inherits="GCA.OFI.UserInterface.frm_OFI_Historial" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../DESARROLLO/Estilos/font-awesome-4.6.3/css/font-awesome.min.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="menu" runat="server">
        <!-- /. NAV TOP  -->
    <nav class="navbar-default navbar-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav" id="main-menu">

                <li>
                    <a href="frm_OFI_ConEstadoReportes.aspx"><i class="fa fa-desktop "></i>Estado de los controles</a>
                </li>

                <li>
                    <a href="frm_OFI_ManEnviarControl.aspx"><i class="fa fa-table "></i>Enviar control</a>
                </li>
                <li class="active-link">
                    <a href="frm_OFI_Historial.aspx"><i class="fa fa-history"></i>Historial</a>
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
<asp:Content ID="Content3" ContentPlaceHolderID="titulo" runat="server">
    Historial de Controles
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Body" runat="server">
</asp:Content>
