﻿<%@ Page EnableEventValidation="false" Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="section_mark.aspx.cs" Inherits="WebApplication1.section_mark" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [section_mark] WHERE [sm_id] = @original_sm_id AND [sec_id] = @original_sec_id AND [sm_item] = @original_sm_item AND [sm_total] = @original_sm_total AND [sm_percentage] = @original_sm_percentage" InsertCommand="INSERT INTO [section_mark] ([sec_id], [sm_item], [sm_total], [sm_percentage]) VALUES (@sec_id, @sm_item, @sm_total, @sm_percentage); INSERT INTO [student_mark] ([u_name], [sm_id], [stum_score]) VALUES ('teststudent', @sm_id, 0)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [section_mark]" UpdateCommand="UPDATE [section_mark] SET [sec_id] = @sec_id, [sm_item] = @sm_item, [sm_total] = @sm_total, [sm_percentage] = @sm_percentage WHERE [sm_id] = @original_sm_id AND [sec_id] = @original_sec_id AND [sm_item] = @original_sm_item AND [sm_total] = @original_sm_total AND [sm_percentage] = @original_sm_percentage">
        <DeleteParameters>
            <asp:Parameter Name="original_sm_id" Type="Int32" />
            <asp:Parameter Name="original_sec_id" Type="Int32" />
            <asp:Parameter Name="original_sm_item" Type="String" />
            <asp:Parameter Name="original_sm_total" Type="Double" />
            <asp:Parameter Name="original_sm_percentage" Type="Double" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="sec_id" Type="Int32" />
            <asp:Parameter Name="sm_item" Type="String" />
            <asp:Parameter Name="sm_total" Type="Double" />
            <asp:Parameter Name="sm_percentage" Type="Double" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="sec_id" Type="Int32" />
            <asp:Parameter Name="sm_item" Type="String" />
            <asp:Parameter Name="sm_total" Type="Double" />
            <asp:Parameter Name="sm_percentage" Type="Double" />
            <asp:Parameter Name="original_sm_id" Type="Int32" />
            <asp:Parameter Name="original_sec_id" Type="Int32" />
            <asp:Parameter Name="original_sm_item" Type="String" />
            <asp:Parameter Name="original_sm_total" Type="Double" />
            <asp:Parameter Name="original_sm_percentage" Type="Double" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT DISTINCT * FROM [section]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [section_mark]"></asp:SqlDataSource>
    <br />
    <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="sm_id"  ShowFooter="True" CssClass="table">
        <Columns>
            <asp:TemplateField HeaderText="Section ID" SortExpression="sec_id">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="sec_id" DataValueField="sec_id" SelectedValue='<%# Bind("sec_id") %>' CssClass="form-control">
                    </asp:DropDownList>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtsec_id" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RangeValidator ID="RangeValidator_sec_id" runat="server" ControlToValidate="txtsec_id" Display="Dynamic" ErrorMessage="Invalid section! Enter available section only." MaximumValue="5" MinimumValue="1" Type="Integer" CssClass="alert-warning"></asp:RangeValidator>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("sec_id") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Section Mark Item" SortExpression="sm_item">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource3" DataTextField="sm_item" DataValueField="sm_item" SelectedValue='<%# Bind("sm_item") %>' CssClass="form-control">
                    </asp:DropDownList>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtsm_item" runat="server" CssClass="form-control"></asp:TextBox>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("sm_item") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Section Mark Total" SortExpression="sm_total">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("sm_total") %>' CssClass="form-control"></asp:TextBox>
                    <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="TextBox3" Display="Dynamic" ErrorMessage="Total Mark should be 1-100" MaximumValue="100" MinimumValue="1" Type="Integer" CssClass="alert-warning"></asp:RangeValidator>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtsm_total" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtsm_total" Display="Dynamic" ErrorMessage="Total Mark should be 1-100" MaximumValue="100" MinimumValue="1" Type="Integer" CssClass="alert-warning"></asp:RangeValidator>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("sm_total") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Section Mark Percentage" SortExpression="sm_percentage">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("sm_percentage") %>' CssClass="form-control"></asp:TextBox>
                    <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="TextBox4" Display="Dynamic" ErrorMessage="Percentage should be 0.01-1.00" MaximumValue="1.0" MinimumValue="0.01" Type="Double" CssClass="alert-warning"></asp:RangeValidator>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtsm_percentage" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="txtsm_percentage" Display="Dynamic" ErrorMessage="Percentage should be 0.01-1.00" MaximumValue="1.0" MinimumValue="0.01" Type="Double" CssClass="alert-warning"></asp:RangeValidator>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("sm_percentage") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False" HeaderText="Actions">
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update" CssClass="btn btn-primary"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-warning"></asp:LinkButton>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" Text="Add" CssClass="btn btn-primary" />
                </FooterTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" CssClass="btn btn-primary"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" CssClass="btn btn-danger"></asp:LinkButton>
                    
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <br />
</asp:Content>
