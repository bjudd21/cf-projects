<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Template.master"  EnableEventValidation="true" CodeFile="Reservations.aspx.cs" Inherits="Reservations" %>
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
    Reservations
</asp:Content>
<asp:Content ID="contentBody" ContentPlaceHolderID="cphBodyArea" Runat="Server">
    <br />
<table width="900px" style="height:500px;padding-left:40px;">
<tr>
<td valign="top">

    <table border ="0"   width="500px" style="border:solid 0px #cccccc;">
    <tr>
    <td  style="width:90px;" align="right">
      Search Reservations:
      </td>
      <td style="width:160px;" align="left">
    <asp:TextBox runat="server" ID="txtTenantSearch" CssClass="textBox1" />
</td>
<td>
<asp:Button runat="server" ID="btnSearch" Text="Search" CssClass="NewButtonP" 
        onclick="btnSearch_Click" />
</td>
</tr>
</table>
<br />
<br />
<br />


<table width="850px" >
<tr>
<td>
 <table width="900">
    <tr>
    <td align="left" style="font-size:14px; font-weight:bold;"> 
                                  
    </td>
    <td align="right">
    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="Images/add.png" onclick="ImageButton1_Click" 
             /><asp:LinkButton ID="LinkButton1" runat="server" Text="Add A New Tenant" Font-Bold ="true" onclick="LinkButton1_Click"></asp:LinkButton>
    </td>
    <td style="width:80px;" align="right" valign="bottom">
        <asp:ImageButton ID="btnExcel" runat="server" 
            ImageUrl="~/Images/excel-download.gif" onclick="btnExcel_Click" /></td>
    </tr>
   </table> 
 <asp:Panel runat="server" ID="pnlAddNew" Visible="false">
    <table style="border:solid 1px #CCCCCC; background-color:#dae2e8;" width="900px" visible ="false">
        <tr>
            <td>SSN Last 4#</td>
            <td>Name</td>
            <td>Unit</td>            
            <td>Move-In Date</td>
            <td>Desired Move-In Date</td>
        </tr>
        <tr>
            <td><asp:TextBox runat="server" ID="txtSSN" CssClass="textBox1"></asp:TextBox></td>
            <td><asp:TextBox runat="server" ID="txtTenantName" CssClass="textBox1"></asp:TextBox></td>
            <td><asp:TextBox runat="server" ID="txtUnit" CssClass="textBox1"></asp:TextBox></td>
            <td><asp:TextBox runat="server" ID="txtMoveIn" Width="50px" CssClass="textBox1"></asp:TextBox></td>
            <td><asp:TextBox runat="server" ID="txtDesired" Width="80px" CssClass="textBox1"></asp:TextBox></td>
        </tr>
        <tr> 
            <td>Property Name</td>
            <td>Unit Address</td>
            <td>On Wait List</td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td><asp:TextBox runat="server" ID="txtPropertyName" CssClass="textBox1"></asp:TextBox></td>
            <td><asp:TextBox runat="server" ID="txtUnitAddress" CssClass ="textBox1"></asp:TextBox></td>
            <td><asp:TextBox runat="server" ID="txtOnWaitList" CssClass="textBox1"></asp:TextBox> </td>
            <td><asp:HiddenField ID="hdnTenantID" runat="server" /></td>
            <td><asp:Button runat="server" Text="Add" ID="btnAddprop" CssClass ="NewButtonP"   onclick="btnAddprop_Click" 
                     /><asp:Button ID="btnCancel" runat="server" 
                    Text="Cancel" CssClass ="NewButtonP" onclick="btnCancel_Click" /></td>
       </tr>
    </table>
    <br />
    </asp:Panel>
   <rad:RadGrid ID="RadGrid1" runat="server"  Skin="WebBlue" EnableEmbeddedSkins="true" 
            GridLines="None" Width="900px" AutoGenerateColumns="False" AllowPaging="true" OnItemCreated="RadGrid1_OnItemCreated" AllowSorting="true" OnNeedDataSource="RadGrid1_OnNeedDataSource" >
<MasterTableView>

<RowIndicatorColumn>
<HeaderStyle Width="20px"></HeaderStyle>
</RowIndicatorColumn>

<ExpandCollapseColumn>
<HeaderStyle Width="20px"></HeaderStyle>
</ExpandCollapseColumn>
    <Columns>

        <rad:GridHyperLinkColumn SortExpression="Name"   HeaderText="Tenant" UniqueName="column"   DataTextField="Name" DataNavigateUrlFields="ID" DataNavigateUrlFormatString= "~/TenantDetails.aspx?TenantID={0}">    
        </rad:GridHyperLinkColumn> 
        <rad:GridTemplateColumn UniqueName="Unit" HeaderText="Unit">
                                <ItemTemplate>
                                    <asp:HyperLink ID="frmTenantUnit" runat="server" NavigateUrl="~/LeaseCreate.aspx" Text="Find Unit"></asp:HyperLink>
                                </ItemTemplate>
                            </rad:GridTemplateColumn>
        <rad:GridHyperLinkColumn   HeaderText="Property" UniqueName="column"   DataTextField="CurrentProperty.Name" DataNavigateUrlFields="CurrentProperty.ID" DataNavigateUrlFormatString= "~/PropertyDetails.aspx?PropertyID={0}">    
        </rad:GridHyperLinkColumn> 
        <rad:GridBoundColumn  DataType="System.Double"  HeaderText="Rent" ItemStyle-HorizontalAlign="Right" UniqueName="column" DataField="CurrentContract.Rent" DataFormatString="{0:C}" >    
        </rad:GridBoundColumn >  
        <rad:GridBoundColumn   HeaderText="Lease Start" UniqueName="column" DataField="CurrentContractStart" DataFormatString="{0:MM/dd/yyyy}" >    
        </rad:GridBoundColumn >           
        <rad:GridBoundColumn   HeaderText="Lease End" UniqueName="column" DataField="CurrentContractEnd" DataFormatString="{0:MM/dd/yyyy}" >    
        </rad:GridBoundColumn >

    </Columns>
    
</MasterTableView>
        </rad:RadGrid>

</td>
</tr>

</table>


       






</td>
</tr>
</table>
<br />
<br />
</asp:Content>