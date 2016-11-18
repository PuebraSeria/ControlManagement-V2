<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/frm_SPV_MasterPageSupervisor.Master" CodeBehind="frm_SPV_AdministrarSupervisor.aspx.vb" Inherits="GCA.SPV.UserInterface.frm_SPV_AdministrarSupervisor" %>
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
                    <a class="btn" data-toggle="collapse" data-target="#dtControles">Controles</a>
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
                    <a class="btn" data-toggle="collapse" data-target="#dtJefeOficina">Jefe Oficina</a>
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
                    <a class="btn" data-toggle="collapse" data-target="#dtSupervisor">Supervisor</a>
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
                    <a class="btn" data-toggle="collapse" data-target="#dtOficina">Oficina</a>
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
                    <a class="btn" data-toggle="collapse" data-target="#dtPeriodo">Período</a>
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
<asp:Content ID="Content3" ContentPlaceHolderID="titulo" runat="server">Gestionar Supervisores</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Body" runat="server">
    <form id="administrarSupervisor" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:GridView ID="gridSupervisor" ShowHeaderWhenEmpty ="True"  runat="server"   HorizontalAlign="Center" BackColor  ="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="5" 
                    AutoGenerateColumns="False" CellSpacing="5" DataKeyNames="TC_Codigo_Supervisor"
                    OnRowCancelingEdit ="gridSupervisor_RowCancelingEdit" OnRowDeleting ="gridSupervisor_RowDeleting" OnRowEditing ="gridSupervisor_RowEditing" OnRowUpdating ="gridSupervisor_RowUpdating"
                    OnPageIndexChanging ="gridControl_PageIndexChanging" Width="768px"   >
                    <Columns>
                        <asp:CommandField HeaderText="Acción" ShowDeleteButton="True" ShowEditButton="True" />
                        <asp:BoundField DataField="TC_Codigo_Supervisor" HeaderText="Código" SortExpression="TC_Codigo_Supervisor"   ReadOnly="True"/>
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
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
    
    <!-- Scripts necesarios -->
    <script src="../DESARROLLO/JS/jquery-1.10.2.js"></script>
    <script src="../DESARROLLO/JS/bootstrap.min.js"></script>
    <script src="../DESARROLLO/JS/custom.js"></script>
</asp:Content>
