<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/frm_SPV_MasterPageSupervisor.Master" CodeBehind="frm_SPV_AdministrarSupervisor.aspx.vb" Inherits="GCA.SPV.UserInterface.frm_SPV_AdministrarSupervisor" %>
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
                 <li>
                    <a href="frm_SPV_AdministrarJefeOficina.aspx"><i class="fa fa-bar-chart-o"></i>Gestionar Jefes de Oficina</a>
                </li>
                 <li>
                    <a href="frm_SPV_CrearSupervisor.aspx"><i class="fa fa-bar-chart-o"></i>Crear Supervisor</a>
                </li>
                 <li class="active-link">
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
<asp:Content ID="Content3" ContentPlaceHolderID="titulo" runat="server">Crear Control</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Body" runat="server">
    <asp:GridView ID="gridSupervisor" ShowHeaderWhenEmpty ="true"  runat="server"   HorizontalAlign="Center" BackColor  ="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="5" AllowSorting="True" AutoGenerateColumns="False" CellSpacing="5" DataKeyNames="TC_Codigo_Supervisor" DataSourceID="dataSupervisor">
        <Columns>
            <asp:CommandField HeaderText="Acción" ShowDeleteButton="True" ShowEditButton="True" />
            <asp:TemplateField HeaderText="Código" SortExpression="TC_Codigo_Supervisor">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("TC_Codigo_Supervisor") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("TC_Codigo_Supervisor") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="TC_DNI_Supervisor" HeaderText="DNI" SortExpression="TC_DNI_Supervisor" />
            <asp:BoundField DataField="TC_Contrasenna_Supervisor" HeaderText="Contraseña" SortExpression="TC_Contrasenna_Supervisor" />
            <asp:BoundField DataField="TC_Nombre_Supervisor" HeaderText="Nombre" SortExpression="TC_Nombre_Supervisor" />
            <asp:BoundField DataField="TC_PrimerApellido_Supervisor" HeaderText="Primer Apellido" SortExpression="TC_PrimerApellido_Supervisor" />
            <asp:BoundField DataField="TC_SegundoApellido_Supervisor" HeaderText="Segundo Apellido" SortExpression="TC_SegundoApellido_Supervisor" />
            <asp:BoundField DataField="TC_Email_Supervisor" HeaderText="Email" SortExpression="TC_Email_Supervisor" />
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
    <asp:SqlDataSource ID="dataSupervisor" runat="server" ConnectionString="<%$ ConnectionStrings:GCAConnectionString %>" DeleteCommand="DELETE FROM [TSupervisor] WHERE [TC_Codigo_Supervisor] = @TC_Codigo_Supervisor" InsertCommand="INSERT INTO [TSupervisor] ([TC_Codigo_Supervisor], [TC_DNI_Supervisor], [TC_Contrasenna_Supervisor], [TC_Nombre_Supervisor], [TC_PrimerApellido_Supervisor], [TC_SegundoApellido_Supervisor], [TC_Email_Supervisor]) VALUES (@TC_Codigo_Supervisor, @TC_DNI_Supervisor, @TC_Contrasenna_Supervisor, @TC_Nombre_Supervisor, @TC_PrimerApellido_Supervisor, @TC_SegundoApellido_Supervisor, @TC_Email_Supervisor)" SelectCommand="SELECT * FROM [TSupervisor]" UpdateCommand="UPDATE [TSupervisor] SET [TC_DNI_Supervisor] = @TC_DNI_Supervisor, [TC_Contrasenna_Supervisor] = @TC_Contrasenna_Supervisor, [TC_Nombre_Supervisor] = @TC_Nombre_Supervisor, [TC_PrimerApellido_Supervisor] = @TC_PrimerApellido_Supervisor, [TC_SegundoApellido_Supervisor] = @TC_SegundoApellido_Supervisor, [TC_Email_Supervisor] = @TC_Email_Supervisor WHERE [TC_Codigo_Supervisor] = @TC_Codigo_Supervisor">
        <DeleteParameters>
            <asp:Parameter Name="TC_Codigo_Supervisor" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="TC_Codigo_Supervisor" Type="String" />
            <asp:Parameter Name="TC_DNI_Supervisor" Type="String" />
            <asp:Parameter Name="TC_Contrasenna_Supervisor" Type="String" />
            <asp:Parameter Name="TC_Nombre_Supervisor" Type="String" />
            <asp:Parameter Name="TC_PrimerApellido_Supervisor" Type="String" />
            <asp:Parameter Name="TC_SegundoApellido_Supervisor" Type="String" />
            <asp:Parameter Name="TC_Email_Supervisor" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="TC_DNI_Supervisor" Type="String" />
            <asp:Parameter Name="TC_Contrasenna_Supervisor" Type="String" />
            <asp:Parameter Name="TC_Nombre_Supervisor" Type="String" />
            <asp:Parameter Name="TC_PrimerApellido_Supervisor" Type="String" />
            <asp:Parameter Name="TC_SegundoApellido_Supervisor" Type="String" />
            <asp:Parameter Name="TC_Email_Supervisor" Type="String" />
            <asp:Parameter Name="TC_Codigo_Supervisor" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
