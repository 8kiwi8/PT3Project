<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewResult.aspx.cs" Inherits="WebApplication1.StudentModule.ViewResult" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Stylesheets" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class = "container">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SelectSemester" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="display_name" DataValueField="s_id" OnSelectedIndexChanged="UpdateTable" AutoPostBack="true" CssClass="form-control">
    </asp:DropDownList>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SelectSectionWithStudentIDAndSemesterID" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="teststudent" Name="u_name" SessionField="u_name" Type="String" />
                    <asp:ControlParameter ControlID="DropDownList1" DefaultValue="1" Name="s_id" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:LinqDataSource ID="LinqDataSource1" runat="server" OnSelecting="LinqDataSource1_Selecting">
            </asp:LinqDataSource>
            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="display_name" DataValueField="sec_id" OnSelectedIndexChanged="UpdateTable" AutoPostBack="True" AppendDataBoundItems="True" CssClass="form-control">
                <asp:ListItem Selected="True" Text="" Value="0"></asp:ListItem>
            </asp:DropDownList>
            <asp:GridView ID="GridView1" runat="server" DataSourceID="LinqDataSource1" AutoGenerateColumns="False" CssClass="table">
                <Columns>
                    <asp:TemplateField HeaderText="Assement">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("sm_item") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Weight(%)">
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("sm_percentage") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Your mark">
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("stum_score") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="out of Total">
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("sm_total") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Actual Mark">
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("total_percentage") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <br />
            <span class="bg-success">
            <div class="col-sm-4">
            Total Mark: <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
            </div>
            <div class="col-sm-4">
            Your Grade: <asp:Label ID="gred" runat="server" Text="Label"></asp:Label>
            </div>
            </span>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="DropDownList1" EventName="SelectedIndexChanged" />
            <asp:AsyncPostBackTrigger ControlID="DropDownList2" EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>
    </div>
    </div>
</asp:Content>
