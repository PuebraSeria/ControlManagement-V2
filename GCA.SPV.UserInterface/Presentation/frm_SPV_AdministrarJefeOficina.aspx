<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/frm_SPV_MasterPageSupervisor.Master" CodeBehind="frm_SPV_AdministrarJefeOficina.aspx.vb" Inherits="GCA.SPV.UserInterface.frm_SPV_AdministrarJefeOficina" %>
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
                <li class="active-link">
                    <a href="frm_SPV_CrearControl.aspx"><i class="fa fa-table "></i>Crear control</a>
                </li>
                <li>
                    <a href="frm_SPV_AsignarControl.aspx"><i class="fa fa-edit "></i>Asignar control</a>
                </li>
                <li>
                    <a href="frm_SPV_EditarControl.aspx"><i class="fa fa-qrcode "></i>Editar control</a>
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
<asp:Content ID="Content3" ContentPlaceHolderID="titulo" runat="server">Administrar Jefes de Oficina</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Body" runat="server">
    <asp:GridView ID="GridJefeOficina" runat="server" AllowSorting="True" HorizontalAlign="Center" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="5" DataKeyNames="TC_Codigo_JefeOficina" DataSourceID="dataJefe" CellSpacing="5">
        <Columns>
            <asp:CommandField HeaderText="Acción" ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="TC_Codigo_JefeOficina" HeaderText="Código" ReadOnly="True" SortExpression="TC_Codigo_JefeOficina" />
            <asp:BoundField DataField="TC_DNI_JefeOficina" HeaderText="DNI" SortExpression="TC_DNI_JefeOficina" />
            <asp:BoundField DataField="TC_Contrasenna_JefeOficina" HeaderText="Contraseña" SortExpression="TC_Contrasenna_JefeOficina" />
            <asp:BoundField DataField="TC_Nombre_JefeOficina" HeaderText="Nombre" SortExpression="TC_Nombre_JefeOficina" />
            <asp:BoundField DataField="TC_PrimerApellido_JefeOficina" HeaderText="Primer Apellido" SortExpression="TC_PrimerApellido_JefeOficina" />
            <asp:BoundField DataField="TC_SegundoApellido_JefeOficina" HeaderText="Segundo Apellido" SortExpression="TC_SegundoApellido_JefeOficina" />
            <asp:BoundField DataField="TC_Email_JefeOficina" HeaderText="Email" SortExpression="TC_Email_JefeOficina" />
            <asp:BoundField DataField="TC_CodOficina_JefeOficina" HeaderText="Oficina" SortExpression="TC_CodOficina_JefeOficina" Visible="False" />
            <asp:TemplateField HeaderText="Oficina" SortExpression="TC_Nombre_Oficina">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlOficina" runat="server" DataSourceID="dataOficina" DataTextField="TC_Nombre_Oficina" DataValueField="TC_Codigo_Oficina" SelectedValue='<%# Bind("TC_CodOficina_JefeOficina") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("TC_Nombre_Oficina") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
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
    <asp:SqlDataSource ID="dataJefe" runat="server" ConnectionString="<%$ ConnectionStrings:GCAConnectionString %>" 
        DeleteCommand="DELETE FROM [TJefeOficina] WHERE [TC_Codigo_JefeOficina] = @TC_Codigo_JefeOficina" 
        InsertCommand="INSERT INTO [TJefeOficina] ([TC_Codigo_JefeOficina], [TC_DNI_JefeOficina], [TC_Contrasenna_JefeOficina], [TC_PrimerApellido_JefeOficina], [TC_Nombre_JefeOficina], [TC_SegundoApellido_JefeOficina], [TC_Email_JefeOficina], [TC_CodOficina_JefeOficina]) VALUES (@TC_Codigo_JefeOficina, @TC_DNI_JefeOficina, @TC_Contrasenna_JefeOficina, @TC_PrimerApellido_JefeOficina, @TC_Nombre_JefeOficina, @TC_SegundoApellido_JefeOficina, @TC_Email_JefeOficina, @TC_CodOficina_JefeOficina)"
         SelectCommand="SELECT [TC_Codigo_JefeOficina], [TC_DNI_JefeOficina], [TC_Contrasenna_JefeOficina], [TC_PrimerApellido_JefeOficina], [TC_Nombre_JefeOficina], [TC_SegundoApellido_JefeOficina], [TC_Email_JefeOficina], [TC_Nombre_Oficina],[TC_CodOficina_JefeOficina] FROM [TJefeOficina] INNER JOIN  [TOficina] ON [TC_CodOficina_JefeOficina] =  [TC_Codigo_Oficina] " 
        UpdateCommand="UPDATE [TJefeOficina] SET [TC_DNI_JefeOficina] = @TC_DNI_JefeOficina, [TC_Contrasenna_JefeOficina] = @TC_Contrasenna_JefeOficina, [TC_PrimerApellido_JefeOficina] = @TC_PrimerApellido_JefeOficina, [TC_Nombre_JefeOficina] = @TC_Nombre_JefeOficina, [TC_SegundoApellido_JefeOficina] = @TC_SegundoApellido_JefeOficina, [TC_Email_JefeOficina] = @TC_Email_JefeOficina, [TC_CodOficina_JefeOficina] = @TC_CodOficina_JefeOficina WHERE [TC_Codigo_JefeOficina] = @TC_Codigo_JefeOficina">
        <DeleteParameters>
            <asp:Parameter Name="TC_Codigo_JefeOficina" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="TC_Codigo_JefeOficina" Type="String" />
            <asp:Parameter Name="TC_DNI_JefeOficina" Type="String" />
            <asp:Parameter Name="TC_Contrasenna_JefeOficina" Type="String" />
            <asp:Parameter Name="TC_PrimerApellido_JefeOficina" Type="String" />
            <asp:Parameter Name="TC_Nombre_JefeOficina" Type="String" />
            <asp:Parameter Name="TC_SegundoApellido_JefeOficina" Type="String" />
            <asp:Parameter Name="TC_Email_JefeOficina" Type="String" />
            <asp:Parameter Name="TC_CodOficina_JefeOficina" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="TC_DNI_JefeOficina" Type="String" />
            <asp:Parameter Name="TC_Contrasenna_JefeOficina" Type="String" />
            <asp:Parameter Name="TC_PrimerApellido_JefeOficina" Type="String" />
            <asp:Parameter Name="TC_Nombre_JefeOficina" Type="String" />
            <asp:Parameter Name="TC_SegundoApellido_JefeOficina" Type="String" />
            <asp:Parameter Name="TC_Email_JefeOficina" Type="String" />
            <asp:Parameter Name="TC_CodOficina_JefeOficina" Type="String" />
            <asp:Parameter Name="TC_Codigo_JefeOficina" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dataOficina" runat="server" ConnectionString="<%$ ConnectionStrings:GCAConnectionString %>" SelectCommand="SELECT * FROM [TOficina]"></asp:SqlDataSource>
</asp:Content>
