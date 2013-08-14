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
    public partial class paymentGroup : System.Web.UI.Page
    {
        public static string parameter = null;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void ListLoad()
        {
            lstvPaymentGroup.Items.Clear();

            string DBConnectionString = ConfigurationManager.ConnectionStrings["POSDB"].ConnectionString;
            SqlConnection con = new SqlConnection(DBConnectionString);

            string sqlCmd = "paymentGroupSelectInsertUpdateDelete";
            using (SqlCommand cmd = new SqlCommand(sqlCmd, con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@StatementType", "Select");
                cmd.Parameters.Add("@NewId", SqlDbType.Int).Direction = ParameterDirection.Output;

                SqlDataAdapter adpt = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();

                //myDS = ds;

                con.Open();
                adpt.Fill(ds);
                con.Close();

                lstvPaymentGroup.DataSource = ds.Tables[0];
                lstvPaymentGroup.DataBind();

                if (ds.Tables[1].Rows.Count > 0) { nextID.Text = ds.Tables[1].Rows[0]["nextID"].ToString(); }
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