using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class _Default : System.Web.UI.Page
{


    private BusinessObjectContainer boc = null;

    protected void Page_Init(object sender, EventArgs e)
    {
        this.boc = (BusinessObjectContainer)this.Application["boc"];

    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        //this.RadGrid1.DataSource = this.boc.Owners.Where(x => x.Name.ToLower().Contains(this.txtOwnerSearch.Text.ToLower()));
        this.RadGrid1.Rebind();
    }
    protected void RadGrid1_OnNeedDataSource(object sender, EventArgs e)
    {
        if (this.txtOwnerSearch.Text == string.Empty)
            this.RadGrid1.DataSource = this.boc.Owners;
        else
            this.RadGrid1.DataSource = this.boc.Owners.Where(x => x.Name.ToLower().Contains(this.txtOwnerSearch.Text.ToLower()));

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

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        this.Response.Redirect("OwnerDetails.aspx");



    }
    protected void ImageButton1_Click(object sender, EventArgs e)
    {
        this.Response.Redirect("OwnerDetails.aspx");



    }
}
