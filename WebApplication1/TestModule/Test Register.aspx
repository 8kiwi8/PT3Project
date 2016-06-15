<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Test Register.aspx.cs" Inherits="WebApplication1.TestModule.Test_Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            height: 62px;
        }
        .auto-style2 {
            height: 26px;
        }
        .auto-style3 {
            height: 26px;
            width: 211px;
            text-align: right;
        }
        .auto-style4 {
            width: 211px;
            text-align: right;
        }
        .auto-style5 {
            height: 30px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <br />
        <table class="auto-style1">
            <tr>
                <td class="auto-style3">New Username</td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtUname" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Display Name</td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtPname" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">New Password</td>
                <td>
                    <asp:TextBox ID="txtPass" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">Confirm Password</td>
                <td>
                    <asp:TextBox ID="txtConfirm" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">Telephone No.</td>
                <td>
                    <asp:TextBox ID="txtPPhoneNo" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">Email Address.</td>
                <td>
                    <asp:TextBox ID="txtPEmailAddress" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center" class="auto-style5">
                    <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" />
                </td>
            </tr>
        </table>
        <p>
            <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [profile]"></asp:SqlDataSource>
        </p>
    </form>
</body>
</html>
