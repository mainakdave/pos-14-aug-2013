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

using System.Xml.Linq;
using System.Reflection;

namespace POS.views
{
    public partial class taxGroup : System.Web.UI.Page
    {
        public static string parameter = null;

        public static DataSet myDS = null;    
        public static ListView myList = null;
        public static TextBox myTextBox = null;

            protected void Page_Load(object sender, EventArgs e)
            {
                myList = lstvTaxGroup;
                myTextBox = nextID;

                if (!this.IsPostBack)
                {
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
                            case "taxGroupName":
                                myDS.Tables[0].DefaultView.RowFilter = searchBy.Trim() + " like '*" + searchKeyword.Trim() + "*'";
                                break;

                            case "taxGroupID":
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


            public void DrpListLoad()
            {
                // country Dropdownlist
                string relPath = "~/country_state.xml";
                string absPath = Server.MapPath(relPath);
                XDocument xDoc = XDocument.Load(absPath);

                var countries = from xEle 
                                in xDoc.Descendants("country")
                                select xEle.Attribute("name").Value;

                foreach (var countryName in countries)
                {
                    country.Items.Add(countryName.ToString());
                }
                country.Items.Insert(0, new ListItem("Select One", "-1"));

                // state Dropdownlist
                var states = from xEle 
                             in xDoc.Descendants("state")
                             select xEle.Value;

                foreach (var stateName in states)
                {
                    state.Items.Add(stateName.ToString());
                }
                state.Items.Insert(0, new ListItem("Select One", "-1"));


                string DBConnectionString = ConfigurationManager.ConnectionStrings["POSDB"].ConnectionString;
                SqlConnection con = new SqlConnection(DBConnectionString);

                // modifier DropdownList
                string sqlCmd = "select * from serviceType";
                using (SqlCommand cmd = new SqlCommand(sqlCmd, con))
                {
                    SqlDataAdapter adpt = new SqlDataAdapter(cmd);
                    DataSet ds = new DataSet();

                    con.Open();
                    adpt.Fill(ds);
                    con.Close();

                    serviceType.DataSource = ds.Tables[0];
                    serviceType.DataValueField = "serviceTypeID";
                    serviceType.DataTextField = "serviceType";
                    serviceType.DataBind();
                    serviceType.Items.Insert(0, new ListItem("Select One", "-1"));
                }

                // item DropdownList
                sqlCmd = "taxTypeSelectInsertUpdateDelete";
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

                    taxType.DataSource = ds.Tables[0];
                    taxType.DataValueField = "taxTypeID";
                    taxType.DataTextField = "description";
                    taxType.DataBind();
                    taxType.Items.Insert(0, new ListItem("Select One", "-1"));
                }
            }

            public static void ListLoad()
            {
                myList.Items.Clear();

                string DBConnectionString = ConfigurationManager.ConnectionStrings["POSDB"].ConnectionString;
                SqlConnection con = new SqlConnection(DBConnectionString);

                string sqlCmd = "taxGroupSelectInsertUpdateDelete";
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

            protected void country_SelectedIndexChanged(object sender, EventArgs e)
            {
                string countryName = country.SelectedValue;

                // state Dropdownlist
                string relPath = "~/country_state.xml";
                string absPath = Server.MapPath(relPath);
                XDocument xDoc = XDocument.Load(absPath);

                var states = from xEle
                             in xDoc.Descendants("state")
                             where xEle.Parent.FirstAttribute.Value == countryName
                             select xEle.Value;
                
                state.Items.Clear();

                foreach (var stateName in states)
                {
                    state.Items.Add(stateName.ToString());
                }
                state.Items.Insert(0, new ListItem("Select One", "-1"));
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