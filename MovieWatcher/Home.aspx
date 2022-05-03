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
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphFormFooter" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphScripts" runat="server">
</asp:Content>
