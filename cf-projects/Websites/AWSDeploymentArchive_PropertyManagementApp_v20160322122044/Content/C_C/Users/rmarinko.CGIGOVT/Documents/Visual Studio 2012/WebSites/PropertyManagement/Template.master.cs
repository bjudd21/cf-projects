using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Telerik.Web.UI;


public partial class Template : System.Web.UI.MasterPage
{

    protected void Page_Load(object sender, EventArgs e)
    {


        //if (Context.User.Identity.IsAuthenticated && lblUserName != null)
        //    lblUserName.Text = "Welcome <b><i>" + Context.User.Identity.Name + "</i></b>";
        //else
            lblUserName.Text = "Welcome <b><i>" + "Guest" + "</i></b>";

    }
    protected void Menu1_MenuItemDataBound(object sender, RadMenuEventArgs e)
    {

    }
    
}
