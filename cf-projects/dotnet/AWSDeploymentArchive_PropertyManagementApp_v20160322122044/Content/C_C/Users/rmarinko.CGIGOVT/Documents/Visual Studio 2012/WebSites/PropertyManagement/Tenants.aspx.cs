using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class _Default : System.Web.UI.Page
{
    //private DataTable TenantTable = null;
    //private DataRow TenantRow = null;
  //  private this.TenantRow = this.TenantTable.Rows.Find(UnitID);

    private void AddTenantDataRow(System.Data.DataTable dt, int TenantID, int TenantUnitID, int TenantPropertyID, string TenantName, string TenantStatus, string TenantDesiredDate, int TenantOrder, string TenantFromDate, string TenantToDate, string TenantSoc, string TenantOnWait, string TenantPropName)
    {
        System.Data.DataRow row;
        row = dt.NewRow();
        row["TenantID"] = TenantID;
        row["TenantLink"] = "TenantDetails.aspx?TenantID=" + TenantID;
        row["TenantUnitID"] = TenantUnitID;
        row["TenantPropertyID"] = TenantPropertyID;
        row["TenantName"] = TenantName;
        row["TenantStatus"] = TenantStatus;
        row["TenantDesiredDate"] = TenantDesiredDate;
        row["TenantOrder"] = TenantOrder;
        row["TenantFromDate"] = TenantFromDate;
        row["TenantToDate"] = TenantToDate;
        row["TenantSoc"] = TenantSoc;
        row["TenantOnWait"] = TenantOnWait;
        row["TenantPropName"] = TenantPropName;


        dt.Rows.Add(row);

    }


    private BusinessObjectContainer boc = null;
    
    protected void Page_Init(object sender, EventArgs e)
    {
        this.boc = (BusinessObjectContainer)this.Application["boc"];



    }

    protected void Page_Load(object sender, EventArgs e)
    {

        


    }
    protected void RadGrid1_OnNeedDataSource(object sender, EventArgs e)
    {
        this.RadGrid1.DataSource = this.boc.Tenants;
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        this.Response.Redirect("TenantDetails.aspx");
        //this.pnlAddNew.Visible = true;
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        this.pnlAddNew.Visible = false;
    }

    protected void btnAddprop_Click(object sender, EventArgs e)
    {
        //System.Data.DataSet ds = new System.Data.DataSet();
        //System.Data.DataTable propertyTable = new System.Data.DataTable("Properties");
        //this.TenantTable = ((DataSet)this.Application["data"]).Tables["Tenants"];

       //this.boc.Tenants[0].
        String SSN = txtSSN.Text;
        String TenantName  = txtTenantName .Text;
        String TenantUnit = txtUnit.Text;
        String TenantMoveIn = txtMoveIn.Text;
        String TenantDesired = txtDesired.Text;
        String TenantWaitList = txtOnWaitList.Text;
        String TenantPropAddress = txtUnitAddress.Text;
        String TenantPropName = txtPropertyName.Text;
        

        //this.AddPropertyDataRow(PropertyTable, PropertyTable.Rows.Count + 1, propName, propAddress, propCity, propState, propZip, NumberUnits, NumberVacancy, 3, 1, OwnerName);
        this.boc.AddTenant(TenantName, 1, "", 50000, "");// TenantTable, TenantTable.Rows.Count + 1, 1, 1, TenantName, "Active", TenantDesired, TenantTable.Rows.Count + 1,"N/A" , "N/A", SSN, TenantWaitList, TenantPropName);



        this.pnlAddNew.Visible = false;



        //ds.Tables.Add(PropertyTable);


        //this.Application.Add("data", ds);

        //this.RadGrid1.DataSource = this.TenantTable;
        this.RadGrid1.Rebind();


    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        this.Response.Redirect("TenantDetails.aspx");
        //this.pnlAddNew.Visible = true;
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {

        String tsearch = txtTenantSearch.Text;
        


        //System.Data.DataView dv = this.TenantTable.AsDataView();
        //dv.RowFilter = "TenantName =" + "'"  + tsearch +"'";
        this.RadGrid1.DataSource = this.boc.Tenants.Where(x => x.Name.ToLower().Contains(tsearch.ToLower()));
        this.RadGrid1.Rebind();

        

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

    protected void RadGrid1_OnItemCreated(object sender, Telerik.Web.UI.GridItemEventArgs e)
    {
        if (e.Item.GetType() == typeof(Telerik.Web.UI.GridDataItem))
        {

            if (e.Item.DataItem != null)
            {
                if (((BusinessObjectContainer.Tenant)e.Item.DataItem).Status == "Waiting List")
                {
                    ((HyperLink)e.Item.FindControl("frmTenantUnit")).Text = "Find Unit";
                    ((HyperLink)e.Item.FindControl("frmTenantUnit")).NavigateUrl = "LeaseCreate.aspx?UnitMode=1&TenantID=" + ((BusinessObjectContainer.Tenant)e.Item.DataItem).ID.ToString();
                    ((HyperLink)e.Item.FindControl("frmTenantUnit")).Font.Bold = true;
                }
                else //if (((BusinessObjectContainer.Tenant)e.Item.DataItem).Status == "Occupied")
                {
                    ((HyperLink)e.Item.FindControl("frmTenantUnit")).Text = ((BusinessObjectContainer.Tenant)e.Item.DataItem).CurrentContract.UnitReference.UnitNumber;
                    ((HyperLink)e.Item.FindControl("frmTenantUnit")).NavigateUrl = "UnitDetails.aspx?UnitID=" + ((BusinessObjectContainer.Tenant)e.Item.DataItem).CurrentContract.UnitReference.ID.ToString();
                }
                //else
                //{
                //    BusinessObjectContainer.Contract c = ((BusinessObjectContainer.Tenant)e.Item.DataItem).Contracts.Where(x => x.ContractStart > DateTime.Now).FirstOrDefault();
                //    ((HyperLink)e.Item.FindControl("frmTenantUnit")).Text = c.TenantReference.Name;
                //    ((HyperLink)e.Item.FindControl("frmTenantUnit")).NavigateUrl = "UnitDetails.aspx?TenantID=" + c.UnitReference.ID.ToString();
                //}
            }
        }
    }
}
