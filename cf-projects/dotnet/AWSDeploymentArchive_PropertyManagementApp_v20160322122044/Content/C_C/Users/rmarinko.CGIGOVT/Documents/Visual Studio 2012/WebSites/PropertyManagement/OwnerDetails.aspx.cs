using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class OwnerDetails : System.Web.UI.Page
{
    private BusinessObjectContainer boc = null;
    private BusinessObjectContainer.Owner Owner = null;
    protected void Page_Init(object sender, EventArgs e)
    {
        this.boc = (BusinessObjectContainer)this.Application["boc"];
        this.Owner = this.boc.Owners.Where(x => x.ID == System.Convert.ToInt32(this.Request.QueryString["OwnerID"])).FirstOrDefault();

    }


    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.Owner != null)
        {
            this.txtOwnerName.Text = this.Owner.Name;
            this.txtOwnerAddress.Text = this.Owner.Address;
            this.txtOwnerCity.Text = this.Owner.City;
            this.txtOwnerState.Text = this.Owner.State;
            this.txtOwnerZip.Text = this.Owner.Zip;
        }


    }
    protected void RadGrid1_OnNeedDataSource(object sender, EventArgs e)
    {
        if (this.Owner != null)
            this.RadGrid1.DataSource = this.boc.Properties.Where(x => x.OwnerReference.ID == this.Owner.ID);
        else
            this.RadGrid1.DataSource = new List<BusinessObjectContainer.Property>();
    }
    protected void frmOwnerSave_Click(object sender, EventArgs e)
    {
        if (this.Owner == null)
        {
            this.Owner = this.boc.AddOwner(this.txtOwnerName.Text, this.txtOwnerAddress.Text, this.txtOwnerCity.Text, this.txtOwnerState.Text, this.txtOwnerZip.Text);
            Response.Redirect("OwnerDetails.aspx?OwnerID=" + this.Owner.ID.ToString());
        }
        else
        {
            this.Owner.Name = this.txtOwnerName.Text;
            this.Owner.Address = this.txtOwnerAddress.Text;
            this.Owner.City = this.txtOwnerCity.Text;
            this.Owner.State = this.txtOwnerState.Text;
            this.Owner.Zip = this.txtOwnerZip.Text;
        }
    }
}
