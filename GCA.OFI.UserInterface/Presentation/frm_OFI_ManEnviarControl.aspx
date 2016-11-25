<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/frm_OFI_MasterPageOficina.Master" CodeBehind="frm_OFI_ManEnviarControl.aspx.vb" Inherits="GCA.OFI.UserInterface.frm_OFI_ManEnviarControl" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Conten2" ContentPlaceHolderID="titulo" runat="server">
    <h2>Enviar Control</h2>
    <a href="frm_OFI_ConEstadoReportes.aspx" style="float: left;font-size: 313%;"><i class="fa fa-arrow-left" aria-hidden="true"></i></a>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="menu" runat="server">
    <!-- /. NAV TOP  -->
    <nav class="navbar-default navbar-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav" id="main-menu">
                <li>
                    <a href="frm_OFI_ConEstadoReportes.aspx"><i class="fa fa-book" aria-hidden="true"></i> Estado de los controles</a>
                </li>
                <li class="active-link">
                    <a href="frm_OFI_ManEnviarControl.aspx"><i class="fa fa-upload" aria-hidden="true"></i> Enviar control</a>
                </li>
                <li>
                    <a href="frm_OFI_Historial.aspx"><i class="fa fa-history"></i>Historial</a>
                </li>
                <li>
                    <a href="blank.html"><i class="fa fa-question-circle" aria-hidden="true"></i> Ayuda</a>
                </li>
                <li>
                    <a href="http://localhost:51014/Presentation/frm_IDX_Index.aspx"><i class="fa fa-sign-out" aria-hidden="true"></i> Salir</a>
                </li>
            </ul>
        </div>
    </nav>
    <!-- /. NAV SIDE  -->
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="Body" runat="server">
    
     <%--<form id="enviarControl" runat="server" class="glyphicon-align-center">--%>
    <form id="enviarControl" runat="server" style="margin: 0px 28%;">
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
               <asp:FileUpload id="fileUpload" runat="server" />
            </div>
        </div>
         <div class="form-group">
            <div class="col-sm-10">
                <asp:Button runat="server" id="btnSee" Text="Subir evidencia" OnClick="btnSee_Click"/>
            </div>
        </div>
         <div class="form-group">
            <div class="col-sm-10">
                <asp:Label ID="lblNotification" runat="server" Text=""></asp:Label>
            </div>
        </div>
    </form>
    <script src="../DESARROLLO/JS/jquery-2.2.4.js" type="text/javascript"></script>
</asp:Content>

