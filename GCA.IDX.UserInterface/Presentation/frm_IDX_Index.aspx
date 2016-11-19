<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/frm_IDX_MasterPageIndex.Master" CodeBehind="frm_IDX_Index.aspx.vb" Inherits="GCA.IDX.UserInterface.frm_IDX_Index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../DESARROLLO/Estilos/font-awesome-4.6.3/css/font-awesome.min.css" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="titulo" runat="server">
    <h2>Inicio de sesión</h2>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Body" runat="server">
    <form id="formLogin" class="form-horizontal" runat="server" style="margin-left: 29%;">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
            <div class="form-group">
                <div style="margin-left :20%">
                    <asp:Label ID="lblMensaje" runat="server"  Visible="false"
                        CssClass="alert alert-danger">
                    </asp:Label>
                </div>
             </div>
                <div class="form-group">
                    <asp:Label ID="lblCodigo" runat="server" Text="Código:" 
                        CssClass="control-label col-sm-2" AssociatedControlID="txtCodigo"></asp:Label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtCodigo" runat="server"
                            CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="txtCodigoVacio" runat="server" 
                            ErrorMessage="Ingrese su codigo" ControlToValidate="txtCodigo"
                            Display="Dynamic" CssClass="alert alert-danger"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="lblContrasenna" runat="server" Text="Contraseña:" 
                        CssClass="control-label col-sm-2" AssociatedControlID="txtContrasenna">
                    </asp:Label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtContrasenna" TextMode="Password" runat="server"
                            CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvContrasenna" runat="server" 
                            ErrorMessage="Ingrese la contraseña" ControlToValidate="txtContrasenna"
                            Display="Dynamic" CssClass="alert alert-danger"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <asp:Button ID="btnIngresar" runat="server" Text="Ingresar" OnClick="btnIngresar_Click"/>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
            <ProgressTemplate>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <i class="fa fa-spinner fa-pulse fa-3x fa-fw"></i>
                        <span class="sr-only">Loading...</span>
                    </div>
                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>
    </form>
</asp:Content>
