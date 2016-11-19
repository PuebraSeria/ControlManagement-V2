<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/frm_SPV_MasterPageSupervisor.Master" CodeBehind="frm_SPV_AdministrarControl.aspx.vb" Inherits="GCA.SPV.UserInterface.frm_SPV_AdministrarControl" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../DESARROLLO/JS/jquery-1.12.4.js"></script>
    <script src="../DESARROLLO/JS/jquery-ui.js"></script>
    <link rel="stylesheet" href="../DESARROLLO/Estilos/jquery-ui.css"/>
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
<asp:Content ID="Content3" ContentPlaceHolderID="titulo" runat="server">Gestionar Controles</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Body" runat="server">
    <form id="administrarControles" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:GridView ID="gridControl"  ShowHeaderWhenEmpty ="True"   runat="server"  HorizontalAlign="Center" 
                    AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                    DataKeyNames="TC_Codigo_DocControl"
                    OnRowDeleting ="gridControl_RowDeleting" OnRowCancelingEdit ="gridControl_RowCancelingEdit"   OnPageIndexChanging ="gridControl_PageIndexChanging" OnRowUpdating="gridControl_RowUpdating"
                    OnRowEditing ="gridControl_RowEditing"  OnRowDataBound="gridControl_RowDataBound" Width="698px" OnPreRender ="gridControl_PreRender"  >
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
                                <asp:TextBox ID="txtFechaI" runat="server" Text='<%# Bind("TF_FechaInicio_DocControl", "{0:dd/MM/yyyy}") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("TF_FechaInicio_DocControl", "{0:dd/MM/yyyy}") %>' ></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Fecha Final" SortExpression="TF_FechaFinal_DocControl"  >
                            <EditItemTemplate>
                                <asp:TextBox ID="txtFechaF" runat="server" Text='<%# Bind("TF_FechaFinal_DocControl", "{0:dd/MM/yyyy}") %>' ></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("TF_FechaFinal_DocControl", "{0:dd/MM/yyyy}") %>'></asp:Label>
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
    <script src="../DESARROLLO/JS/bootstrap.min.js"></script>
    <script src="../DESARROLLO/JS/custom.js"></script>

              <script>
                  function pageLoad() {
                      event();
                  }
                  function event() {
                      $.datepicker.regional['es'] = {
                          closeText: 'Cerrar',
                          prevText: '<Ant',
                          nextText: 'Sig>',
                          currentText: 'Hoy',
                          monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
                          monthNamesShort: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'],
                          dayNames: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
                          dayNamesShort: ['Dom', 'Lun', 'Mar', 'Mié', 'Juv', 'Vie', 'Sáb'],
                          dayNamesMin: ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sá'],
                          weekHeader: 'Sm',
                          dateFormat: 'dd/mm/yy',
                          firstDay: 1,
                          isRTL: false,
                          showMonthAfterYear: false,
                          yearSuffix: ''
                      };
                      $.datepicker.setDefaults($.datepicker.regional['es']);
                      $(function () {
                          $("input[type=text][id*=txtFechaI]").datepicker();
                          $("input[type=text][id*=txtFechaF]").datepicker();
                      });
                  };
              </script>
</asp:Content>
