<%@ Page Title="" Language="C#" MasterPageFile="~/MovieWatcher.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="MovieWatcher.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphHeadContents" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphFormHeader" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphFormBody" runat="server">
    <div class="col-sm-10 offset-sm-1 bg-light bg-gradient">
        <div class="row">
            <div class="col-12">
                <h3 class="display-3 text-center">Registration</h3>
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
                        <asp:Label ID="lblConfirmPassword" CssClass="form-label" AssociatedControlID="txtConfirmPassword" 
                                   runat="server" Text="Confirm Password:"></asp:Label><span class="text-danger">*</span>
                        <asp:TextBox ID="txtConfirmPassword" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvConfirmPassword" CssClass="alert-danger" runat="server" 
                                                    ErrorMessage=" * Required" ControlToValidate="txtConfirmPassword">
                        </asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="cmvPassword" CssClass="alert-danger" runat="server" 
                                              ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" 
                                              ErrorMessage=" * Must match Password"></asp:CompareValidator>
                    </div>
                    <div class="col-md-6">
                        <asp:Label ID="lblFirstName" CssClass="form-label" AssociatedControlID="txtFirstName" runat="server" 
                                   Text="First Name:"></asp:Label>
                        <asp:TextBox ID="txtFirstName" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <asp:Label ID="lblLastName" CssClass="form-label" AssociatedControlID="lblLastName" runat="server" 
                                   Text="Last Name:"></asp:Label>
                        <asp:TextBox ID="txtLastName" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-12">
                        <asp:Label ID="lblAddress" CssClass="form-label" AssociatedControlID="txtAddress" runat="server" 
                                   Text="Address"></asp:Label>
                        <asp:TextBox ID="txtAddress" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-12">
                        <asp:Label ID="lblPhone" CssClass="form-label" AssociatedControlID="txtPhone" runat="server" 
                                   Text="Phone"></asp:Label>
                        <asp:TextBox ID="txtPhone" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <asp:Label ID="lblCity" CssClass="form-label" AssociatedControlID="txtCity" runat="server" 
                                   Text="City"></asp:Label>
                        <asp:TextBox ID="txtCity" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-3">
                        <asp:Label ID="lblState" CssClass="form-label" AssociatedControlID="txtState" runat="server" 
                                   Text="State"></asp:Label>
                        <asp:TextBox ID="txtState" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-3">
                        <asp:Label ID="lblZip" CssClass="form-label" AssociatedControlID="txtZip" runat="server" 
                                   Text="Zip"></asp:Label>
                        <asp:TextBox ID="txtZip" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-12 text-center">
                        <asp:Button ID="btnRegister" CssClass="btn btn-primary" runat="server" Text="Register" OnClick="btnRegister_Click" />
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
