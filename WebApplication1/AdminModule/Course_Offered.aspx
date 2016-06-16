<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Course_Offered.aspx.cs" Inherits="WebApplication1.AdminModule.Course_Offered" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="WebApplication1.CampuswebDataContext" EntityTypeName="" OnSelecting="LinqDataSource1_Selecting" TableName="course_offereds" EnableDelete="True" EnableUpdate="True">
    </asp:LinqDataSource>
    <asp:LinqDataSource ID="LinqDataSource2" runat="server" ContextTypeName="WebApplication1.CampuswebDataContext" EntityTypeName="" TableName="semesters" OnSelecting="LinqDataSource2_Selecting">
    </asp:LinqDataSource>
    <asp:LinqDataSource ID="LinqDataSource3" runat="server" ContextTypeName="WebApplication1.CampuswebDataContext" EntityTypeName="" TableName="courses" OnSelecting="LinqDataSource3_Selecting">
    </asp:LinqDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="LinqDataSource1" ShowFooter="True" DataKeyNames="co_id" OnRowDeleting="GridView1_RowDeleting" OnRowUpdating="GridView1_RowUpdating">
        <Columns>
        <asp:TemplateField HeaderText="Semester" SortExpression="s_id">
            <EditItemTemplate>
                <asp:DropDownList ID="EditSemester" runat="server" DataSourceID="LinqDataSource2" DataTextField="name" DataValueField="s_id" SelectedValue='<%# Bind("s_id") %>'></asp:DropDownList>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Bind("s_year")%>'/>
                /
                <asp:Label ID="Label2" runat="server" Text='<%# Bind("s_sem")%>'/>
            </ItemTemplate>
            <FooterTemplate>
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="LinqDataSource2" DataTextField="name" DataValueField="s_id"></asp:DropDownList>
            </FooterTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Course Code" SortExpression="c_code">
            <EditItemTemplate>
                <asp:DropDownList ID="EditCourse" runat="server" DataSourceID="LinqDataSource3" DataTextField="name" DataValueField="c_id" SelectedValue='<%# Bind("c_id") %>'></asp:DropDownList>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label3" runat="server" Text='<%# Bind("c_code") %>'/>
                <asp:Label ID="Label4" runat="server" Text='<%# Bind("c_name") %>'/>
            </ItemTemplate>
            <FooterTemplate>
                <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="LinqDataSource3" DataTextField="name" DataValueField="c_id"></asp:DropDownList>
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
