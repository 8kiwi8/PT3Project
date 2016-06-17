<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WebApplication1.AccountModule.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Stylesheets" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <p class="bg-warning"><asp:Label ID="Label1" runat="server"></asp:Label></p>
        <div class="form-group">
            <asp:Label ID="Label2" runat="server" Text="Label">New username</asp:Label>
            <asp:TextBox ID="txtU_name" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtU_name" ErrorMessage="Please fill In Username" CssClass="label label-warning"></asp:RequiredFieldValidator>
        </div>
        <div class="form-group">
            <asp:Label ID="Label3" runat="server" Text="Label">New Password</asp:Label>
            <asp:TextBox ID="txtU_passsword" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtU_passsword" ErrorMessage="Please Fill In Password" CssClass="label label-warning"></asp:RequiredFieldValidator>
        </div>
        <div class="form-group">
            <asp:Label ID="Label5" runat="server" Text="Label">Type of User</asp:Label>
            <asp:RadioButtonList ID="txtU_level" runat="server">
            <asp:ListItem Text="Admin" Value="admin" CssClass="radio"></asp:ListItem>
            <asp:ListItem Text="Lecturer" Value="lecturer"></asp:ListItem>
            <asp:ListItem Text="Student" Value="student"></asp:ListItem>
            </asp:RadioButtonList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtU_level" ErrorMessage="Please pick the user type" CssClass="label label-warning"></asp:RequiredFieldValidator>
        </div>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Add" CssClass="btn btn-primary"/>
    </div>
</asp:Content>
