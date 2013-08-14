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
    public partial class paymentType : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int paymentTypeID = -1;
            String description = String.Empty;
            int currencyCode = -1;
            char isCashPayment = '0';
            char isAssociateTheClient = '0';
            char isVisibleAtPOS = '0';
            char isPending = '0';
            int round = -1;
            int keepTheChange = -1;
            String bankCommission = String.Empty;
            String image = String.Empty;
            char isDisableOverPayment = '0';
            char isOpenCashDrawer = '0';
            char isLinkSoftwareForHotel = '0';
            char isApplicableWithOtherPaymentType = '0';
            String associatedDLL = String.Empty;

            DateTime createDate = DateTime.Now;
            int createUser = -1;
            int modifyUser = -1;

            String StatementType = String.Empty;

            if (!String.IsNullOrEmpty(Request.Form["paymentTypeID"])) { paymentTypeID = Int32.Parse(Request.Form["paymentTypeID"]); }
            if (!String.IsNullOrEmpty(Request.Form["description"])) { description = Request.Form["description"]; }
            if (!String.IsNullOrEmpty(Request.Form["currencyCode"])) { currencyCode = Int32.Parse(Request.Form["currencyCode"]); }
            if (!String.IsNullOrEmpty(Request.Form["isCashPayment"])) { isCashPayment = Char.Parse(Request.Form["isCashPayment"]); }
            if (!String.IsNullOrEmpty(Request.Form["isAssociateTheClient"])) { isAssociateTheClient = Char.Parse(Request.Form["isAssociateTheClient"]); }
            if (!String.IsNullOrEmpty(Request.Form["isVisibleAtPOS"])) { isVisibleAtPOS = Char.Parse(Request.Form["isVisibleAtPOS"]); }
            if (!String.IsNullOrEmpty(Request.Form["isPending"])) { isPending = Char.Parse(Request.Form["isPending"]); }
            if (!String.IsNullOrEmpty(Request.Form["round"])) { round = Int32.Parse(Request.Form["round"]); }
            if (!String.IsNullOrEmpty(Request.Form["keepTheChange"])) { keepTheChange = Int32.Parse(Request.Form["keepTheChange"]); }
            if (!String.IsNullOrEmpty(Request.Form["bankCommission"])) { bankCommission = Request.Form["bankCommission"]; }
            if (!String.IsNullOrEmpty(Request.Form["associatedDLL"])) { associatedDLL = Request.Form["associatedDLL"]; }
            if (!String.IsNullOrEmpty(Request.Form["isDisableOverPayment"])) { isDisableOverPayment = Char.Parse(Request.Form["isDisableOverPayment"]); }
            if (!String.IsNullOrEmpty(Request.Form["isOpenCashDrawer"])) { isOpenCashDrawer = Char.Parse(Request.Form["isOpenCashDrawer"]); }
            if (!String.IsNullOrEmpty(Request.Form["isLinkSoftwareForHotel"])) { isLinkSoftwareForHotel = Char.Parse(Request.Form["isLinkSoftwareForHotel"]); }
            if (!String.IsNullOrEmpty(Request.Form["isApplicableWithOtherPaymentType"])) { isApplicableWithOtherPaymentType = Char.Parse(Request.Form["isApplicableWithOtherPaymentType"]); }
            if (!String.IsNullOrEmpty(Request.Form["image"])) { image = Request.Form["image"]; }

            if (!String.IsNullOrEmpty(Request.Form["createUser"])) { createUser = Int32.Parse(Request.Form["createUser"]); }
            if (!String.IsNullOrEmpty(Request.Form["modifyUser"])) { modifyUser = Int32.Parse(Request.Form["modifyUser"]); }
            if (!String.IsNullOrEmpty(Request.Form["StatementType"])) { StatementType = Request.Form["StatementType"]; }


            //store in DB
            var DBConnectionString = ConfigurationManager.ConnectionStrings["POSDB"].ConnectionString;
            SqlConnection con = new SqlConnection(DBConnectionString);

            string sqlCmd = "paymentTypeSelectInsertUpdateDelete";
            int newID;
            using (SqlCommand cmd = new SqlCommand(sqlCmd, con))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                if (StatementType == "Insert")
                {
                    //cmd.Parameters.AddWithValue("@paymentTypeID", paymentTypeID);
                    cmd.Parameters.AddWithValue("@description", description);
                    cmd.Parameters.AddWithValue("@currencyCode", currencyCode);
                    cmd.Parameters.AddWithValue("@isCashPayment", isCashPayment);
                    cmd.Parameters.AddWithValue("@isAssociateTheClient", isAssociateTheClient);
                    cmd.Parameters.AddWithValue("@isVisibleAtPOS", isVisibleAtPOS);
                    cmd.Parameters.AddWithValue("@isPending", isPending);
                    cmd.Parameters.AddWithValue("@round", round);
                    cmd.Parameters.AddWithValue("@keepTheChange", keepTheChange);
                    cmd.Parameters.AddWithValue("@bankCommission", bankCommission);
                    cmd.Parameters.AddWithValue("@image", image);
                    cmd.Parameters.AddWithValue("@isDisableOverPayment", isDisableOverPayment);
                    cmd.Parameters.AddWithValue("@isOpenCashDrawer", isOpenCashDrawer);
                    cmd.Parameters.AddWithValue("@isLinkSoftwareForHotel", isLinkSoftwareForHotel);
                    cmd.Parameters.AddWithValue("@isApplicableWithOtherPaymentType", isApplicableWithOtherPaymentType);
                    cmd.Parameters.AddWithValue("@associatedDLL", associatedDLL);
                    
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
                    cmd.Parameters.AddWithValue("@paymentTypeID", paymentTypeID);
                    cmd.Parameters.AddWithValue("@description", description);
                    cmd.Parameters.AddWithValue("@currencyCode", currencyCode);
                    cmd.Parameters.AddWithValue("@isCashPayment", isCashPayment);
                    cmd.Parameters.AddWithValue("@isAssociateTheClient", isAssociateTheClient);
                    cmd.Parameters.AddWithValue("@isVisibleAtPOS", isVisibleAtPOS);
                    cmd.Parameters.AddWithValue("@isPending", isPending);
                    cmd.Parameters.AddWithValue("@round", round);
                    cmd.Parameters.AddWithValue("@keepTheChange", keepTheChange);
                    cmd.Parameters.AddWithValue("@bankCommission", bankCommission);
                    cmd.Parameters.AddWithValue("@image", image);
                    cmd.Parameters.AddWithValue("@isDisableOverPayment", isDisableOverPayment);
                    cmd.Parameters.AddWithValue("@isOpenCashDrawer", isOpenCashDrawer);
                    cmd.Parameters.AddWithValue("@isLinkSoftwareForHotel", isLinkSoftwareForHotel);
                    cmd.Parameters.AddWithValue("@isApplicableWithOtherPaymentType", isApplicableWithOtherPaymentType);
                    cmd.Parameters.AddWithValue("@associatedDLL", associatedDLL);

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
                    cmd.Parameters.AddWithValue("@paymentTypeID", paymentTypeID);
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