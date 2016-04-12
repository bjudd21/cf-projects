using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LeaseCreate : System.Web.UI.Page
{

    public int? UnitID
    {
        get 
        {
            if (this.UnitIDValue.HasValue == false)
            {
                if (this.Page.Request.QueryString["UnitID"] != null && this.Page.Request.QueryString["UnitID"] != string.Empty)
                {
                    this.UnitIDValue = System.Convert.ToInt32(this.Page.Request.QueryString["UnitID"]);
                }
            }
            return this.UnitIDValue; 
        }
    }
    private int? UnitIDValue;


    public int? TenantID
    {
        get
        {
            if (this.TenantIDValue.HasValue == false)
            {
                if (this.Page.Request.QueryString["TenantID"] != null && this.Page.Request.QueryString["TenantID"] != string.Empty)
                {
                    this.TenantIDValue = System.Convert.ToInt32(this.Page.Request.QueryString["TenantID"]);
                }
            }
            return this.TenantIDValue;
        }
    }
    private int? TenantIDValue;

    public DateTime? LeaseStart
    {
        get
        {
            if (this.LeaseStartValue.HasValue == false)
            {
                if (this.Page.Request.QueryString["LeaseStart"] != null && this.Page.Request.QueryString["LeaseStart"] != string.Empty)
                {
                    this.LeaseStartValue = System.Convert.ToDateTime(this.Page.Request.QueryString["LeaseStart"]);
                }
            }
            return this.LeaseStartValue;
        }
    }
    private DateTime? LeaseStartValue;

    public DateTime? LeaseEnd
    {
        get
        {
            if (this.LeaseEndValue.HasValue == false)
            {
                if (this.Page.Request.QueryString["LeaseEnd"] != null && this.Page.Request.QueryString["LeaseEnd"] != string.Empty)
                {
                    this.LeaseEndValue = System.Convert.ToDateTime(this.Page.Request.QueryString["LeaseEnd"]);
                }
            }
            return this.LeaseEndValue;
        }
    }
    private DateTime? LeaseEndValue;



    public int TenantMode
    {
        get 
        {
            if (this.Request.QueryString["TenantMode"] != null && this.Request.QueryString["TenantMode"] != string.Empty)
            {
                return System.Convert.ToInt32(this.Request.QueryString["TenantMode"]);
            }
            else
                return 0;
        }
    }
    public int UnitMode
    {
        get
        {
            if (this.Request.QueryString["UnitMode"] != null && this.Request.QueryString["UnitMode"] != string.Empty)
            {
                return System.Convert.ToInt32(this.Request.QueryString["UnitMode"]);
            }
            else
                return 0;
        }
    }

    private BusinessObjectContainer boc = null;
    private BusinessObjectContainer.Unit Unit = null;
    private BusinessObjectContainer.Tenant Tenant = null;

    protected override void OnInit(EventArgs e)
    {
        
        base.OnInit(e);
        this.boc = (BusinessObjectContainer)this.Application["boc"];
        if (this.UnitID.HasValue)
            this.Unit = boc.Units.Where(x => x.ID == this.UnitID.Value).FirstOrDefault();
        if (this.TenantID.HasValue)
            this.Tenant = boc.Tenants.Where(x => x.ID == this.TenantID.Value).FirstOrDefault();

        //this.frmSuggestedTenants.ItemCommand += new Telerik.Web.UI.GridCommandEventHandler(frmSuggestedTenants_ItemCommand);

    }
    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);

        this.frmContractStart.SelectedDate = this.LeaseStart;
        this.frmContractEnd.SelectedDate = this.LeaseEnd;

        

        if (this.Unit != null)
        {
            this.frmUnitNumber.Text = this.Unit.UnitNumber;
            this.frmUnitProperty.Text = this.Unit.PropertyReference.Name;
            if (this.frmContractRent.Text == string.Empty)
            {
                this.frmContractRent.Text = this.Unit.Rent.ToString("0.00");
            }
            this.frmUnitBedrooms.Text = this.Unit.Bedrooms.ToString();
            this.frmUnitBathrooms.Text = this.Unit.Bathrooms.ToString();
            this.frmUnitRent.Text = string.Format("{0:C}", this.Unit.Rent);
            this.frmUnitIdealIncome.Text = string.Format("{0:C} - {1:C}", this.Unit.IdealIncomeMin, this.Unit.IdealIncomeMax);

            if (this.frmContractStart.SelectedDate.HasValue == false)
            {
                //find next available date
                DateTime dSuggested = new DateTime(System.DateTime.Now.Year, System.DateTime.Now.Month, 1);
                BusinessObjectContainer.Contract currentContract = this.Unit.Contracts.Where(x => x.ContractStart <= System.DateTime.Now && x.ContractEnd >= System.DateTime.Now).FirstOrDefault();
                if (currentContract == null)
                {
                    this.frmContractStart.SelectedDate = dSuggested;
                }
                else
                {
                    this.frmContractStart.SelectedDate = currentContract.ContractEnd.AddDays(1).Date;
                }
            }
            if (this.frmContractEnd.SelectedDate.HasValue == false)
            {
                this.frmContractEnd.SelectedDate = this.frmContractStart.SelectedDate.Value.AddMonths(6);
            }
        }

        this.frmTenantSelectedPanel.Visible = this.TenantMode == 0;
        this.frmTenantSuggestedPanel.Visible = this.TenantMode == 1;
        this.frmTenantLookupPanel.Visible = this.TenantMode == 2;
        this.frmUnitSelectedPanel.Visible = this.UnitMode == 0;
        this.frmUnitSuggestedPanel.Visible = this.UnitMode == 1;
        this.frmUnitLookupPanel.Visible = this.UnitMode == 2;
        if (this.Tenant != null)
        {
            
            this.frmTenantName.Text = this.Tenant.Name;
            this.frmTenantFamilySize.Text = this.Tenant.FamilySize.ToString();
            this.frmTenantIncome.Text =  string.Format("{0:C}", this.Tenant.Income);
            this.frmTenantIdealRent.Text = string.Format("{0:C} - {1:C}", this.Tenant.IdealRentMin, this.Tenant.IdealRentMax);
            this.frmTenantOccupation.Text = this.Tenant.Job;
            this.frmTenantCompany.Text = this.Tenant.Employer;


            if (this.frmContractStart.SelectedDate.HasValue == false)
            {
                //find next available date
                DateTime dSuggested = new DateTime(System.DateTime.Now.Year, System.DateTime.Now.Month, 1);
                BusinessObjectContainer.Contract currentContract = this.Tenant.Contracts.Where(x => x.ContractStart <= System.DateTime.Now && x.ContractEnd >= System.DateTime.Now).FirstOrDefault();
                if (currentContract == null)
                {
                    this.frmContractStart.SelectedDate = dSuggested;
                }
                else
                {
                    this.frmContractStart.SelectedDate = currentContract.ContractEnd.AddDays(1).Date;
                }
            }
            if (this.frmContractEnd.SelectedDate.HasValue == false)
            {
                this.frmContractEnd.SelectedDate = this.frmContractStart.SelectedDate.Value.AddMonths(6);
            }

        }
        //this.frmSuggestedTenants.ItemCommand += new Telerik.Web.UI.GridCommandEventHandler(frmSuggestedTenants_ItemCommand);
        if (this.frmPropertyList.Items.Count == 0)
        {
            this.frmPropertyList.Items.Add(new ListItem("", "-1"));
            foreach (BusinessObjectContainer.Property property in this.boc.Properties)
            {
                this.frmPropertyList.Items.Add(new ListItem(property.Name, property.ID.ToString()));
            }
        }


        this.frmShowSuggestedTenants.NavigateUrl = this.Page.Request.Path + "?TenantMode=1";
        this.frmShowTenantLookup.NavigateUrl = this.Page.Request.Path + "?TenantMode=2";
        if (this.UnitID.HasValue == true)
        {
            this.frmShowSuggestedTenants.NavigateUrl += "&UnitID=" + this.UnitID.Value.ToString();
            this.frmShowTenantLookup.NavigateUrl += "&UnitID=" + this.UnitID.Value.ToString();
            if (this.frmContractStart.SelectedDate.HasValue)
            {
                this.frmShowSuggestedTenants.NavigateUrl += "&LeaseStart=" + this.frmContractStart.SelectedDate.Value.ToString("MM/dd/yyyy");
                this.frmShowTenantLookup.NavigateUrl += "&LeaseStart=" + this.frmContractStart.SelectedDate.Value.ToString("MM/dd/yyyy");
            }
            if (this.frmContractEnd.SelectedDate.HasValue)
            {
                this.frmShowSuggestedTenants.NavigateUrl += "&LeaseEnd=" + this.frmContractEnd.SelectedDate.Value.ToString("MM/dd/yyyy");
                this.frmShowTenantLookup.NavigateUrl += "&LeaseEnd=" + this.frmContractEnd.SelectedDate.Value.ToString("MM/dd/yyyy");
            }
        }
        this.frmShowSuggestedTenants2.NavigateUrl = this.frmShowSuggestedTenants.NavigateUrl;
        this.frmShowTenantLookup2.NavigateUrl = this.frmShowTenantLookup.NavigateUrl;

        this.frmShowUnitsSuggested.NavigateUrl = this.Page.Request.Path + "?UnitMode=1";
        this.frmShowUnitsList.NavigateUrl = this.Page.Request.Path + "?UnitMode=2";
        if (this.TenantID.HasValue == true)
        {
            this.frmShowUnitsSuggested.NavigateUrl += "&TenantID=" + this.TenantID.Value.ToString();
            this.frmShowUnitsList.NavigateUrl += "&TenantID=" + this.TenantID.Value.ToString();
            if (this.frmContractStart.SelectedDate.HasValue)
            {
                this.frmShowUnitsSuggested.NavigateUrl += "&LeaseStart=" + this.frmContractStart.SelectedDate.Value.ToString("MM/dd/yyyy");
                this.frmShowUnitsList.NavigateUrl += "&LeaseStart=" + this.frmContractStart.SelectedDate.Value.ToString("MM/dd/yyyy");
            }
            if (this.frmContractEnd.SelectedDate.HasValue)
            {
                this.frmShowUnitsSuggested.NavigateUrl += "&LeaseEnd=" + this.frmContractEnd.SelectedDate.Value.ToString("MM/dd/yyyy");
                this.frmShowUnitsList.NavigateUrl += "&LeaseEnd=" + this.frmContractEnd.SelectedDate.Value.ToString("MM/dd/yyyy");
            }
        }
        this.frmShowUnitsSuggested2.NavigateUrl = this.frmShowUnitsSuggested.NavigateUrl;
        this.frmShowUnitsList2.NavigateUrl = this.frmShowUnitsList.NavigateUrl;

        
    }

    protected void frmSuggestedTenants_OnNeedDataSource(object sender, EventArgs e)
    {
        IQueryable<BusinessObjectContainer.Tenant> qTenant = this.boc.Tenants.AsQueryable();
        
        DateTime start = this.frmContractStart.SelectedDate.Value;
        DateTime end = this.frmContractEnd.SelectedDate.Value;
        //qTenant = qTenant.Where(x => x.Contracts.Count == 0);
        qTenant = qTenant.Where(y => y.Contracts.Count(x =>
            ((x.ContractStart <= start && x.ContractEnd >= end)
            || (x.ContractStart >= start && x.ContractEnd <= end)
            || (x.ContractStart <= start && x.ContractEnd >= start)
            || (x.ContractStart <= end && x.ContractEnd >= end))) == 0);

        if (this.Unit != null)
        {
            //refine query by amenities
            qTenant = qTenant.Where(x => this.Unit.Amenities.Count(y => x.AmenitiesRequired.Contains(y)) == x.AmenitiesRequired.Count);

            //refine query by bedrooms
            qTenant = qTenant.Where(x => this.Unit.Bedrooms >= System.Math.Round((System.Convert.ToDouble(x.FamilySize) / 2), 0) && this.Unit.Bedrooms <= x.FamilySize);

            //order by income deviation
            //qTenant = qTenant.OrderBy(x => System.Math.Abs((x.Income / 12 / 3) - this.Unit.Rent));
            qTenant = qTenant.OrderByDescending(x => x.GetUnitMatch(this.Unit));
        }
        
        this.frmSuggestedTenants.DataSource = qTenant.Take(10);
    }
    protected void frmSuggestedUnits_OnNeedDataSource(object sender, EventArgs e)
    {
        IQueryable<BusinessObjectContainer.Unit> qUnit = this.boc.Units.AsQueryable();
        //qUnit = qUnit.Where(x => x.Contracts.Count(y => y.ContractEnd >= DateTime.Now) == 0);
        DateTime start = this.frmContractStart.SelectedDate.Value;
        DateTime end = this.frmContractEnd.SelectedDate.Value;
        //qTenant = qTenant.Where(x => x.Contracts.Count == 0);
        qUnit = qUnit.Where(y => y.Contracts.Count(x =>
            ((x.ContractStart <= start && x.ContractEnd >= end)
            || (x.ContractStart >= start && x.ContractEnd <= end)
            || (x.ContractStart <= start && x.ContractEnd >= start)
            || (x.ContractStart <= end && x.ContractEnd >= end))) == 0);
        if (this.Tenant != null)
        {
            //refine query by amenities
            qUnit = qUnit.Where(x => this.Tenant.AmenitiesRequired.Count(y => x.Amenities.Contains(y)) == this.Tenant.AmenitiesRequired.Count);

            //refine query by bedrooms
            qUnit = qUnit.Where(x => this.Tenant.FamilySize <= System.Math.Round((System.Convert.ToDouble(x.Bedrooms) * 2), 0) && this.Tenant.FamilySize >= x.Bedrooms);
            
            //order by income deviation
            //qUnit = qUnit.OrderBy(x => System.Math.Abs((x.Rent * 12 * 3) - this.Tenant.Income));
            qUnit = qUnit.OrderByDescending(x => x.GetTenantMatch(this.Tenant));
        }
        
        this.frmSuggestedUnits.DataSource = qUnit.Take(10);
        //this.frmSuggestedUnits.Rebind();
    }
    protected void frmSuggestedTenants_ItemCommand(object source, Telerik.Web.UI.GridCommandEventArgs e)
    {
        if (e.CommandName == "Select")
        {
            int tenantSelected = System.Convert.ToInt32(e.Item.OwnerTableView.DataKeyValues[(e.Item.RowIndex / 2) - 1]["ID"]);
            string rDirPath = this.Page.Request.Path + "?TenantID=" + tenantSelected.ToString();
            if (this.UnitID.HasValue)
                rDirPath += "&UnitID=" + this.UnitID.Value.ToString();
            if (this.LeaseStart.HasValue)
                rDirPath += "&LeaseStart=" + this.LeaseStart.Value.ToString("MM/dd/yyyy");
            if (this.LeaseEnd.HasValue)
                rDirPath += "&LeaseEnd=" + this.LeaseEnd.Value.ToString("MM/dd/yyyy");
            this.Response.Redirect(rDirPath);
        }

    }
    protected void frmTenantLookupSearch_Search(object sender, EventArgs e)
    {
        IQueryable<BusinessObjectContainer.Tenant> qTenant =this.boc.Tenants.Where(x => x.Name.ToLower().Contains(this.frmTenantLookupText.Text.ToLower())).AsQueryable();
        if (this.Unit != null)
        {
            qTenant = qTenant.OrderByDescending(x => x.GetUnitMatch(this.Unit));
        }
        
        this.frmLookupTenants.DataSource = qTenant.Take(10);
        this.frmLookupTenants.DataBind();
    }

    protected void frmSuggestedUnits_ItemCommand(object source, Telerik.Web.UI.GridCommandEventArgs e)
    {
        if (e.CommandName == "Select")
        {
            int unitSelected = System.Convert.ToInt32(e.Item.OwnerTableView.DataKeyValues[(e.Item.RowIndex / 2) - 1]["ID"]);
            string rDirPath = this.Page.Request.Path + "?UnitID=" + unitSelected.ToString();
            if (this.TenantID.HasValue)
                rDirPath += "&TenantID=" + this.TenantID.Value.ToString();
            if (this.LeaseStart.HasValue)
                rDirPath += "&LeaseStart=" + this.LeaseStart.Value.ToString("MM/dd/yyyy");
            if (this.LeaseEnd.HasValue)
                rDirPath += "&LeaseEnd=" + this.LeaseEnd.Value.ToString("MM/dd/yyyy");
            this.Response.Redirect(rDirPath);
        }

    }
    protected void frmUnitLookupSelect_Click(object sender, EventArgs e)
    {
        int selectedUnit = System.Convert.ToInt32(this.frmPropertyUnitList.Items[this.frmPropertyUnitList.SelectedIndex].Value);
        int unitID = this.boc.Units.Where(x => x.ID == selectedUnit).FirstOrDefault().ID;

        string rDirPath = this.Page.Request.Path + "?UnitID=" + unitID.ToString();
        if (this.TenantID.HasValue)
            rDirPath += "&TenantID=" + this.TenantID.Value.ToString();
        if (this.LeaseStart.HasValue)
            rDirPath += "&LeaseStart=" + this.LeaseStart.Value.ToString("MM/dd/yyyy");
        if (this.LeaseEnd.HasValue)
            rDirPath += "&LeaseEnd=" + this.LeaseEnd.Value.ToString("MM/dd/yyyy");
        this.Response.Redirect(rDirPath);
    }

    protected void frmPropertyList_OnSelectedIndexChanged(object sender, EventArgs e)
    {
        this.frmPropertyUnitList.Items.Clear();
        if (this.frmPropertyList.SelectedIndex >= 1)
        {
            this.frmPropertyUnitList.Visible = true;
            int propID = System.Convert.ToInt32(this.frmPropertyList.Items[this.frmPropertyList.SelectedIndex].Value);
            foreach (BusinessObjectContainer.Unit unit in this.boc.Properties.Where(x => x.ID == propID).FirstOrDefault().Units)
            {
                this.frmPropertyUnitList.Items.Add(new ListItem(unit.UnitNumber, unit.ID.ToString()));
            }
        }
        else
            this.frmPropertyUnitList.Visible = false;
    }

    protected void frmCreateLease_OnClick(object sender, EventArgs e)
    {
        if (this.Tenant != null && this.Unit != null && this.frmContractStart.SelectedDate.HasValue == true && this.frmContractEnd.SelectedDate.HasValue == true && this.frmContractRent.Text != string.Empty)
        {
            boc.AddContract(this.Unit, this.Tenant, this.frmContractStart.SelectedDate.Value, this.frmContractEnd.SelectedDate.Value, System.Convert.ToDouble(this.frmContractRent.Text));
            this.Response.Redirect("/UnitDetails.aspx?UnitID=" + this.Unit.ID.ToString());
        }
    }
}
