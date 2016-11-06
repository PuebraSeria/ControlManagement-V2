<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/frm_SPV_MasterPageSupervisor.Master" CodeBehind="frm_SPV_AdministrarOficina.aspx.vb" Inherits="GCA.SPV.UserInterface.frm_SPV_AdministrarOficina" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="menu" runat="server">
    <!-- /. NAV TOP  -->
    <nav class="navbar-default navbar-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav" id="main-menu">
                <li>
                    <a href="frm_SPV_ConEstadoDeControles.aspx"><i class="fa fa-desktop"></i>Estado de los controles</a>
                </li>
                <li>
                    <a href="frm_SPV_CrearControl.aspx"><i class="fa fa-table "></i>Crear control</a>
                </li>
                <li>
                    <a href="frm_SPV_AsignarControl.aspx"><i class="fa fa-edit "></i>Asignar control</a>
                </li>
                <li>
                    <a href="frm_SPV_AdministrarControl.aspx"><i class="fa fa-qrcode "></i>Administrar control</a>
                </li>
                 <li>
                    <a href="frm_SPV_CrearJefeOficina.aspx"><i class="fa fa-bar-chart-o"></i>Crear Jefe de Oficina</a>
                </li>
                 <li class="active-link">
                    <a href="frm_SPV_AdministrarJefeOficina.aspx"><i class="fa fa-bar-chart-o"></i>Gestionar Jefes de Oficina</a>
                </li>
                 <li>
                    <a href="frm_SPV_CrearSupervisor.aspx"><i class="fa fa-bar-chart-o"></i>Crear Supervisor</a>
                </li>
                 <li>
                    <a href="frm_SPV_AdministrarSupervisor.aspx"><i class="fa fa-bar-chart-o"></i>Gestionar Supervisores</a>
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
<asp:Content ID="Content3" ContentPlaceHolderID="titulo" runat="server">Administrar Oficinas</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Body" runat="server">
    <asp:GridView ID="gridOficina" runat="server" HorizontalAlign ="Center" AutoGenerateColumns="False" DataKeyNames="TC_Codigo_Oficina" BackColor="White" BorderColor="#CCCCCC"
         BorderStyle="None" BorderWidth="1px" ShowHeaderWhenEmpty ="True"  CellPadding="3" OnRowCancelingEdit ="gridOficina_RowCancelingEdit" OnRowDeleting ="gridOficina_RowDeleting" OnRowEditing ="gridOficina_RowEditing" 
        OnRowUpdating ="gridOficina_RowUpdating" OnPageIndexChanging="gridOficina_PageIndexChanging"   >
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" HeaderText="Acción" />
            <asp:BoundField DataField="TC_Codigo_Oficina" HeaderText="Código" ReadOnly="True" SortExpression="TC_Codigo_Oficina" />
            <asp:BoundField DataField="TC_Nombre_Oficina" HeaderText="Nombre" SortExpression="TC_Nombre_Oficina" />
        </Columns>
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <RowStyle ForeColor="#000066" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#007DBB" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#00547E" />
    </asp:GridView>
</asp:Content>
