using System;
using System.Web.UI;
using System.Data;
using MySql.Data.MySqlClient;

namespace EasyCart
{
    public partial class Login : System.Web.UI.Page
    {
        private CommanFunctions cf;
        public MySqlCommand cmd;
        DataTable dt = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                //Session to track login
                Session["Login"] = false;
            }
            catch (Exception EX)
            {

            }
        }

        protected void btnSignIn_Click(object sender, EventArgs e)
        {
            try
            {
                cf = new CommanFunctions();
                cf.setQuery("select * from users where userName='" + txt_Usernm.Text + "' and BINARY password ='" + txt_Pass.Text + "'");

                dt = cf.QueryEx();

                if (dt.Rows.Count > 0)
                {

                    fail_div.Attributes.CssStyle.Add("display", "none");
                    Session["Login"] = true;
                    Response.Redirect("/Default.aspx");
                }
                else
                {
                    //wrong credentials
                    Session["Login"] = false;
                    fail_div.Attributes.CssStyle.Add("display", "block");
                    lblfail.Attributes.CssStyle.Add("display", "block");
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "showpanel", "autoHide();", true);
                }
            }
            catch (Exception EX)
            {
                lblfail.Text = "Exception! Contact admin@easycart.com";
                fail_div.Attributes.CssStyle.Add("display", "block");
                lblfail.Attributes.CssStyle.Add("display", "block");
                ScriptManager.RegisterStartupScript(this, this.GetType(), "showpanel", "autoHide();", true);
            }
        }
    }
}