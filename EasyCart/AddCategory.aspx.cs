using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.Web.UI;

namespace EasyCart
{
    public partial class AddCategory : System.Web.UI.Page
    {
        CommanFunctions cf = new CommanFunctions();
        MySqlCommand cmd;

        string query;
        protected void Page_Load(object sender, EventArgs e)
        {
            //Redirect to login page if login session is expired
            if (Session["login"] == null || Session["Login"].ToString() == "False")
            {
                Response.Redirect("/Login.aspx");              
            }
        }

        protected void btnAddCategory_Click(object sender, EventArgs e)
        {
            try
            {
                query = "insert into productcategory (productCategoryName) values (@productCategoryName)";

                cmd = new MySqlCommand();
                cmd.Parameters.Add("@productCategoryName", MySqlDbType.VarChar, 45).Value = txtCategory.Text.Trim();

                if (cf.ExecuteSQLWithparameter(query, cmd.Parameters) == "OK")
                {
                    clearData();
                }
            }
            catch
            {

            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            try
            {
                clearData();
            }
            catch
            {

            }
        }
        protected void clearData()
        {
            try
            {
                txtCategory.Text = "";
            }
            catch
            {

            }
        }
    }
}