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
    public partial class currency : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int currencyID = -1;
            String description = String.Empty;
            char isMain = '0';
            int decimalsQuantity = -1;
            String initials = String.Empty;
            String ISOCurrencyCode = String.Empty;
            float defaultExchangeRate = -1;
            char isReturnGivenInMainCurrency = '0';
            char isApplyExchangeRateByDefault = '0';
            char isShowInitialInFrontOfTotal = '0';
            String image = String.Empty;
            
            DateTime createDate = DateTime.Now;
            int createUser = -1;
            int modifyUser = -1;

            String StatementType = String.Empty;

            if (!String.IsNullOrEmpty(Request.Form["currencyID"])) { currencyID = Int32.Parse(Request.Form["currencyID"]); }
            if (!String.IsNullOrEmpty(Request.Form["description"])) { description = Request.Form["description"]; }
            if (!String.IsNullOrEmpty(Request.Form["isMain"])) { isMain = Char.Parse(Request.Form["isMain"]); }
            if (!String.IsNullOrEmpty(Request.Form["decimalsQuantity"])) { decimalsQuantity = Int32.Parse(Request.Form["decimalsQuantity"]); }
            if (!String.IsNullOrEmpty(Request.Form["initials"])) { initials = Request.Form["initials"]; }
            if (!String.IsNullOrEmpty(Request.Form["ISOCurrencyCode"])) { ISOCurrencyCode = Request.Form["ISOCurrencyCode"]; }
            if (!String.IsNullOrEmpty(Request.Form["defaultExchangeRate"])) { defaultExchangeRate = float.Parse(Request.Form["defaultExchangeRate"]); }

            if (!String.IsNullOrEmpty(Request.Form["isReturnGivenInMainCurrency"])) { isReturnGivenInMainCurrency = Char.Parse(Request.Form["isReturnGivenInMainCurrency"]); }
            if (!String.IsNullOrEmpty(Request.Form["isApplyExchangeRateByDefault"])) { isApplyExchangeRateByDefault = Char.Parse(Request.Form["isApplyExchangeRateByDefault"]); }
            if (!String.IsNullOrEmpty(Request.Form["isShowInitialInFrontOfTotal"])) { isShowInitialInFrontOfTotal = Char.Parse(Request.Form["isShowInitialInFrontOfTotal"]); }
            if (!String.IsNullOrEmpty(Request.Form["image"])) { image = Request.Form["image"]; }
            
            if (!String.IsNullOrEmpty(Request.Form["createUser"])) { createUser = Int32.Parse(Request.Form["createUser"]); }
            if (!String.IsNullOrEmpty(Request.Form["modifyUser"])) { modifyUser = Int32.Parse(Request.Form["modifyUser"]); }
            if (!String.IsNullOrEmpty(Request.Form["StatementType"])) { StatementType = Request.Form["StatementType"]; }


            //store in DB
            var DBConnectionString = ConfigurationManager.ConnectionStrings["POSDB"].ConnectionString;
            SqlConnection con = new SqlConnection(DBConnectionString);

            string sqlCmd = "currencySelectInsertUpdateDelete";
            int newID;
            using (SqlCommand cmd = new SqlCommand(sqlCmd, con))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                if (StatementType == "Insert")
                {
                    //cmd.Parameters.AddWithValue("@currencyID", currencyID);
                    cmd.Parameters.AddWithValue("@description", description);
                    cmd.Parameters.AddWithValue("@isMain", isMain);
                    cmd.Parameters.AddWithValue("@decimalsQuantity", decimalsQuantity);
                    cmd.Parameters.AddWithValue("@initials", initials);
                    cmd.Parameters.AddWithValue("@ISOCurrencyCode", ISOCurrencyCode);
                    cmd.Parameters.AddWithValue("@defaultExchangeRate", defaultExchangeRate);
                    cmd.Parameters.AddWithValue("@isReturnGivenInMainCurrency", isReturnGivenInMainCurrency);
                    cmd.Parameters.AddWithValue("@isApplyExchangeRateByDefault", isApplyExchangeRateByDefault);
                    cmd.Parameters.AddWithValue("@isShowInitialInFrontOfTotal", isShowInitialInFrontOfTotal);
                    cmd.Parameters.AddWithValue("@image", image);
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
                    cmd.Parameters.AddWithValue("@currencyID", currencyID);
                    cmd.Parameters.AddWithValue("@description", description);
                    cmd.Parameters.AddWithValue("@isMain", isMain);
                    cmd.Parameters.AddWithValue("@decimalsQuantity", decimalsQuantity);
                    cmd.Parameters.AddWithValue("@initials", initials);
                    cmd.Parameters.AddWithValue("@ISOCurrencyCode", ISOCurrencyCode);
                    cmd.Parameters.AddWithValue("@defaultExchangeRate", defaultExchangeRate);
                    cmd.Parameters.AddWithValue("@isReturnGivenInMainCurrency", isReturnGivenInMainCurrency);
                    cmd.Parameters.AddWithValue("@isApplyExchangeRateByDefault", isApplyExchangeRateByDefault);
                    cmd.Parameters.AddWithValue("@isShowInitialInFrontOfTotal", isShowInitialInFrontOfTotal);
                    cmd.Parameters.AddWithValue("@image", image);
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
                    cmd.Parameters.AddWithValue("@currencyID", currencyID);
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