using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace pos.ajax
{
    public partial class employee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int employeeID = -1;
            String userName = String.Empty;
            String displayName = String.Empty;
            String firstName = String.Empty;
            String lastName = String.Empty;
            int employeeLevel = -1;
            String salesPassword = String.Empty;
            String clockinPassword = String.Empty;
            int employeeRole = -1;
            int locked = -1;
            int active = -1;
            String image = String.Empty;
            String language = String.Empty;
            String location = String.Empty;

            String organization = String.Empty;
            String pobox = String.Empty;
            String addr1 = String.Empty;
            String addr2 = String.Empty;
            String city = String.Empty;
            String state = String.Empty;
            String country = String.Empty;
            String landline = String.Empty;
            String mobile1 = String.Empty;
            String mobile2 = String.Empty;
            String birthdate = String.Empty;
            String anniversary = String.Empty;
            String wife = String.Empty;
            String child1 = String.Empty;
            String child2 = String.Empty;

            String emailID = String.Empty;
            String mailServerID = String.Empty;
            String emailUserName = String.Empty;
            String emailPassword = String.Empty;


            DateTime createDate = DateTime.Now;
            int createUser = -1;
            int modifyUser = -1;

            String StatementType = String.Empty;

            if (!String.IsNullOrEmpty(Request.Form["employeeID"])) { employeeID = Int32.Parse(Request.Form["employeeID"]); }
            if (!String.IsNullOrEmpty(Request.Form["userName"])) { userName = Request.Form["userName"]; }
            if (!String.IsNullOrEmpty(Request.Form["displayName"])) { displayName = Request.Form["displayName"]; }
            if (!String.IsNullOrEmpty(Request.Form["firstName"])) { firstName = Request.Form["firstName"]; }
            if (!String.IsNullOrEmpty(Request.Form["lastName"])) { lastName = Request.Form["lastName"]; }
            if (!String.IsNullOrEmpty(Request.Form["employeeLevel"])) { employeeLevel = Int32.Parse(Request.Form["employeeLevel"]); }
            if (!String.IsNullOrEmpty(Request.Form["salesPassword"])) { salesPassword = Request.Form["salesPassword"]; }
            if (!String.IsNullOrEmpty(Request.Form["clockinPassword"])) { clockinPassword = Request.Form["clockinPassword"]; }
            if (!String.IsNullOrEmpty(Request.Form["employeeRole"])) { employeeRole = Int32.Parse(Request.Form["employeeRole"]); }
            if (!String.IsNullOrEmpty(Request.Form["locked"])) { locked = Int32.Parse(Request.Form["locked"]); }
            if (!String.IsNullOrEmpty(Request.Form["active"])) { active = Int32.Parse(Request.Form["active"]); }
            if (!String.IsNullOrEmpty(Request.Form["image"])) { image = Request.Form["image"]; }
            if (!String.IsNullOrEmpty(Request.Form["language"])) { language = Request.Form["language"]; }
            if (!String.IsNullOrEmpty(Request.Form["location"])) { location = Request.Form["location"]; }

            if (!String.IsNullOrEmpty(Request.Form["organization"])) { organization = Request.Form["organization"]; }
            if (!String.IsNullOrEmpty(Request.Form["pobox"])) { pobox = Request.Form["pobox"]; }
            if (!String.IsNullOrEmpty(Request.Form["addr1"])) { addr1 = Request.Form["addr1"]; }
            if (!String.IsNullOrEmpty(Request.Form["addr2"])) { addr2 = Request.Form["addr2"]; }
            if (!String.IsNullOrEmpty(Request.Form["city"])) { city = Request.Form["city"]; }
            if (!String.IsNullOrEmpty(Request.Form["state"])) { state = Request.Form["state"]; }
            if (!String.IsNullOrEmpty(Request.Form["country"])) { country = Request.Form["country"]; }
            if (!String.IsNullOrEmpty(Request.Form["landline"])) { landline = Request.Form["landline"]; }
            if (!String.IsNullOrEmpty(Request.Form["mobile1"])) { mobile1 = Request.Form["mobile1"]; }
            if (!String.IsNullOrEmpty(Request.Form["mobile2"])) { mobile2 = Request.Form["mobile2"]; }
            if (!String.IsNullOrEmpty(Request.Form["birthdate"])) { birthdate = Request.Form["birthdate"]; }
            if (!String.IsNullOrEmpty(Request.Form["anniversary"])) { anniversary = Request.Form["anniversary"]; }
            if (!String.IsNullOrEmpty(Request.Form["wife"])) { wife = Request.Form["wife"]; }
            if (!String.IsNullOrEmpty(Request.Form["child1"])) { child1 = Request.Form["child1"]; }
            if (!String.IsNullOrEmpty(Request.Form["child2"])) { child2 = Request.Form["child2"]; }

            if (!String.IsNullOrEmpty(Request.Form["emailID"])) { emailID = Request.Form["emailID"]; }
            if (!String.IsNullOrEmpty(Request.Form["mailServerID"])) { mailServerID = Request.Form["mailServerID"]; }
            if (!String.IsNullOrEmpty(Request.Form["emailUserName"])) { emailUserName = Request.Form["emailUserName"]; }
            if (!String.IsNullOrEmpty(Request.Form["emailPassword"])) { emailPassword = Request.Form["emailPassword"]; }


            if (!String.IsNullOrEmpty(Request.Form["createUser"])) { createUser = Int32.Parse(Request.Form["createUser"]); }
            if (!String.IsNullOrEmpty(Request.Form["modifyUser"])) { modifyUser = Int32.Parse(Request.Form["modifyUser"]); }
            if (!String.IsNullOrEmpty(Request.Form["StatementType"])) { StatementType = Request.Form["StatementType"]; }


            //store in DB
            var DBConnectionString = ConfigurationManager.ConnectionStrings["POSDB"].ConnectionString;
            SqlConnection con = new SqlConnection(DBConnectionString);

            string sqlCmd = "employeeSelectInsertUpdateDelete";
            int newID;
            using (SqlCommand cmd = new SqlCommand(sqlCmd, con))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                if (StatementType == "Insert")
                {
                    //cmd.Parameters.AddWithValue("@employeeID", employeeID);
                    cmd.Parameters.AddWithValue("@userName", userName);
                    cmd.Parameters.AddWithValue("@displayName", displayName);
                    cmd.Parameters.AddWithValue("@firstName", firstName);
                    cmd.Parameters.AddWithValue("@lastName", lastName);
                    cmd.Parameters.AddWithValue("@employeeLevel", employeeLevel);
                    cmd.Parameters.AddWithValue("@salesPassword", salesPassword);
                    cmd.Parameters.AddWithValue("@clockinPassword", clockinPassword);
                    cmd.Parameters.AddWithValue("@employeeRole", employeeRole);
                    cmd.Parameters.AddWithValue("@locked", locked);
                    cmd.Parameters.AddWithValue("@active", active);
                    cmd.Parameters.AddWithValue("@image", image);
                    cmd.Parameters.AddWithValue("@language", language);
                    cmd.Parameters.AddWithValue("@location", location);

                    cmd.Parameters.AddWithValue("@organization", organization);
                    cmd.Parameters.AddWithValue("@pobox", pobox);
                    cmd.Parameters.AddWithValue("@addr1", addr1);
                    cmd.Parameters.AddWithValue("@addr2", addr2);
                    cmd.Parameters.AddWithValue("@city", city);
                    cmd.Parameters.AddWithValue("@state", state);
                    cmd.Parameters.AddWithValue("@country", country);
                    cmd.Parameters.AddWithValue("@landline", landline);
                    cmd.Parameters.AddWithValue("@mobile1", mobile1);
                    cmd.Parameters.AddWithValue("@mobile2", mobile2);
                    cmd.Parameters.AddWithValue("@birthdate", birthdate);
                    cmd.Parameters.AddWithValue("@anniversary", anniversary);
                    cmd.Parameters.AddWithValue("@wife", wife);
                    cmd.Parameters.AddWithValue("@child1", child1);
                    cmd.Parameters.AddWithValue("@child2", child2);

                    cmd.Parameters.AddWithValue("@emailID", emailID);
                    cmd.Parameters.AddWithValue("@mailServerID", mailServerID);
                    cmd.Parameters.AddWithValue("@emailUserName", emailUserName);
                    cmd.Parameters.AddWithValue("@emailPassword", emailPassword);

                    //cmd.Parameters.AddWithValue("@createDate", createDate);
                    cmd.Parameters.AddWithValue("@createUser", createUser);
                    cmd.Parameters.AddWithValue("@modifyUser", modifyUser);
                    cmd.Parameters.AddWithValue("@StatementType", "Insert");

                    cmd.Parameters.Add("@NewId", SqlDbType.Int).Direction = ParameterDirection.Output;

                    try
                    {
                        con.Open();
                        int result = cmd.ExecuteNonQuery();
                        con.Close();
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine(ex);
                    }
                    newID = Convert.ToInt32(cmd.Parameters["@NewId"].Value);
                    Response.Write(newID);
                }
                else if (StatementType == "Update")
                {
                    cmd.Parameters.AddWithValue("@employeeID", employeeID);
                    cmd.Parameters.AddWithValue("@userName", userName);
                    cmd.Parameters.AddWithValue("@displayName", displayName);
                    cmd.Parameters.AddWithValue("@firstName", firstName);
                    cmd.Parameters.AddWithValue("@lastName", lastName);
                    cmd.Parameters.AddWithValue("@employeeLevel", employeeLevel);
                    cmd.Parameters.AddWithValue("@salesPassword", salesPassword);
                    cmd.Parameters.AddWithValue("@clockinPassword", clockinPassword);
                    cmd.Parameters.AddWithValue("@employeeRole", employeeRole);
                    cmd.Parameters.AddWithValue("@locked", locked);
                    cmd.Parameters.AddWithValue("@active", active);
                    cmd.Parameters.AddWithValue("@image", image);
                    cmd.Parameters.AddWithValue("@language", language);
                    cmd.Parameters.AddWithValue("@location", location);

                    cmd.Parameters.AddWithValue("@organization", organization);
                    cmd.Parameters.AddWithValue("@pobox", pobox);
                    cmd.Parameters.AddWithValue("@addr1", addr1);
                    cmd.Parameters.AddWithValue("@addr2", addr2);
                    cmd.Parameters.AddWithValue("@city", city);
                    cmd.Parameters.AddWithValue("@state", state);
                    cmd.Parameters.AddWithValue("@country", country);
                    cmd.Parameters.AddWithValue("@landline", landline);
                    cmd.Parameters.AddWithValue("@mobile1", mobile1);
                    cmd.Parameters.AddWithValue("@mobile2", mobile2);
                    cmd.Parameters.AddWithValue("@birthdate", birthdate);
                    cmd.Parameters.AddWithValue("@anniversary", anniversary);
                    cmd.Parameters.AddWithValue("@wife", wife);
                    cmd.Parameters.AddWithValue("@child1", child1);
                    cmd.Parameters.AddWithValue("@child2", child2);

                    cmd.Parameters.AddWithValue("@emailID", emailID);
                    cmd.Parameters.AddWithValue("@mailServerID", mailServerID);
                    cmd.Parameters.AddWithValue("@emailUserName", emailUserName);
                    cmd.Parameters.AddWithValue("@emailPassword", emailPassword);

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
                    cmd.Parameters.AddWithValue("@employeeID", employeeID);
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