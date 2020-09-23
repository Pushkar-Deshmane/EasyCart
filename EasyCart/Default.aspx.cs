using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Threading;
using System.Web.Services;
using System.Web.UI.WebControls;

namespace EasyCart
{
    public partial class Default : System.Web.UI.Page
    {
        CommanFunctions cf = new CommanFunctions();
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["login"] == null || Session["Login"].ToString() == "False")
            {
                Response.Redirect("/Login.aspx");
                //Response.Redirect("Login.aspx?url=AddSolicitation.aspx");
            }
            else
            {
                fillCategories();
            }
        }

        //initialization of culture for indian rupees format
        protected override void InitializeCulture()
        {
            CultureInfo ci = new CultureInfo("en-IN");
            ci.NumberFormat.CurrencySymbol = "₹";
            Thread.CurrentThread.CurrentCulture = ci;

            base.InitializeCulture();
        }


        //WebMethod (AJAX call) for autocomplete
        [WebMethod]
        public static List<string> GetAutoCompleteData(string productCategoryName)
        {
            CommanFunctions cf = new CommanFunctions();
            List<string> result = new List<string>();
            cf.setQuery("select productCategoryID,productCategoryName from productcategory where productCategoryName LIKE '%" + productCategoryName + "%'");
            DataTable dtD = cf.QueryEx();
            if (dtD.Rows.Count > 0)
            {
                for (int i = 0; i < dtD.Rows.Count; i++)
                {
                    result.Add(string.Format("{0}/{1}", dtD.Rows[i]["productCategoryName"].ToString(), dtD.Rows[i]["productCategoryID"].ToString()));
                }
            }
            else
            {
                cf.setQuery("select productID,productName from product where productName LIKE '%" + productCategoryName + "%'");
                dtD = cf.QueryEx();
                for (int i = 0; i < dtD.Rows.Count; i++)
                {
                    result.Add(string.Format("{0}/{1}", dtD.Rows[i]["productName"].ToString(), dtD.Rows[i]["productID"].ToString()));
                }
            }
            return result;
        }

        //Function to load categories
        protected void fillCategories()
        {
            try
            {
                string categories = "";

                cf.setQuery("SELECT distinct productCategoryName, productCategoryID from productcategory order by productCategoryName");
                dt = cf.QueryEx();

                if (dt.Rows.Count > 0)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        categories = categories + "<button type='button' id='btn_" + dt.Rows[i]["productCategoryID"].ToString() + "' class='btn btn-block btn-outline-success btn-sm' onclick='return ans(" + dt.Rows[i]["productCategoryID"].ToString() + ");'>" + dt.Rows[i]["productCategoryName"].ToString() + "</button>";
                    }
                    divCategory.InnerHtml = categories;
                }




            }
            catch
            {

            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                cf.setQuery("select * from product WHERE productName='" + txtProduct.Text.Trim() + "'");
                dt = cf.QueryEx();

                if (dt.Rows.Count > 0)
                {
                    cf.setQuery("select productID, productName, productDescription, price, productCategoryName from product inner join productcategory on product.productCategoryID = productcategory.productCategoryID where productName = '" + txtProduct.Text.Trim() + "'");
                    dt = cf.QueryEx();
                    if (dt.Rows.Count > 0)
                    {
                        grd_Product.Visible = true;
                        grd_Product.DataSource = dt;
                        grd_Product.DataBind();
                        empty.Visible = false;
                    }
                    else
                    {
                        grd_Product.Visible = false;
                    }
                    divDropdown.Attributes.CssStyle.Add("display", "none");
                }
                else
                {
                    string queryddl = "select productID,productName FROM product WHERE productCategoryID = (select productCategoryID from productcategory where productCategoryName = '" + txtProduct.Text.Trim() + "')";

                    cf.setQuery(queryddl);
                    dt = cf.QueryEx();
                    if (dt.Rows.Count > 0)
                    {

                        cf.FillDropDownList(ddlProducts, queryddl, "productID", "productName");

                        ddlProducts.Items.Insert(0, new ListItem("Select Product", "0"));
                        divDropdown.Attributes.CssStyle.Add("display", "block");
                        empty.Visible = false;
                        grd_Product.Visible = false;
                    }
                    else
                    {
                        grd_Product.Visible = false;
                        empty.Visible = true;
                    }
                }

            }
            catch
            { }
        }

        protected void ddlProducts_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                cf.setQuery("select productID, productName, productDescription, price, productCategoryName from product inner join productcategory on product.productCategoryID = productcategory.productCategoryID where productName = '" + ddlProducts.SelectedItem.ToString() + "'");
                dt = cf.QueryEx();

                if (dt.Rows.Count > 0)
                {
                    grd_Product.Visible = true;
                    grd_Product.DataSource = dt;
                    grd_Product.DataBind();
                }
                else
                {
                    grd_Product.Visible = false;
                }
            }
            catch
            {

            }
        }

        protected void btnSearchCat_Click(object sender, EventArgs e)
        {
            try
            {
                cf.setQuery("select productID, productName, productDescription, price, productCategoryName from product inner join productcategory on product.productCategoryID = productcategory.productCategoryID where  product.productCategoryID = " + int.Parse(hidCatID.Value.ToString()));
                dt = cf.QueryEx();

                if (dt.Rows.Count > 0)
                {
                    grd_Product.Visible = true;
                    grd_Product.DataSource = dt;
                    grd_Product.DataBind();
                    empty.Visible = false;
                }
                else
                {
                    grd_Product.Visible = false;
                    empty.Visible = true;
                }
            }
            catch
            {

            }
        }
    }
}