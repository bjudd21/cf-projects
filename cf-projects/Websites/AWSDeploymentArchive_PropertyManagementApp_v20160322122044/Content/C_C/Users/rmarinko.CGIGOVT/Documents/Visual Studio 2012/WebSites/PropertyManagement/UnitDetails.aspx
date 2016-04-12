<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UnitDetails.aspx.cs" EnableEventValidation="false"
    MasterPageFile="~/Template.master" Inherits="UnitDetails" %>

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
            height: 15px;
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
            background-color: Transparent;
            background-position: center;
            background-repeat: no-repeat;
            border: None;
            font-weight: bold;
            color: Black;
            cursor: pointer;
            width: 90px;
            height: 36px;
        }
        .NewButtonPOver
        {
            background-image: url(Images/Button2On.gif);
            background-color: Transparent;
            background-position: center;
            background-repeat: no-repeat;
            border: None;
            font-weight: bold;
            cursor: pointer;
            width: 90px;
            height: 36px;
            color: black;
        }
    </style>
</asp:Content>
<asp:Content ID="contentPageTitle" ContentPlaceHolderID="cphPageTitle" runat="Server">
    Unit Details
</asp:Content>
<asp:Content ID="contentBody" ContentPlaceHolderID="cphBodyArea" runat="Server">
    <br />
    <table width="900px" style="height: 500px; padding-left: 10px;">
        <tr>
            <td valign="top">
                <br />
                <table width="900px" border="0">
                    <tr>
                        <td valign="top" style="width: 880px;">
                            <table style="background-color: #ffffff; border: solid 1px #cccccc; padding: 0px;">
                                <tr>
                                    <td colspan="3" class="theader" valign="top">
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        <table style="background-color: #ffffff; border: solid 0px #cccccc; padding: 10px;"
                                            width="380px">
                                            <tr>
                                                <td style="width: 70px; height: 25px; font-size: 13px; font-weight: bold;" align="right">
                                                    Unit:
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblUnit" runat="server" Font-Size="13px" Font-Bold="true"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 70px; height: 25px;" align="right">
                                                    Property:
                                                </td>
                                                <td>
                                                    <asp:HyperLink ID="frmProperty" runat="server"></asp:HyperLink>
                                                    <br /><asp:Label runat="server" ID="txtUnitAddress" />
                                                    <br /><asp:Label runat="server" ID="txtUnitCity" />, <asp:Label runat="server" ID="txtUnitState" /> <asp:Label runat="server" ID="txtUnitZip" />
                                                    
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 70px; height: 25px;" align="right">
                                                    Bedrooms:
                                                </td>
                                                <td align="left">
                                                    <asp:TextBox runat="server" ID="txtBedrooms" CssClass="textBox1" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="height: 25px; width: 70px;" align="right">
                                                    Bathrooms:
                                                </td>
                                                <td align="left">
                                                    <asp:TextBox runat="server" ID="txtBaths" CssClass="textBox1" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 70px; height: 25px;" align="right">
                                                    Rent:
                                                </td>
                                                <td align="left" style="width: 200px;">
                                                    <asp:TextBox runat="server" ID="txtRent" CssClass="textBox1" />
                                                </td>
                                            </tr>
                                            
                                        </table>
                                    </td>
                                    <td valign="top">
                                        <br />
                                        <br />
                                        <table style="background-color: #ffffff; border: solid 0px #cccccc; padding: 0px;"
                                            width="250px">
                                            <tr>
                                                <td colspan="2">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="font-size: 13px; font-weight: normal; height: 25px; width: 260px;">
                                                    Current Occupant:
                                                    <asp:Label runat="server" ID="lblCurrentTenant" Font-Bold="true" Text="Fred Renter"
                                                        Font-Size="13px"></asp:Label>
                                                </td>
                                                <td align="right">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <table>
                                                        
                                                        <tr>
                                                            <td colspan="2" align="right">
                                                                <br />
                                                                <asp:Button ID="frmFindTenant" runat="server" CssClass="NewButtonExtraLong" Text="Find Future Occupant" OnClick="frmFindTenant_Click" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <table width="300">
                                            <tr>
                                                <td colspan="2" align="left" style="font-size: 14px; font-weight: bold;">
                                                    Amenities
                                                </td>
                                            </tr>
                                            <tr>
                                                <td runat="server" id="frmAmenities0" width="150" valign="top">
                                                </td>
                                                <td runat="server" id="frmAmenities1" width="150" valign="top">
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                 </tr>
                                 <tr>
                                 <td colspan="3" align="right" style="padding-right:30px;">
                                 <br/>
                                  <asp:Button runat="server" ID="frmSave" class="NewButtonP" Text="Save" OnClick="frmSave_Click" />
                                 </td>
                                 </tr>
                            </table>
                        </td>
                    </tr>
                    
                </table>
                <table width="100%"> 
                    <tr>
                        <td align="right">
                           
                        </td>
                    </tr>
                </table>
                <br />
                <table width="850px">
                    <tr>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                            <table width="900">
                                <tr>
                                    <td align="left" style="font-size: 14px; font-weight: bold;">
                                        Occupancy
                                    </td>
                                    <td align="right">
                                    </td>
                                    <td style="width: 80px;" align="right" valign="bottom">
                                        <asp:ImageButton ID="btnExcel" runat="server" 
                                            ImageUrl="~/Images/excel-download.gif" onclick="btnExcel_Click" />
                                    </td>
                                </tr>
                            </table>
                            <rad:RadGrid OnItemDataBound="Occupany_OnItemDataBound" ID="RadGrid2" runat="server"
                                Skin="WebBlue" EnableEmbeddedSkins="true" GridLines="None" Width="900px" AutoGenerateColumns="False">
                                <MasterTableView>
                                    <RowIndicatorColumn>
                                        <HeaderStyle Width="20px"></HeaderStyle>
                                    </RowIndicatorColumn>
                                    <ExpandCollapseColumn>
                                        <HeaderStyle Width="20px"></HeaderStyle>
                                    </ExpandCollapseColumn>
                                    <Columns>
                                        <rad:GridHyperLinkColumn HeaderText="Tenant" UniqueName="column" DataTextField="TenantReference.Name"
                                            DataNavigateUrlFields="TenantReference.ID" DataNavigateUrlFormatString="~/TenantDetails.aspx?TenantID={0}">
                                        </rad:GridHyperLinkColumn>
                                        <rad:GridBoundColumn HeaderText="From" UniqueName="column" DataField="ContractStart"
                                            DataFormatString="{0:d}">
                                        </rad:GridBoundColumn>
                                        <rad:GridBoundColumn HeaderText="To" UniqueName="column1" DataField="ContractEnd"
                                            DataFormatString="{0:d}">
                                        </rad:GridBoundColumn>
                                        <rad:GridBoundColumn HeaderText="Rent" UniqueName="column1" DataField="Rent" DataFormatString="{0:C}">
                                        </rad:GridBoundColumn>
                                        <rad:GridBoundColumn HeaderText="Status" UniqueName="column1" DataField="Status">
                                        </rad:GridBoundColumn>
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
