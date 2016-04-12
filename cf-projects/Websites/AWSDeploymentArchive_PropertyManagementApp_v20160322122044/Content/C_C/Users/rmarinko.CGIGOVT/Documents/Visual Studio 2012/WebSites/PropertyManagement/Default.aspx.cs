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
    private DataTable UnitTable = null;
    private DataTable TenantTable = null;
    private DataTable ReservationTable = null;
    private DataRow UnitRow = null;
    private DataColumn UnitColumn = null;
    private DataTable PropertyTable = null;
    private DataRow PropertyRow = null;
    protected void Page_Init(object sender, EventArgs e)
    {
        this.boc = (BusinessObjectContainer)this.Application["boc"];
        //int UnitID = Convert.ToInt32(this.Request.QueryString["UnitID"]);
        //this.UnitTable = ((DataSet)this.Application["data"]).Tables["Units"];
        //this.ReservationTable = ((DataSet)this.Application["data"]).Tables["Reservations"];
        // this.UnitRow = this.PropertyTable.Rows.Find(UnitID);
       // this.TenantTable = ((DataSet)this.Application["data"]).Tables["Tenants"];
       // this.UnitRow = this.UnitTable.Rows.Find(UnitID);
        //int UnitCount = this.UnitTable.Columns.Count;
        //int UnitRowsCount = this.UnitTable.Rows.Count;
        
        //this.frmUnitsOccupied 
        //System.Data.DataView dvContracts = ((DataSet)this.Application["data"]).Tables["Contracts"].DefaultView;
        //int total = dvContracts.Count;

        //dvContracts.RowFilter = "ContractStart < '" + System.DateTime.Now.ToString("MM/dd/yyyy") + "' AND ContractEnd > '" + System.DateTime.Now.ToString("MM/dd/yyyy") + "'";
        int occupied = boc.Contracts.Count(x => x.ContractStart < DateTime.Now && x.ContractEnd > DateTime.Now);
        this.frmUnitsOccupied.Text = occupied.ToString();
        this.frmUnitsVacant.Text = (this.boc.Units.Count - occupied).ToString();
        this.frmUnitsReserved.Text = this.boc.Contracts.Count(x => x.ContractStart > DateTime.Now).ToString();
       this.frmUnitsVacantFuture.Text = this.boc.Units.Count(x => x.Contracts.Count(y => y.ContractEnd >= System.DateTime.Now.AddDays(60) || y.ContractStart >= System.DateTime.Now.AddDays(60)) == 0).ToString();
        this.frmWaitListCount.Text = this.boc.Tenants.Count(x => x.Contracts.Count == 0).ToString();
        string rent = this.boc.Contracts.Where(x => x.ContractStart < DateTime.Now && x.ContractEnd > DateTime.Now).Sum(x => x.Rent).ToString("c0");
        this.frmCurrentRent.Text = rent + ".00";
        string prevrent = this.boc.Contracts.Where(x => x.ContractStart < DateTime.Now.AddMonths(-1) && x.ContractEnd > DateTime.Now.AddMonths(-1)).Sum(x => x.Rent).ToString("c0");
        this.frmPreviousRent.Text = prevrent + ".00"; 
        //dvContracts.RowFilter = "ContractStart > '" + System.DateTime.Now.ToString("MM/dd/yyyy") + "'";
         

        
    }

    protected void Page_Load(object sender, EventArgs e)
    {

        //int UnitID = Convert.ToInt32(1);
        //System.Data.DataView dv2 = this.TenantTable.AsDataView();
        //dv2.RowFilter = "TenantPropertyID = " + UnitID.ToString();
       /// this.RadGrid2.DataSource = dv2;
       /// this.RadGrid2.DataBind();
       /// 

        int reserved = this.boc.Contracts.Count(x => x.ContractStart > DateTime.Now);
        int occupied = boc.Contracts.Count(x => x.ContractStart < DateTime.Now && x.ContractEnd > DateTime.Now);
        DateTime endDate = System.DateTime.Now.Date;
        //  DateTime startDate = endDate.AddDays(-7); <--this is the right one
        DateTime startDate = endDate.AddDays(-55);  //<--this is for testing


        if (this.frmUnitChart.Series.Count > 0)
            this.frmUnitChart.Series.Clear();

        Telerik.Charting.ChartSeries series = new Telerik.Charting.ChartSeries("Units");       
        series.Type = Telerik.Charting.ChartSeriesType.Pie;



        System.Drawing.Font fontLabel = new System.Drawing.Font("Arial", 11, System.Drawing.FontStyle.Bold);


       int vacant =  Convert.ToInt32(this.boc.Units.Count - occupied);
       Telerik.Charting.ChartSeriesItem itemOccupied = new Telerik.Charting.ChartSeriesItem();
       itemOccupied.Appearance.Exploded = false;
       itemOccupied.Name = "Occupied";
       itemOccupied.Label.Appearance.LabelLocation = Telerik.Charting.Styles.StyleSeriesItemLabel.ItemLabelLocation.Outside;
       itemOccupied.Label.TextBlock.Appearance.TextProperties.Color = System.Drawing.Color.Navy;
       itemOccupied.Label.TextBlock.Appearance.TextProperties.Font = fontLabel;
       itemOccupied.Label.TextBlock.Text = string.Format("{0} ({1:P0})", occupied, (double)occupied / (occupied + vacant));
       itemOccupied.Appearance.FillStyle.MainColor = System.Drawing.Color.DodgerBlue;
       itemOccupied.Appearance.FillStyle.SecondColor = System.Drawing.Color.Blue;
       itemOccupied.YValue = occupied;
       series.AddItem(itemOccupied);
       
        Telerik.Charting.ChartSeriesItem itemVacant = new Telerik.Charting.ChartSeriesItem();
        itemVacant.Appearance.Exploded = false;
        itemVacant.Name = "Vacant";
        itemVacant.Label.Appearance.LabelLocation = Telerik.Charting.Styles.StyleSeriesItemLabel.ItemLabelLocation.Outside;
        itemVacant.Label.TextBlock.Appearance.TextProperties.Color = System.Drawing.Color.Navy;
        itemVacant.Label.TextBlock.Appearance.TextProperties.Font = fontLabel;
        itemVacant.Label.TextBlock.Text = string.Format("{0} ({1:P0})", vacant, (double)vacant / (occupied + vacant));
        itemVacant.Appearance.FillStyle.MainColor = System.Drawing.Color.Blue;
        itemVacant.Appearance.FillStyle.SecondColor = System.Drawing.Color.White;
        itemVacant.YValue = vacant;
        series.AddItem(itemVacant);
        
        series.Appearance.FillStyle.MainColor = System.Drawing.Color.White;
        series.Appearance.Shadow.Color = System.Drawing.Color.Black;
        series.Appearance.LegendDisplayMode = Telerik.Charting.ChartSeriesLegendDisplayMode.ItemLabels;
        this.frmUnitChart.Series.Add(series);
        this.frmUnitChart.PlotArea.Appearance.Dimensions.Margins.Bottom = 0;
        this.frmUnitChart.PlotArea.Appearance.Dimensions.Margins.Left = 0;
        this.frmUnitChart.PlotArea.Appearance.FillStyle.MainColor = System.Drawing.Color.White;
        this.frmUnitChart.PlotArea.Appearance.FillStyle.SecondColor = System.Drawing.Color.White;

        //this.frmUnitChart.TempImagesFolder = @"C:\Inetpub\wwwroot\PropertyManagement";
        this.frmUnitChart.UseSession = true;
        this.frmUnitChart.Appearance.FillStyle.MainColor = System.Drawing.Color.White;
        this.frmUnitChart.PlotArea.Appearance.Border.Visible = false;
        this.frmUnitChart.Appearance.Border.Visible = false;
        //series.PlotArea.Chart.BringToFront();

  //      Telerik.Charting.ChartSeries series2 = new Telerik.Charting.ChartSeries("Annual Rent Average");
     

        int rent12 =  Convert.ToInt32(this.boc.Contracts.Where(x => x.ContractStart < DateTime.Now.AddMonths(-12) && x.ContractEnd > DateTime.Now.AddMonths(-12)).Sum(x => x.Rent));
        int rent11 = Convert.ToInt32(this.boc.Contracts.Where(x => x.ContractStart < DateTime.Now.AddMonths(-11) && x.ContractEnd > DateTime.Now.AddMonths(-11)).Sum(x => x.Rent));
        int rent10 = Convert.ToInt32(this.boc.Contracts.Where(x => x.ContractStart < DateTime.Now.AddMonths(-10) && x.ContractEnd > DateTime.Now.AddMonths(-10)).Sum(x => x.Rent));
        int rent9 = Convert.ToInt32(this.boc.Contracts.Where(x => x.ContractStart < DateTime.Now.AddMonths(-9) && x.ContractEnd > DateTime.Now.AddMonths(-9)).Sum(x => x.Rent));
        int rent8 = Convert.ToInt32(this.boc.Contracts.Where(x => x.ContractStart < DateTime.Now.AddMonths(-8) && x.ContractEnd > DateTime.Now.AddMonths(-8)).Sum(x => x.Rent));
        int rent7 = Convert.ToInt32(this.boc.Contracts.Where(x => x.ContractStart < DateTime.Now.AddMonths(-7) && x.ContractEnd > DateTime.Now.AddMonths(-7)).Sum(x => x.Rent));
        int rent6 = Convert.ToInt32(this.boc.Contracts.Where(x => x.ContractStart < DateTime.Now.AddMonths(-6) && x.ContractEnd > DateTime.Now.AddMonths(-6)).Sum(x => x.Rent));
        int rent5 = Convert.ToInt32(this.boc.Contracts.Where(x => x.ContractStart < DateTime.Now.AddMonths(-5) && x.ContractEnd > DateTime.Now.AddMonths(-5)).Sum(x => x.Rent));
        int rent4 = Convert.ToInt32(this.boc.Contracts.Where(x => x.ContractStart < DateTime.Now.AddMonths(-4) && x.ContractEnd > DateTime.Now.AddMonths(-4)).Sum(x => x.Rent));
        int rent3 = Convert.ToInt32(this.boc.Contracts.Where(x => x.ContractStart < DateTime.Now.AddMonths(-3) && x.ContractEnd > DateTime.Now.AddMonths(-3)).Sum(x => x.Rent));
        int rent2 = Convert.ToInt32(this.boc.Contracts.Where(x => x.ContractStart < DateTime.Now.AddMonths(-2) && x.ContractEnd > DateTime.Now.AddMonths(-2)).Sum(x => x.Rent));
        int rent1 = Convert.ToInt32(this.boc.Contracts.Where(x => x.ContractStart < DateTime.Now.AddMonths(-1) && x.ContractEnd > DateTime.Now.AddMonths(-1)).Sum(x => x.Rent));

//        series2.AddItem(rent12);
 //       series2.AddItem(rent11);
 //       series2.AddItem(rent10);
 //       series2.AddItem(rent9);
 //       series2.AddItem(rent8);
 //       series2.AddItem(rent7);
//        series2.AddItem(rent5);
 //       series2.AddItem(rent4);
 //       series2.AddItem(rent3);
 //       series2.AddItem(rent2);
//        series2.AddItem(rent1);
//        series2.Name = "Rent Averages";
//
 //       series2.Type = Telerik.Charting.ChartSeriesType.Bar;
        //series2.Name = "Rent Averages";
        //series2.SetItemLabel(0, Convert.ToString(rent12));
        //series2.SetItemLabel(1, Convert.ToString(rent11));
        //series2.SetItemLabel(2, Convert.ToString(rent10));
        //series2.SetItemLabel(3, Convert.ToString(rent9));
        //series2.SetItemLabel(4, Convert.ToString(rent8));
        //series2.SetItemLabel(5, Convert.ToString(rent7));
        //series2.SetItemLabel(6, Convert.ToString(rent6));
        //series2.SetItemLabel(7, Convert.ToString(rent5));
        //series2.SetItemLabel(8, Convert.ToString(rent4));
        //series2.SetItemLabel(9, Convert.ToString(rent3));
        //series2.SetItemLabel(10, Convert.ToString(rent2));
        //series2.SetItemLabel(11, Convert.ToString(rent1));
      
       
        

        

        //this.ChartRent.PlotArea.XAxis.AutoScale = false;
        //this.ChartRent.PlotArea.XAxis.AddRange(1, 12, 1);
        //this.ChartRent.PlotArea.XAxis[0].TextBlock.Text = "JAN";
        //this.ChartRent.PlotArea.XAxis[1].TextBlock.Text = "FEB";
        //this.ChartRent.PlotArea.XAxis[2].TextBlock.Text = "MAR";
        //this.ChartRent.PlotArea.XAxis[3].TextBlock.Text = "APR";
        //this.ChartRent.PlotArea.XAxis[4].TextBlock.Text = "MAY";
        //this.ChartRent.PlotArea.XAxis[5].TextBlock.Text = "JUN";
        //this.ChartRent.PlotArea.XAxis[6].TextBlock.Text = "JUL";
        //this.ChartRent.PlotArea.XAxis[7].TextBlock.Text = "AUG";
        //this.ChartRent.PlotArea.XAxis[8].TextBlock.Text = "SEP";
        //this.ChartRent.PlotArea.XAxis[9].TextBlock.Text = "OCT";
        //this.ChartRent.PlotArea.XAxis[10].TextBlock.Text = "NOV";
        //this.ChartRent.PlotArea.XAxis[11].TextBlock.Text = "DEC";
        
        //this.ChartRent.Legend.Appearance.FillStyle.MainColor = System.Drawing.Color.DarkBlue;
        //this.ChartRent.Series.Add(series2);
        
     //   ChartRent.DataGroupColumn = "Rent";
    //    ChartRent.PlotArea.XAxis.DataLabelsColumn = "Month";
     //   ChartRent.Legend.Appearance.GroupNameFormat = "#NAME:#VALUE";

       
    }
}
