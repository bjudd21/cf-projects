<%@ Page Title="Property Management - Properties" Language="C#" MasterPageFile="~/Template.master" AutoEventWireup="true" EnableEventValidation="false" CodeFile="Properties.aspx.cs" Inherits="_Default" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="rad" %>


<asp:Content ID="contentHeader" ContentPlaceHolderID="cphHeader" Runat="Server">
    <style type="text/css" >
.textBox1
{
	background-image: url(Images/TextboxBackground1.jpg);
	background-repeat:repeat-x;
	
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
    
     <script type="text/javascript">
         function showAddNew() {
             var adddiv = document.getElementById("ctl00_cphBodyArea_pnlAddNew");
            // adddiv.style.Display = "block";
            // adddiv.style.Visible = "true";

            // $get('panelID').style.display = 'none' // for hide

            // $get('ctl00_cphBodyArea_pnlAddNew').style.display = 'block' // for show
             document.getElementById("ctl00_cphBodyArea_pnlAddNew").setAttribute("Visible","true");
         }

         function MapIt(address) {
             window.open("Maps.aspx?address=" + address, "MapIt", 'toolbar = no ,resizable = yes, width=750px, scrollbars = yes, height = 500px');
         }
     </script>
    
    
</asp:Content>
<asp:Content ID="contentPageTitle" ContentPlaceHolderID="cphPageTitle" Runat="Server">
    Properties
</asp:Content>
<asp:Content ID="contentBody" ContentPlaceHolderID="cphBodyArea" Runat="Server">   
  
    <br /><br />
    
     
<table style="height:500px;">
<tr>
<td valign="top">
    <table cellpadding ="3px">
    <tr>
    <td style="height:22;">
    Search:  <asp:TextBox runat="server" ID="txtPropSearch" CssClass="textBox1"  ></asp:TextBox> 
    </td>
    <td align="left">
      <asp:Button runat="server" CssClass ="NewButtonP" Text="Search" ID="btnSearch" 
            onclick="btnSearch_Click" />
    </td>
    </tr>
    <tr>
    <td colspan="2"><asp:CheckBox ID="chkAll" Text="All" runat="server" />&nbsp;&nbsp;&nbsp; <asp:CheckBox ID="CheckBox2" runat="server" Text="With Vacancies" />&nbsp;&nbsp;&nbsp;<asp:CheckBox ID="CheckBox3" runat="server" Text="With Reservations" />
    </td>
    </tr>
    </table>
    <br />
    <table>
    <tr>
    <td>
        
       <table width="900">
    <tr>
    <td align="left" style="font-size:14px; font-weight:bold;"> Properties
                                  
    </td>
    <td align="right">
    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="Images/add.png" 
             onclick="ImageButton1_Click" /><asp:LinkButton runat="server" 
            Text="Add A New Property" Font-Bold ="true" onclick="Unnamed1_Click"></asp:LinkButton>
    </td>
      <td style="width:80px;" align="right" valign="bottom">
          <asp:ImageButton ID="btnExcel" runat="server" 
              ImageUrl="~/Images/excel-download.gif" onclick="btnExcel_Click" /></td>
    </tr>
    </table>    
    <asp:Panel runat="server" ID="pnlAddNew" Visible="false">
    <table style="border:solid 1px #CCCCCC; background-color:#dae2e8;" width="900px" visible ="false">
        <tr>
            <td>Name</td>
            <td>Address</td>
            <td>City</td>
            <td>State</td>
            <td>Zip</td>
        </tr>
        <tr>
            <td><asp:TextBox runat="server" ID="txtpropName" CssClass="textBox1"></asp:TextBox></td>
            <td><asp:TextBox runat="server" ID="txtpropAddress" CssClass="textBox1"></asp:TextBox></td>
            <td><asp:TextBox runat="server" ID="txtpropCity" CssClass="textBox1"></asp:TextBox></td>
            <td><asp:TextBox runat="server" ID="txtpropState" Width="50px" CssClass="textBox1"></asp:TextBox></td>
            <td><asp:TextBox runat="server" ID="txtpropZip" Width="80px" CssClass="textBox1"></asp:TextBox></td>
        </tr>
        <tr> 
            <td>Owner Name</td>
            <td>Number Of Units</td>
            <td>Number Of Vacancies</td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td><asp:TextBox runat="server" ID="txtpropOwnerName" CssClass="textBox1"></asp:TextBox></td>
            <td><asp:TextBox runat="server" ID="txtpropNumberOfUnits" CssClass="textBox1"></asp:TextBox></td>
            <td><asp:TextBox runat="server" ID="txtpropNumberOfVacancies" CssClass="textBox1"></asp:TextBox></td>
            <td></td>
            <td><asp:Button runat="server" Text="Add" ID="btnAddprop" CssClass ="NewButtonP" onclick="btnAddprop_Click" 
                     /><asp:Button ID="btnCancel" runat="server" 
                    Text="Cancel" CssClass ="NewButtonP" onclick="btnCancel_Click" /></td>                
          
       </tr>
    </table>
    <br />
    </asp:Panel>
  
    <rad:RadGrid ID="RadGrid1" runat="server"  Skin="WebBlue" EnableEmbeddedSkins="true"    
            GridLines="None" Width="900px" AutoGenerateColumns="False" OnNeedDataSource="RadGrid1_OnNeedDataSource" AllowSorting="true">
<MasterTableView>
<RowIndicatorColumn>
<HeaderStyle Width="20px"></HeaderStyle>
</RowIndicatorColumn>

<ExpandCollapseColumn>
<HeaderStyle Width="20px"></HeaderStyle>
</ExpandCollapseColumn>
    <Columns>
        <rad:GridHyperLinkColumn   HeaderText="Name" UniqueName="column" DataTextField="Name" DataNavigateUrlFields="ID" DataNavigateUrlFormatString= "~/PropertyDetails.aspx?PropertyID={0}"   >    
        </rad:GridHyperLinkColumn >
        <rad:GridBoundColumn HeaderText="Units" UniqueName="column1" DataField="UnitCount">
        </rad:GridBoundColumn>  
        <rad:GridBoundColumn HeaderText="Occupied" UniqueName="column1" DataField="Occupied">
        </rad:GridBoundColumn>
        <rad:GridBoundColumn HeaderText="Vacant" UniqueName="column2" DataField="Vacant">
        </rad:GridBoundColumn>
        <rad:GridBoundColumn HeaderText="Reserved" UniqueName="column3" DataField="Reserved">
            <HeaderStyle BackColor="#8BADD6" />
        </rad:GridBoundColumn>     
        <rad:GridHyperLinkColumn HeaderText="Map It" UniqueName="map" Text="View Map"  DataNavigateUrlFields="Address,City,State,Zip" DataNavigateUrlFormatString= "javascript:MapIt('{0},{1},{2},{3}');" ></rad:GridHyperLinkColumn>
       
    </Columns>
    
</MasterTableView>
        </rad:RadGrid>
    
    
    </td>
    </tr>
    </table>

</td>
</tr>
</table>
</asp:Content>

