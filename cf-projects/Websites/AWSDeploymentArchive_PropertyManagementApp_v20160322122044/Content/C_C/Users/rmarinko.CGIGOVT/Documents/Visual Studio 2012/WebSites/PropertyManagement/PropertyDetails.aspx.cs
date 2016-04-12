using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class PropertyDetails : System.Web.UI.Page
{
    

    public int PropertyID
    {
        get { return System.Convert.ToInt32(this.Page.Request["PropertyID"]); }
    }

   

    

    private BusinessObjectContainer boc = null;
    private BusinessObjectContainer.Property Property = null;
    //private BusinessObjectContainer.Owner Owner = null;

    protected void Page_Init(object sender, EventArgs e)
    {
        this.boc = (BusinessObjectContainer)this.Application["boc"];
        this.Property = this.boc.Properties.Where(x => x.ID == this.PropertyID).FirstOrDefault();
        
        //this.Owner = this.Property.OwnerReference;// this.boc.Owners.Where(x => x.PropertyReference.ID == this.PropertyID).FirstOrDefault();
        if (!this.Page.IsPostBack)
        {
            this.frmOwnerList.DataTextField = "Name";
            this.frmOwnerList.DataValueField = "ID";
            this.frmOwnerList.DataSource = this.boc.Owners;
            this.frmOwnerList.DataBind();
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.Property != null)
        {
            this.frmPropertyName.Text = this.Property.Name;
            this.frmPropertyAddress.Text = this.Property.Address;
            this.frmPropertyCity.Text = this.Property.City;
            this.frmPropertyState.Text = this.Property.State;
            this.frmPropertyZip.Text = this.Property.Zip;
            this.frmOwnerList.SelectedValue = this.Property.OwnerReference.ID.ToString();
            this.frmOwnerList_OnSelectedIndexChanged(null, null);
        }
       //this.PropertyTable = ((DataSet)this.Application["data"]).Tables["Properties"]; 

        if (this.Property != null)
        {
            string PropMapLink = "javascript:MapIt(" + "'" + this.Property.Address + "," + this.Property.City + "," + this.Property.State + "," + this.Property.Zip + "'" + ")";
            btnMapProperty.PostBackUrl = PropMapLink;
            this.btnMapProperty.Visible = true;
        }
        else
            this.btnMapProperty.Visible = false;




        //int propID = Convert.ToInt32(this.Request.QueryString["PropertyID"]);
        //System.Data.DataView dv = this.UnitTable.AsDataView();
        //dv.RowFilter = "UnitPropertyID = " + propID.ToString();



      //  int OwnerPropID = Convert.ToInt32(this.Request.QueryString["pID"]);
     //   System.Data.DataView odv = this.OwnerTable.AsDataView();
     //   odv.RowFilter = "OwnerID = " + OwnerPropID.ToString();
        //this.lblOwnerAddress.Text =  this.Owner.
        //this.lblOwnerCity.Text = this.OwnerRow["OwnerCity"].ToString();
        //this.lblOwnerState.Text = this.OwnerRow["OwnerState"].ToString();
       // this.lblOwnerZip.Text = this.OwnerRow["OwnerZip"].ToString();
        //this.lblpropOwnerName.Text = this.Owner.Name;

       


        
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
        //this.UnitTable = ((DataSet)this.Application["data"]).Tables["Units"];

        //int propID = Convert.ToInt32(hdnPropID.Value);
        String Unit = txtUnit.Text;
        String UnitAddress = txtUnitAddress.Text;
        String UnitStatus = txtStatus.Text;
        String LeaseStart = txtLeaseStart.Text;
        String LeaseEnd = txtLeaseEnd.Text;
        String ReservedDate = txtReservedDate.Text;
        String WaitList = txtWaitList.Text;

        // this.AddUnitDataRow(PropertyTable, PropertyTable.Rows.Count + 1, propName, propAddress, propCity, propState, propZip, NumberUnits, NumberVacancy, 3, 1, OwnerName);
        //this.AddUnitDataRow(UnitTable, UnitTable.Rows.Count + 1, this.PropertyID, "A74", "vacant", "8/7/2010", "8/7/2011", "4/3/2009", "Yes", 3, "$800.00", 1, "Leon Johnson", "N 59th St.", "Tampa", "FL", "33617");


        this.pnlAddNew.Visible = false;



        //ds.Tables.Add(PropertyTable);


        //this.Application.Add("data", ds);

        //System.Data.DataView dv = this.UnitTable.AsDataView();
        //dv.RowFilter = "UnitPropertyID = " + this.PropertyID.ToString();
        //this.RadGrid1.DataSource = dv;
        //this.RadGrid1.Rebind();




        //this.RadGrid1.DataSource = this.UnitTable;
        //this.RadGrid1.Rebind();
    }
    //protected void btnNewOwnerSubmit_Click(object sender, EventArgs e)
    //{

    //    //this.OwnerTable = ((DataSet)this.Application["data"]).Tables["Owner"];

    //    int propID = Convert.ToInt32(hdnPropID.Value);
    //    String NewOwner = txtNewOwnerName.Text;
    //    String NewOwnerAddress = txtNewOwnerAddress.Text;
    //    String NewOwnerCity = txtNewOwnerCity.Text;
    //    String NewOwnerState = txtNewOwnerState.Text;
    //    String NewOwnerZip = txtNewOwnerZip.Text;
        

    //    // this.AddUnitDataRow(PropertyTable, PropertyTable.Rows.Count + 1, propName, propAddress, propCity, propState, propZip, NumberUnits, NumberVacancy, 3, 1, OwnerName);
    //  //  this.AddUnitDataRow(UnitTable, UnitTable.Rows.Count + 1, propID, "A74", "vacant", "8/7/2010", "8/7/2011", "4/3/2009", "Yes", 3, "$800.00", 1, "Leon Johnson", "N 59th St.", "Tampa", "FL", "33617");
    //    //this.AddOwnerDataRow(OwnerTable, OwnerTable.Rows.Count + 1, NewOwner, NewOwnerAddress, NewOwnerCity,NewOwnerState,NewOwnerZip, 1);

        
    //    this.pnlOwner.Visible = false;



    //}
    //protected void btnNewOwnerCancel_Click(object sender, EventArgs e)
    //{
    //    this.pnlOwner.Visible = false;
    //}
    //protected void ChangeOwner_Click(object sender, EventArgs e)
    //{
    //    this.pnlOwner.Visible = true;
    //}
    protected void btnExcel_Click(object sender, ImageClickEventArgs e)
    {
        int count = RadGrid1.Columns.Count;
        RadGrid1.Columns[count - 1].Visible = true;
        RadGrid1.Rebind();


        RadGrid1.ExportSettings.ExportOnlyData = true;
        RadGrid1.ExportSettings.FileName = "Propert Details";
        RadGrid1.ExportSettings.IgnorePaging = true;
        RadGrid1.ExportSettings.OpenInNewWindow = true;
        RadGrid1.ExportSettings.Excel.Format = Telerik.Web.UI.GridExcelExportFormat.Html;

        RadGrid1.MasterTableView.ExportToExcel();
    }
    protected void RadGrid1_OnNeedDataSource(object sender, EventArgs e)
    {
        if (this.Property != null)
        {
            this.RadGrid1.DataSource = this.Property.Units;
        }
        else
            this.RadGrid1.DataSource = new List<BusinessObjectContainer.Unit>();
    }
    protected void frmOwnerList_OnSelectedIndexChanged(object sender, EventArgs e)
    {
        BusinessObjectContainer.Owner o = this.boc.Owners.Where(x => x.ID == System.Convert.ToInt32(this.frmOwnerList.SelectedValue)).FirstOrDefault();
        if (o != null)
        {
            this.frmOwnerAddress.Text = o.Address;
            this.frmOwnerCity.Text = o.City;
            this.frmOwnerState.Text = o.State;
            this.frmOwnerZip.Text = o.Zip;
        }
    }
    protected void frmPropertySave_OnClick(object sender, EventArgs e)
    {
        if (this.Property != null)
        {
            this.Property.Name = this.frmPropertyName.Text;
            this.Property.Address = this.frmPropertyAddress.Text;
            this.Property.City = this.frmPropertyCity.Text;
            this.Property.State = this.frmPropertyState.Text;
            this.Property.Zip = this.frmPropertyZip.Text;
            this.Property.OwnerReference = this.boc.Owners.Where(x => x.ID == System.Convert.ToInt32(this.frmOwnerList.SelectedValue)).FirstOrDefault();
        }
        else
        {
            BusinessObjectContainer.Property p = this.boc.AddProperty(this.frmPropertyName.Text, this.frmPropertyAddress.Text, this.frmPropertyCity.Text, this.frmPropertyState.Text, this.frmPropertyZip.Text);
            p.OwnerReference = this.boc.Owners.Where(x => x.ID == System.Convert.ToInt32(this.frmOwnerList.SelectedValue)).FirstOrDefault();
            this.Response.Redirect("PropertyDetails.aspx?PropertyID=" + p.ID);
        }
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
