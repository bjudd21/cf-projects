<%@ Page Title="Property Management - Units" Language="C#" MasterPageFile="~/Template.master"
    AutoEventWireup="true" CodeFile="Units.aspx.cs" Inherits="_Default" %>

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
        .textBox1
        {
            background-image: url(Images/TextboxBackground1.jpg);
            background-repeat: repeat-x;
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
    Units
</asp:Content>
<asp:Content ID="contentBody" ContentPlaceHolderID="cphBodyArea" runat="Server">

    <br />
    <table width="900px" style="height: 500px;">
        <tr>
            <td valign="top" style="padding-left: 20px;">
                <table>
                    <tr>
                        <td valign="top">
                            <table cellpadding="10" style="background-color: #ffffff; border: solid 1px #cccccc; padding: 0px;"
                                width="490px">
                                <tr>
                                    <td class="theader" colspan="3" style="padding:0;height:20px;">
                                    Search Criteria
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        <asp:UpdatePanel ID="frmPropertyPanel" runat="server">
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="drpProperties" EventName="SelectedIndexChanged" />
                                            </Triggers>
                                            <ContentTemplate>
                                                <table>
                                                    <tr>
                                                        <td>
                                                            Property
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:DropDownList ID="drpProperties" runat="server" AutoPostBack="true">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Label runat="server" ID="frmPropertyAddress"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </td>
                                    <td valign="top">
                                        <table width="400px">
                                            <tr>
                                                <td>
                                                </td>
                                                <td>
                                                    from
                                                </td>
                                                <td>
                                                    to
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    Vacant:
                                                </td>
                                                <td>
                                                    <rad:RadDatePicker runat="server" ID="frmVacantFrom" Width="100" DateInput-CssClass="textBox1"
                                                        Skin="WebBlue">
                                                    </rad:RadDatePicker>
                                                </td>
                                                <td>
                                                    <rad:RadDatePicker runat="server" ID="frmVacantTo" Width="100" DateInput-CssClass="textBox1"
                                                        Skin="WebBlue">
                                                    </rad:RadDatePicker>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                </td>
                                                <td>
                                                    from
                                                </td>
                                                <td>
                                                    to
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    Occupied:
                                                </td>
                                                <td>
                                                    <rad:RadDatePicker runat="server" ID="frmOccupiedFrom" Width="100" DateInput-CssClass="textBox1"
                                                        Skin="WebBlue">
                                                    </rad:RadDatePicker>
                                                </td>
                                                <td>
                                                    <rad:RadDatePicker runat="server" ID="frmOccupiedTo" Width="100" DateInput-CssClass="textBox1"
                                                        Skin="WebBlue">
                                                    </rad:RadDatePicker>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><img src="images/spacer.gif" width="5px" /></td>
                                                <td>min</td>
                                                <td>max</td>
                                            </tr>
                                            <tr>
                                                <td align="right" style="padding-top: 8px;">
                                                    Monthly Rent:
                                                </td>
                                                <td>
                                                    <asp:TextBox Width="50" ID="frmRentMin" runat="server"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox Width="50" ID="frmRentMax" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><img src="images/spacer.gif" width="5px" /></td>
                                                <td>min</td>
                                                <td>max</td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    Bedrooms:
                                                </td>
                                                <td>
                                                    <asp:TextBox Width="50" ID="frmBedroomsMin" runat="server"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox Width="50" ID="frmBedroomsMax" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><img src="images/spacer.gif" width="5px"  /></td>
                                                <td>min</td>
                                                <td>max</td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    Bathrooms:
                                                </td>
                                                <td>
                                                    <asp:TextBox Width="50" ID="frmBathsMin" runat="server"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox Width="50" ID="frmBathsMax" runat="server"></asp:TextBox>
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
                                        </table><br />
                                         <table width="100%">
                    <tr>
                        <td align="right"><asp:Button ID="frmSearch" runat="server" Text="Search" CssClass ="NewButtonP"              
                        
                         OnClick="frmSearch_Click" /></td>
                    </tr>
                </table>
                                    </td>
                                </tr>

                            </table>
                            
                        </td>
                    </tr>
                </table>
               
                <table>
                    <tr>
                        <td>
                            <br />
                            <table width="900">
                                <tr>
                                    <td align="left" style="font-size: 14px; font-weight: bold;">
                                        Units
                                    </td>
                                    <td align="right">
                                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="Images/add.png" OnClick="ImageButton1_Click" /><asp:LinkButton
                                            ID="LinkButton1" runat="server" Text="Add A New Unit" Font-Bold="true"></asp:LinkButton>
                                    </td>
                                    <td style="width: 80px;" align="right" valign="bottom">
                                        <asp:ImageButton ID="btnExcel" runat="server" 
                                            ImageUrl="~/Images/excel-download.gif" onclick="btnExcel_Click" />
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel runat="server" ID="pnlAddNew" Visible="false">
                                <table style="border: solid 1px #CCCCCC; background-color: #dae2e8;" width="900px"
                                    visible="false">
                                    <tr>
                                        <td>
                                            Unit
                                        </td>
                                        <td>
                                            Address
                                        </td>
                                        <td>
                                            Status
                                        </td>
                                        <td>
                                            Lease Start
                                        </td>
                                        <td>
                                            Lease End
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox runat="server" ID="txtUnit" CssClass="textBox1"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox runat="server" ID="TextBox1" CssClass="textBox1"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox runat="server" ID="txtStatus" CssClass="textBox1"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox runat="server" ID="txtLeaseStart" Width="50px" CssClass="textBox1"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox runat="server" ID="txtLeaseEnd" Width="80px" CssClass="textBox1"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Reserved Date
                                        </td>
                                        <td>
                                            Wait List
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox runat="server" ID="txtReservedDate" CssClass="textBox1"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox runat="server" ID="txtWaitList" CssClass="textBox1"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:HiddenField ID="HiddenField1" runat="server" />
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                            <asp:Button runat="server" Text="Add" ID="btnAddprop" CssClass="NewButtonP" OnClick="btnAddprop_Click" /><asp:Button
                                                ID="btnCancel" runat="server" Text="Cancel" CssClass="NewButtonP" OnClick="btnCancel_Click" />
                                        </td>
                                    </tr>
                                </table>
                                <br />
                            </asp:Panel>
                            <rad:RadGrid ID="RadGrid1" runat="server" Skin="WebBlue" EnableEmbeddedSkins="true"
                                GridLines="None" Width="900px" AutoGenerateColumns="False" AllowPaging="true"
                                OnItemCreated="RadGrid1_OnItemCreated">
                                <MasterTableView>
                                    <RowIndicatorColumn>
                                        <HeaderStyle Width="20px"></HeaderStyle>
                                    </RowIndicatorColumn>
                                    <ExpandCollapseColumn>
                                        <HeaderStyle Width="20px"></HeaderStyle>
                                    </ExpandCollapseColumn>
                                    <Columns>
                                        <rad:GridHyperLinkColumn HeaderText="Property" UniqueName="column" DataTextField="PropertyReference.Name"
                                            DataNavigateUrlFields="PropertyReference.ID" DataNavigateUrlFormatString="~/PropertyDetails.aspx?PropertyID={0}">
                                        </rad:GridHyperLinkColumn>
                                        <rad:GridHyperLinkColumn SortExpression="UnitNumber" HeaderText="Unit" UniqueName="column"
                                            DataTextField="UnitNumber" DataNavigateUrlFields="ID" DataNavigateUrlFormatString="~/UnitDetails.aspx?UnitID={0}">
                                        </rad:GridHyperLinkColumn>
                                        <rad:GridBoundColumn HeaderText="Status" UniqueName="UnitStatus" DataField="Status">
                                        </rad:GridBoundColumn>
                                        <rad:GridTemplateColumn SortExpression="CurrentContract.TenantReference.Name" UniqueName="Tenant"
                                            HeaderText="Tenant">
                                            <ItemTemplate>
                                                <asp:HyperLink ID="frmUnitTenant" runat="server" NavigateUrl="~/LeaseCreate.aspx"
                                                    Text="Find Tenant"></asp:HyperLink>
                                            </ItemTemplate>
                                        </rad:GridTemplateColumn>
                                        <rad:GridBoundColumn HeaderText="Lease Start" UniqueName="column3" DataField="CurrentContractStart"
                                            DataFormatString="{0:MM/dd/yyyy}">
                                        </rad:GridBoundColumn>
                                        <rad:GridBoundColumn HeaderText="Lease End" UniqueName="column4" DataField="CurrentContractEnd"
                                            DataFormatString="{0:MM/dd/yyyy}">
                                        </rad:GridBoundColumn>
                                        <rad:GridBoundColumn HeaderText="Reserved Date" UniqueName="column5" DataField="NextReservedDate"
                                            DataFormatString="{0:MM/dd/yyyy}">
                                        </rad:GridBoundColumn>
                                        <rad:GridBoundColumn HeaderText="Beds" UniqueName="column2" DataField="Bedrooms">
                                        </rad:GridBoundColumn>
                                        <rad:GridBoundColumn HeaderText="Baths" UniqueName="column2" DataField="Bathrooms">
                                        </rad:GridBoundColumn>
                                        <rad:GridBoundColumn HeaderText="Rent" UniqueName="column2" DataField="Rent" DataFormatString="{0:C}"
                                            ItemStyle-HorizontalAlign="Right">
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
</asp:Content>
