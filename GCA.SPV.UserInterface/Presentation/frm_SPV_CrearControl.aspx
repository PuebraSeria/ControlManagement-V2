<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/frm_SPV_MasterPageSupervisor.Master" CodeBehind="frm_SPV_CrearControl.aspx.vb" Inherits="GCA.SPV.UserInterface.frm_SPV_CrearControl" %>
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
                    <a class="btn" style="text-align:left" data-toggle="collapse" data-target="#dtControles"><i class="fa fa-book" aria-hidden="true"></i> Controles</a>
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
                    <a class="btn" style="text-align:left" data-toggle="collapse" data-target="#dtJefeOficina"><i class="fa fa-user" aria-hidden="true"></i> Jefe Oficina</a>
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
                    <a class="btn" style="text-align:left" data-toggle="collapse" data-target="#dtSupervisor"><i class="fa fa-user" aria-hidden="true"></i> Supervisor</a>
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
                    <a class="btn" style="text-align:left" data-toggle="collapse" data-target="#dtOficina"><i class="fa fa-university" aria-hidden="true"></i> Oficina</a>
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
                    <a class="btn" style="text-align:left" data-toggle="collapse" data-target="#dtPeriodo"><i class="fa fa-clock-o" aria-hidden="true"></i> Período</a>
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
                    <a href="#"><i class="fa fa-question-circle" aria-hidden="true"></i> Ayuda</a>
                </li>
                <li>
                    <a href="http://localhost:51014/Presentation/frm_IDX_Index.aspx"><i class="fa fa-sign-out" aria-hidden="true"></i> Salir</a>
                </li>
            </ul>
        </div>
    </nav>
    <!-- /. NAV SIDE  -->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="titulo" runat="server">Crear Control</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Body" runat="server">
    <form id="crearControl" runat="server" class="form-horizontal">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <asp:Button ID="btnAccept" runat="server"  OnClick="btnAccept_Click"  Text ="Crear" 
                            CssClass="btn btn-default" />
                        <input id="btnResert" type="reset" value="Limpiar" class="btn btn-default"/>
                    </div>
                    <div class="panel-body">
                        <div class="form-group">
                            <asp:Label ForeColor="Red"  ID="lblMensaje" runat="server" Text=""
                                CssClass="control-label col-sm-2"></asp:Label><br />
                        </div>
                        
                        <!-- Tipo de control -->
                        <div class="form-group">
                            <asp:Label ID="lblEscoge" runat="server" Text="Tipo de control:"
                                CssClass="control-label col-sm-2"></asp:Label>
                            <div class="col-sm-10">
                                <asp:DropDownList ID="ddlEscoge" runat="server" OnSelectedIndexChanged ="ddlEscoge_SelectedIndexChanged" AutoPostBack="true" 
                                    CssClass="form-control">
                                    <asp:ListItem Value ="1">Periodo</asp:ListItem>
                                    <asp:ListItem Value="2">Fecha</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>

                        <!-- Código del Control -->
                        <div class="form-group">
                            <asp:Label runat="server" Text="Código:"
                                CssClass="control-label col-sm-2"></asp:Label>
                            <div class="col-sm-10">
                                <asp:TextBox ID="txtCodigo" runat="server" 
                                    CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="codigoVacio" runat="server" 
                                    ControlToValidate="txtCodigo" Display="Dynamic" Text="Este campo es obligatorio." 
                                    CssClass="alert alert-danger">
                                </asp:RequiredFieldValidator>
                            </div>
                        </div>

                        <!-- Nombre del control -->
                        <div class="form-group">
                            <asp:Label runat="server" Text="Nombre:" CssClass="control-label col-sm-2"></asp:Label>
                            <div class="col-sm-10">
                                <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="nombreVacio" runat="server" 
                                    ControlToValidate="txtNombre" Display="Dynamic" Text="Este campo es obligatorio." 
                                    CssClass="alert alert-danger">
                                </asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="txtNombreEx" runat="server" ErrorMessage="Solo se permiten letras."
                                    ControlToValidate="txtNombre" ValidationExpression="^[a-zA-Z\s]*$" Display="Dynamic"
                                    CssClass="alert alert-danger">
                                </asp:RegularExpressionValidator>
                            </div>
                        </div>

                        <!-- Períodicidad -->
                        <div id="divPeriodicidad" runat="server">
                            <div class="form-group">
                                <asp:Label runat="server" Text="Periocidad:"  ID="lblPeriocidad" CssClass="control-label col-sm-2"></asp:Label>
                                <div class="col-sm-10">
                                    <asp:DropDownList ID="ddlPeriocidad" runat="server" CssClass="form-control"></asp:DropDownList>
                                </div>
                            </div>
                        </div>

                        <!-- Por fechas -->
                        <div id="divPorFechas" runat="server">
                            <div class="form-group">
                                <asp:Label runat="server" Text="Fecha de inicio:" ID="lblFechaI" CssClass="control-label col-sm-2"></asp:Label>
                                <div class="col-sm-10">
                                    <asp:TextBox ID="txtFechaI" runat="server" CssClass="form-control" ReadOnly="true" ></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group">
                                <asp:Label runat="server" Text="Fecha final:"  ID="lblFechaF" CssClass="control-label col-sm-2"></asp:Label>
                                <div class="col-sm-10">
                                    <asp:TextBox ID="txtFechaF" runat="server" CssClass="form-control" ReadOnly ="true" ></asp:TextBox>
                                </div>
                            </div>
                        </div>
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
                    </div>
                </div>
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
                          dateFormat: 'dd-mm-yy',
                          firstDay: 1,
                          isRTL: false,
                          showMonthAfterYear: false,
                          yearSuffix: ''
                      };
                      $.datepicker.setDefaults($.datepicker.regional['es']);
                      $(function () {
                          $("#<%= txtFechaF.ClientID %>").datepicker();
                          $("#<%= txtFechaI.ClientID %>").datepicker();
                      });
                  };
                  $(document).ready(event());
              </script>
</asp:Content>