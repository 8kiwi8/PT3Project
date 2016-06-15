<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterStudent_1.aspx.cs" Inherits="WebApplication1.Create_Profile_1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="auto-style1">
            <tr>
                <td>New username</td>
                <td>
                    <asp:TextBox ID="txtU_name" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>New Password</td>
                <td>
                    <asp:TextBox ID="txtU_passsword" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Confirm Password </td>
                <td>
                    <asp:TextBox ID="txtConfirm" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Type Of User</td>
                <td>
                    <asp:RadioButtonList ID="txtU_level" runat="server">
                        <asp:ListItem Text="Admin" Value="Admin"></asp:ListItem>
                        <asp:ListItem Text="Lecturer" Value="Lecturer"></asp:ListItem>
                        <asp:ListItem Text="Student" Value="Student"></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center">
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
                </td>
            </tr>
        </table>
        <asp:Label ID="Label1" runat="server"></asp:Label>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [user]"></asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
