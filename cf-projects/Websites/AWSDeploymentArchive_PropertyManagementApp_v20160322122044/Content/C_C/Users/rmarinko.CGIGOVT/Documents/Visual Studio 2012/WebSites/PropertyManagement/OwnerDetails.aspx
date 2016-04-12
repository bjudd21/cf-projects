<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Template.master"
    CodeFile="OwnerDetails.aspx.cs" Inherits="OwnerDetails" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="rad" %>
<asp:Content ID="contentHeader" ContentPlaceHolderID="cphHeader" runat="Server">
    <style type="text/css">
        .textBox1
        {
            background-image: url(Images/TextboxBackground1.jpg);
            background-repeat: repeat-x;
        }
        .theader
        {
            background-image: url(Images/holidayGridbar.gif);
            padding-left: 3px;
            background-repeat: repeat-x;
            height: 25px;
            background-color: #d3dbe9;
            border-bottom: solid 1px #cccccc;
            text-align: left;
            vertical-align: middle;
            font-weight: bold;
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
    </style>
     <script type="text/javascript">
        
         function MapIt(address) {
             window.open("Maps.aspx?address=" + address, "MapIt", 'toolbar = no ,resizable = yes, width=750px, scrollbars = yes, height = 500px');
         }
     </script>
</asp:Content>
<asp:Content ID="contentPageTitle" ContentPlaceHolderID="cphPageTitle" runat="Server">
    Owner Details
</asp:Content>
<asp:Content ID="contentBody" ContentPlaceHolderID="cphBodyArea" runat="Server">
    <table width="900px" style="height: 500px; padding-left: 30px;">
        <tr>
            <td valign="top">
                <br />
                <table width="850px">
                    <tr>
                        <td valign="top" style="width: 360px;">
                            <br />
                            <table style="background-color: #ffffff; border: solid 1px #cccccc; padding: 0px;"
                                width="400px">
                                <tr>
                                    <td colspan="2" class="theader" style="height: 15px;">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 100px; height: 25px; font-size: 14px; font-weight: bold;" align="right">
                                        Name:
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" ID="txtOwnerName" CssClass="textBox1" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 100px; height: 25px;" align="right">
                                        Address:
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" ID="txtOwnerAddress" CssClass="textBox1" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 100px; height: 25px;" align="right">
                                        City:
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" ID="txtOwnerCity" CssClass="textBox1" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 100px; height: 25px;" align="right">
                                        State:
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" ID="txtOwnerState" CssClass="textBox1" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 100px; height: 25px;" align="right">
                                        Postal Code:
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" ID="txtOwnerZip" CssClass="textBox1" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="right"><asp:Button runat="server" CssClass="NewButtonP" ID="frmOwnerSave" Text="Save" OnClick="frmOwnerSave_Click" /></td>
                                </tr>
                            </table>
                        </td>
                        <td valign="top">
                            <br />
                        </td>
                    </tr>
                </table>
                <br />
                <br />
                <table width="850px">
                    <tr>
                        <td>
                            <div style="font-size: 14px; margin-bottom: 5px;">
                                <b>Properties</b></div>
                            <rad:RadGrid ID="RadGrid1" runat="server" Skin="WebBlue" EnableEmbeddedSkins="true"
                                GridLines="None" Width="900px" AutoGenerateColumns="False" OnNeedDataSource="RadGrid1_OnNeedDataSource"
                                AllowSorting="true">
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
                    <tr>
                        <td>
                            <br />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <br />
    <br />
</asp:Content>
