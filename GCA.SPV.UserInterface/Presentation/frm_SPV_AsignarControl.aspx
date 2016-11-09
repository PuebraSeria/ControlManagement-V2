<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/frm_SPV_MasterPageSupervisor.Master" CodeBehind="frm_SPV_AsignarControl.aspx.vb" Inherits="GCA.SPV.UserInterface.frm_SPV_AsginarControl" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
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
                <li>
                    <a href="frm_SPV_AdministrarControl.aspx"><i class="fa fa-qrcode "></i>Gestionar Controles</a>
                </li>
                 <li class="active-link">
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
<asp:Content ID="Content3" ContentPlaceHolderID="titulo" runat="server">Asignar Control</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Body" runat="server">
      <table style="width: 100%;"  runat ="server"  >
                         <tr>
                            <td>
                                <br />
                                <asp:Label ForeColor="Red"  ID="lblMensaje" runat="server" Text=""></asp:Label><br />
                            </td>
                        </tr>
                         <tr>
                            <td>
                                <asp:Label ID="lblOficina" runat="server" Text="Oficina: "></asp:Label>
                                 <br />
                                <asp:DropDownList ID="ddlOficina" runat="server" OnSelectedIndexChanged ="ddlOficina_SelectedIndexChanged" AutoPostBack ="true"   >
                                </asp:DropDownList>
                                <br />
                            </td>
                        </tr>
                    </table>
            <br/>
            <br/>
          <table style="width: 50%; margin-left :25%;" id="tablaControles" runat ="server"   >
                         <tr>
                            <td  style="border : 1px solid #214761">
                                <asp:Label ID="lblControl" runat="server" Text="Control"></asp:Label>
                                 <br />
                            </td>
                              <td style="border : 1px solid #214761">
                                <asp:Label ID="lblAsignado" runat="server" Text="Asignado"></asp:Label>
                                 <br />
                            </td>
                        </tr>
                    </table>
                              <table style="width: 50%; margin-left :25%;" runat ="server"   >
                         <tr>
                            <td  style="width: 50%;">
                                <br />
                                 <br />
                            </td>
                              <td style="width: 50%;" >
                                <br />
                                  <asp:Button ID="btnAsignar" runat="server" OnClick ="btnAsignar_Click"   Text ="Actualizar" Height="49px" Width="200px"  />
                                 <br />
                            </td>
                        </tr>
                    </table>
</asp:Content>
