using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class UnitDetails : System.Web.UI.Page
{
    //private DataTable UnitTable = null;
    //private DataTable TenantTable = null;
    //private DataTable ReservationTable = null;
    //private DataRow UnitRow = null;
    //private DataTable PropertyTable = null;
    //private DataRow PropertyRow = null;
    public int UnitID
    {
        get { return System.Convert.ToInt32(this.Page.Request.QueryString["UnitID"]); ; }
    }
    //private int UnitIDPrivate;
    private BusinessObjectContainer boc = null;
    private BusinessObjectContainer.Unit Unit = null;
    private BusinessObjectContainer.Tenant Tenant = null;
    //private BusinessObjectContainer.Contract Contract = null;
    //private BusinessObjectContainer.Owner Owner = null;

    protected void Page_Init(object sender, EventArgs e)
    {
        this.boc = (BusinessObjectContainer)this.Application["boc"];
        this.Unit = this.boc.Units.Where(x => x.ID == this.UnitID).FirstOrDefault();
        BusinessObjectContainer.Contract contract = this.boc.Contracts.Where(x => x.UnitReference.ID == this.UnitID && x.ContractStart <= DateTime.Now && x.ContractEnd >= DateTime.Now).FirstOrDefault();
        if (contract != null)
            this.Tenant = contract.TenantReference;

    }
    protected void Page_Load(object sender, EventArgs e)
    {
       // this.frmPropertyName.Text = this.PropertyRow["Name"].ToString();
       // this.lblPropertyAddress.Text = this.PropertyRow["pAddress"].ToString();
       // this.lblPropCityStateZip.Text = this.PropertyRow["pCityStateZip"].ToString();
        //this.PropertyTable = ((DataSet)this.Application["data"]).Tables["Properties"]; 

        this.lblUnit.Text = this.Unit.UnitNumber;
        this.txtUnitAddress.Text = this.Unit.PropertyReference.Address;
        this.frmProperty.Text = this.Unit.PropertyReference.Name;
        this.frmProperty.NavigateUrl = "/PropertyDetails.aspx?PropertyID=" + this.Unit.PropertyReference.ID.ToString();
        this.txtUnitCity.Text = this.Unit.PropertyReference.City;
        this.txtUnitState.Text = this.Unit.PropertyReference.State;
        this.txtUnitZip.Text = this.Unit.PropertyReference.Zip;

        this.txtBaths.Text = Convert.ToString(this.Unit.Bathrooms);
        if (this.Tenant != null)
            this.lblCurrentTenant.Text = Convert.ToString(this.Tenant.Name);
        this.txtBedrooms.Text = Convert.ToString(this.Unit.Bedrooms);
        //string rent = this.Unit.Rent.ToString("c0");

        this.txtRent.Text = this.Unit.Rent.ToString();


        int propID = Convert.ToInt32(this.Request.QueryString["pID"]);
        
        //System.Data.DataView dv = this.ReservationTable.AsDataView();
       // dv.RowFilter = "UnitPropertyID = " + propID.ToString();
        //this.RadGrid1.DataSource = this.ReservationTable;
        //this.RadGrid1.DataBind();

        //int UnitID = Convert.ToInt32(1);
        //System.Data.DataView dv2 = this.TenantTable.AsDataView();
        //dv2.RowFilter = "TenantPropertyID = " + UnitID.ToString();
        //this.RadGrid2.DataSource = dv2;
        //this.RadGrid2.DataBind();
        //DataView dvContracts = ((DataSet)this.Application["data"]).Tables["Contracts"].DefaultView;
        //dvContracts.RowFilter = "UnitID = " + this.UnitID.ToString();
        //dvContracts.Sort = "ContractStart DESC";

        //this.Unit.Contracts[0].TenantReference.Name
        

        this.RadGrid2.DataSource = this.Unit.Contracts.OrderByDescending(x => x.ContractStart);
        this.RadGrid2.DataBind();

        //this.Owner = this.boc.Owners.Where(x => x.PropertyReference.ID == this.PropertyID).FirstOrDefault();
        //this.RadGridFindTenant.DataSource = this.boc.Contracts.Where(x => x.ContractStart > DateTime.Now);
        //this.RadGridFindTenant.DataBind();

        int curAmen = 0;
        foreach (BusinessObjectContainer.Amenity amenity in boc.Amenities)
	    {
		    CheckBox cbAmenity = new CheckBox();
            cbAmenity.ID = "Amenity_" + amenity.ID.ToString();
            cbAmenity.Text = amenity.Name;
            cbAmenity.Checked = this.Unit.Amenities.Count(x => x.ID == amenity.ID) > 0;

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
    }

    protected void Occupany_OnItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
    { 
        
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        //this.pnlAddNew.Visible = true;



    }
    protected void frmFindTenant_Click(object sender, EventArgs e)
    {
        this.Response.Redirect("LeaseCreate.aspx?UnitID=" + this.UnitID.ToString());
    }
    protected void frmSave_Click(object sender, EventArgs e)
    {
        this.Unit.Rent = System.Convert.ToInt32(this.txtRent.Text);
        this.Unit.Bedrooms = System.Convert.ToInt32(this.txtBedrooms.Text);
        this.Unit.Bathrooms = System.Convert.ToInt32(this.txtBaths.Text);

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
        this.Unit.Amenities = checkedAmenities;

    }
    protected void btnAddprop_Click(object sender, EventArgs e)
    {
        //this.UnitTable = ((DataSet)this.Application["data"]).Tables["Units"];

    //    int propID = Convert.ToInt32(hdnPropID.Value);
      //  String Unit = txtUnit.Text;
      //  String UnitAddress = txtUnitAddress.Text;
      //  String UnitStatus = txtStatus.Text;
      //  String LeaseStart = txtLeaseStart.Text;
      //  String LeaseEnd = txtLeaseEnd.Text;
      //  String ReservedDate = txtReservedDate.Text;
      //  String WaitList = txtWaitList.Text;

        // this.AddUnitDataRow(PropertyTable, PropertyTable.Rows.Count + 1, propName, propAddress, propCity, propState, propZip, NumberUnits, NumberVacancy, 3, 1, OwnerName);
  //FIX THIS TO RESERVATIONTABLE      this.AddUnitDataRow(UnitTable, UnitTable.Rows.Count + 1, propID, "A74", "vacant", "8/7/2010", "8/7/2011", "4/3/2009", "Yes", 3, "$800.00", 1, "Leon Johnson", "N 59th St.", "Tampa", "FL", "33617");


     //   this.pnlAddNew.Visible = false;



        //ds.Tables.Add(PropertyTable);


        //this.Application.Add("data", ds);

  //      System.Data.DataView dv = this.UnitTable.AsDataView();
  //      dv.RowFilter = "UnitPropertyID = " + propID.ToString();
  //      this.RadGrid1.DataSource = dv;
  //      this.RadGrid1.Rebind();




        //this.RadGrid1.DataSource = this.UnitTable;
        //this.RadGrid1.Rebind();
    }

    protected void btnMoveIn_Click(object sender, EventArgs e)
    {
       // this.pnlAddNew.Visible = false;
    }
    protected void btnExcel_Click(object sender, ImageClickEventArgs e)
    {
        int count = RadGrid2.Columns.Count;
        RadGrid2.Columns[count - 1].Visible = true;
        RadGrid2.Rebind();


        RadGrid2.ExportSettings.ExportOnlyData = true;
        RadGrid2.ExportSettings.FileName = "Propert Details";
        RadGrid2.ExportSettings.IgnorePaging = true;
        RadGrid2.ExportSettings.OpenInNewWindow = true;
        RadGrid2.ExportSettings.Excel.Format = Telerik.Web.UI.GridExcelExportFormat.Html;

        RadGrid2.MasterTableView.ExportToExcel();
    }
}
