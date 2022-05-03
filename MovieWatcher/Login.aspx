<%@ Page Title="" Language="C#" MasterPageFile="~/MovieWatcher.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MovieWatcher.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphHeadContents" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphFormHeader" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphFormBody" runat="server">
    <div class="col-sm-10 offset-sm-1 bg-light bg-gradient">
        <div class="row">
            <div class="col-12">
                <h3 class="display-3 text-center">Login</h3>
            </div>
        </div>
        <div class="row p-3">
            <div class="col-10 offset-1">
                <asp:Panel ID="pnlError" Visible="False" CssClass="bg-info bg-gradient rounded p-3 m-3 text-center text-danger" runat="server">
                    <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
                </asp:Panel>
            </div>
            <div class="col-10 offset-1 border border-3 rounded-3 border-primary p-3">
                <div class="row g-2">
                    <div class="col-md-6">
                        <asp:Label ID="lblEmail" CssClass="form-label" AssociatedControlID="txtEmail" 
                                   runat="server" Text="Email:"></asp:Label><span class="text-danger">*</span>
                        <asp:TextBox ID="txtEmail" TextMode="Email" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEmail" CssClass="alert-danger" runat="server" 
                                                    ErrorMessage=" * Required" ControlToValidate="txtEmail">
                        </asp:RequiredFieldValidator>
                    </div>
                    <div class="col-md-6">
                        <asp:Label ID="lblPassword" CssClass="form-label" AssociatedControlID="txtPassword" 
                                   runat="server" Text="Password:"></asp:Label><span class="text-danger">*</span>
                        <asp:TextBox ID="txtPassword" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPassword" CssClass="alert-danger" runat="server" 
                                                    ErrorMessage=" * Required" ControlToValidate="txtPassword">
                        </asp:RequiredFieldValidator>
                    </div>
                    <div class="col-12">
                        <div class="form-check form-switch">
                            <input class="form-check-input" runat="server" type="checkbox" id="chkRememberMe" />
                            <label class="form-check-label" for="chkRememberMe">Remember Me</label>
                        </div>
                    </div>
                    <div class="col-12 text-center">
                        <asp:Button ID="btnLogin" CssClass="btn btn-primary" runat="server" Text="Login" OnClick="btnLogin_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphFormFooter" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphScripts" runat="server">
</asp:Content>
