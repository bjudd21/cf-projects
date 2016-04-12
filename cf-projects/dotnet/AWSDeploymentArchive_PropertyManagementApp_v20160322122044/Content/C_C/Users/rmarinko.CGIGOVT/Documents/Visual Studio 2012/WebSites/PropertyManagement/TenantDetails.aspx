<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Template.master"
    CodeFile="TenantDetails.aspx.cs" Inherits="TenantDetails" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="rad" %>
<asp:Content ID="contentHeader" ContentPlaceHolderID="cphHeader" runat="Server">
    <style type="text/css">
        td
        {
            font-size: small;
        }
        .textBox1
        {
            background-image: url(Images/TextboxBackground1.jpg);
            background-repeat: repeat-x;
        }
        .theader
        {
            background-image: url(Images/holidayGridbar.gif);
            padding-left: 0px;
            background-repeat: repeat-x;
            max-height: 14px;
            min-height: 14px;
            height: 14px;
            background-color: #d3dbe9;
            border-bottom: solid 1px #cccccc;
            text-align: left;
            vertical-align: middle;
            font-weight: bold;
            font-size: 14px;
        }
        .NewButtonLongT
        {
            background-image: url(Images/Button2LongOff.gif);
            background-color: Transparent;
            background-position: center;
            background-repeat: no-repeat;
            border: None;
            font-weight: bold;
            color: Black;
            cursor: pointer;
            width: 118px;
            height: 36px;
        }
        .NewButtonLongTOver
        {
            background-image: url(Images/Button2LongOn.gif);
            background-color: Transparent;
            background-position: center;
            background-repeat: no-repeat;
            border: None;
            font-weight: bold;
            cursor: pointer;
            width: 158px;
            height: 36px;
            color: black;
        }
    </style>
    
    <script language="javascript">
        function AmenityClicked(sender) {
            if (sender.checked == true) {
                if (sender.parentNode.parentNode.childNodes[0].childNodes[0].id == sender.id) {
                    sender.parentNode.parentNode.childNodes[1].childNodes[0].checked = false;
                }
                else {
                    sender.parentNode.parentNode.childNodes[0].childNodes[0].checked = false;
                }
            }
        }
    </script>
</asp:Content>
<asp:Content ID="contentPageTitle" ContentPlaceHolderID="cphPageTitle" runat="Server">
    Tenant Details
</asp:Content>
<asp:Content ID="contentBody" ContentPlaceHolderID="cphBodyArea" runat="Server">
    <table width="600px" style="height: 500px; padding-left: 40px;">
        <tr>
            <td valign="top" align="left">
                <br />
                
                <table><tr><td align="left">
                <table width="600px" style="border: solid 1px #cccccc;">
                    <tr>
                        <td valign="top" class="theader" style="padding: 5px; max-height: 7px; min-height: 7px;
                            height: 7px;">
                        </td>
                    </tr>
                    <tr>
                        <td align="left">                            
                            <asp:Panel runat="server" ID="pnlTenantEdit" Visible="true">
                                <table border="0" width="900px">
                                    <tr>
                                        <td valign="top" align="left" style="border-right:solid 1px #cccccc;">
                                            <table border='0' cellpadding="3px" style="background-color: #ffffff; padding: 0px;"
                                                width="290px">
                                                
                                                <tr>
                                                    <td style="height: 35px; font-size: 13px; font-weight: normal;" align="right">
                                                        Tenant Name:                                                        
                                                    </td>
                                                    <td style="width:290px;"><asp:TextBox ID="txtTenantName" CssClass="textBox1" runat="server" Font-Size="13px"
                                                            Font-Bold="true" /></td>
                                                   
                                                </tr>
                                                <tr>
                                                    <td align="right" style="width: 180px;">
                                                        Family Size:
                                                    </td>
                                                    <td>
                                                        <asp:TextBox runat="server" ID="txtFamilySize" CssClass="textBox1" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 150px;" align="right">
                                                        Employer:
                                                    </td>
                                                    <td>
                                                        <asp:TextBox runat="server" ID="txtEmployer" CssClass="textBox1" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" style="width: 180px;">
                                                        Job Title:
                                                    </td>
                                                    <td>
                                                        <asp:TextBox runat="server" ID="txtJobTitle" CssClass="textBox1" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" style="width: 180px;">
                                                        Annual Income:
                                                    </td>
                                                    <td align="left">
                                                        <asp:TextBox runat="server" ID="txtIncome" CssClass="textBox1" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2" align="center">
                                                        <br />
                                                        <asp:Panel runat="server" ID="frmCurrentUnitPanel">
                                                        <table width="200px" style="border: solid 1px #cccccc;">
                                                            <tr>
                                                            <td class="theader" colspan="2" align="left" style="padding-left:5px; max-height: 7px; font-size:12px; min-height: 7px;
                                                                height: 7px;">
                                                            <b>Current Unit Info </b>
                                                            </td>
                                                            
                                                            </tr>
                                                            <tr>
                                                            <td style="height:5px;">
                                                            </td>
                                                            <td>
                                                            </td>
                                                            </tr>    
                                                            <tr>                        
                                                            <td style="width:100px;" align="right">Unit:
                                                            </td>
                                                            <td style="width:100px;" align="left"><asp:Label runat="server" ID="lblUnitNumber"  />
                                                            </td>
                                                            </tr>
                                                             <tr>                        
                                                            <td style="width:100px;" align="right">Rent $:
                                                            </td>
                                                            <td style="width:100px;" align="left"><asp:Label runat="server" ID="lblUnitRent"  />
                                                            </td>
                                                            </tr>
                                                            <tr>                        
                                                            <td style="width:100px;" align="right">Bedrooms:
                                                            </td>
                                                            <td style="width:100px;" align="left"><asp:Label runat="server" ID="lblUnitBeds"  />
                                                            </td>
                                                            </tr>
                                                            <tr>                        
                                                            <td style="width:100px;" align="right">Bathrooms:
                                                            </td>
                                                            <td style="width:100px;" align="left"><asp:Label runat="server" ID="lblUnitBaths"  />
                                                            </td>
                                                            </tr>
                                                            <tr>                        
                                                            <td style="width:100px;" align="right">Contract Start:
                                                            </td>
                                                            <td style="width:100px;" align="left"><asp:Label runat="server" ID="lblContractStart"  />
                                                            </td>
                                                            </tr>
                                                            <tr>                        
                                                            <td style="width:100px;" align="right">Contract End:
                                                            </td>
                                                            <td style="width:100px;" align="left"><asp:Label runat="server" ID="lblContractEnd"  />
                                                            </td>
                                                            </tr>
                                                            <tr>
                                                            <td style="height:5px;">
                                                            </td>
                                                            <td>
                                                            </td>
                                                            </tr>                       
                                                        </table>
                                                        </asp:Panel>
                                                        <br />
                                                        
                                                        
                                                    </td>
                                                    
                                                </tr>
                                            </table>
                                        </td>
                                        <td style="width:40px;">&nbsp;</td>
                                        <td valign="top"><br />                                      
                                         <div style="font-size:14px;height:15px;"><b>Amenities</b></div><br />
                                         
                                            <table width="100%">
                                                <tr>
                                                    <td width="50%" align="center" valign="top">
                                                        <table width="100%" id="frmAmenityTable0" runat="server">
                                                            <tr>
                                                                <td style="width: 30px;">
                                                                    Required
                                                                </td>
                                                                <td style="width: 30px;">
                                                                    Desired
                                                                </td>
                                                                <td style="width: 150px;">
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td width="50%" align="center" valign="top">
                                                        <table width="100%" id="frmAmenityTable1" runat="server">
                                                            <tr>
                                                                <td style="width: 30px;">
                                                                    Required
                                                                </td>
                                                                <td style="width: 30px;">
                                                                    Desired
                                                                </td>
                                                                <td style="width: 150px;">
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                            
                                            
                                        </td>
                                    </tr>
                                    
                                    <tr>
                                        <td align="center">
                                            <asp:Button runat="server" Text="Find Unit" CssClass="NewButtonLongT" ID="btnFindUnit" OnClick="btnFindUnit_Click" />
                                        </td>
                                        <td colspan="2">
                                            <table width="100%">
                                                <tr>
                                                    <td align="right" width="100%">
                                                        <asp:Button runat="server" Text="Save" CssClass="NewButtonLongT" ID="btnSave" OnClick="btnSave_Click" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                           
                            </asp:Panel>
  
                        </td>
                    </tr>
                </table>
                </td>
                <td valign="top" align= "center" style="width:300px;padding-left:8px;padding-right:8px;">
                                      
                        
                        
                 
                 </td>
                </tr>
                </table>
                <br />
                <br />
                <table width="850px">
                    <tr>
                        <td>
  <table width="850px">
    <tr>
    <td align="left" style="font-size:14px; font-weight:bold;">Occupancy History
                                  
    </td>
    <td align="right">   
    </td>
    <td style="width:80px;" align="right" valign="bottom">
        <asp:ImageButton ID="btnExcel" runat="server" 
            ImageUrl="~/Images/excel-download.gif" onclick="btnExcel_Click"  /></td>
    </tr>
    </table> 
                            <rad:RadGrid ID="RadGrid1" runat="server" Skin="WebBlue" EnableEmbeddedSkins="true"
                                GridLines="None" Width="850px" AutoGenerateColumns="False" OnNeedDataSource="RadGrid1_OnNeedDataSource" AllowSorting="true">
                                <MasterTableView>
                                    <RowIndicatorColumn>
                                        <HeaderStyle Width="20px"></HeaderStyle>
                                    </RowIndicatorColumn>
                                    <ExpandCollapseColumn>
                                        <HeaderStyle Width="20px"></HeaderStyle>
                                    </ExpandCollapseColumn>
                                    <Columns>
                                        <rad:GridHyperLinkColumn HeaderText="Property" UniqueName="column" DataTextField="UnitReference.PropertyReference.Name"
                                            DataNavigateUrlFields="UnitReference.PropertyReference.ID" DataNavigateUrlFormatString="~/PropertyDetails.aspx?PropertyID={0}">
                                        </rad:GridHyperLinkColumn>
                                        <rad:GridHyperLinkColumn HeaderText="Unit" UniqueName="column" DataTextField="UnitReference.UnitNumber"
                                            DataNavigateUrlFields="UnitReference.ID" DataNavigateUrlFormatString="~/UnitDetails.aspx?UnitID={0}">
                                        </rad:GridHyperLinkColumn>
                                        <rad:GridBoundColumn HeaderText="Move In" UniqueName="from" DataField="ContractStart"  DataFormatString="{0:MM/dd/yyyy}">
                                        </rad:GridBoundColumn>
                                        <rad:GridBoundColumn HeaderText="Move Out" UniqueName="to" DataField="ContractEnd" DataFormatString="{0:MM/dd/yyyy}">
                                        </rad:GridBoundColumn>
                                        <rad:GridBoundColumn HeaderText="Rent" UniqueName="rent"   DataField="Rent"  DataFormatString="{0:C}">
                                        </rad:GridBoundColumn>
                                        <rad:GridBoundColumn HeaderText="Status" UniqueName="status" DataField="Status">
                                        </rad:GridBoundColumn>
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
                <br />
                <br />
               
            </td>
        </tr>
    </table>
    <br />
    <br />
</asp:Content>
