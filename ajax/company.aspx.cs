using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace POS.ajax
{
    public partial class company : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int companyID = -1;
            String name = String.Empty;
            String address1 = String.Empty;
            String address2 = String.Empty;
            String city = String.Empty;
            String state = String.Empty;
            String country = String.Empty;
            String zipcode = String.Empty;
            String region = String.Empty;
            String officePhone = String.Empty;
            String officeFax = String.Empty;
            String taxtID = String.Empty;
            String vatID = String.Empty;
            String logo = String.Empty;
            String salesEmail = String.Empty;
            String supportEmail = String.Empty;
            String contactUsEmail = String.Empty;
            
            DateTime createDate = DateTime.Now;
            int createUser = -1;
            int modifyUser = -1;

            String StatementType = String.Empty;

            if (!String.IsNullOrEmpty(Request.Form["companyID"])) { companyID = Int32.Parse(Request.Form["companyID"]); }
            if (!String.IsNullOrEmpty(Request.Form["name"])) { name = Request.Form["name"]; }
            if (!String.IsNullOrEmpty(Request.Form["address1"])) { address1 = Request.Form["address1"]; }
            if (!String.IsNullOrEmpty(Request.Form["address2"])) { address2 = Request.Form["address2"]; }
            if (!String.IsNullOrEmpty(Request.Form["city"])) { city = Request.Form["city"]; }
            if (!String.IsNullOrEmpty(Request.Form["state"])) { state = Request.Form["state"]; }
            if (!String.IsNullOrEmpty(Request.Form["country"])) { country = Request.Form["country"]; }
            if (!String.IsNullOrEmpty(Request.Form["zipcode"])) { zipcode = Request.Form["zipcode"]; }
            if (!String.IsNullOrEmpty(Request.Form["region"])) { region = Request.Form["region"]; }
            if (!String.IsNullOrEmpty(Request.Form["officePhone"])) { officePhone = Request.Form["officePhone"]; }
            if (!String.IsNullOrEmpty(Request.Form["officeFax"])) { officeFax = Request.Form["officeFax"]; }
            if (!String.IsNullOrEmpty(Request.Form["taxtID"])) { taxtID = Request.Form["taxtID"]; }
            if (!String.IsNullOrEmpty(Request.Form["vatID"])) { vatID = Request.Form["vatID"]; }
            if (!String.IsNullOrEmpty(Request.Form["logo"])) { logo = Request.Form["logo"]; }
            if (!String.IsNullOrEmpty(Request.Form["salesEmail"])) { salesEmail = Request.Form["salesEmail"]; }
            if (!String.IsNullOrEmpty(Request.Form["supportEmail"])) { supportEmail = Request.Form["supportEmail"]; }
            if (!String.IsNullOrEmpty(Request.Form["contactUsEmail"])) { contactUsEmail = Request.Form["contactUsEmail"]; }

            if (!String.IsNullOrEmpty(Request.Form["createUser"])) { createUser = Int32.Parse(Request.Form["createUser"]); }
            if (!String.IsNullOrEmpty(Request.Form["modifyUser"])) { modifyUser = Int32.Parse(Request.Form["modifyUser"]); }
            if (!String.IsNullOrEmpty(Request.Form["StatementType"])) { StatementType = Request.Form["StatementType"]; }


            //store in DB
            var DBConnectionString = ConfigurationManager.ConnectionStrings["POSDB"].ConnectionString;
            SqlConnection con = new SqlConnection(DBConnectionString);

            string sqlCmd = "companySelectInsertUpdateDelete";
            int newID;
            using (SqlCommand cmd = new SqlCommand(sqlCmd, con))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                if (StatementType == "Insert")
                {
                    //cmd.Parameters.AddWithValue("@companyID", companyID);
                    cmd.Parameters.AddWithValue("@name", name);
                    cmd.Parameters.AddWithValue("@address1", address1);
                    cmd.Parameters.AddWithValue("@address2", address2);
                    cmd.Parameters.AddWithValue("@city", city);
                    cmd.Parameters.AddWithValue("@state", state);
                    cmd.Parameters.AddWithValue("@country", country);
                    cmd.Parameters.AddWithValue("@zipcode", zipcode);
                    cmd.Parameters.AddWithValue("@region", region);
                    cmd.Parameters.AddWithValue("@officePhone", officePhone);
                    cmd.Parameters.AddWithValue("@officeFax", officeFax);
                    cmd.Parameters.AddWithValue("@taxtID", taxtID);
                    cmd.Parameters.AddWithValue("@vatID", vatID);
                    cmd.Parameters.AddWithValue("@logo", logo);
                    cmd.Parameters.AddWithValue("@salesEmail", salesEmail);
                    cmd.Parameters.AddWithValue("@supportEmail", supportEmail);
                    cmd.Parameters.AddWithValue("@contactUsEmail", contactUsEmail);

                    //cmd.Parameters.AddWithValue("@createDate", createDate);
                    cmd.Parameters.AddWithValue("@createUser", createUser);
                    cmd.Parameters.AddWithValue("@modifyUser", modifyUser);
                    cmd.Parameters.AddWithValue("@StatementType", "Insert");

                    cmd.Parameters.Add("@NewId", SqlDbType.Int).Direction = ParameterDirection.Output;

                    con.Open();
                    int result = cmd.ExecuteNonQuery();
                    con.Close();

                    newID = Convert.ToInt32(cmd.Parameters["@NewId"].Value);
                    Response.Write(newID);
                }
                else if (StatementType == "Update")
                {
                    cmd.Parameters.AddWithValue("@companyID", companyID);
                    cmd.Parameters.AddWithValue("@name", name);
                    cmd.Parameters.AddWithValue("@address1", address1);
                    cmd.Parameters.AddWithValue("@address2", address2);
                    cmd.Parameters.AddWithValue("@city", city);
                    cmd.Parameters.AddWithValue("@state", state);
                    cmd.Parameters.AddWithValue("@country", country);
                    cmd.Parameters.AddWithValue("@zipcode", zipcode);
                    cmd.Parameters.AddWithValue("@region", region);
                    cmd.Parameters.AddWithValue("@officePhone", officePhone);
                    cmd.Parameters.AddWithValue("@officeFax", officeFax);
                    cmd.Parameters.AddWithValue("@taxtID", taxtID);
                    cmd.Parameters.AddWithValue("@vatID", vatID);
                    cmd.Parameters.AddWithValue("@logo", logo);
                    cmd.Parameters.AddWithValue("@salesEmail", salesEmail);
                    cmd.Parameters.AddWithValue("@supportEmail", supportEmail);
                    cmd.Parameters.AddWithValue("@contactUsEmail", contactUsEmail);
                    
                    //cmd.Parameters.AddWithValue("@createDate", createDate);
                    //cmd.Parameters.AddWithValue("@createUser", createUser);
                    cmd.Parameters.AddWithValue("@modifyUser", modifyUser);
                    cmd.Parameters.AddWithValue("@StatementType", "Update");

                    cmd.Parameters.AddWithValue("@NewId", -1);

                    con.Open();
                    int result = cmd.ExecuteNonQuery();
                    con.Close();
                }
                else if (StatementType == "Delete")
                {
                    cmd.Parameters.AddWithValue("@companyID", companyID);
                    cmd.Parameters.AddWithValue("@StatementType", "Delete");

                    cmd.Parameters.AddWithValue("@NewId", -1);

                    con.Open();
                    int result = cmd.ExecuteNonQuery();
                    con.Close();
                }


            }

        }
    }
}