﻿<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/frm_SPV_MasterPageSupervisor.Master" CodeBehind="frm_SPV_CrearSupervisor.aspx.vb" Inherits="GCA.SPV.UserInterface.frm_SPV_CrearSupervisor" %>
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
                    <a href="frm_SPV_EditarControl.aspx"><i class="fa fa-qrcode "></i>Editar control</a>
                </li>
                 <li>
                    <a href="frm_SPV_CrearJefeOficina.aspx"><i class="fa fa-bar-chart-o"></i>Crear Jefe de Oficina</a>
                </li>
                 <li>
                    <a href="frm_SPV_AdministrarJefeOficina.aspx"><i class="fa fa-bar-chart-o"></i>Gestionar Jefes de Oficina</a>
                </li>
                 <li class="active-link">
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
<asp:Content ID="Content3" ContentPlaceHolderID="titulo" runat="server">Crear Supervisor</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Body" runat="server">
    <table style="width: 100%;">
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
                                <asp:Label runat="server" Text="DNI:"></asp:Label>
                                <br />
                                <asp:TextBox ID="txtDni" runat="server" Height="27px" Width="485px"></asp:TextBox><br />
                                <asp:RequiredFieldValidator ID="dniVacio" runat="server" 
                                    ControlToValidate="txtDni" Display="Dynamic" Text="Este campo es obligatorio." ForeColor="Red">
                                </asp:RequiredFieldValidator>
                                 <asp:RegularExpressionValidator ID="txtDniEx" runat="server" ErrorMessage="Solo se permiten numeros."
                                    ControlToValidate="txtDni" ValidationExpression="^^\d+$" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
                                <br />
                            </td>
                        </tr>
                        <tr>
                             <td>
                                <asp:Label runat="server" Text="Contraseña:"></asp:Label>
                                <br />
                                 <asp:TextBox ID="txtContrasenna" runat="server" Height="27px" Width="485px"></asp:TextBox><br />
                                <asp:RequiredFieldValidator ID="contrasennaVacio" runat="server" 
                                    ControlToValidate="txtContrasenna" Display="Dynamic" Text="Este campo es obligatorio." ForeColor="Red">
                                </asp:RequiredFieldValidator>
                                <br />
                            </td>
                        </tr>
                       <tr>
                             <td>
                                <asp:Label runat="server" Text="Nombre:"></asp:Label>
                                <br />
                                 <asp:TextBox ID="txtNombre" runat="server" Height="27px" Width="485px"></asp:TextBox><br />
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
                                <asp:Label runat="server" Text="Primer Apellido:"></asp:Label>
                                <br />
                                <asp:TextBox ID="txtApellido1" runat="server" Height="27px" Width="485px"></asp:TextBox><br />
                                <asp:RequiredFieldValidator ID="apellido1Vacio" runat="server" 
                                    ControlToValidate="txtApellido1" Display="Dynamic" Text="Este campo es obligatorio." ForeColor="Red">
                                </asp:RequiredFieldValidator>
                                 <asp:RegularExpressionValidator ID="txtApellido1Ex" runat="server" ErrorMessage="Solo se permiten letras."
                                    ControlToValidate="txtApellido1" ValidationExpression="^[a-zA-Z\s]*$" ForeColor="Red" Display="Dynamic">
                                </asp:RegularExpressionValidator>
                                <br />
                            </td>
                        </tr>
                          <tr>
                            <td>
                                <asp:Label runat="server" Text="Segundo Apellido:"></asp:Label>
                                <br />
                                <asp:TextBox ID="txtApellido2" runat="server" Height="27px" Width="485px"></asp:TextBox><br />
                                <asp:RequiredFieldValidator ID="apellido2Vacio" runat="server" 
                                    ControlToValidate="txtApellido2" Display="Dynamic" Text="Este campo es obligatorio." ForeColor="Red">
                                </asp:RequiredFieldValidator>
                                 <asp:RegularExpressionValidator ID="txtApellido2Ex" runat="server" ErrorMessage="Solo se permiten letras."
                                    ControlToValidate="txtApellido2" ValidationExpression="^[a-zA-Z\s]*$" ForeColor="Red" Display="Dynamic">
                                </asp:RegularExpressionValidator>
                                <br />
                            </td>
                        </tr>
                         <tr>
                            <td>
                                <asp:Label runat="server" Text="Email:"></asp:Label>
                                <br />
                                <asp:TextBox ID="txtEmail" runat="server" Height="27px" Width="485px"></asp:TextBox><br />
                                <asp:RequiredFieldValidator ID="emailVacio" runat="server" 
                                    ControlToValidate="txtEmail" Display="Dynamic" Text="Este campo es obligatorio." ForeColor="Red">
                                </asp:RequiredFieldValidator>
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="btnAccept" runat="server" Text="Crear" OnClick="btnAccept_Click"  Height="49px" Width="485px" />
                           </td>
                        </tr>

                    </table>
</asp:Content>
