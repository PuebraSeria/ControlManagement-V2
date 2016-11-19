<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/frm_OFI_MasterPageOficina.Master" CodeBehind="frm_OFI_ConEstadoReportes.aspx.vb" Inherits="GCA.OFI.UserInterface.frm_OFI_ConEstadoReportes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../DESARROLLO/Estilos/font-awesome-4.6.3/css/font-awesome.min.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="titulo" runat="server">
    Estado de los Controles
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="menu" runat="server">
    <!-- /. NAV TOP  -->
    <nav class="navbar-default navbar-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav" id="main-menu">
                <li class="active-link">
                    <a href="frm_OFI_ConEstadoReportes.aspx"><i class="fa fa-book" aria-hidden="true"></i> Estado de los controles</a>
                </li>
                <li>
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
    <form id="estadoDeLosReportes" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="upEstadoReportes" runat="server">
            <ContentTemplate>
                <div class="panel panel-primary">
                    <div class="panel-heading">
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
                                    <th>Control:</th>
                                    <th>Estado:</th>
                                    <th>Fecha de entrega:</th>
                                    <th>Adjuntar evidencia:</th>
                                </tr>
                            </thead>
                            <tbody id="cuerpoTabla" runat="server">
                            </tbody>
                        </table>
                        <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="upEstadoReportes">
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

    <!-- JQUERY SCRIPTS -->
    <script src="../DESARROLLO/JS/jquery-1.10.2.js"></script>
    <script src="../DESARROLLO/JS/bootstrap.min.js"></script>
</asp:Content>
