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
    public partial class item : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int itemID = -1;
            String itemName = String.Empty;
            String reference = String.Empty;
            String description = String.Empty;
            String shortDescription = String.Empty;
            int deptID = -1;
            int sectionID = -1;
            int familyID = -1;
            int brandID = -1;
            int lineID = -1;
            String isStockItem = "0";
            String discontinue = "0";
            String stockMeasure = String.Empty;
            float stockMeasureUnit = -1;
            String purchaseMeasure = String.Empty;
            float purchaseMeasureUnit = -1;
            String saleMeasure = String.Empty;
            float saleMeasureUnit = -1;
            int itemType = -1;
            String itemClass = String.Empty;
            String saleAccount = String.Empty;
            String purchaseAccount = String.Empty;
            String costOfSaleAccount = String.Empty;
            String saleReturnAccount = String.Empty;
            String purchaseReturnAccount = String.Empty;
            String visibleOnWeb = String.Empty;
            String season = String.Empty;
            String characteristics = String.Empty;
            int warningID = -1;

            String allUser = String.Empty;
            int users = -1;
            String warningMessage = String.Empty;

            int itemPicID = -1;
            String referencePic = String.Empty;
            String descriptionPic = String.Empty;

            int itemRestID = -1;
            String byPortion = String.Empty;
            String visibleSales = String.Empty;
            int orderNo = -1;
            String isMenu = String.Empty;
            String freePrice = String.Empty;
            float freeMin = 0;
            float freeMax = 0;
            int couponCode = -1;
            String shortcut = String.Empty;
            String bgColor = String.Empty;
            String textColor = String.Empty;
            String yield = String.Empty;

            DateTime createDate = DateTime.Now;
            int createUser = -1;
            int modifyUser = -1;

            String StatementType = String.Empty;

            if (!String.IsNullOrEmpty(Request.Form["itemID"])) { itemID = Int32.Parse(Request.Form["itemID"]); }
            if (!String.IsNullOrEmpty(Request.Form["itemName"])) { itemName = Request.Form["itemName"]; }
            if (!String.IsNullOrEmpty(Request.Form["reference"])) { reference = Request.Form["reference"]; }
            if (!String.IsNullOrEmpty(Request.Form["description"])) { description = Request.Form["description"]; }
            if (!String.IsNullOrEmpty(Request.Form["shortDescription"])) { shortDescription = Request.Form["shortDescription"]; }
            if (!String.IsNullOrEmpty(Request.Form["deptID"])) { deptID = Int32.Parse(Request.Form["deptID"]); }
            if (!String.IsNullOrEmpty(Request.Form["sectionID"])) { sectionID = Int32.Parse(Request.Form["sectionID"]); }
            if (!String.IsNullOrEmpty(Request.Form["familyID"])) { familyID = Int32.Parse(Request.Form["familyID"]); }
            if (!String.IsNullOrEmpty(Request.Form["brandID"])) { brandID = Int32.Parse(Request.Form["brandID"]); }
            if (!String.IsNullOrEmpty(Request.Form["lineID"])) { lineID = Int32.Parse(Request.Form["lineID"]); }
            if (!String.IsNullOrEmpty(Request.Form["isStockItem"])) { isStockItem = Request.Form["isStockItem"]; }
            if (!String.IsNullOrEmpty(Request.Form["discontinue"])) { discontinue = Request.Form["discontinue"]; }
            if (!String.IsNullOrEmpty(Request.Form["stockMeasure"])) { stockMeasure = Request.Form["stockMeasure"]; }
            if (!String.IsNullOrEmpty(Request.Form["stockMeasureUnit"])) { stockMeasureUnit = float.Parse(Request.Form["stockMeasureUnit"]); }
            if (!String.IsNullOrEmpty(Request.Form["purchaseMeasure"])) { purchaseMeasure = Request.Form["purchaseMeasure"]; }
            if (!String.IsNullOrEmpty(Request.Form["purchaseMeasureUnit"])) { purchaseMeasureUnit = float.Parse(Request.Form["purchaseMeasureUnit"]); }
            if (!String.IsNullOrEmpty(Request.Form["saleMeasure"])) { saleMeasure = Request.Form["saleMeasure"]; }
            if (!String.IsNullOrEmpty(Request.Form["saleMeasureUnit"])) { saleMeasureUnit = float.Parse(Request.Form["saleMeasureUnit"]); }
            if (!String.IsNullOrEmpty(Request.Form["itemType"])) { itemType = Int32.Parse(Request.Form["itemType"]); }
            if (!String.IsNullOrEmpty(Request.Form["itemClass"])) { itemClass = Request.Form["itemClass"]; }
            if (!String.IsNullOrEmpty(Request.Form["saleAccount"])) { saleAccount = Request.Form["saleAccount"]; }
            if (!String.IsNullOrEmpty(Request.Form["purchaseAccount"])) { purchaseAccount = Request.Form["purchaseAccount"]; }
            if (!String.IsNullOrEmpty(Request.Form["costOfSaleAccount"])) { costOfSaleAccount = Request.Form["costOfSaleAccount"]; }
            if (!String.IsNullOrEmpty(Request.Form["saleReturnAccount"])) { saleReturnAccount = Request.Form["saleReturnAccount"]; }
            if (!String.IsNullOrEmpty(Request.Form["purchaseReturnAccount"])) { purchaseReturnAccount = Request.Form["purchaseReturnAccount"]; }
            if (!String.IsNullOrEmpty(Request.Form["visibleOnWeb"])) { visibleOnWeb = Request.Form["visibleOnWeb"]; }
            if (!String.IsNullOrEmpty(Request.Form["season"])) { season = Request.Form["season"]; }
            if (!String.IsNullOrEmpty(Request.Form["characteristics"])) { characteristics = Request.Form["characteristics"]; }
            if (!String.IsNullOrEmpty(Request.Form["warningID"])) { warningID = Int32.Parse(Request.Form["warningID"]); }

            if (!String.IsNullOrEmpty(Request.Form["allUser"])) { allUser = Request.Form["allUser"]; }
            if (!String.IsNullOrEmpty(Request.Form["users"])) { users = Int32.Parse(Request.Form["users"]); }
            if (!String.IsNullOrEmpty(Request.Form["warningMessage"])) { warningMessage = Request.Form["warningMessage"]; }

            if (!String.IsNullOrEmpty(Request.Form["itemPicID"])) { itemPicID = Int32.Parse(Request.Form["itemPicID"]); }
            if (!String.IsNullOrEmpty(Request.Form["reference"])) { reference = Request.Form["reference"]; }
            if (!String.IsNullOrEmpty(Request.Form["description"])) { description = Request.Form["description"]; }

            if (!String.IsNullOrEmpty(Request.Form["itemRestID"])) { itemRestID = Int32.Parse(Request.Form["itemRestID"]); }
            if (!String.IsNullOrEmpty(Request.Form["byPortion"])) { byPortion = Request.Form["byPortion"]; }
            if (!String.IsNullOrEmpty(Request.Form["visibleSales"])) { visibleSales = Request.Form["visibleSales"]; }
            if (!String.IsNullOrEmpty(Request.Form["orderNo"])) { orderNo = Int32.Parse(Request.Form["orderNo"]); }
            if (!String.IsNullOrEmpty(Request.Form["isMenu"])) { isMenu = Request.Form["isMenu"]; }
            if (!String.IsNullOrEmpty(Request.Form["freePrice"])) { freePrice = Request.Form["freePrice"]; }
            if (!String.IsNullOrEmpty(Request.Form["freeMin"])) { freeMin = float.Parse(Request.Form["freeMin"]); }
            if (!String.IsNullOrEmpty(Request.Form["freeMax"])) { freeMax = float.Parse(Request.Form["freeMax"]); }
            if (!String.IsNullOrEmpty(Request.Form["couponCode"])) { couponCode = Int32.Parse(Request.Form["couponCode"]); }
            if (!String.IsNullOrEmpty(Request.Form["shortcut"])) { shortcut = Request.Form["shortcut"]; }
            if (!String.IsNullOrEmpty(Request.Form["bgColor"])) { bgColor = Request.Form["bgColor"]; }
            if (!String.IsNullOrEmpty(Request.Form["textColor"])) { textColor = Request.Form["textColor"]; }
            if (!String.IsNullOrEmpty(Request.Form["yield"])) { yield = Request.Form["yield"]; }

            if (!String.IsNullOrEmpty(Request.Form["createUser"])) { createUser = Int32.Parse(Request.Form["createUser"]); }
            if (!String.IsNullOrEmpty(Request.Form["modifyUser"])) { modifyUser = Int32.Parse(Request.Form["modifyUser"]); }
            if (!String.IsNullOrEmpty(Request.Form["StatementType"])) { StatementType = Request.Form["StatementType"]; }

            //store in DB
            var DBConnectionString = ConfigurationManager.ConnectionStrings["POSDB"].ConnectionString;
            SqlConnection con = new SqlConnection(DBConnectionString);

            string sqlCmd = "itemSelectInsertUpdateDelete";
            int newID, newPicID;
            using (SqlCommand cmd = new SqlCommand(sqlCmd, con))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                if (StatementType == "Insert")
                {
                    cmd.Parameters.AddWithValue("@itemName", itemName);
                    cmd.Parameters.AddWithValue("@reference", reference);
                    cmd.Parameters.AddWithValue("@description", description);
                    cmd.Parameters.AddWithValue("@shortDescription", shortDescription);
                    cmd.Parameters.AddWithValue("@deptID", deptID);
                    cmd.Parameters.AddWithValue("@sectionID", sectionID);
                    cmd.Parameters.AddWithValue("@familyID", familyID);
                    cmd.Parameters.AddWithValue("@brandID", brandID);
                    cmd.Parameters.AddWithValue("@lineID", lineID);
                    cmd.Parameters.AddWithValue("@isStockItem", isStockItem);
                    cmd.Parameters.AddWithValue("@discontinue", discontinue);
                    cmd.Parameters.AddWithValue("@stockMeasure", stockMeasure);
                    cmd.Parameters.AddWithValue("@stockMeasureUnit", stockMeasureUnit);
                    cmd.Parameters.AddWithValue("@purchaseMeasure", purchaseMeasure);
                    cmd.Parameters.AddWithValue("@purchaseMeasureUnit", purchaseMeasureUnit);
                    cmd.Parameters.AddWithValue("@saleMeasure", saleMeasure);
                    cmd.Parameters.AddWithValue("@saleMeasureUnit", saleMeasureUnit);
                    cmd.Parameters.AddWithValue("@itemType", itemType);
                    cmd.Parameters.AddWithValue("@itemClass", itemClass);
                    cmd.Parameters.AddWithValue("@saleAccount", saleAccount);
                    cmd.Parameters.AddWithValue("@purchaseAccount", purchaseAccount);
                    cmd.Parameters.AddWithValue("@costOfSaleAccount", costOfSaleAccount);
                    cmd.Parameters.AddWithValue("@saleReturnAccount", saleReturnAccount);
                    cmd.Parameters.AddWithValue("@purchaseReturnAccount", purchaseReturnAccount);
                    cmd.Parameters.AddWithValue("@visibleOnWeb", visibleOnWeb);
                    cmd.Parameters.AddWithValue("@season", season);
                    cmd.Parameters.AddWithValue("@characteristics", characteristics);
                    cmd.Parameters.AddWithValue("@warningID", warningID);

                    cmd.Parameters.AddWithValue("@allUser", allUser);
                    cmd.Parameters.AddWithValue("@users", users);
                    cmd.Parameters.AddWithValue("@warningMessage", warningMessage);

                    cmd.Parameters.AddWithValue("@referencePic", reference);
                    cmd.Parameters.AddWithValue("@descriptionPic", description);

                    //cmd.Parameters.AddWithValue("@itemRestID", itemRestID);
                    cmd.Parameters.AddWithValue("@byPortion", byPortion);
                    cmd.Parameters.AddWithValue("@visibleSales", visibleSales);
                    cmd.Parameters.AddWithValue("@orderNo", orderNo);
                    cmd.Parameters.AddWithValue("@isMenu", isMenu);
                    cmd.Parameters.AddWithValue("@freePrice", freePrice);
                    cmd.Parameters.AddWithValue("@freeMin", freeMin);
                    cmd.Parameters.AddWithValue("@freeMax", freeMax);
                    cmd.Parameters.AddWithValue("@couponCode", couponCode);
                    cmd.Parameters.AddWithValue("@shortcut", shortcut);
                    cmd.Parameters.AddWithValue("@bgColor", bgColor);
                    cmd.Parameters.AddWithValue("@textColor", textColor);
                    cmd.Parameters.AddWithValue("@yield", yield);

                    cmd.Parameters.AddWithValue("@createUser", createUser);
                    cmd.Parameters.AddWithValue("@modifyUser", modifyUser);
                    cmd.Parameters.AddWithValue("@StatementType", "Insert");

                    cmd.Parameters.Add("@NewId", SqlDbType.Int).Direction = ParameterDirection.Output;
                    cmd.Parameters.Add("@NewPicId", SqlDbType.Int).Direction = ParameterDirection.Output;

                    con.Open();
                    int result = cmd.ExecuteNonQuery();
                    con.Close();

                    newID = Convert.ToInt32(cmd.Parameters["@NewId"].Value);
                    newPicID = Convert.ToInt32(cmd.Parameters["@NewPicId"].Value);
                    Response.Write(newID.ToString() + ":;:" + newPicID.ToString());
                }
                else if (StatementType == "Update")
                {
                    cmd.Parameters.AddWithValue("@itemID", itemID);
                    cmd.Parameters.AddWithValue("@itemName", itemName);
                    cmd.Parameters.AddWithValue("@reference", reference);
                    cmd.Parameters.AddWithValue("@description", description);
                    cmd.Parameters.AddWithValue("@shortDescription", shortDescription);
                    cmd.Parameters.AddWithValue("@deptID", deptID);
                    cmd.Parameters.AddWithValue("@sectionID", sectionID);
                    cmd.Parameters.AddWithValue("@familyID", familyID);
                    cmd.Parameters.AddWithValue("@brandID", brandID);
                    cmd.Parameters.AddWithValue("@lineID", lineID);
                    cmd.Parameters.AddWithValue("@isStockItem", isStockItem);
                    cmd.Parameters.AddWithValue("@discontinue", discontinue);
                    cmd.Parameters.AddWithValue("@stockMeasure", stockMeasure);
                    cmd.Parameters.AddWithValue("@stockMeasureUnit", stockMeasureUnit);
                    cmd.Parameters.AddWithValue("@purchaseMeasure", purchaseMeasure);
                    cmd.Parameters.AddWithValue("@purchaseMeasureUnit", purchaseMeasureUnit);
                    cmd.Parameters.AddWithValue("@saleMeasure", saleMeasure);
                    cmd.Parameters.AddWithValue("@saleMeasureUnit", saleMeasureUnit);
                    cmd.Parameters.AddWithValue("@itemType", itemType);
                    cmd.Parameters.AddWithValue("@itemClass", itemClass);
                    cmd.Parameters.AddWithValue("@saleAccount", saleAccount);
                    cmd.Parameters.AddWithValue("@purchaseAccount", purchaseAccount);
                    cmd.Parameters.AddWithValue("@costOfSaleAccount", costOfSaleAccount);
                    cmd.Parameters.AddWithValue("@saleReturnAccount", saleReturnAccount);
                    cmd.Parameters.AddWithValue("@purchaseReturnAccount", purchaseReturnAccount);
                    cmd.Parameters.AddWithValue("@visibleOnWeb", visibleOnWeb);
                    cmd.Parameters.AddWithValue("@season", season);
                    cmd.Parameters.AddWithValue("@characteristics", characteristics);
                    cmd.Parameters.AddWithValue("@warningID", warningID);

                    cmd.Parameters.AddWithValue("@allUser", allUser);
                    cmd.Parameters.AddWithValue("@users", users);
                    cmd.Parameters.AddWithValue("@warningMessage", warningMessage);

                    cmd.Parameters.AddWithValue("@itemPicID", itemPicID);
                    cmd.Parameters.AddWithValue("@itemID", itemID);
                    cmd.Parameters.AddWithValue("@referencePic", reference);
                    cmd.Parameters.AddWithValue("@descriptionPic", description);

                    cmd.Parameters.AddWithValue("@itemRestID", itemRestID);
                    cmd.Parameters.AddWithValue("@itemID", itemID);
                    cmd.Parameters.AddWithValue("@byPortion", byPortion);
                    cmd.Parameters.AddWithValue("@visibleSales", visibleSales);
                    cmd.Parameters.AddWithValue("@orderNo", orderNo);
                    cmd.Parameters.AddWithValue("@isMenu", isMenu);
                    cmd.Parameters.AddWithValue("@freePrice", freePrice);
                    cmd.Parameters.AddWithValue("@freeMin", freeMin);
                    cmd.Parameters.AddWithValue("@freeMax", freeMax);
                    cmd.Parameters.AddWithValue("@couponCode", couponCode);
                    cmd.Parameters.AddWithValue("@shortcut", shortcut);
                    cmd.Parameters.AddWithValue("@bgColor", bgColor);
                    cmd.Parameters.AddWithValue("@textColor", textColor);
                    cmd.Parameters.AddWithValue("@yield", yield);

                    cmd.Parameters.AddWithValue("@modifyUser", modifyUser);
                    cmd.Parameters.AddWithValue("@StatementType", "Update");

                    cmd.Parameters.AddWithValue("@NewId", -1);
                    cmd.Parameters.AddWithValue("@NewPicId", -1);

                    con.Open();
                    int result = cmd.ExecuteNonQuery();
                    con.Close();

                    Response.Write(itemID.ToString() + ":;:" + itemPicID.ToString());
                }
                else if (StatementType == "Delete")
                {
                    cmd.Parameters.AddWithValue("@itemID", itemID);
                    cmd.Parameters.AddWithValue("@warningID", warningID);
                    cmd.Parameters.AddWithValue("@itemPicID", itemPicID);
                    cmd.Parameters.AddWithValue("@itemRestID", itemRestID);
                    cmd.Parameters.AddWithValue("@StatementType", "Delete");

                    cmd.Parameters.AddWithValue("@NewId", -1);
                    cmd.Parameters.AddWithValue("@NewPicId", -1);

                    con.Open();
                    int result = cmd.ExecuteNonQuery();
                    con.Close();
                }


            }
        }
    }
}