<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Template.master"
    CodeFile="PropertyDetails.aspx.cs" Inherits="PropertyDetails" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="rad" %>
<asp:Content ID="contentHeader" ContentPlaceHolderID="cphHeader" runat="Server">
    <style type="text/css">
        .textBox1
        {
            background-image: url(Images/TextboxBackground1.jpg);
            background-repeat: repeat-x;
            width: 100px;
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

    <script type="text/javascript">
        function showAddNew() {
            var adddiv = document.getElementById("ctl00_cphBodyArea_pnlAddNew");
            // adddiv.style.Display = "block";
            // adddiv.style.Visible = "true";

            // $get('panelID').style.display = 'none' // for hide

            // $get('ctl00_cphBodyArea_pnlAddNew').style.display = 'block' // for show
            document.getElementById("ctl00_cphBodyArea_pnlAddNew").setAttribute("Visible", "true");
        }

        function MapIt(address) {
            window.open("Maps.aspx?address=" + address, "MapIt", 'toolbar = no ,resizable = yes, width=750px, scrollbars = yes, height = 500px');
        }
    </script>

</asp:Content>
<asp:Content ID="contentPageTitle" ContentPlaceHolderID="cphPageTitle" runat="Server">
    Property Details
</asp:Content>
<asp:Content ID="contentBody" ContentPlaceHolderID="cphBodyArea" runat="Server">
    <br />
    <table style="height: 500px; width: 900px; padding-left: 10px; border: solid 0px #cccccc;">
        <tr>
            <td valign="top">
                <br />
                <table width="900px">
                    <tr>
                        <td valign="top" style="width: 600px;">
                            <table style="border: solid 1px #cccccc;" width="600px">
                                <tr>
                                    <td class="theader" colspan="2">
                                    </td>
                                </tr>
                                <tr>
                                    <td><br />
                                        <table width="250px">

                                            <tr>
                                                <td align="right" style="width:160px;">
                                                Name:
                                                </td>
                                                <td valign="top">
                                                    <asp:TextBox runat="server" ID="frmPropertyName"></asp:TextBox>
                                                </td>
                                                
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                Address:
                                                </td>
                                                <td valign="top">
                                                    <asp:TextBox runat="server" ID="frmPropertyAddress"></asp:TextBox>
                                                </td>
                                                
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    City:
                                                </td>
                                                <td>
                                                    <asp:TextBox runat="server" ID="frmPropertyCity"></asp:TextBox>
                                                </td>
                                                
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                State:
                                                </td>
                                                <td>
                                                    <asp:TextBox runat="server" ID="frmPropertyState"></asp:TextBox>
                                                </td>
                                                
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                Postal Code:
                                                </td>
                                                <td>
                                                    <asp:TextBox runat="server" ID="frmPropertyZip"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center" >
                                                    <br />
                                                   
                                                </td>
                                                <td align="right" style="padding-top:15px;">
                                               <asp:Button runat="server" ID="btnMapProperty" Text="Map" CssClass="NewButtonP" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    
                                    <td valign="top" style="padding-left:19px;width:300px;">
                                        <table width="300px" style="width: 300px;">
                                            <tr>
                                                <td colspan="1" style="padding-left:40px;"><br />
                                                    <b>Owner</b>
                                                    
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 300px;padding-right:100px;" align="right">
                                                    <asp:UpdatePanel ID="frmOwnerPanel" runat="server">
                                                        <ContentTemplate>
                                                        
                                                        <table width="100%" padding="4px">
                                                            <tr>
                                                                <td colspan="2" align="center">
                                                                    <asp:DropDownList runat="server" ID="frmOwnerList" AutoPostBack="true" OnSelectedIndexChanged="frmOwnerList_OnSelectedIndexChanged"></asp:DropDownList>
                                                                </td>
                                                            </tr>
                                                              
                                                            <tr>
                                                                <td width="50%" align="right"><br />Address:</td>
                                                                <td width="50%" align="left"><br />
                                                                    <asp:Label runat="server" ID="frmOwnerAddress"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="50%" align="right">City:</td>
                                                                <td width="50%"  align="left">
                                                                    <asp:Label runat="server" ID="frmOwnerCity"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="50%" align="right">State:</td>
                                                                <td width="50%"  align="left">
                                                                    <asp:Label runat="server" ID="frmOwnerState"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="50%" align="right">Postal Code:</td>
                                                                <td width="50%"  align="left">
                                                                    <asp:Label runat="server" ID="frmOwnerZip"></asp:Label>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </ContentTemplate>
                                                    
                                                    </asp:UpdatePanel>
                                                </td>
                                            </tr>
                                        </table><br /> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                          &nbsp;<asp:Button ID="frmPropertySave" runat="server" Text="Save" CssClass="NewButtonP" OnClick="frmPropertySave_OnClick" />
                                    </td>
                                </tr>
                            </table>
                        </td>

                    </tr>
                </table>
                <br />
                
                <br />
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
                            <asp:ImageButton ID="btnExcel" runat="server" ImageUrl="~/Images/excel-download.gif"
                                OnClick="btnExcel_Click" />
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
                                <asp:TextBox runat="server" ID="txtUnitAddress" CssClass="textBox1"></asp:TextBox>
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
                                <asp:HiddenField ID="hdnPropID" runat="server" />
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
                    GridLines="None" Width="900px" AutoGenerateColumns="False" OnItemCreated="RadGrid1_OnItemCreated" OnNeedDataSource="RadGrid1_OnNeedDataSource"  
                    AllowSorting="true">
                    <MasterTableView>
                        <RowIndicatorColumn>
                            <HeaderStyle Width="20px"></HeaderStyle>
                        </RowIndicatorColumn>
                        <ExpandCollapseColumn>
                            <HeaderStyle Width="20px"></HeaderStyle>
                        </ExpandCollapseColumn>
                        <Columns>
                            
                            <rad:GridHyperLinkColumn SortExpression="UnitNumber" HeaderText="Unit" UniqueName="column" DataTextField="UnitNumber"
                                DataNavigateUrlFields="ID" DataNavigateUrlFormatString="~/UnitDetails.aspx?UnitID={0}">
                            </rad:GridHyperLinkColumn>
                            <rad:GridBoundColumn HeaderText="Status" UniqueName="UnitStatus" DataField="Status">
                            </rad:GridBoundColumn>
                            <rad:GridTemplateColumn SortExpression="CurrentContract.TenantReference.Name" UniqueName="Tenant" HeaderText="Tenant">
                                <ItemTemplate>
                                    <asp:HyperLink ID="frmUnitTenant" runat="server" NavigateUrl="~/LeaseCreate.aspx" Text="Find Tenant"></asp:HyperLink>
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
</asp:Content>
