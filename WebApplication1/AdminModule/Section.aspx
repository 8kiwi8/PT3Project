<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Section.aspx.cs" Inherits="WebApplication1.AdminModule.Section1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Stylesheets" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="WebApplication1.CampuswebDataContext" EntityTypeName="" OnSelecting="LinqDataSource1_Selecting" TableName="sections" EnableDelete="True" EnableUpdate="True">
    </asp:LinqDataSource>
    <asp:LinqDataSource ID="LinqDataSource3" runat="server" ContextTypeName="WebApplication1.CampuswebDataContext" EntityTypeName="" TableName="courses" OnSelecting="LinqDataSource3_Selecting">
    </asp:LinqDataSource>
    <asp:LinqDataSource ID="LinqDataSource4" runat="server" ContextTypeName="WebApplication1.CampuswebDataContext" EntityTypeName="" TableName="users" OnSelecting="LinqDataSource4_Selecting">
    </asp:LinqDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="LinqDataSource1" ShowFooter="True" DataKeyNames="sec_id" OnRowDeleting="GridView1_RowDeleting" OnRowUpdating="GridView1_RowUpdating" OnDataBound="GridView1_DataBound">
        <Columns>
        <asp:TemplateField HeaderText="Course Code" SortExpression="c_code">
            <EditItemTemplate>
                <asp:DropDownList ID="EditCourse" runat="server" DataSourceID="LinqDataSource3" DataTextField="name" DataValueField="co_id" SelectedValue='<%# Bind("co_id") %>'></asp:DropDownList>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Bind("c_code") %>'/>
                <asp:Label ID="Label2" runat="server" Text='<%# Bind("c_name") %>'/>
            </ItemTemplate>
            <FooterTemplate>
                <asp:DropDownList ID="NewSectionCourse" runat="server" DataSourceID="LinqDataSource3" DataTextField="name" DataValueField="co_id"></asp:DropDownList>
            </FooterTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Lecturer" SortExpression="u_name">
            <EditItemTemplate>
                <asp:DropDownList ID="EditLecturer" runat="server" DataSourceID="LinqDataSource4" DataTextField="name" DataValueField="u_name" SelectedValue='<%# Bind("u_name") %>'></asp:DropDownList>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label3" runat="server" Text='<%# Bind("p_name") %>'/>
            </ItemTemplate>
            <FooterTemplate>
                <asp:DropDownList ID="NewSectionLecturer" runat="server" DataSourceID="LinqDataSource4" DataTextField="name" DataValueField="u_name"></asp:DropDownList>
            </FooterTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Section No">
            <EditItemTemplate>
                <asp:TextBox ID="EditSectionNo" TextMode="Number" runat="server" min="0" max="20" step="1" Text='<%# Bind("sec_no") %>'/>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label4" runat="server" Text='<%# Bind("sec_no") %>'/>
            </ItemTemplate>
            <FooterTemplate>
                <asp:TextBox ID="NewSectionNo" TextMode="Number" runat="server" min="0" max="20" step="1"/>
            </FooterTemplate>
        </asp:TemplateField>
        <asp:TemplateField>
            <ItemTemplate>
                <asp:Button Text="Edit" CommandName="Edit" CausesValidation="false" ID="btEdit" runat="server" Font-Italic="True" /> 
                <asp:Button Text="Delete" CommandName="Delete" CausesValidation="false" ID="btDelete" runat="server" />
            </ItemTemplate>
            <EditItemTemplate>
                <asp:Button Text="Update" CommandName="Update" CausesValidation="true" ID="btUpdate" runat="server" /> 
                <asp:Button Text="Cancel" CommandName="Cancel" CausesValidation="false" ID="btCancel1" runat="server" />
            </EditItemTemplate>
            <FooterTemplate>
                <asp:Button Text="Insert" OnClick="NewEntry" ID="btInsert" runat="server" /> 
                <asp:Button Text="Cancel" CommandName="Cancel" CausesValidation="false" ID="btCancel2" runat="server" />
            </FooterTemplate>
        </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>
