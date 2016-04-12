<%@ Page Title="Property Management - Dashboard" Language="C#" MasterPageFile="~/Template.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="rad" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Charting" tagprefix="telerik" %>
<asp:Content ID="contentHeader" ContentPlaceHolderID="cphHeader" Runat="Server">
<style type="text/css" >
.NewButtonLongP
{
	background-image: url(Images/Button2LongOff.gif);
	background-color:Transparent ;
	background-position:center ;
	background-repeat:no-repeat;
	border:None;
	font-weight:bold;
	color: Black;   
    cursor:pointer;
    width:105px;
    height:36px; 
}
.NewButtonLongPOver
{
	background-image: url(Images/Button2LongOn.gif);
	background-color:Transparent ;
	background-position:center ;
	background-repeat:no-repeat;
	border:None;
	font-weight:bold;   
    cursor:pointer;
    width:105px;
    height:36px; 
    color:black;
    
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

.numberLabels
{
	vertical-align:middle;
	text-align:center;
	padding-top:4px;
	border:solid 1px #7190b2;
	
}
</style>
<script type="text/javascript" >
    function MapVacantUnits() {
        window.open("MapsMultiple.aspx", "MapIt", 'toolbar = no ,resizable = yes, width=750px, scrollbars = yes, height = 500px');
    }

</script>
</asp:Content>
<asp:Content ID="contentPageTitle" ContentPlaceHolderID="cphPageTitle" Runat="Server">
Dashboard Overview
</asp:Content>
<asp:Content ID="contentBody" ContentPlaceHolderID="cphBodyArea" Runat="Server">
<br />
<br />
  <table width="920" summary="Occupancy and Lease Contract Table" cellpadding="0" border="0" style="border:solid 0px #cccccc; font-size:13px;">
   <tr>
    <td valign ="top" style="padding-left:6px;">
        <table  cellspacing="0" cellpadding="0" width="920px">
           
            <tr>
            <td style="padding-left:0px;  background-color:#ffffff; " valign="top" align="left">             
                 <table border="0" style="height:410px;border:solid 1px #cccccc; " cellpadding="0" cellspacing ="0" width="425" >
               
                 <tr>
                     <td  align="center" style="padding-left:5px; height:25px; background-color:#12466d;border-bottom:solid 1px #2f6b98;background-image:url(Images/DashboardUnitDarkGrad2.jpg); background-repeat:repeat-x; " valign="middle"  >
                     <asp:Label ID="frmUnitsOccupied" runat="server" ForeColor="#ffffff" CssClass="numberLabels"  Text="999" Height="20" BorderStyle="None" Width="110" Font-Bold="true" Font-Size="16px" /> 
                        </td>
                        <td style="padding-left: 5px;background-color:#f8f9fb;border-bottom:solid 1px #cccccc; "><b>Occupied Units</b>
                        </td>
                        </tr> 
                        <tr>
                        <td  align="center" style="padding-left:5px; height:25px; background-color:#12466d;border-bottom:solid 1px #2f6b98;background-image:url(Images/DashboardUnitDarkGrad2.jpg); background-repeat:repeat-x; " valign="middle">
                         <asp:Label ID="frmUnitsVacant" runat="server" ForeColor="#ffffff" BorderStyle="None"  CssClass="numberLabels"  Text="99" Height="20" Width="110" Font-Bold="true" Font-Size="16px" /> 
                        </td>
                         <td style="padding-left: 5px;background-color:#f8f9fb;border-bottom:solid 1px #cccccc; "><b>Vacant Units</b>
                        </td>
                        </tr>
                        <tr>
                        <td align="center" style="padding-left:5px;height:25px;background-color:#12466d;background-image:url(Images/DashboardUnitDarkGrad2.jpg); background-repeat:repeat-x; ">
                         <asp:Label ID="frmUnitsReserved" runat="server" ForeColor="#ffffff" BorderStyle="None" CssClass="numberLabels"  Text="99" Height="20" Width="110" Font-Bold="true" Font-Size="16px" />
                        </td>
                         <td style="padding-left: 5px;background-color:#f8f9fb;border-bottom:solid 1px #cccccc;"><b> Future Reservations</b> 
                        </td>
                        </tr>
                        <tr>
                        <td align="center" style="padding-left:5px;height:25px;background-color:#12466d;background-image:url(Images/DashboardUnitDarkGrad2.jpg); background-repeat:repeat-x; ">
                         <asp:Label ID="frmUnitsVacantFuture" runat="server" ForeColor="#ffffff" BorderStyle="None" CssClass="numberLabels"  Text="9" Height="20" Width="110" Font-Bold="true" Font-Size="16px" />
                        </td>
                         <td style="padding-left: 5px;background-color:#f8f9fb;border-bottom:solid 1px #cccccc;height:25px; "><b> Units Available in the next 60 Days</b> 
                        </td>
                        </tr> 
                        <tr>
                        <td  align="center" style="padding-left:5px;height:25px;background-color:#12466d;background-image:url(Images/DashboardUnitDarkGrad2.jpg); background-repeat:repeat-x; ">
                         <asp:Label ID="frmWaitListCount" runat="server" ForeColor="#ffffff" BorderStyle="None" CssClass="numberLabels"  Text="9" Height="20" Width="110" Font-Bold="true" Font-Size="16px" /> 
                        </td>
                         <td style="padding-left: 5px;background-color:#f8f9fb;border-bottom:solid 1px #cccccc;height:25px;"><b>Waiting List Applicants </b>
                        </td>
                        </tr>
                        <tr>
                        <td align="center" style="padding-left:5px; height:25px;background-color:#12466d;background-image:url(Images/DashboardUnitDarkGrad2.jpg); background-repeat:repeat-x; ">
                         <asp:Label ID="frmCurrentRent" runat="server" ForeColor="#ffffff" BorderStyle="None" CssClass="numberLabels"  Text="9" Height="20" Width="110" Font-Bold="true" Font-Size="16px" />
                        </td>
                         <td style="padding-left: 5px;background-color:#f8f9fb;border-bottom:solid 1px #cccccc;height:25px; "><b> This Month's Rent</b>
                        </td>
                        </tr>
                        <tr>
                        <td align="center" style="padding-left:5px;height:25px;background-color:#12466d;background-image:url(Images/DashboardUnitDarkGrad2.jpg); background-repeat:repeat-x; ">
                         <asp:Label ID="frmPreviousRent" runat="server" ForeColor="#ffffff" BorderStyle="None" CssClass="numberLabels"  Text="9" Height="20" Width="110" Font-Bold="true" Font-Size="16px" /> 
                                      
                        </td> 
                         <td style="padding-left: 5px;background-color:#f8f9fb;border-bottom:solid 0px #cccccc;height:25px;"><b> Last Month's Rent </b>
                        </td>
                        </tr>     
                        </table>
                        <table width="380px">
                        <tr>
                        <td align="center"> <br /> <asp:ImageButton runat="server" ID="btnMapAll" ImageUrl="Images/ButtonMapAllUnits.gif" OnClientClick="MapVacantUnits()" /> 
                        </td>
                        </tr>
                        </table>
            
            
                           
            </td>
            <td valign="top">
                <table>
                  <tr>
                    <td valign="top" width="30"></td>
                    <td valign="top" >
                    <rad:RadChart ID="frmUnitChart" runat="server" Height="400px" >
                        <ChartTitle TextBlock-Text="Unit Occupancy" TextBlock-Appearance-TextProperties-Color="#07528c"  Appearance-Position-Y="190"></ChartTitle>
                        
                    </rad:RadChart>
                    <br />

            
            </td>
            </tr>
            <tr>
            <td valign="top">
                       
            </td>            
            </tr>
            </table>
            
          
            </td>            
            </tr>             
        </table>
    <table width="900px">
    <tr>
    <td style="width:50px;"></td>
    <td align="center">
    <br /> 
    
<img src="Images/RentTotalsGraph.jpg" alt="Rent Totals" />
    
    
    </td>
    </tr>    
    </table>
   
    
    </td>     
    </tr>    
    </table>
<br /><br />
</asp:Content>

