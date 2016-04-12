using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


public partial class TenantDetails : System.Web.UI.Page
{
    //private DataTable TenantTable = null;
    //private DataRow TenantRow = null;
    //private DataTable UnitTable = null;
    //private DataRow UnitRow = null;

    private BusinessObjectContainer boc = null;
    private BusinessObjectContainer.Tenant Tenant = null;
    private BusinessObjectContainer.Unit Unit = null;
    //private BusinessObjectContainer.Owner Owner = null;
    public int TenantID
    {
        get { return System.Convert.ToInt32(this.Page.Request.QueryString["TenantID"]); ; }
    }
    private int UnitIDPrivate;
    protected void Page_Init(object sender, EventArgs e)
    {
        this.boc = (BusinessObjectContainer)this.Application["boc"];
        this.Tenant = this.boc.Tenants.Where(x => x.ID == this.TenantID).FirstOrDefault();
        //this.Unit = this.boc.Units.Where(x => x.ID == this.Unit.ID).FirstOrDefault();
        
    }
    protected void RadGrid1_OnNeedDataSource(object sender, EventArgs e)
    {
        if (this.Tenant != null)
            this.RadGrid1.DataSource = this.Tenant.Contracts.OrderByDescending(x => x.ContractStart);
        else
            this.RadGrid1.DataSource = new List<BusinessObjectContainer.Contract>();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.Tenant != null)
        {
            txtTenantName.Text = this.Tenant.Name.ToString();


            txtEmployer.Text = this.Tenant.Employer;
            txtFamilySize.Text = this.Tenant.FamilySize.ToString();
            txtJobTitle.Text = this.Tenant.Job.ToString();
            txtIncome.Text = this.Tenant.Income.ToString();

            if (this.Tenant.CurrentUnit != null)
            {
                lblUnitNumber.Text = this.Tenant.CurrentUnit.UnitNumber;
                lblUnitRent.Text = "$" + this.Tenant.CurrentUnit.Rent;
                lblUnitBeds.Text = this.Tenant.CurrentUnit.Bedrooms.ToString();
                lblUnitBaths.Text = this.Tenant.CurrentUnit.Bathrooms.ToString();
                lblContractStart.Text = this.Tenant.CurrentContract.ContractStart.ToString("MM/dd/yyyy");
                lblContractEnd.Text = this.Tenant.CurrentContract.ContractEnd.ToString("MM/dd/yyyy");
                this.frmCurrentUnitPanel.Visible = true;
            }
            else
            {
                this.frmCurrentUnitPanel.Visible = false;
            }
            this.btnFindUnit.Visible = true;


            


        }
        else
        {
            this.frmCurrentUnitPanel.Visible = false;
            this.btnFindUnit.Visible = false;
        }


        double iCurAmen = 0;
        foreach (BusinessObjectContainer.Amenity amenity in this.boc.Amenities)
        {
            System.Web.UI.HtmlControls.HtmlTableRow amenRow = new System.Web.UI.HtmlControls.HtmlTableRow();

            System.Web.UI.HtmlControls.HtmlTableCell requiredCell = new System.Web.UI.HtmlControls.HtmlTableCell();
            CheckBox cbRequired = new CheckBox();
            cbRequired.ID = "RA_" + amenity.ID.ToString();
            cbRequired.Attributes.Add("onClick", "AmenityClicked(this)");
            if (this.Tenant != null)
                cbRequired.Checked = this.Tenant.AmenitiesRequired.Count(x => x.ID == amenity.ID) > 0;
            requiredCell.Controls.Add(cbRequired);
            amenRow.Cells.Add(requiredCell);

            System.Web.UI.HtmlControls.HtmlTableCell desiredCell = new System.Web.UI.HtmlControls.HtmlTableCell();
            CheckBox cbDesired = new CheckBox();
            cbDesired.ID = "DA_" + amenity.ID.ToString();
            cbDesired.Attributes.Add("onClick", "AmenityClicked(this)");
            if (this.Tenant != null)
                cbDesired.Checked = this.Tenant.AmenitiesDesired.Count(x => x.ID == amenity.ID) > 0;
            desiredCell.Controls.Add(cbDesired);
            amenRow.Cells.Add(desiredCell);


            System.Web.UI.HtmlControls.HtmlTableCell labelCell = new System.Web.UI.HtmlControls.HtmlTableCell();
            labelCell.InnerText = amenity.Name;
            labelCell.Align = "left";
            amenRow.Cells.Add(labelCell);
            if (iCurAmen / this.boc.Amenities.Count >= 0.5)
            {
                this.frmAmenityTable1.Rows.Add(amenRow);
            }
            else
            {
                this.frmAmenityTable0.Rows.Add(amenRow);
            }


            iCurAmen++;
        }
   
    

        
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        //save info
        if (this.Tenant != null)
        {
            this.Tenant.Name = txtTenantName.Text;
            this.Tenant.Employer = txtEmployer.Text;
            this.Tenant.FamilySize = System.Convert.ToInt32(txtFamilySize.Text);
            this.Tenant.Job = txtJobTitle.Text;
            this.Tenant.Income = System.Convert.ToInt32(txtIncome.Text);
            this.SaveAmenities(this.Tenant);
        }
        else
        {
            BusinessObjectContainer.Tenant t = null;
            t = this.boc.AddTenant(this.txtTenantName.Text,
                               System.Convert.ToInt32(this.txtFamilySize.Text),
                               this.txtJobTitle.Text,
                               System.Convert.ToInt32(this.txtIncome.Text),
                               this.txtEmployer.Text);
            this.SaveAmenities(t);
            this.Response.Redirect("TenantDetails.aspx?TenantID=" + t.ID.ToString());

        }
    }

    private void SaveAmenities(BusinessObjectContainer.Tenant t)
    {
        List<BusinessObjectContainer.Amenity> requiredAmenities = new List<BusinessObjectContainer.Amenity>();
        List<BusinessObjectContainer.Amenity> desiredAmenities = new List<BusinessObjectContainer.Amenity>();
        foreach (System.Web.UI.HtmlControls.HtmlTableRow row in this.frmAmenityTable0.Rows)
        {
            Control cRequired = null;
            Control cDesired = null;
            if (row.Cells[0].Controls.Count > 0)
            {
                cRequired = row.Cells[0].Controls[0];
                cDesired = row.Cells[1].Controls[0];
            }
            if (cRequired.GetType() == typeof(CheckBox))
            {
                //get amenity id
                if (((CheckBox)cRequired).Checked)
                {
                    int id = System.Convert.ToInt32(cRequired.ID.Split("_".ToCharArray())[1]);
                    requiredAmenities.Add(boc.Amenities.Where(x => x.ID == id).FirstOrDefault());
                }
                if (((CheckBox)cDesired).Checked)
                {
                    int id = System.Convert.ToInt32(cDesired.ID.Split("_".ToCharArray())[1]);
                    desiredAmenities.Add(boc.Amenities.Where(x => x.ID == id).FirstOrDefault());
                }
            }
        }
        foreach (System.Web.UI.HtmlControls.HtmlTableRow row in this.frmAmenityTable1.Rows)
        {
            Control cRequired = null;
            Control cDesired = null;
            if (row.Cells[0].Controls.Count > 0)
            {
                cRequired = row.Cells[0].Controls[0];
                cDesired = row.Cells[1].Controls[0];
            }
            if (cRequired.GetType() == typeof(CheckBox))
            {
                //get amenity id
                if (((CheckBox)cRequired).Checked)
                {
                    int id = System.Convert.ToInt32(cRequired.ID.Split("_".ToCharArray())[1]);
                    requiredAmenities.Add(boc.Amenities.Where(x => x.ID == id).FirstOrDefault());
                }
                if (((CheckBox)cDesired).Checked)
                {
                    int id = System.Convert.ToInt32(cDesired.ID.Split("_".ToCharArray())[1]);
                    desiredAmenities.Add(boc.Amenities.Where(x => x.ID == id).FirstOrDefault());
                }
            }
        }
        t.AmenitiesDesired = desiredAmenities;
        t.AmenitiesRequired = requiredAmenities;
    }
   
   
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

    protected void btnFindUnit_Click(object sender, EventArgs e)
    {
        this.Response.Redirect("LeaseCreate.aspx?UnitMode=1&TenantID=" + this.Tenant.ID.ToString());
    }
}
