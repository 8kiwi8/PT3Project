<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="student_mark.aspx.cs" Inherits="WebApplication1.student_mark1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        Added To Keep This.
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [student_mark] WHERE [u_name] = @original_u_name AND [sm_id] = @original_sm_id AND [stum_score] = @original_stum_score" InsertCommand="INSERT INTO [student_mark] ([u_name], [sm_id], [stum_score]) VALUES (@u_name, @sm_id, @stum_score)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [student_mark]" UpdateCommand="UPDATE [student_mark] SET [stum_score] = @stum_score WHERE [u_name] = @original_u_name AND [sm_id] = @original_sm_id AND [stum_score] = @original_stum_score">
            <DeleteParameters>
                <asp:Parameter Name="original_u_name" Type="String" />
                <asp:Parameter Name="original_sm_id" Type="Int32" />
                <asp:Parameter Name="original_stum_score" Type="Double" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="u_name" Type="String" />
                <asp:Parameter Name="sm_id" Type="Int32" />
                <asp:Parameter Name="stum_score" Type="Double" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="stum_score" Type="Double" />
                <asp:Parameter Name="original_u_name" Type="String" />
                <asp:Parameter Name="original_sm_id" Type="Int32" />
                <asp:Parameter Name="original_stum_score" Type="Double" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CssClass="table">
            <Columns>
                <asp:BoundField DataField="u_name" HeaderText="Student Name" ReadOnly="True" SortExpression="u_name" />
                <asp:BoundField DataField="sm_id" HeaderText="Section Mark ID" ReadOnly="True" SortExpression="sm_id" />
                <asp:TemplateField HeaderText="Student Score" SortExpression="stum_score">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("stum_score") %>'></asp:TextBox>
                        <br />
                        <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="Student Mark should be 1-100" MaximumValue="100" MinimumValue="1" Type="Integer" CssClass="alert-warning"></asp:RangeValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("stum_score") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Actions" ShowHeader="False">
                    <EditItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update" CssClass="btn btn-primary"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-warning"></asp:LinkButton>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" CssClass="btn btn-primary"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </p>
    <p>
        &nbsp;</p>
</asp:Content>
