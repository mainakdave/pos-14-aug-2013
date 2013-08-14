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
    public partial class currency : System.Web.UI.Page
    {
        public static string parameter = null;
        public static SimpleImageUpload imgUpload = null;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            imgUpload = ImageUploader;

            if (!this.IsPostBack)
            {
                string fileName = "dummy";
                string sourceImageFilePath = "~/uploadedImg/" + fileName + ".jpg";
                imgUpload.LoadImageFromFileSystem(sourceImageFilePath);

                //imgUpload.UnloadImage();

            }
        }

        public void ListLoad()
        {
            lstvCurrency.Items.Clear();

            string DBConnectionString = ConfigurationManager.ConnectionStrings["POSDB"].ConnectionString;
            SqlConnection con = new SqlConnection(DBConnectionString);

            string sqlCmd = "currencySelectInsertUpdateDelete";
            using (SqlCommand cmd = new SqlCommand(sqlCmd, con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@StatementType", "Select");
                cmd.Parameters.Add("@NewId", SqlDbType.Int).Direction = ParameterDirection.Output;

                SqlDataAdapter adpt = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();

                con.Open();
                adpt.Fill(ds);
                con.Close();

                lstvCurrency.DataSource = ds.Tables[0];
                lstvCurrency.DataBind();

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

        [WebMethod]
        public static void saveImage(int newID)
        {
            string fileName = newID.ToString();

            if (imgUpload.HasNewImage)
            {
                imgUpload.SaveProcessedImageToFileSystem("~/uploadedImg/currency/" + fileName + ".jpg");
            }

            //ListLoad();
        }
    }
}