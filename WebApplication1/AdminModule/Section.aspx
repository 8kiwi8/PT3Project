<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Section.aspx.cs" Inherits="WebApplication1.AdminModule.Section1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Stylesheets" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
    <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="WebApplication1.CampuswebDataContext" EntityTypeName="" OnSelecting="LinqDataSource1_Selecting" TableName="sections" EnableDelete="True" EnableUpdate="True">
    </asp:LinqDataSource>
    <asp:LinqDataSource ID="LinqDataSource3" runat="server" ContextTypeName="WebApplication1.CampuswebDataContext" EntityTypeName="" TableName="courses" OnSelecting="LinqDataSource3_Selecting">
    </asp:LinqDataSource>
    <asp:LinqDataSource ID="LinqDataSource4" runat="server" ContextTypeName="WebApplication1.CampuswebDataContext" EntityTypeName="" TableName="users" OnSelecting="LinqDataSource4_Selecting">
    </asp:LinqDataSource>
    <asp:LinqDataSource ID="LinqDataSource5" runat="server" OnSelecting="LinqDataSource5_Selecting">
    </asp:LinqDataSource>
    <asp:LinqDataSource ID="LinqDataSource6" runat="server" OnSelecting="LinqDataSource6_Selecting">
    </asp:LinqDataSource>
    <asp:LinqDataSource ID="LinqDataSource7" runat="server" OnSelecting="LinqDataSource7_Selecting">
    </asp:LinqDataSource>
    <div class="col-sm-4">
        <label>Filter by Semester</label>
        <asp:DropDownList ID="semesterFilter" runat="server" DataSourceID="LinqDataSource5" AutoPostBack="True" OnSelectedIndexChanged="Filter_SelectedIndexChanged" DataTextField="display_name" DataValueField="s_id" AppendDataBoundItems="true" CssClass="form-control">
            <asp:ListItem Text="All" Value="-1" Selected="True"/>
        </asp:DropDownList>
    </div>
    <div class="col-sm-4">
        <label>Filter by Lecturer</label>
        <asp:DropDownList ID="lecturerFilter" runat="server" DataSourceID="LinqDataSource6" AutoPostBack="True" OnSelectedIndexChanged="Filter_SelectedIndexChanged" DataTextField="display_name" DataValueField="u_name" AppendDataBoundItems="true" CssClass="form-control">
            <asp:ListItem Text="All" Value="all" Selected="True"/>
        </asp:DropDownList>
    </div>
    <div class="col-sm-4">
        <label>Filter by Course</label>
        <asp:DropDownList ID="courseFilter" runat="server" DataSourceID="LinqDataSource7" AutoPostBack="True" OnSelectedIndexChanged="Filter_SelectedIndexChanged" DataTextField="display_name" DataValueField="c_id" AppendDataBoundItems="true"  CssClass="form-control">
            <asp:ListItem Text="All" Value="-1" Selected="True"/>
        </asp:DropDownList>
    </div>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="sec_id" DataSourceID="LinqDataSource1" OnDataBound="GridView1_DataBound" OnRowDeleting="GridView1_RowDeleting" OnRowUpdating="GridView1_RowUpdating" ShowFooter="True" CssClass="table">
                <Columns>
                    <asp:TemplateField HeaderText="Course Code" SortExpression="c_code">
                        <EditItemTemplate>
                            <asp:DropDownList ID="EditCourse" runat="server" DataSourceID="LinqDataSource3" DataTextField="name" DataValueField="co_id" SelectedValue='<%# Bind("co_id") %>' CssClass="form-control">
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("c_code") %>' />
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("c_name") %>' />
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:DropDownList ID="NewSectionCourse" runat="server" DataSourceID="LinqDataSource3" DataTextField="display_name" DataValueField="co_id" CssClass="form-control">
                            </asp:DropDownList>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Lecturer" SortExpression="u_name">
                        <EditItemTemplate>
                            <asp:DropDownList ID="EditLecturer" runat="server" DataSourceID="LinqDataSource4" DataTextField="name" DataValueField="u_name" SelectedValue='<%# Bind("u_name") %>' CssClass="form-control">
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("p_name") %>' />
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:DropDownList ID="NewSectionLecturer" runat="server" DataSourceID="LinqDataSource4" DataTextField="name" DataValueField="u_name" CssClass="form-control">
                            </asp:DropDownList>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Section No">
                        <EditItemTemplate>
                            <asp:TextBox ID="EditSectionNo" runat="server" max="20" min="0" step="1" Text='<%# Bind("sec_no") %>' TextMode="Number" CssClass="form-control"/>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("sec_no") %>' />
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="NewSectionNo" runat="server" max="20" min="1" step="1" Text="1" TextMode="Number" CssClass="form-control"/>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="btEdit" runat="server" CausesValidation="false" CommandName="Edit" Font-Italic="True" Text="Edit" CssClass="btn btn-primary"/>
                            <asp:Button ID="btDelete" runat="server" CausesValidation="false" CommandName="Delete" Text="Delete" CssClass="btn btn-danger"/>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Button ID="btUpdate" runat="server" CausesValidation="true" CommandName="Update" Text="Update" CssClass="btn btn-primary"/>
                            <asp:Button ID="btCancel1" runat="server" CausesValidation="false" CommandName="Cancel" Text="Cancel" CssClass="btn btn-default"/>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:Button ID="btInsert" runat="server" OnClick="NewEntry" Text="Insert" CssClass="btn btn-primary"/>
                            <asp:Button ID="btCancel2" runat="server" CausesValidation="false" CommandName="Cancel" Text="Cancel" CssClass="btn btn-default"/>
                        </FooterTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="semesterFilter" EventName="SelectedIndexChanged" />
            <asp:AsyncPostBackTrigger ControlID="lecturerFilter" EventName="SelectedIndexChanged" />
            <asp:AsyncPostBackTrigger ControlID="courseFilter" EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>
    </div>
</asp:Content>
