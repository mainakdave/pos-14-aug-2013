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
using CodeCarvings;

namespace POS.views
{
    public partial class section : System.Web.UI.Page
    {
        public static string parameter = null;
        public static DataSet myDS = null;

        public static char IU = 'I';

        public static System.Web.UI.Page myPageInstance = null;
        public static SimpleImageUpload imgUpload = null;
        public static ListView myList = null;
        public static UpdatePanel myUpdatePanel = null;
        public static TextBox myTextBox = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            myPageInstance = this;
            imgUpload = ImageUploader;
            myList = lstvSection;
            myTextBox = nextID;
            myUpdatePanel = UpdatePanel1;

            
            if (!this.IsPostBack)
            {
                string fileName = "dummy";
                string sourceImageFilePath = "~/uploadedImg/" + fileName + ".jpg";
                imgUpload.LoadImageFromFileSystem(sourceImageFilePath);

                //imgUpload.UnloadImage();
                
                DrpListLoad();
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
                        case "sectionName":
                            myDS.Tables[0].DefaultView.RowFilter = searchBy.Trim() + " like '*" + searchKeyword.Trim() + "*'";
                            break;

                        case "sectionID":
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

        private void DrpListLoad()
        {
            string DBConnectionString = ConfigurationManager.ConnectionStrings["POSDB"].ConnectionString;
            SqlConnection con = new SqlConnection(DBConnectionString);

            string sqlCmd = "departmentSelectInsertUpdateDelete";
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

                deptDrplst.DataSource = ds.Tables[0];
                deptDrplst.DataValueField = "deptID";
                deptDrplst.DataTextField = "deptName";
                deptDrplst.DataBind();
                deptDrplst.Items.Insert(0, new ListItem("Select One", "-1"));
            }
        }

        private static void ListLoad()
        {
            myList.Items.Clear();

            string DBConnectionString = ConfigurationManager.ConnectionStrings["POSDB"].ConnectionString;
            SqlConnection con = new SqlConnection(DBConnectionString);

            string sqlCmd = "sectionSelectInsertUpdateDelete";
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

        [WebMethod]
        public static void saveImage(int newID)
        {
            string fileName = newID.ToString();

            if (imgUpload.HasNewImage)
            {
                imgUpload.SaveProcessedImageToFileSystem("~/uploadedImg/section/" + fileName + ".jpg");
            }

            ListLoad();
        }

        [WebMethod]
        public static void updateRow(int id)
        {
            imgUpload.UnloadImage();


            imgUpload.LoadControl("~/piczardUserControls/simpleImageUploadUserControl/SimpleImageUpload.ascx");

            string fileName = id.ToString();
            string sourceImageFilePath = "~/uploadedImg/section/" + fileName + ".jpg";
            imgUpload.LoadImageFromFileSystem(sourceImageFilePath);


            imgUpload.LoadControl("~/piczardUserControls/simpleImageUploadUserControl/SimpleImageUpload.ascx");

            ListLoad();
        }

        protected void DataPager_PreRender(object sender, EventArgs e)
        {
            if (parameter == null || parameter == "" || parameter == "undefined")
            {
                ListLoad();
            }
        }


        protected void dataPagerAssociatedItem_PreRender(object sender, EventArgs e)
        {
            if (parameter != null && parameter != "")
            {
                int spliterInt = parameter.IndexOf(":=:");
                if (spliterInt > 0)
                {
                    int FilterID = Int32.Parse(parameter.Substring(spliterInt + 3));
                    AssociatedListLoad(FilterID);
                }
            }
        }

        public void AssociatedListLoad(int FilterID)
        {
            lstvAssociatedItem.Items.Clear();

            string DBConnectionString = ConfigurationManager.ConnectionStrings["POSDB"].ConnectionString;
            SqlConnection con = new SqlConnection(DBConnectionString);

            string sqlCmd = "getAssociatedItem";
            using (SqlCommand cmd = new SqlCommand(sqlCmd, con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@criteria", " where sectionID = " + FilterID);

                SqlDataAdapter adpt = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();

                con.Open();
                adpt.Fill(ds);
                con.Close();

                lstvAssociatedItem.DataSource = ds.Tables[0];
                lstvAssociatedItem.DataBind();
            }
        }
    }
}