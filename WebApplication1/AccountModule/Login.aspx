<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplication1.AccountModule.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Stylesheets" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
    <fieldset>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="bg-warning"/>
        <asp:Label ID="lblMsg" runat="server" Text="" CssClass="label label-warning"/>
        <div class='form-group'>
            <asp:Label ID="Name" runat="server" Text="UserName:"/><br/>
            <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control"/>
            <asp:RequiredFieldValidator ID="RV1" runat="server" ControlToValidate="txtUserName" ErrorMessage="Please Enter User Name" SetFocusOnError="True" CssClass="label label-warning">Please type your username</asp:RequiredFieldValidator>
        </div>      
        <div class='form-group'>
            <asp:Label ID="lblPwd" runat="server" Text="Password:"/><br/>
            <asp:TextBox ID="txtPwd" runat="server" TextMode="Password" CssClass="form-control"/>
            <asp:RequiredFieldValidator ID="RV2" runat="server" ControlToValidate="txtPwd" ErrorMessage="Your Password" SetFocusOnError="True"  CssClass="label label-warning">Please type your password</asp:RequiredFieldValidator>
        </div>
        <div class='container'>
            <asp:Button ID="btnLogIn" runat="server" Text="Sign In" onclick="btnLogIn_Click" CssClass="btn btn-primary"/>
    </fieldset>
    </div>
</asp:Content>
