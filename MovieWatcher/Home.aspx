<%@ Page Title="Home" Language="C#" MasterPageFile="~/MovieWatcher.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="MovieWatcher.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphHeadContents" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphFormHeader" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphFormBody" runat="server">
    <div class="bg-secondary text-light bg-gradient p-5 rounded-3 m-3">
        <h1 class="display-4">Welcome to Movie Watcher!</h1>
        <p class="lead">
            This is a web application that will allow users to browse movies they would like to stream
            and add them to a Watch List, so they can pull them up and watch them later.
        </p>
        <% if (!LoggedIn)
           { %>
        <hr/>
        <p class="lead">
            <asp:HyperLink ID="hylRegister" CssClass="btn btn-link text-light" NavigateUrl="Register.aspx" 
                           runat="server">Register here!</asp:HyperLink>
        </p>
        <% } %>            
    </div>
    <asp:GridView ID="gdvMovies" CssClass="table table-responsive table-primary table-striped table-active" runat="server" AllowPaging="True" AllowSorting="True" 
                  AutoGenerateColumns="False" DataKeyNames="Id" EnableViewState="True" DataSourceID="sdsMovies" OnRowDataBound="gdvMovies_RowDataBound" OnSelectedIndexChanged="gdvMovies_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
            <asp:BoundField DataField="Name" HeaderText="Rating" SortExpression="Name" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="sdsMovies" runat="server" ConnectionString="<%$ ConnectionStrings:strConnection %>" 
                       SelectCommand="SELECT Movie.Id, Movie.Title, Movie.Description, Rating.Name FROM Movie INNER JOIN Rating ON Movie.RatingId = Rating.Id ORDER BY Movie.Title">
    </asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphFormFooter" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphScripts" runat="server">
</asp:Content>
