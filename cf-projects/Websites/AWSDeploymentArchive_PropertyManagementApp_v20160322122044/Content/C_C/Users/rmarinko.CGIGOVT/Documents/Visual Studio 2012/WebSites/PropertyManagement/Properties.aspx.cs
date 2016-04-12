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
        //this.PropertyTable = ((DataSet)this.Application["data"]).Tables["Properties"];
        //update counts
        //foreach (System.Data.DataRow drProp in this.PropertyTable.Rows)
        //{

            //int total = drProp.GetChildRows("PropertyUnits").Length;

            //System.Data.DataView dv = new DataView(((DataSet)this.Application["data"]).Tables["Contracts"]);
            //dv.RowFilter = "PropertyID = " + drProp["ID"] + " AND ContractStart < '" + System.DateTime.Now.ToString("MM/dd/yyyy") + "' AND ContractEnd > '" + System.DateTime.Now.ToString("MM/dd/yyyy") + "'";

            //int occupied = dv.Count;

            //dv.RowFilter = "PropertyID = " + drProp["ID"] + " AND ContractStart > '" + System.DateTime.Now.ToString("MM/dd/yyyy") + "'";
            //int reserved = dv.Count;

            //drProp["Occupied"] = occupied;
            //drProp["Vacant"] = total - occupied;
            //d/rProp["Reserved"] = reserved;
            
        //}

        
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        
        
        //this.RadGrid1.DataSource = ((DataTable)Session["myDataTable"]).DefaultView;

    }
    protected void RadGrid1_OnNeedDataSource(object sender, EventArgs e)
    {
            this.RadGrid1.DataSource = this.boc.Properties;
    }

    //private void AddDataRow(string propertyName,  int occupiedUnits, int vacantUnits, int reservedUnits)
    //{
    //    DataRow row;
    //    row = this.PropertyTable.NewRow();

    //    row["Name"] = propertyName;
    //    row["NameLink"] = "PropertyDetails.aspx?name=" + propertyName;
    //    row["Occupied"] = occupiedUnits;
    //    row["Vacant"] = vacantUnits;
    //    row["Reserved"] = reservedUnits;

    //    this.PropertyTable.Rows.Add(row);
    //}
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        this.Response.Redirect("PropertyDetails.aspx");
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
        //this.PropertyTable = ((DataSet)this.Application["data"]).Tables["Properties"];

        //System.Data.DataColumn dcID = new System.Data.DataColumn("ID", typeof(int));
        //propertyTable.Columns.Add(dcID);
        //propertyTable.PrimaryKey = new System.Data.DataColumn[] { dcID };

        //System.Data.DataColumn dcName = new System.Data.DataColumn("Name", typeof(string));
        //propertyTable.Columns.Add(dcName);

        //System.Data.DataColumn dcNameLink = new System.Data.DataColumn("NameLink", typeof(string));
        //propertyTable.Columns.Add(dcNameLink);

        //System.Data.DataColumn dcPropAddress = new System.Data.DataColumn("propAddress", typeof(string));
        //propertyTable.Columns.Add(dcPropAddress);

        //System.Data.DataColumn dcPropCity = new System.Data.DataColumn("propCity", typeof(string));
        //propertyTable.Columns.Add(dcPropCity);

        //System.Data.DataColumn dcPropState = new System.Data.DataColumn("propState", typeof(string));
        //propertyTable.Columns.Add(dcPropState);

        //System.Data.DataColumn dcPropZip = new System.Data.DataColumn("propZip", typeof(string));
        //propertyTable.Columns.Add(dcPropZip);

        //System.Data.DataColumn dcOccupied = new System.Data.DataColumn("Occupied", typeof(int));
        //propertyTable.Columns.Add(dcOccupied);

        //System.Data.DataColumn dcVacant = new System.Data.DataColumn("Vacant", typeof(int));
        //propertyTable.Columns.Add(dcVacant);

        //System.Data.DataColumn dcReserved = new System.Data.DataColumn("Reserved", typeof(int));
        //propertyTable.Columns.Add(dcReserved);

        //System.Data.DataColumn dcpOwnerID = new System.Data.DataColumn("pOwnerID", typeof(int));
        //propertyTable.Columns.Add(dcpOwnerID);

        //System.Data.DataColumn dcpOwnerName = new System.Data.DataColumn("pOwnerName", typeof(string));
        //propertyTable.Columns.Add(dcpOwnerName);
        String propName = txtpropName.Text;
        String propAddress = txtpropAddress.Text;
        String propCity = txtpropCity.Text;
        String propState = txtpropState.Text;
        String propZip = txtpropZip.Text;
        String OwnerName = txtpropOwnerName.Text;
        string NumberUnits = txtpropNumberOfUnits.Text;
        //string NumberVacancy = txtpropNumberOfVacancies.Text;
        
        //this.AddPropertyDataRow(PropertyTable, PropertyTable.Rows.Count + 1, propName, propAddress, propCity, propState , propZip, NumberUnits, NumberVacancy, "3", 1, OwnerName );
        BusinessObjectContainer.Property prop = this.boc.AddProperty(this.txtpropName.Text, this.txtpropAddress.Text, this.txtpropCity.Text, this.txtpropState.Text ,this.txtpropZip.Text);
        int unitCount = System.Convert.ToInt32(NumberUnits);
        for (int i = 0; i < unitCount; i++)
        {
            this.boc.AddUnit(prop, (i + 1).ToString(), 0, 1, 1);
        }
        this.pnlAddNew.Visible = false;



        //ds.Tables.Add(PropertyTable);
        

        //this.Application.Add("data", ds);
        
        //this.RadGrid1.DataSource = this.PropertyTable;
        this.RadGrid1.Rebind();
        
            
    }


    protected void btnSearch_Click(object sender, EventArgs e)
    {


        String psearch = txtPropSearch.Text;

        if (chkAll.Checked != true)
        {


            //System.Data.DataView dv = this.PropertyTable.AsDataView();
            //dv.RowFilter = "Name =" + "'" + psearch + "'";
            this.RadGrid1.DataSource = this.boc.Properties.Where(x => x.Name.ToLower().Contains(psearch.ToLower()));
            this.RadGrid1.Rebind();
        }
        else
        {
            this.RadGrid1.DataSource = this.boc.Properties;
            this.RadGrid1.DataBind();
        }

    }
    protected void Unnamed1_Click(object sender, EventArgs e)
    {
        this.Response.Redirect("PropertyDetails.aspx");
        //this.pnlAddNew.Visible = true;
    }
    protected void btnExcel_Click(object sender, ImageClickEventArgs e)
    {
        int count = RadGrid1.Columns.Count;
        RadGrid1.Columns[count - 1].Visible = true;
        RadGrid1.Rebind();


        RadGrid1.ExportSettings.ExportOnlyData = true;
        RadGrid1.ExportSettings.FileName = "Properties";
        RadGrid1.ExportSettings.IgnorePaging = true;
        RadGrid1.ExportSettings.OpenInNewWindow = true;
        RadGrid1.ExportSettings.Excel.Format = Telerik.Web.UI.GridExcelExportFormat.Html;
        
        RadGrid1.MasterTableView.ExportToExcel();
    }

  
}
