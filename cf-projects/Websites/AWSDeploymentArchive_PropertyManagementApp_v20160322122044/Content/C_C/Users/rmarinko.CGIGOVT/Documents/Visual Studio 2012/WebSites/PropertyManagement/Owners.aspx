<%@ Page Title="Property Management - Owners" Language="C#" MasterPageFile="~/Template.master" AutoEventWireup="true" CodeFile="Owners.aspx.cs" Inherits="_Default" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="rad" %>
<asp:Content ID="contentHeader" ContentPlaceHolderID="cphHeader" Runat="Server">
 <style type="text/css" >
.textBox1
{
	background-image: url(Images/TextboxBackground1.jpg);
	background-repeat:repeat-x;
	
}
.theader
{
    background-image:url(Images/holidayGridbar.gif);
    padding-left:3px;
    background-repeat:repeat-x;
    height:25px; background-color:#d3dbe9;
    border-bottom:solid 1px #cccccc;
    text-align :left;
    vertical-align :middle;	
    font-weight:bold ;
    font-size: 14px;    
}
.NewButtonP
{
	background-image: url(Images/Button2Off.gif);
	background-color:Transparent ;
	background-position:center ;
	background-repeat:no-repeat;
	border:None;
	font-weight:bold;
	color: Black;   
    cursor:pointer;
    width:90px;
    height:36px; 
}
.NewButtonPOver
{
	background-image: url(Images/Button2On.gif);
	background-color:Transparent ;
	background-position:center ;
	background-repeat:no-repeat;
	border:None;
	font-weight:bold;   
    cursor:pointer;
    width:90px;
    height:36px; 
    color:black;
    
}

</style> 
</asp:Content>
<asp:Content ID="contentPageTitle" ContentPlaceHolderID="cphPageTitle" Runat="Server">
Owners
</asp:Content>
<asp:Content ID="contentBody" ContentPlaceHolderID="cphBodyArea" Runat="Server">
<br />

<table style="height:500px;width:900px;padding-left:10px;border:solid 0px #cccccc;">
<tr>
<td valign="top">
<br />  
    <table border ="0"   width="500px" style="border:solid 0px #cccccc;">
    <tr>
    <td  style="width:90px;" align="right">
      Search Owners:
      </td>
      <td style="width:160px;" align="left">
    <asp:TextBox runat="server" ID="txtOwnerSearch" CssClass="textBox1" ></asp:TextBox>
</td>
<td>
<asp:Button runat="server" ID="btnSearch" Text="Search" CssClass="NewButtonP" OnClick="btnSearch_Click" />
</td>
</tr>
</table>
<br />
<br />
<br />
<table width="825px">
    <tr>
    <td align="left" style="font-size:14px; font-weight:bold;">Owners
                                  
    </td>
    <td align="right">
        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="Images/add.png" OnClick="ImageButton1_Click" /><asp:LinkButton
            ID="LinkButton1" OnClick="ImageButton1_Click"  runat="server" Text="Add A New Owner" Font-Bold="true"></asp:LinkButton>
    </td>
    <td style="width:80px;" align="right" valign="bottom">
        <asp:ImageButton ID="btnExcel" runat="server" 
            ImageUrl="~/Images/excel-download.gif" onclick="btnExcel_Click"   /></td>
    </tr>
    </table> 

    <rad:RadGrid ID="RadGrid1" runat="server"  Skin="WebBlue" EnableEmbeddedSkins="true" 
            GridLines="None" Width="825px" AutoGenerateColumns="False" OnNeedDataSource="RadGrid1_OnNeedDataSource">
<MasterTableView>
<RowIndicatorColumn>
<HeaderStyle Width="20px"></HeaderStyle>
</RowIndicatorColumn>

<ExpandCollapseColumn>
<HeaderStyle Width="20px"></HeaderStyle>
</ExpandCollapseColumn>
    <Columns>
        <rad:GridHyperLinkColumn   HeaderText="Owner Name" UniqueName="column" DataTextField="Name" DataNavigateUrlFields="ID" DataNavigateUrlFormatString= "~/OwnerDetails.aspx?OwnerID={0}"  >    
        </rad:GridHyperLinkColumn >         
        <rad:GridBoundColumn HeaderText="Address" UniqueName="column1" DataField="Address">
        </rad:GridBoundColumn>           
        <rad:GridBoundColumn HeaderText="City" UniqueName="column2" DataField="City">
        </rad:GridBoundColumn>
        <rad:GridBoundColumn HeaderText="State" UniqueName="column2" DataField="State">
        </rad:GridBoundColumn>
        <rad:GridBoundColumn HeaderText="Zip" UniqueName="column2" DataField="Zip">
        </rad:GridBoundColumn>
        <rad:GridBoundColumn HeaderText="Number Of Properties" UniqueName="column3"  ItemStyle-Width="130px" DataField="PropertyCount">           
        </rad:GridBoundColumn>
          
    </Columns>
    
</MasterTableView>
        </rad:RadGrid>



</td>
</tr>
</table>
</asp:Content>

