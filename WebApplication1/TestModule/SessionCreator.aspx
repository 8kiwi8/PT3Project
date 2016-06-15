<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SessionCreator.aspx.cs" Inherits="WebApplication1.Testing.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <h1>This page will help to set session</h1>
    <form id="form1" runat="server">
    <div>
        <h3>Current login session: <%Response.Write(Session["p_name"]); %></h3>

        My Coding....

        <br />
        
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Set Session as Admin" />
        <br />
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Set Session as Lecturer" />
        <br />
        <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Set Session as Student" />
        <br />
        <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Remove Session" />
        
    </div>
    </form>
</body>
</html>
