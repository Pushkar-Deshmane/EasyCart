using System;
using System.Data;
using System.Configuration;
using MySql.Data.MySqlClient;
using System.Web.UI.WebControls;
namespace EasyCart
{
    public class CommanFunctions
    {
        private MySqlConnection con;
        public MySqlCommand cmd;
        private MySqlDataAdapter da;
        private MySqlDataReader dr;
        DataTable dt;
        public static string user_id, id, date;

        //Constructor
        public CommanFunctions()
        {
            try
            {
                string strcon = ConfigurationManager.ConnectionStrings["BTSDB"].ConnectionString;
                con = new MySqlConnection(strcon);
            }
            catch
            { }
        }

        //Function to set the query to be executed
        public void setQuery(string query)
        {
            try
            {
                cmd = new MySqlCommand(query, con);
            }
            catch
            { }
        }

        //returns collection of data in DataTable object
        public DataTable QueryEx()
        {
            try
            {
                con.Open();
                da = new MySqlDataAdapter(cmd);
                dt = new DataTable();
                da.Fill(dt);
                con.Close();
                return dt;
            }
            catch
            {
                con.Close();
                return null;
            }
        }

        public void NonQueryEx()
        {
            try
            {
                con.Open();
                cmd.CommandTimeout = 0;
                cmd.ExecuteNonQuery();
                con.Close();
            }
            catch
            {
                con.Close();
            }
        }

        public MySqlDataReader readerExecute()
        {
            try
            {
                con.Open();
                dr = cmd.ExecuteReader();
                con.Close();
                return dr;
            }
            catch
            {
                con.Close();
                return null;
            }
        }
        public string ExecuteSQLWithparameter(string SQL, MySqlParameterCollection @params)
        {

            cmd = new MySqlCommand(SQL, con);
            con.Open();
            id = "OK";
            try
            {
                for (int i = 0; i <= @params.Count - 1; i++)
                {
                    if ((@params[i].Value != null))
                    {
                        if (!CheckSpecialCharacters(@params[i].Value.ToString()))
                        {
                            return null;
                        }
                    }
                    else
                    {
                        @params[i].Value = string.Empty;
                    }
                    cmd.Parameters.Add(@params[i].ParameterName, @params[i].MySqlDbType, @params[i].Size).Value = @params[i].Value;

                }

                cmd.ExecuteNonQuery();
                con.Close();
            }
            catch (Exception ex)
            {
                con.Close();
                return ex.Message.ToString();
            }
            con.Close();
            return id;
        }

        public static bool CheckSpecialCharacters(string input, string Extra = "")
        {
            if (input.Contains("'"))
            {
                input.Replace("'", "\'");
                //CheckSQLQuery(input);
                //return false;
            }
            if (input.Contains("\""))
            {
                input.Replace("\"", "\"");
                //CheckSQLQuery(input);
                //return false;
            }
            return true;
        }

        public DataTable FillDropDownList(DropDownList dropdown, string query, string valueField, string textField)
        {
            try
            {
                setQuery(query);
                dt = QueryEx();
                dropdown.ClearSelection();
                dropdown.DataSource = dt;
                dropdown.DataValueField = valueField;
                dropdown.DataTextField = textField;
                dropdown.DataBind();
                con.Close();

            }
            catch { }
            return dt;
        }

    }
}