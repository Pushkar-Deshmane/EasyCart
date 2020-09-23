using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.Web.UI;

namespace EasyCart
{
    public partial class AddProduct : System.Web.UI.Page
    {
        CommanFunctions cf = new CommanFunctions();
        MySqlCommand cmd;
        string query;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["login"] == null || Session["Login"].ToString() == "False")
            {
                Response.Redirect("/Login.aspx");
                //Response.Redirect("Login.aspx?url=AddSolicitation.aspx");
            }
            else
            {
                if (!Page.IsPostBack)
                {
                    try
                    {
                        fillCategory();
                    }
                    catch
                    {

                    }
                } 
            }
        }

        //Function to fill dropdownlist
        protected void fillCategory()
        {
            try
            {
                string query = "SELECT distinct productCategoryName, productCategoryID from productcategory";
                cf.FillDropDownList(ddlCategory, query, "productCategoryID", "productCategoryName");
                ddlCategory.Items.Insert(0, "Select Category");
            }
            catch
            { }
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
                txtProductName.Text = "";
                txtDescription.Text = "";
                txtPrice.Text = "";
                ddlCategory.SelectedIndex = 0;
            }
            catch
            {

            }
        }

        protected void btnAddProduct_Click(object sender, EventArgs e)
        {
            try
            {
                query = "insert into product (productName, productDescription, price, productCategoryID) values (@productName, @productDescription, @price, @productCategoryID)";

                cmd = new MySqlCommand();
                cmd.Parameters.Add("@productName", MySqlDbType.VarChar, 45).Value = txtProductName.Text.Trim();
                cmd.Parameters.Add("@productDescription", MySqlDbType.VarChar, 45).Value = txtDescription.Text.Trim();
                cmd.Parameters.Add("@price", MySqlDbType.Double).Value = txtPrice.Text.Trim();                
                cmd.Parameters.Add("@productCategoryID", MySqlDbType.Int32).Value = int.Parse(ddlCategory.SelectedValue.ToString());

                if (cf.ExecuteSQLWithparameter(query, cmd.Parameters) == "OK")
                {
                    clearData();
                }
            }
            catch
            {

            }
        }
    }
}