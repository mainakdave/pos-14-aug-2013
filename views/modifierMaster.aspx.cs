using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Configuration;
using System.Data;
using System.Data.SqlClient;

using System.Web.Services;


namespace POS.views
{
    public partial class modifierMaster : System.Web.UI.Page
    {
        public static string parameter = null;

        public static DataSet myDS = null;

        public static ListView myList = null;
        public static TextBox myTextBox = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            myList = lstvModifierMaster;
            myTextBox = nextID;

            if (!this.IsPostBack)
            {
                
            }


            searchText.Focus();

            //ListLoad();

            parameter = Request["__EVENTARGUMENT"];
            if (parameter != null && parameter != "")
            {
                int spliterInt = parameter.IndexOf(":,:");
                if (spliterInt > 0)
                {
                    string searchBy = parameter.Substring(0, spliterInt);
                    string searchKeyword = parameter.Substring(spliterInt + 3);


                    switch (searchBy)
                    {
                        case "reference":
                            myDS.Tables[0].DefaultView.RowFilter = searchBy.Trim() + " like '*" + searchKeyword.Trim() + "*'";
                            break;

                        case "modifierID":
                            myDS.Tables[0].DefaultView.RowFilter = searchBy.Trim() + " = " + int.Parse(searchKeyword.Trim());
                            break;
                    }

                    myList.DataSource = myDS.Tables[0].DefaultView;
                    myList.DataBind();
                }
                else
                {
                    myList.DataSource = myDS.Tables[0];
                    myList.DataBind();
                }
            }
        }

        public static void ListLoad()
        {
            myList.Items.Clear();

            string DBConnectionString = ConfigurationManager.ConnectionStrings["POSDB"].ConnectionString;
            SqlConnection con = new SqlConnection(DBConnectionString);

            string sqlCmd = "modifierMasterSelectInsertUpdateDelete";
            using (SqlCommand cmd = new SqlCommand(sqlCmd, con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@StatementType", "Select");
                cmd.Parameters.Add("@NewId", SqlDbType.Int).Direction = ParameterDirection.Output;

                SqlDataAdapter adpt = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();

                myDS = ds;

                con.Open();
                adpt.Fill(ds);
                con.Close();

                myList.DataSource = ds.Tables[0];
                myList.DataBind();

                if (ds.Tables[1].Rows.Count > 0) { myTextBox.Text = ds.Tables[1].Rows[0]["nextID"].ToString(); }
            }
        }

        protected void DataPager_PreRender(object sender, EventArgs e)
        {
            if (parameter == null || parameter == "" || parameter == "undefined")
            {
                ListLoad();
            }
        }
    }
}