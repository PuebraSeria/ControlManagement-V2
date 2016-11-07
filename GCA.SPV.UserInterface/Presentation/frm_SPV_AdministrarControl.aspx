﻿<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/frm_SPV_MasterPageSupervisor.Master" CodeBehind="frm_SPV_AdministrarControl.aspx.vb" Inherits="GCA.SPV.UserInterface.frm_SPV_AdministrarControl" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
                   <script src="../DESARROLLO/JS/jquery-1.12.4.js"></script>
              <script src="../DESARROLLO/JS/jquery-ui.js"></script>
             <link rel="stylesheet" href="../DESARROLLO/Estilos/jquery-ui.css"/>

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
<asp:Content ID="Content3" ContentPlaceHolderID="titulo" runat="server">Gestionar Controles</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Body" runat="server">
    <asp:GridView ID="gridControl"  ShowHeaderWhenEmpty ="True"   runat="server"  HorizontalAlign="Center" 
        AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
        DataKeyNames="TC_Codigo_DocControl"
        OnRowDeleting ="gridControl_RowDeleting" OnRowCancelingEdit ="gridControl_RowCancelingEdit"   OnPageIndexChanging ="gridControl_PageIndexChanging" OnRowUpdating="gridControl_RowUpdating"
        OnRowEditing ="gridControl_RowEditing"  OnRowDataBound="gridControl_RowDataBound" Width="698px"  >
        <Columns>
            <asp:CommandField HeaderText="Acción" ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="TC_Codigo_DocControl" HeaderText="Codigo" ReadOnly="True" SortExpression="TC_Codigo_DocControl" />
            <asp:BoundField DataField="TC_Nombre_DocControl" HeaderText="Nombre" SortExpression="TC_Nombre_DocControl" />
            <asp:BoundField DataField="TN_Periocidad_DocControl" HeaderText="Periocidad" SortExpression="TN_Periocidad_DocControl" />
             <asp:TemplateField HeaderText="Periocidad" SortExpression="TC_Nombre_Periodo">
                 <EditItemTemplate>
                     <asp:DropDownList ID="ddlPeriodo" runat="server"  >

                     </asp:DropDownList>
                     <asp:Label ID="labelPeriodo" runat="server" Text='<%# Bind("TN_Periocidad_DocControl") %>' Visible ="false" ></asp:Label>
                 </EditItemTemplate>
                 <ItemTemplate>
                     <asp:Label ID="Label3" runat="server" Text='<%# Bind("TC_Nombre_Periodo") %>'></asp:Label>
                 </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Fecha de Inicio" SortExpression="TF_FechaInicio_DocControl">
                <EditItemTemplate>
                    <asp:TextBox ID="txtFechaI" runat="server" Text='<%# Bind("TF_FechaInicio_DocControl") %>' ReadOnly="true"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("TF_FechaInicio_DocControl") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Fecha Final" SortExpression="TF_FechaFinal_DocControl"  >
                <EditItemTemplate>
                    <asp:TextBox ID="txtFechaF" runat="server" Text='<%# Bind("TF_FechaFinal_DocControl") %>' ReadOnly="true" ></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("TF_FechaFinal_DocControl") %>'></asp:Label>
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
              <script>
                  $(function () {
                      $("input[type=text][id*=txtFechaI]").datepicker();
                      $("input[type=text][id*=txtFechaF]").datepicker();
              } );
              </script>
    <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
</asp:Content>
