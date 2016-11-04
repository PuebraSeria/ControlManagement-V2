<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/frm_SPV_MasterPageSupervisor.Master" CodeBehind="frm_SPV_CrearControl.aspx.vb" Inherits="GCA.SPV.UserInterface.frm_SPV_CrearControl" %>
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
                <li class="active-link">
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
<asp:Content ID="Content3" ContentPlaceHolderID="titulo" runat="server">Crear Control</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Body" runat="server">
   <table style="width: 100%;" id="tableA" runat ="server"  >
                        <tr>
                            <td>
                                <br />
                                <asp:Label ForeColor="Red"  ID="lblMensaje" runat="server" Text=""></asp:Label><br />
                            </td>
                        </tr>
                         <tr>
                            <td>
                                <asp:Label runat="server" Text="Código:"></asp:Label>
                                <br />
                                <asp:TextBox ID="txtCodigo" runat="server" Height="27px" Width="485px"></asp:TextBox><br />
                                <asp:RequiredFieldValidator ID="codigoVacio" runat="server" 
                                    ControlToValidate="txtCodigo" Display="Dynamic" Text="Este campo es obligatorio." ForeColor="Red">
                                </asp:RequiredFieldValidator>
                                <br />
                            </td>
                        </tr>
                       <tr>
                             <td>
                                <asp:Label runat="server" Text="Nombre:"></asp:Label>
                                <br />
                                 <asp:TextBox ID="txtNombre" runat="server" Height="27px" Width="485px" ></asp:TextBox><br />
                                <asp:RequiredFieldValidator ID="nombreVacio" runat="server" 
                                    ControlToValidate="txtNombre" Display="Dynamic" Text="Este campo es obligatorio." ForeColor="Red">
                                </asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="txtNombreEx" runat="server" ErrorMessage="Solo se permiten letras."
                                    ControlToValidate="txtNombre" ValidationExpression="^[a-zA-Z\s]*$" ForeColor="Red" Display="Dynamic">
                                </asp:RegularExpressionValidator>
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label runat="server" Text="Periocidad:"></asp:Label>
                                <br />
                                <asp:DropDownList ID="ddlPeriocidad" runat="server"></asp:DropDownList>
                                <br />
                            </td>
                        </tr>
                          <tr>
                            <td>
                                <asp:Label runat="server" Text="Fecha de inicio:"></asp:Label>
                                <br />
                                <asp:TextBox ID="txtFechaI" runat="server"  style="height:27px;width :485px; " ReadOnly="true" ></asp:TextBox>
                                <br />
                            </td>
                        </tr>
                         <tr>
                            <td>
                                <asp:Label runat="server" Text="Fecha final:"></asp:Label>
                                <br />
                                 <asp:TextBox ID="txtFechaF" runat="server"  style="height:27px;width :485px; " ReadOnly="true" ></asp:TextBox>
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="btnAccept" runat="server"  OnClick="btnAccept_Click"  Text ="Crear" Height="49px" Width="485px" />
                           </td>
                        </tr>
                    </table>
              <script>
                  $(function () {
                $( "#<%= txtFechaI.ClientID %>" ).datepicker();
               $( "#<%= txtFechaF.ClientID %>" ).datepicker();
              } );
              </script>
</asp:Content>