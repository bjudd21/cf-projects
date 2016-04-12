<%@ Page Title="" Language="C#" MasterPageFile="~/Template.master" AutoEventWireup="true" EnableViewState="true"
    CodeFile="LeaseCreate.aspx.cs" Inherits="LeaseCreate" EnableEventValidation="false" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="rad" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphHeader" runat="Server">
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
            font-size: 13px;
            color:#062944;
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
<asp:Content ID="Content2" ContentPlaceHolderID="cphPageTitle" runat="Server">
    Lease Finder
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphBodyArea" runat="Server">
    <br /><br />
    <table width="100%">
        <tr>
            <td valign="top" width="30%">
                <table width="100%" style="border:solid 1px #cccccc;height:200px; ">
                    <tr>
                        <td colspan="2" class="theader" style="height:17px;" >Lease</td>
                    </tr>
                    <tr>
                        <td style="padding-left:5px;">
                        <br />
                        Lease Start Date</td>
                        <td>
                        <br />
                            <rad:RadDatePicker runat="server" ID="frmContractStart" 
                                               Width="100" 
                                               DateInput-CssClass="textBox1"
                                               Skin="WebBlue">
                                               </rad:RadDatePicker>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left:5px;">Lease End Date</td>
                        <td>
                            <rad:RadDatePicker runat="server" ID="frmContractEnd" 
                                               Width="100" 
                                               DateInput-CssClass="textBox1"
                                               Skin="WebBlue">
                                               </rad:RadDatePicker>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left:5px;">Monthly Rent</td>
                        <td>
                            <asp:TextBox ID="frmContractRent" runat="server" Width="68"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align=right><br /><br /><br /><asp:Button runat="server" CssClass = "NewButtonLong" ID="frmCreateLease" Text="Create Lease" OnClick="frmCreateLease_OnClick" /></td>
                    </tr>
                </table>
            </td>
            <td valign="top" width="35%">
                <asp:Panel runat=server ID="frmUnitSelectedPanel">
                <table width="100%" style="border:solid 1px #cccccc; ">
                    <tr>
                        <td colspan="2" class="theader"  style="height:17px;">
                            Selected Unit
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left:5px;">
                            Unit Number
                        </td>
                        <td>
                            <asp:Label runat="server" ID="frmUnitNumber"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left:5px;">
                            Property
                        </td>
                        <td>
                            <asp:Label runat="server" ID="frmUnitProperty"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left:5px;">
                            Rent
                        </td>
                        <td>
                            <asp:Label runat="server" ID="frmUnitRent"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left:5px;">
                            Ideal Income
                        </td>
                        <td>
                            <asp:Label runat="server" ID="frmUnitIdealIncome"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left:5px;">
                            Bedrooms
                        </td>
                        <td>
                            <asp:Label runat="server" ID="frmUnitBedrooms"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left:5px;">
                            Bathrooms
                        </td>
                        <td>
                            <asp:Label runat="server" ID="frmUnitBathrooms"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td><asp:HyperLink runat="server" ForeColor="Blue" Font-Size="13px" ID="frmShowUnitsSuggested" Text="Suggested Units"></asp:HyperLink><br /><br /></td>
                        <td><asp:HyperLink runat="server" ForeColor="Blue" Font-Size="13px"  ID="frmShowUnitsList" Text="Unit List"></asp:HyperLink><br /><br /></td>
                    </tr>
                </table>
                </asp:Panel>
                <asp:Panel runat=server ID="frmUnitSuggestedPanel">
                <table width="100%" style="border:solid 1px #cccccc;">
                    <tr>
                        <td class="theader" style="height:17px;">
                            Suggested Units
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <rad:RadGrid ID="frmSuggestedUnits" runat="server" Skin="WebBlue" OnItemCommand="frmSuggestedUnits_ItemCommand" EnableEmbeddedSkins="true"
                                GridLines="None" Width="100%" AutoGenerateColumns="False" AllowSorting="true"  OnNeedDataSource="frmSuggestedUnits_OnNeedDataSource">
                                <MasterTableView DataKeyNames="ID">
                                    
                                    <RowIndicatorColumn>
                                        <HeaderStyle Width="20px"></HeaderStyle>
                                    </RowIndicatorColumn>
                                    <ExpandCollapseColumn>
                                        <HeaderStyle Width="20px"></HeaderStyle>
                                    </ExpandCollapseColumn>
                                    <Columns>
                                        <rad:GridButtonColumn  ButtonType="ImageButton" CommandName="Select" CommandArgument="asfd"  ImageUrl="/images/navigate_checkSmall.gif" ></rad:GridButtonColumn>
                                        <rad:GridHyperLinkColumn   HeaderText="Property" UniqueName="column"   DataTextField="PropertyReference.Name" DataNavigateUrlFields="ID" DataNavigateUrlFormatString= "~/PropertyDetails.aspx?PropertyID={0}">    
                                        </rad:GridHyperLinkColumn> 
                                        <rad:GridHyperLinkColumn   HeaderText="Unit" UniqueName="column"   DataTextField="UnitNumber" DataNavigateUrlFields="ID" DataNavigateUrlFormatString= "~/UnitDetails.aspx?UnitID={0}">    
                                        </rad:GridHyperLinkColumn> 
                                        <rad:GridBoundColumn HeaderText="Rent" UniqueName="UnitRent" DataField="Rent" DataFormatString="{0:C}" ItemStyle-HorizontalAlign="Right" AllowSorting="true">
                                        </rad:GridBoundColumn>
                                        <rad:GridBoundColumn HeaderText="Beds" UniqueName="UnitBedrooms" DataField="Bedrooms"></rad:GridBoundColumn>
                                        <rad:GridBoundColumn HeaderText="Match" UniqueName="UnitTenantMatch" DataField="TenantMatch" DataFormatString="{0:P0}" AllowSorting="true" ItemStyle-HorizontalAlign="Right">
                                        </rad:GridBoundColumn>
                                    </Columns>
                                </MasterTableView>
                            </rad:RadGrid>
                        </td>
                    </tr>
                    <tr>
                        <td><asp:HyperLink runat="server" ForeColor="Blue" Font-Size="13px" ID="frmShowUnitsList2" Text="Unit Lookup"></asp:HyperLink><br /><br /></td>
                    </tr>
                </table>
                </asp:Panel>
                <asp:Panel runat="server" ID="frmUnitLookupPanel">
                <table width="100%" style="border:solid 1px #cccccc;"  >
                    <tr>
                        <td colspan="2" class="theader" style="height:17px;">
                            Unit Lookup
                        </td>
                    </tr>
                    <tr>
                        <td>
                    <asp:UpdatePanel runat="server" ID="PropertyList">
                    <ContentTemplate>
                       <table width="100%" border="0"><tr>
                        <td><asp:DropDownList ID="frmPropertyList" runat="server" AutoPostBack="true" OnSelectedIndexChanged="frmPropertyList_OnSelectedIndexChanged"></asp:DropDownList></td>
                        <td><asp:DropDownList ID="frmPropertyUnitList" runat="server" Visible="false"></asp:DropDownList></td>
                        </tr></table>
                        </ContentTemplate>
                        </asp:UpdatePanel>
                        
                        </td>
                        <td><asp:Button ID="frmUnitLookupSelect" CssClass="NewButton" runat="server" Text="Select" OnClick="frmUnitLookupSelect_Click" /></td>
                        
                        </td>
                    </tr>
                    
                    <tr>
                        <td colspan="2"><asp:HyperLink runat="server" ForeColor="Blue" Font-Size="13px"  ID="frmShowUnitsSuggested2" Text="Suggested Units"></asp:HyperLink>
                        <br /><br />
                        </td>
                    </tr>
                        
                </table>
                </asp:Panel>
                <br />
            </td>
            <td valign="top" width="35%">
                <asp:Panel runat=server ID="frmTenantSelectedPanel">
                <table width="100%" style="border:solid 1px #cccccc;">
                    <tr>
                        <td colspan="2" class="theader"  style="height:17px;">
                            Selected Tenant
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left:5px;">
                            Name
                        </td>
                        <td>
                            <asp:Label runat="server" ID="frmTenantName"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left:5px;">
                            Family Size
                        </td>
                        <td>
                            <asp:Label runat="server" ID="frmTenantFamilySize"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left:5px;">
                            Income
                        </td>
                        <td>
                            <asp:Label runat="server" ID="frmTenantIncome"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left:5px;">
                            Ideal Rent
                        </td>
                        <td>
                            <asp:Label runat="server" ID="frmTenantIdealRent"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left:5px;">
                            Occupation
                        </td>
                        <td>
                            <asp:Label runat="server" ID="frmTenantOccupation"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left:5px;">
                            Company
                        </td>
                        <td>
                            <asp:Label runat="server" ID="frmTenantCompany"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td><asp:HyperLink runat="server" ForeColor="Blue" Font-Size="13px" ID="frmShowSuggestedTenants" Text="Suggested Tenants"></asp:HyperLink><br /><br /></td>
                        <td><asp:HyperLink runat="server" ForeColor="Blue" Font-Size="13px" ID="frmShowTenantLookup" Text="Tenant Lookup"></asp:HyperLink><br /><br /></td>
                    </tr>
                </table>
                </asp:Panel>
                <asp:Panel runat=server ID="frmTenantSuggestedPanel">
                <table width="100%" border="solid 1px #cccccc;">
                    <tr>
                        <td class="theader"  style="height:17px;">
                            Suggested Tenants
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <rad:RadGrid ID="frmSuggestedTenants" runat="server" Skin="WebBlue" OnItemCommand="frmSuggestedTenants_ItemCommand" EnableEmbeddedSkins="true"
                                GridLines="None" Width="100%" AutoGenerateColumns="False" OnNeedDataSource="frmSuggestedTenants_OnNeedDataSource" AllowSorting="true">
                                <MasterTableView DataKeyNames="ID">
                                    
                                    <RowIndicatorColumn>
                                        <HeaderStyle Width="20px"></HeaderStyle>
                                    </RowIndicatorColumn>
                                    <ExpandCollapseColumn>
                                        <HeaderStyle Width="20px"></HeaderStyle>
                                    </ExpandCollapseColumn>
                                    <Columns>
                                        <rad:GridButtonColumn  ButtonType="ImageButton" CommandName="Select" CommandArgument="asfd"  ImageUrl="/images/navigate_checkSmall.gif" ></rad:GridButtonColumn>
                                        <rad:GridHyperLinkColumn   HeaderText="Tenant" UniqueName="column"   DataTextField="Name" DataNavigateUrlFields="ID" DataNavigateUrlFormatString= "~/TenantDetails.aspx?TenantID={0}" Reorderable="true">    
                                        </rad:GridHyperLinkColumn> 
                                        <rad:GridBoundColumn HeaderText="Family" UniqueName="TenantFamily" DataField="FamilySize" AllowSorting="true">
                                        </rad:GridBoundColumn>
                                        <rad:GridBoundColumn HeaderText="Income" UniqueName="TenantIncome" DataField="Income" DataFormatString="{0:C}" AllowSorting="true" ItemStyle-HorizontalAlign="Right">
                                        </rad:GridBoundColumn>
                                        <rad:GridBoundColumn HeaderText="Match" UniqueName="TenantUnitMatch" DataField="UnitMatch" DataFormatString="{0:P0}" AllowSorting="true" ItemStyle-HorizontalAlign="Right">
                                        </rad:GridBoundColumn>
                                    </Columns>
                                </MasterTableView>
                            </rad:RadGrid>
                        </td>
                    </tr>
                    <tr>
                        <td><asp:HyperLink runat="server" ForeColor="Blue" Font-Size="13px" ID="frmShowTenantLookup2" Text="Tenant Lookup"></asp:HyperLink><br /><br /></td>
                    </tr>
                </table>
                </asp:Panel>
                <asp:Panel runat="server" ID="frmTenantLookupPanel">
                <table width="100%" style="border:solid 1px #cccccc;">
                    <tr>
                        <td colspan="3" class="theader"  style="height:17px;">
                            Tenant Lookup
                        </td>
                    </tr>
                    <tr>
                        <td>Name</td>
                        <td><asp:TextBox ID="frmTenantLookupText" runat="server"></asp:TextBox></td>
                        <td><asp:Button ID="frmTenantLookupSearch" runat="server" Text="Search" CssClass="NewButton" OnClick="frmTenantLookupSearch_Search" /></td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <rad:RadGrid ID="frmLookupTenants" runat="server" Skin="WebBlue" OnItemCommand="frmSuggestedTenants_ItemCommand" EnableEmbeddedSkins="true"
                                GridLines="None" Width="100%" AutoGenerateColumns="False">
                                <MasterTableView DataKeyNames="ID">
                                    
                                    <RowIndicatorColumn>
                                        <HeaderStyle Width="20px"></HeaderStyle>
                                    </RowIndicatorColumn>
                                    <ExpandCollapseColumn>
                                        <HeaderStyle Width="20px"></HeaderStyle>
                                    </ExpandCollapseColumn>
                                    <Columns>
                                        <rad:GridButtonColumn  ButtonType="ImageButton" CommandName="Select" CommandArgument="asfd"  ImageUrl="/images/navigate_checkSmall.gif" ></rad:GridButtonColumn>
                                        <rad:GridHyperLinkColumn   HeaderText="Tenant" UniqueName="column"   DataTextField="Name" DataNavigateUrlFields="ID" DataNavigateUrlFormatString= "~/TenantDetails.aspx?TenantID={0}" Reorderable="true">    
                                        </rad:GridHyperLinkColumn> 
                                        <rad:GridBoundColumn HeaderText="Family" UniqueName="TenantFamily" DataField="FamilySize" AllowSorting="true">
                                        </rad:GridBoundColumn>
                                        <rad:GridBoundColumn HeaderText="Income" UniqueName="TenantIncome" DataField="Income" DataFormatString="{0:C}" AllowSorting="true" ItemStyle-HorizontalAlign="Right">
                                        </rad:GridBoundColumn>
                                        <rad:GridBoundColumn HeaderText="Match" UniqueName="TenantUnitMatch" DataField="UnitMatch" DataFormatString="{0:P0}" AllowSorting="true" ItemStyle-HorizontalAlign="Right">
                                        </rad:GridBoundColumn>
                                    </Columns>
                                </MasterTableView>
                            </rad:RadGrid>
                            
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3"><asp:HyperLink runat="server" ForeColor="Blue" Font-Size="13px" ID="frmShowSuggestedTenants2" Text="Suggested Tenants"></asp:HyperLink><br /><br /></td>
                    </tr>
                        
                </table>
                </asp:Panel>
            </td>
        </tr>
    </table>
    <br />
</asp:Content>
