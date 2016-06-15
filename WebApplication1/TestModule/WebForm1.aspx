<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication1.TestModule.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    </div>
    &nbsp;<asp:Label ID="Label1" runat="server" Text="Student Name:"></asp:Label>
&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txt_name" runat="server"></asp:TextBox>
&nbsp;
        <asp:Button ID="Button1" runat="server" Text="View Mark" OnClick="Button1_Click" />
        <asp:GridView ID="GridView1" runat="server" DataKeyNames="u_name" AutoGenerateColumns="false">
            <Columns>
                <asp:TemplateField HeaderText="Assesment">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# Eval("assestment") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Mark">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# Eval("marks") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Total Mark">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# Eval("totalMarks") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Percentage Mark">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# Eval("percent") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Actual Mark">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# Eval("actualMarks") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:TextBox ID="finalMarks" runat="server">

        </asp:TextBox>
        <asp:TextBox ID="gred" runat="server"></asp:TextBox>
        
    </form>
</body>
</html>
