<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Course_Offered.aspx.cs" Inherits="WebApplication1.AdminModule.Course_Offered" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
    <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="WebApplication1.CampuswebDataContext" EntityTypeName="" OnSelecting="LinqDataSource1_Selecting" TableName="course_offereds" EnableDelete="True" EnableUpdate="True">
    </asp:LinqDataSource>
    <asp:LinqDataSource ID="LinqDataSource2" runat="server" ContextTypeName="WebApplication1.CampuswebDataContext" EntityTypeName="" TableName="semesters" OnSelecting="LinqDataSource2_Selecting">
    </asp:LinqDataSource>
    <asp:LinqDataSource ID="LinqDataSource3" runat="server" ContextTypeName="WebApplication1.CampuswebDataContext" EntityTypeName="" TableName="courses" OnSelecting="LinqDataSource3_Selecting">
    </asp:LinqDataSource>
    <asp:LinqDataSource ID="LinqDataSource4" runat="server" OnSelecting="LinqDataSource4_Selecting">
    </asp:LinqDataSource>
    <br />
        <div class="col-sm-4">
            <label>Filter by Semester</label>
            <asp:DropDownList ID="semester" runat="server" DataSourceID="LinqDataSource4" DataTextField="display_name" DataValueField="s_id" OnSelectedIndexChanged="semester_SelectedIndexChanged" AutoPostBack="True" CssClass="form-control">
            </asp:DropDownList>
        </div>
    
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table" DataKeyNames="co_id" DataSourceID="LinqDataSource1" OnRowDeleting="GridView1_RowDeleting" OnRowUpdating="GridView1_RowUpdating" ShowFooter="True">
                <Columns>
                    <asp:TemplateField HeaderText="Semester" SortExpression="s_id">
                        <EditItemTemplate>
                            <asp:DropDownList ID="EditSemester" runat="server" DataSourceID="LinqDataSource2" DataTextField="name" DataValueField="s_id" SelectedValue='<%# Bind("s_id") %>' CssClass="form-control">
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("s_year")%>' />
                            /
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("s_sem")%>' />
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="LinqDataSource2" DataTextField="name" DataValueField="s_id" CssClass="form-control" SelectedValue='<%# semester.SelectedValue %>'>
                            </asp:DropDownList>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Course Code" SortExpression="c_code">
                        <EditItemTemplate>
                            <asp:DropDownList ID="EditCourse" runat="server" DataSourceID="LinqDataSource3" DataTextField="name" DataValueField="c_id" SelectedValue='<%# Bind("c_id") %>' CssClass="form-control">
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("c_code") %>' />
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("c_name") %>' />
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="LinqDataSource3" DataTextField="name" DataValueField="c_id" CssClass="form-control">
                            </asp:DropDownList>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="btEdit" runat="server" CausesValidation="false" CommandName="Edit" CssClass="btn btn-primary" Font-Italic="True" Text="Edit" />
                            <asp:Button ID="btDelete" runat="server" CausesValidation="false" CommandName="Delete" CssClass="btn btn-danger" Text="Delete" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Button ID="btUpdate" runat="server" CausesValidation="true" CommandName="Update" Text="Update" CssClass="btn btn-primary" />
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
            <asp:AsyncPostBackTrigger ControlID="semester" EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>
    </div>
</asp:Content>
