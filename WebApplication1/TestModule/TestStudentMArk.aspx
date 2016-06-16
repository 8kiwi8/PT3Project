<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TestStudentMark.aspx.cs" Inherits="WebApplication1.TestModule.TestStudentMArk" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Stylesheets" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <asp:LinqDataSource ID="LinqDataSource1" runat="server" OnSelecting="LinqDataSource1_Selecting">
    </asp:LinqDataSource>
    <br />
    <asp:GridView ID="GridView1" runat="server" DataSourceID="LinqDataSource1">
    </asp:GridView>

</asp:Content>
