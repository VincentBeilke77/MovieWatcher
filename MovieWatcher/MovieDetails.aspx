<%@ Page Title="" Language="C#" MasterPageFile="~/MovieWatcher.Master" AutoEventWireup="true" CodeBehind="MovieDetails.aspx.cs" Inherits="MovieWatcher.MovieDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphHeadContents" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphFormHeader" runat="server">
    <div class="col-sm-10 offset-md-1 bg-light bg-gradient">
        <div class="row">
            <div class="col-12">
                <h3 class="display-3 text-center">Movie Details</h3>
            </div>
        </div>
        <div class="row">
            <div class="col-10 offset-1">
                <asp:Panel ID="pnlError" Visible="False" CssClass="bg-info bg-gradient rounded p-3 m-3 text-center text-danger" runat="server">
                    <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
                </asp:Panel>
            </div>
        </div>
        <div class="card">
            <div class="card-header text-center">
                <label class="display-6"><%:Movie.Title %></label>
                <span class="float-end">
                    <label class="display-6 float-end"><%:Movie.Rating.Name %></label>
                </span>
            </div>
            <div class="card-body">
                <% if (LoggedIn && !InWatchList)
                   { %>
                    <p class="float-end">
                        <asp:LinkButton ID="lnbWatchList" CssClass="btn btn-outline-secondary" 
                                        runat="server" OnClick="lnbWatchList_Click">Add to Watch List</asp:LinkButton>
                    </p>
                <% } %>
                <h5 class="card-title">Description:</h5>
                <p class="card-text">
                    <%:Movie.Description %>
                    <asp:Panel ID="pnlMovierTrailer" CssClass="text-center" runat="server">
                        <asp:Literal ID="ltlTrailerLink" runat="server"></asp:Literal>
                    </asp:Panel>
                </p>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphFormBody" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphFormFooter" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphScripts" runat="server">
</asp:Content>
