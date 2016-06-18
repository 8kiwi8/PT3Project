<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegisterSection.aspx.cs" Inherits="WebApplication1.StudentModule.RegisterSection" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Stylesheets" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="WebApplication1.CampuswebDataContext" EntityTypeName="" TableName="courses" OnSelecting="LinqDataSource1_Selecting">
    </asp:LinqDataSource>
    <br />
    <asp:DropDownList ID="AvaiableCourse" runat="server" DataSourceID="LinqDataSource1" DataTextField="display_name" DataValueField="co_id" AutoPostBack="True" OnSelectedIndexChanged="AvaiableCourse_SelectedIndexChanged" CssClass="form-control"></asp:DropDownList>
    <br />
    <br />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <asp:LinqDataSource ID="LinqDataSource2" runat="server" OnSelecting="LinqDataSource2_Selecting">
            </asp:LinqDataSource>
            <asp:GridView ID="GridView1" runat="server" DataSourceID="LinqDataSource2" AutoGenerateColumns="False" DataKeyNames="sec_id" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CssClass="table">
                <Columns>
                <asp:TemplateField HeaderText="Course Code" SortExpression="c_code">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("c_code") %>'/>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("c_name") %>'/>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Lecturer" SortExpression="u_name">
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("p_name") %>'/>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Section No">
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("sec_no") %>'/>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="">
                    <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text=Registered Visible='<%# Eval("taken").Equals("1") %>' CssClass="label label-primary"/>
                            <asp:Button Text="Register" CommandName="Select" CausesValidation="true" ID="Button1" runat="server" Visible='<%# Eval("taken").Equals("0") %>' CssClass="btn btn-primary"/>
                    </ItemTemplate>
                </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="AvaiableCourse" EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>

</asp:Content>
