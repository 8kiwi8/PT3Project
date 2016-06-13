<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Course.aspx.cs" Inherits="WebApplication1.AdminModule.Course" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="WebApplication1.CampuswebDataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" TableName="courses">
    </asp:LinqDataSource>

    <asp:GridView ID="GridView1" runat="server" DataSourceID="LinqDataSource1" AutoGenerateColumns="False" DataKeyNames="c_id" ShowFooter="True">
        <Columns>
         <asp:TemplateField HeaderText="ID" SortExpression="c_id">
            <asp:EditItemTemplate>
                <asp:TextBox ID="TextBoxEdit1" runat="server" Text='<%# Bind("c_id") %>'/>
            </asp:EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Bind("c_id") %>'/>
            </ItemTemplate>
            <FooterTemplate>
                <asp:Button ID="Button1" runat="server" Text="Add" OnClick="Button1_Click" />
            </FooterTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Course Code" SortExpression="c_code">
            <EditItemTemplate>
                <asp:TextBox ID="TextBoxEdit2" runat="server" Text='<%# Bind("c_code") %>'/>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label2" runat="server" Text='<%# Bind("c_code") %>'/>
            </ItemTemplate>
            <FooterTemplate>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </FooterTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Name" SortExpression="c_name">
            <EditItemTemplate>
                <asp:TextBox ID="TextBoxEdit3" runat="server" Text='<%# Bind("c_name") %>'/>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label3" runat="server" Text='<%# Bind("c_name") %>'/>
            </ItemTemplate>
            <FooterTemplate>
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            </FooterTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Credit" SortExpression="c_credit">
            <EditItemTemplate>
                <asp:TextBox ID="TextBoxEdit4" runat="server" Text='<%# Bind("c_credit") %>'/>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label4" runat="server" Text='<%# Bind("c_credit") %>'/>
            </ItemTemplate>
            <FooterTemplate>
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            </FooterTemplate>
        </asp:TemplateField>
        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
        </Columns>
    </asp:GridView>

</asp:Content>
