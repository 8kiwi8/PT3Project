<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegisterSection.aspx.cs" Inherits="WebApplication1.StudentModule.RegisterSection" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Stylesheets" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="WebApplication1.CampuswebDataContext" EntityTypeName="" TableName="courses" OnSelecting="LinqDataSource1_Selecting">
    </asp:LinqDataSource>
    <br />
    <asp:DropDownList ID="AvaiableCourse" runat="server" DataSourceID="LinqDataSource1" DataTextField="display_name" DataValueField="co_id"></asp:DropDownList>

    <br />
    <br />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:LinqDataSource ID="LinqDataSource2" runat="server" OnSelecting="LinqDataSource2_Selecting">
            </asp:LinqDataSource>
            <asp:GridView ID="GridView1" runat="server" DataSourceID="LinqDataSource2">
            </asp:GridView>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="AvaiableCourse" EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>

</asp:Content>
