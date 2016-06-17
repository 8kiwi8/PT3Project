<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Course.aspx.cs" Inherits="WebApplication1.AdminModule.Course" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
    <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="WebApplication1.CampuswebDataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" TableName="courses">
    </asp:LinqDataSource>

    <asp:GridView ID="GridView1" runat="server" DataSourceID="LinqDataSource1" AutoGenerateColumns="False" DataKeyNames="c_id" ShowFooter="True" OnDataBound="GridView1_DataBound" CssClass="table">
        <Columns>
         <asp:TemplateField HeaderText="ID" SortExpression="c_id">
            <asp:EditItemTemplate>
                <%# Container.DataItemIndex + 1 %>
            </asp:EditItemTemplate>
            <ItemTemplate>
                <%# Container.DataItemIndex + 1 %>
            </ItemTemplate>
            <FooterTemplate>
                
            </FooterTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Course Code" SortExpression="c_code">
            <EditItemTemplate>
                <asp:TextBox ID="TextBoxEdit2" runat="server" Text='<%# Bind("c_code") %>' CssClass="form-control"/>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label2" runat="server" Text='<%# Bind("c_code") %>'/>
            </ItemTemplate>
            <FooterTemplate>
                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
            </FooterTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Name" SortExpression="c_name">
            <EditItemTemplate>
                <asp:TextBox ID="TextBoxEdit3" runat="server" Text='<%# Bind("c_name") %>' CssClass="form-control"/>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label3" runat="server" Text='<%# Bind("c_name") %>'/>
            </ItemTemplate>
            <FooterTemplate>
                <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control"></asp:TextBox>
            </FooterTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Credit" SortExpression="c_credit">
            <EditItemTemplate>
                <asp:TextBox ID="TextBoxEdit4" runat="server" Text='<%# Bind("c_credit") %>' CssClass="form-control"/>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label4" runat="server" Text='<%# Bind("c_credit") %>'/>
            </ItemTemplate>
            <FooterTemplate>
                <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control"></asp:TextBox>
            </FooterTemplate>
        </asp:TemplateField>
        <asp:TemplateField>
            <ItemTemplate>
                <asp:Button Text="Edit" CommandName="Edit" CausesValidation="false" ID="btEdit" runat="server" Font-Italic="True" CssClass="btn btn-primary"/> 
                <asp:Button Text="Delete" CommandName="Delete" CausesValidation="false" ID="btDelete" runat="server" CssClass="btn btn-danger"/>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:Button Text="Update" CommandName="Update" CausesValidation="true" ID="btUpdate" runat="server" CssClass="btn btn-primary"/> 
                <asp:Button Text="Cancel" CommandName="Cancel" CausesValidation="false" ID="btCancel1" runat="server" CssClass="btn btn-default"/>
            </EditItemTemplate>
            <FooterTemplate>
                <asp:Button ID="Button1" runat="server" Text="Insert" OnClick="Button1_Click" CssClass="btn btn-primary"/> 
                <asp:Button Text="Cancel" CommandName="Cancel" CausesValidation="false" ID="btCancel2" runat="server" CssClass="btn btn-default"/>
            </FooterTemplate>
        </asp:TemplateField>
        </Columns>
        
    </asp:GridView>
    <asp:SqlDataSource runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [course] WHERE [c_id] = @c_id" InsertCommand="INSERT INTO [course] ([c_code], [c_name], [c_credit]) VALUES (@c_code, @c_name, @c_credit)" SelectCommand="SELECT * FROM [course]" UpdateCommand="UPDATE [course] SET [c_code] = @c_code, [c_name] = @c_name, [c_credit] = @c_credit WHERE [c_id] = @c_id">
        <DeleteParameters>
            <asp:Parameter Name="c_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="c_code" Type="String" />
            <asp:Parameter Name="c_name" Type="String" />
            <asp:Parameter Name="c_credit" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="c_code" Type="String" />
            <asp:Parameter Name="c_name" Type="String" />
            <asp:Parameter Name="c_credit" Type="Int32" />
            <asp:Parameter Name="c_id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    </div>
</asp:Content>
