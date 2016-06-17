<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Account.aspx.cs" Inherits="WebApplication1.AdminModule.Account" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Stylesheets" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="container">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [user]" DeleteCommand="DELETE FROM [user] WHERE [u_name] = @u_name" InsertCommand="INSERT INTO [user] ([u_name], [u_password], [u_level]) VALUES (@u_name, @u_password, @u_level)" UpdateCommand="UPDATE [user] SET [u_password] = @u_password, [u_level] = @u_level WHERE [u_name] = @u_name">
        <DeleteParameters>
            <asp:Parameter Name="u_name" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="u_name" Type="String" />
            <asp:Parameter Name="u_password" Type="String" />
            <asp:Parameter Name="u_level" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="u_password" Type="String" />
            <asp:Parameter Name="u_level" Type="String" />
            <asp:Parameter Name="u_name" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="u_name" DataSourceID="SqlDataSource1" CssClass="table">
        <Columns>
            <asp:BoundField DataField="u_name" HeaderText="Username" ReadOnly="True" SortExpression="u_name" />
            <asp:BoundField DataField="u_password" HeaderText="Password" SortExpression="u_password" />
            <asp:BoundField DataField="u_level" HeaderText="Type" SortExpression="u_level" />
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" CssClass="btn btn-danger"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:Button ID="Button1" runat="server" Text="Add New User" OnClick="Button1_Click" CssClass="btn btn-primary"/>
    <br />
</div>
</asp:Content>
