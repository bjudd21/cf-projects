<%@ Control Language="C#" AutoEventWireup="true" CodeFile="TopNav.ascx.cs" Inherits="TopNav" %>
<table cellpadding="0" border="0px" cellspacing="0" style="width: 490px;">
    <tr>
        <td align="right">
            <asp:Panel ID="pnlLogout" runat="server" Visible="true">
                <asp:Label ID="lblWelcome" runat="server" Text="Welcome Guest"></asp:Label><asp:Label
                    ID="lblLoggedIn" runat="server"></asp:Label>
                &nbsp;</asp:Panel>
            
        </td>
        <td align="left">
            | <a href="/ContactUs.aspx">Contact Us</a>
        </td>
    </tr>
</table>
