using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class _Default : System.Web.UI.Page
{
    private DataTable UnitTable = null;
    private DataTable PropertyTable = null;
    private DataRow UnitRow = null;
    private DataRow PropertyRow = null;

    private void AddUnitDataRow(System.Data.DataTable dt, int UnitID, int propID, string UnitNumber, string UnitStatus, string LeaseStart, string LeaseEnd, string ReservedDate, string WL, int Bedrooms, string Rent, int UnitTenantID, string PreviousTenant, string UnitAddress, string UnitCity, string UnitState, string UnitZip)
    {
        System.Data.DataRow row;
        row = dt.NewRow();
        row["UnitID"] = UnitID;
        row["UnitPropertyID"] = propID;
        row["UnitLink"] = "UnitDetails.aspx?UnitID=" + UnitID;
        row["UnitNumber"] = UnitNumber;
        row["UnitStatus"] = UnitStatus;
        row["LeaseStart"] = LeaseStart;
        row["LeaseEnd"] = LeaseEnd;
        row["ReservedDate"] = ReservedDate;
        row["WL"] = WL;
        row["Bedrooms"] = Bedrooms;
        row["Rent"] = Rent;
        row["UnitTenantID"] = UnitTenantID;
        row["PreviousTenant"] = PreviousTenant;
        row["UnitAddress"] = UnitAddress;
        row["UnitCity"] = UnitCity;
        row["UnitState"] = UnitState;
        row["UnitZip"] = UnitZip;

        dt.Rows.Add(row);

    }




    private BusinessObjectContainer boc = null;

    protected void Page_Init(object sender, EventArgs e)
    {
        this.boc = (BusinessObjectContainer)this.Application["boc"];
        int curAmen = 0;
        foreach (BusinessObjectContainer.Amenity amenity in boc.Amenities)
        {
            CheckBox cbAmenity = new CheckBox();
            cbAmenity.ID = "Amenity_" + amenity.ID.ToString();
            cbAmenity.Text = amenity.Name;
            //cbAmenity.Checked = this.Unit.Amenities.Count(x => x.ID == amenity.ID) > 0;

            if (curAmen < boc.Amenities.Count / 2)
            {
                this.frmAmenities0.Controls.Add(cbAmenity);
                this.frmAmenities0.Controls.Add(new LiteralControl("<br />"));
            }
            else
            {
                this.frmAmenities1.Controls.Add(cbAmenity);
                this.frmAmenities1.Controls.Add(new LiteralControl("<br />"));
            }

            curAmen++;
        }

        List<ListItem> propertyList = new List<ListItem>();
        propertyList.Add(new ListItem("All Properties", string.Empty));
        foreach (BusinessObjectContainer.Property property in this.boc.Properties)
        {
            propertyList.Add(new ListItem(property.Name, property.ID.ToString()));
        }

        this.drpProperties.DataSource = propertyList;
        this.drpProperties.DataBind();
    }



    protected void Page_Load(object sender, EventArgs e)
    {

        
        //.DataSource = this.boc.Properties;
        //drpProperties.DataTextField = "Name";
        //drpProperties.DataValueField = "ID";
        //this.drpProperties.DataBind();
        //this.drpProperties.Items.Insert(0, new ListItem("All Properties"));
        
        this.RadGrid1.DataSource = this.boc.Units;
        this.RadGrid1.DataBind();

        //int pID = this.drpProperties.SelectedIndex;
        //this.PropertyRow = this.PropertyTable.Rows.Find(pID);
        //System.Data.DataView dv = this.PropertyTable.AsDataView();
        BusinessObjectContainer.Property selected = null;
        if (this.drpProperties.SelectedIndex > 0)
        {
            selected = this.boc.Properties[this.drpProperties.SelectedIndex - 1];
        }

        // dv.RowFilter = "UnitPropertyID = " + pID.ToString();
        if (selected != null)
        {
            this.frmPropertyAddress.Text = selected.Address + "<br />" + selected.City + ", " + selected.State + "  " + selected.Zip;
            //this.txtUnitAddress.Text = selected.Address;
            //this.txtUnitCity.Text = selected.City;
            //this.txtUnitZip.Text = selected.Zip;
            //this.drpProperties.SelectedIndex = pID;
        }
        else
            this.frmPropertyAddress.Text = string.Empty;
        

        
    }
    protected void frmSearch_Click(object sender, EventArgs e)
    {

        List<BusinessObjectContainer.Amenity> checkedAmenities = new List<BusinessObjectContainer.Amenity>();
        foreach (Control c in this.frmAmenities0.Controls)
        {
            if (c.GetType() == typeof(CheckBox))
            {
                //get amenity id
                if (((CheckBox)c).Checked)
                {
                    int id = System.Convert.ToInt32(c.ID.Split("_".ToCharArray())[1]);
                    checkedAmenities.Add(boc.Amenities.Where(x => x.ID == id).FirstOrDefault());
                }
            }
        }
        foreach (Control c in this.frmAmenities1.Controls)
        {
            if (c.GetType() == typeof(CheckBox))
            {
                //get amenity id
                if (((CheckBox)c).Checked)
                {
                    int id = System.Convert.ToInt32(c.ID.Split("_".ToCharArray())[1]);
                    checkedAmenities.Add(boc.Amenities.Where(x => x.ID == id).FirstOrDefault());
                }
            }
        }

        IQueryable<BusinessObjectContainer.Unit> qUnits = boc.Units.AsQueryable();

        if (this.frmVacantFrom.SelectedDate.HasValue)
        {
            if (this.frmVacantTo.SelectedDate.HasValue)
            {
                qUnits = qUnits.Where(x => x.Contracts.Count(y => (y.ContractStart <= this.frmVacantFrom.SelectedDate.Value && y.ContractEnd >= this.frmVacantTo.SelectedDate.Value) 
                                                               || (y.ContractStart >= this.frmVacantFrom.SelectedDate.Value && y.ContractEnd <= this.frmVacantTo.SelectedDate.Value)
                                                               || (y.ContractStart <= this.frmVacantFrom.SelectedDate.Value && y.ContractEnd >= this.frmVacantFrom.SelectedDate.Value)
                                                               || (y.ContractStart <= this.frmVacantTo.SelectedDate.Value && y.ContractEnd >= this.frmVacantTo.SelectedDate.Value)
                                                               )== 0);
            }
            else
            {
                qUnits = qUnits.Where(x => x.Contracts.Count(y => y.ContractStart >= this.frmVacantFrom.SelectedDate.Value && y.ContractEnd >= this.frmVacantFrom.SelectedDate.Value) == 0);
            }
        }
        if (this.frmVacantTo.SelectedDate.HasValue && this.frmVacantFrom.SelectedDate.HasValue == false)
        {
            qUnits = qUnits.Where(x => x.Contracts.Count(y => y.ContractStart <= this.frmVacantTo.SelectedDate.Value && y.ContractEnd <= this.frmVacantTo.SelectedDate.Value) == 0);
        }

        if (this.frmOccupiedFrom.SelectedDate.HasValue)
        {
            if (this.frmOccupiedTo.SelectedDate.HasValue)
            {
                qUnits = qUnits.Where(x => x.Contracts.Count(y => (y.ContractStart <= this.frmOccupiedFrom.SelectedDate.Value && y.ContractEnd >= this.frmOccupiedTo.SelectedDate.Value)
                                                               || (y.ContractStart >= this.frmOccupiedFrom.SelectedDate.Value && y.ContractEnd <= this.frmOccupiedTo.SelectedDate.Value)
                                                               || (y.ContractStart <= this.frmOccupiedFrom.SelectedDate.Value && y.ContractEnd >= this.frmOccupiedFrom.SelectedDate.Value)
                                                               || (y.ContractStart <= this.frmOccupiedTo.SelectedDate.Value && y.ContractEnd >= this.frmOccupiedTo.SelectedDate.Value)
                                                               ) > 0);
            }
            else
            {
                qUnits = qUnits.Where(x => x.Contracts.Count(y => y.ContractStart >= this.frmOccupiedFrom.SelectedDate.Value && y.ContractEnd >= this.frmOccupiedFrom.SelectedDate.Value) > 0);
            }
        }
        if (this.frmOccupiedTo.SelectedDate.HasValue && this.frmOccupiedFrom.SelectedDate.HasValue == false)
        {
            qUnits = qUnits.Where(x => x.Contracts.Count(y => y.ContractStart <= this.frmOccupiedTo.SelectedDate.Value && y.ContractEnd <= this.frmOccupiedTo.SelectedDate.Value) > 0);
        }
        if (this.frmRentMin.Text != string.Empty)
            qUnits = qUnits.Where(x => x.Rent >= System.Convert.ToDecimal(this.frmRentMin.Text));
        if (this.frmRentMax.Text != string.Empty)
            qUnits = qUnits.Where(x => x.Rent <= System.Convert.ToDecimal(this.frmRentMax.Text));
        if (this.frmBedroomsMin.Text != string.Empty)
            qUnits = qUnits.Where(x => x.Bedrooms >= System.Convert.ToInt32(this.frmBedroomsMin.Text));
        if (this.frmBedroomsMax.Text != string.Empty)
            qUnits = qUnits.Where(x => x.Bedrooms <= System.Convert.ToInt32(this.frmBedroomsMax.Text));
        if (this.frmBathsMin.Text != string.Empty)
            qUnits = qUnits.Where(x => x.Bathrooms >= System.Convert.ToInt32(this.frmBathsMin.Text));
        if (this.frmBathsMax.Text != string.Empty)
            qUnits = qUnits.Where(x => x.Bathrooms <= System.Convert.ToInt32(this.frmBathsMax.Text));

        if (this.drpProperties.SelectedValue != "All Properties")
        {
            qUnits = qUnits.Where(x => x.PropertyReference.ID == boc.Properties[this.drpProperties.SelectedIndex - 1].ID);
        }
        if (checkedAmenities.Count > 0)
        {

            qUnits = qUnits.Where(x => x.Amenities.Count(y => checkedAmenities.Contains(y)) == checkedAmenities.Count);
            
        }

        this.RadGrid1.DataSource = qUnits;
        this.RadGrid1.DataBind();
    }
    protected void drpProperties_SelectedIndexChanged(object sender, EventArgs e)
    {
        //this.hdnpropID.Value = this.drpProperties.SelectedValue;
//      int pID = Convert.ToInt32(this.drpProperties.SelectedValue);
//      this.PropertyRow = this.PropertyTable.Rows.Find(pID);
//      System.Data.DataView dv = this.PropertyTable.AsDataView();
     // dv.RowFilter = "UnitPropertyID = " + pID.ToString();
//      this.txtUnitAddress.Text = this.PropertyRow["propAddress"].ToString();
//      this.txtUnitCity.Text = this.PropertyRow["propCity"].ToString();
//      this.txtUnitZip.Text = this.PropertyRow["propZip"].ToString();

  //    this.hdnpropID.Value = pID.ToString ();
      //drpProperties.SelectedIndex = pID;
   //   int pp = drpProperties.SelectedIndex;


     // drpProperties.DataBind();
    //  drpProperties.SelectedIndex = pp;
      //this.RadGrid1.DataSource = dv;
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        this.pnlAddNew.Visible = true;



    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        this.pnlAddNew.Visible = false;
    }
    protected void btnAddprop_Click(object sender, EventArgs e)
    {
        this.UnitTable = ((DataSet)this.Application["data"]).Tables["Units"];

        int propID = 1;// Convert.ToInt32(hdnPropID.Value);
        String Unit = txtUnit.Text;
        //String UnitAddress = txtUnitAddress.Text;
        String UnitStatus = txtStatus.Text;
        String LeaseStart = txtLeaseStart.Text;
        String LeaseEnd = txtLeaseEnd.Text;
        String ReservedDate = txtReservedDate.Text;
        String WaitList = txtWaitList.Text;

        // this.AddUnitDataRow(PropertyTable, PropertyTable.Rows.Count + 1, propName, propAddress, propCity, propState, propZip, NumberUnits, NumberVacancy, 3, 1, OwnerName);
  //      this.AddUnitDataRow(UnitTable, UnitTable.Rows.Count + 1, propID, "A74", "vacant", "8/7/2010", "8/7/2011", "4/3/2009", "Yes", 3, "$800.00", 1, "Leon Johnson", "N 59th St.", "Tampa", "FL", "33617");


        this.pnlAddNew.Visible = false;



        //ds.Tables.Add(PropertyTable);


        //this.Application.Add("data", ds);

        System.Data.DataView dv = this.UnitTable.AsDataView();
        dv.RowFilter = "UnitPropertyID = " + propID.ToString();
        this.RadGrid1.DataSource = dv;
        this.RadGrid1.Rebind();




        //this.RadGrid1.DataSource = this.UnitTable;
        //this.RadGrid1.Rebind();
    }
    protected void btnExcel_Click(object sender, ImageClickEventArgs e)
    {
        int count = RadGrid1.Columns.Count;
        RadGrid1.Columns[count - 1].Visible = true;
        RadGrid1.Rebind();


        RadGrid1.ExportSettings.ExportOnlyData = true;
        RadGrid1.ExportSettings.FileName = "Units";
        RadGrid1.ExportSettings.IgnorePaging = true;
        RadGrid1.ExportSettings.OpenInNewWindow = true;
        RadGrid1.ExportSettings.Excel.Format = Telerik.Web.UI.GridExcelExportFormat.Html;

        RadGrid1.MasterTableView.ExportToExcel();
    }
    protected void RadGrid1_OnItemCreated(object sender, Telerik.Web.UI.GridItemEventArgs e)
    {
        if (e.Item.GetType() == typeof(Telerik.Web.UI.GridDataItem))
        {

            if (e.Item.DataItem != null)
            {
                if (((BusinessObjectContainer.Unit)e.Item.DataItem).Status == "Vacant")
                {
                    ((HyperLink)e.Item.FindControl("frmUnitTenant")).Text = "Find Tenant";
                    ((HyperLink)e.Item.FindControl("frmUnitTenant")).NavigateUrl = "LeaseCreate.aspx?TenantMode=1&UnitID=" + ((BusinessObjectContainer.Unit)e.Item.DataItem).ID.ToString();
                    ((HyperLink)e.Item.FindControl("frmUnitTenant")).Font.Bold = true;
                }
                else if (((BusinessObjectContainer.Unit)e.Item.DataItem).Status == "Occupied")
                {
                    ((HyperLink)e.Item.FindControl("frmUnitTenant")).Text = ((BusinessObjectContainer.Unit)e.Item.DataItem).CurrentContract.TenantReference.Name;
                    ((HyperLink)e.Item.FindControl("frmUnitTenant")).NavigateUrl = "TenantDetails.aspx?TenantID=" + ((BusinessObjectContainer.Unit)e.Item.DataItem).CurrentContract.TenantReference.ID.ToString();
                }
                else
                {
                    BusinessObjectContainer.Contract c = ((BusinessObjectContainer.Unit)e.Item.DataItem).Contracts.Where(x => x.ContractStart > DateTime.Now).FirstOrDefault();
                    ((HyperLink)e.Item.FindControl("frmUnitTenant")).Text = c.TenantReference.Name;
                    ((HyperLink)e.Item.FindControl("frmUnitTenant")).NavigateUrl = "TenantDetails.aspx?TenantID=" + c.TenantReference.ID.ToString();
                }
            }
        }
    }
}
