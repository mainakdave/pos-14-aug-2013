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
    public partial class employeeRole : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int employeeRoleID = -1;
            String description = String.Empty; if (!String.IsNullOrEmpty(Request.Form["description"])) { description = Request.Form["description"]; }
            int saleMenu = -1; if (!String.IsNullOrEmpty(Request.Form["saleMenu"])) { saleMenu = Int32.Parse(Request.Form["saleMenu"]); }
            int userMenu = -1; if (!String.IsNullOrEmpty(Request.Form["userMenu"])) { userMenu = Int32.Parse(Request.Form["userMenu"]); }
            int tableMenu = -1; if (!String.IsNullOrEmpty(Request.Form["tableMenu"])) { tableMenu = Int32.Parse(Request.Form["tableMenu"]); }
    
            int departmentCreate = -1; if (!String.IsNullOrEmpty(Request.Form["departmentCreate"])) { departmentCreate = Int32.Parse(Request.Form["departmentCreate"]); }
            int departmentModify = -1; if (!String.IsNullOrEmpty(Request.Form["departmentModify"])) { departmentModify = Int32.Parse(Request.Form["departmentModify"]); }
            int departmentDelete = -1; if (!String.IsNullOrEmpty(Request.Form["departmentDelete"])) { departmentDelete = Int32.Parse(Request.Form["departmentDelete"]); }
            int departmentVisible = -1; if (!String.IsNullOrEmpty(Request.Form["departmentVisible"])) { departmentVisible = Int32.Parse(Request.Form["departmentVisible"]); }
            int sectionCreate = -1; if (!String.IsNullOrEmpty(Request.Form["sectionCreate"])) { sectionCreate = Int32.Parse(Request.Form["sectionCreate"]); }
            int sectionModify = -1; if (!String.IsNullOrEmpty(Request.Form["sectionModify"])) { sectionModify = Int32.Parse(Request.Form["sectionModify"]); }
            int sectionDelete = -1; if (!String.IsNullOrEmpty(Request.Form["sectionDelete"])) { sectionDelete = Int32.Parse(Request.Form["sectionDelete"]); }
            int sectionVisible = -1; if (!String.IsNullOrEmpty(Request.Form["sectionVisible"])) { sectionVisible = Int32.Parse(Request.Form["sectionVisible"]); }
            int familyCreate = -1; if (!String.IsNullOrEmpty(Request.Form["familyCreate"])) { familyCreate = Int32.Parse(Request.Form["familyCreate"]); }
            int familyModify = -1; if (!String.IsNullOrEmpty(Request.Form["familyModify"])) { familyModify = Int32.Parse(Request.Form["familyModify"]); }
            int familyDelete = -1; if (!String.IsNullOrEmpty(Request.Form["familyDelete"])) { familyDelete = Int32.Parse(Request.Form["familyDelete"]); }
            int familyVisible = -1; if (!String.IsNullOrEmpty(Request.Form["familyVisible"])) { familyVisible = Int32.Parse(Request.Form["familyVisible"]); }
            int brandCreate = -1; if (!String.IsNullOrEmpty(Request.Form["brandCreate"])) { brandCreate = Int32.Parse(Request.Form["brandCreate"]); }
            int brandModify = -1; if (!String.IsNullOrEmpty(Request.Form["brandModify"])) { brandModify = Int32.Parse(Request.Form["brandModify"]); }
            int brandDelete = -1; if (!String.IsNullOrEmpty(Request.Form["brandDelete"])) { brandDelete = Int32.Parse(Request.Form["brandDelete"]); }
            int brandVisible = -1; if (!String.IsNullOrEmpty(Request.Form["brandVisible"])) { brandVisible = Int32.Parse(Request.Form["brandVisible"]); }
            int lineCreate = -1; if (!String.IsNullOrEmpty(Request.Form["lineCreate"])) { lineCreate = Int32.Parse(Request.Form["lineCreate"]); }
            int lineModify = -1; if (!String.IsNullOrEmpty(Request.Form["lineModify"])) { lineModify = Int32.Parse(Request.Form["lineModify"]); }
            int lineDelete = -1; if (!String.IsNullOrEmpty(Request.Form["lineDelete"])) { lineDelete = Int32.Parse(Request.Form["lineDelete"]); }
            int lineVisible = -1; if (!String.IsNullOrEmpty(Request.Form["lineVisible"])) { lineVisible = Int32.Parse(Request.Form["lineVisible"]); }
    
            int cashCount = -1; if (!String.IsNullOrEmpty(Request.Form["cashCount"])) { cashCount = Int32.Parse(Request.Form["cashCount"]); }
            int declared = -1; if (!String.IsNullOrEmpty(Request.Form["declared"])) { declared = Int32.Parse(Request.Form["declared"]); }
            int reportByPaymentType = -1; if (!String.IsNullOrEmpty(Request.Form["reportByPaymentType"])) { reportByPaymentType = Int32.Parse(Request.Form["reportByPaymentType"]); }
            int seller = -1; if (!String.IsNullOrEmpty(Request.Form["seller"])) { seller = Int32.Parse(Request.Form["seller"]); }
            int saleSummary = -1; if (!String.IsNullOrEmpty(Request.Form["saleSummary"])) { saleSummary = Int32.Parse(Request.Form["saleSummary"]); }
            int collectionsOrPayments = -1; if (!String.IsNullOrEmpty(Request.Form["collectionsOrPayments"])) { collectionsOrPayments = Int32.Parse(Request.Form["collectionsOrPayments"]); }
            int returnSummary = -1; if (!String.IsNullOrEmpty(Request.Form["returnSummary"])) { returnSummary = Int32.Parse(Request.Form["returnSummary"]); }
            int returnDetail = -1; if (!String.IsNullOrEmpty(Request.Form["returnDetail"])) { returnDetail = Int32.Parse(Request.Form["returnDetail"]); }
            int voidSummary = -1; if (!String.IsNullOrEmpty(Request.Form["voidSummary"])) { voidSummary = Int32.Parse(Request.Form["voidSummary"]); }
            int voidDetail = -1; if (!String.IsNullOrEmpty(Request.Form["voidDetail"])) { voidDetail = Int32.Parse(Request.Form["voidDetail"]); }
            int complimentary = -1; if (!String.IsNullOrEmpty(Request.Form["complimentary"])) { complimentary = Int32.Parse(Request.Form["complimentary"]); }
            int saleBySection = -1; if (!String.IsNullOrEmpty(Request.Form["saleBySection"])) { saleBySection = Int32.Parse(Request.Form["saleBySection"]); }
            int saleByItem = -1; if (!String.IsNullOrEmpty(Request.Form["saleByItem"])) { saleByItem = Int32.Parse(Request.Form["saleByItem"]); }
            int discountDetail = -1; if (!String.IsNullOrEmpty(Request.Form["discountDetail"])) { discountDetail = Int32.Parse(Request.Form["discountDetail"]); }
    
            int customerMasterCreate = -1; if (!String.IsNullOrEmpty(Request.Form["customerMasterCreate"])) { customerMasterCreate = Int32.Parse(Request.Form["customerMasterCreate"]); }
            int customerMasterModify = -1; if (!String.IsNullOrEmpty(Request.Form["customerMasterModify"])) { customerMasterModify = Int32.Parse(Request.Form["customerMasterModify"]); }
            int customerMasterDelete = -1; if (!String.IsNullOrEmpty(Request.Form["customerMasterDelete"])) { customerMasterDelete = Int32.Parse(Request.Form["customerMasterDelete"]); }
            int customerMasterVisible = -1; if (!String.IsNullOrEmpty(Request.Form["customerMasterVisible"])) { customerMasterVisible = Int32.Parse(Request.Form["customerMasterVisible"]); }
            int consultBalanceCreate = -1; if (!String.IsNullOrEmpty(Request.Form["consultBalanceCreate"])) { consultBalanceCreate = Int32.Parse(Request.Form["consultBalanceCreate"]); }
            int consultBalanceModify = -1; if (!String.IsNullOrEmpty(Request.Form["consultBalanceModify"])) { consultBalanceModify = Int32.Parse(Request.Form["consultBalanceModify"]); }
            int consultBalanceDelete = -1; if (!String.IsNullOrEmpty(Request.Form["consultBalanceDelete"])) { consultBalanceDelete = Int32.Parse(Request.Form["consultBalanceDelete"]); }
            int consultBalanceVisible = -1; if (!String.IsNullOrEmpty(Request.Form["consultBalanceVisible"])) { consultBalanceVisible = Int32.Parse(Request.Form["consultBalanceVisible"]); }
    
            int tableCreate = -1; if (!String.IsNullOrEmpty(Request.Form["tableCreate"])) { tableCreate = Int32.Parse(Request.Form["tableCreate"]); }
            int tableModify = -1; if (!String.IsNullOrEmpty(Request.Form["tableModify"])) { tableModify = Int32.Parse(Request.Form["tableModify"]); }
            int tableDelete = -1; if (!String.IsNullOrEmpty(Request.Form["tableDelete"])) { tableDelete = Int32.Parse(Request.Form["tableDelete"]); }
            int tableVisible = -1; if (!String.IsNullOrEmpty(Request.Form["tableVisible"])) { tableVisible = Int32.Parse(Request.Form["tableVisible"]); }
            int salesCreate = -1; if (!String.IsNullOrEmpty(Request.Form["salesCreate"])) { salesCreate = Int32.Parse(Request.Form["salesCreate"]); }
            int salesModify = -1; if (!String.IsNullOrEmpty(Request.Form["salesModify"])) { salesModify = Int32.Parse(Request.Form["salesModify"]); }
            int salesDelete = -1; if (!String.IsNullOrEmpty(Request.Form["salesDelete"])) { salesDelete = Int32.Parse(Request.Form["salesDelete"]); }
            int salesVisible = -1; if (!String.IsNullOrEmpty(Request.Form["salesVisible"])) { salesVisible = Int32.Parse(Request.Form["salesVisible"]); }
            int deliveryCreate = -1; if (!String.IsNullOrEmpty(Request.Form["deliveryCreate"])) { deliveryCreate = Int32.Parse(Request.Form["deliveryCreate"]); }
            int deliveryModify = -1; if (!String.IsNullOrEmpty(Request.Form["deliveryModify"])) { deliveryModify = Int32.Parse(Request.Form["deliveryModify"]); }
            int deliveryDelete = -1; if (!String.IsNullOrEmpty(Request.Form["deliveryDelete"])) { deliveryDelete = Int32.Parse(Request.Form["deliveryDelete"]); }
            int deliveryVisible = -1; if (!String.IsNullOrEmpty(Request.Form["deliveryVisible"])) { deliveryVisible = Int32.Parse(Request.Form["deliveryVisible"]); }
            int takeAwayCreate = -1; if (!String.IsNullOrEmpty(Request.Form["takeAwayCreate"])) { takeAwayCreate = Int32.Parse(Request.Form["takeAwayCreate"]); }
            int takeAwayModify = -1; if (!String.IsNullOrEmpty(Request.Form["takeAwayModify"])) { takeAwayModify = Int32.Parse(Request.Form["takeAwayModify"]); }
            int takeAwayDelete = -1; if (!String.IsNullOrEmpty(Request.Form["takeAwayDelete"])) { takeAwayDelete = Int32.Parse(Request.Form["takeAwayDelete"]); }
            int takeAwayVisible = -1; if (!String.IsNullOrEmpty(Request.Form["takeAwayVisible"])) { takeAwayVisible = Int32.Parse(Request.Form["takeAwayVisible"]); }
    
            int allowInventoryToGoNegative = -1; if (!String.IsNullOrEmpty(Request.Form["allowInventoryToGoNegative"])) { allowInventoryToGoNegative = Int32.Parse(Request.Form["allowInventoryToGoNegative"]); }
            int declareInventory = -1; if (!String.IsNullOrEmpty(Request.Form["declareInventory"])) { declareInventory = Int32.Parse(Request.Form["declareInventory"]); }
            int declareWastage = -1; if (!String.IsNullOrEmpty(Request.Form["declareWastage"])) { declareWastage = Int32.Parse(Request.Form["declareWastage"]); }
            int inventoryAdjustment = -1; if (!String.IsNullOrEmpty(Request.Form["inventoryAdjustment"])) { inventoryAdjustment = Int32.Parse(Request.Form["inventoryAdjustment"]); }
            int closeInventory = -1; if (!String.IsNullOrEmpty(Request.Form["closeInventory"])) { closeInventory = Int32.Parse(Request.Form["closeInventory"]); }
    
            int salePriceCreate = -1; if (!String.IsNullOrEmpty(Request.Form["salePriceCreate"])) { salePriceCreate = Int32.Parse(Request.Form["salePriceCreate"]); }
            int salePriceModify = -1; if (!String.IsNullOrEmpty(Request.Form["salePriceModify"])) { salePriceModify = Int32.Parse(Request.Form["salePriceModify"]); }
            int salePriceDelete = -1; if (!String.IsNullOrEmpty(Request.Form["salePriceDelete"])) { salePriceDelete = Int32.Parse(Request.Form["salePriceDelete"]); }
            int salePriceVisible = -1; if (!String.IsNullOrEmpty(Request.Form["salePriceVisible"])) { salePriceVisible = Int32.Parse(Request.Form["salePriceVisible"]); }
            int costCreate = -1; if (!String.IsNullOrEmpty(Request.Form["costCreate"])) { costCreate = Int32.Parse(Request.Form["costCreate"]); }
            int costModify = -1; if (!String.IsNullOrEmpty(Request.Form["costModify"])) { costModify = Int32.Parse(Request.Form["costModify"]); }
            int costDelete = -1; if (!String.IsNullOrEmpty(Request.Form["costDelete"])) { costDelete = Int32.Parse(Request.Form["costDelete"]); }
            int costVisible = -1; if (!String.IsNullOrEmpty(Request.Form["costVisible"])) { costVisible = Int32.Parse(Request.Form["costVisible"]); }
            int itemCreate = -1; if (!String.IsNullOrEmpty(Request.Form["itemCreate"])) { itemCreate = Int32.Parse(Request.Form["itemCreate"]); }
            int itemModify = -1; if (!String.IsNullOrEmpty(Request.Form["itemModify"])) { itemModify = Int32.Parse(Request.Form["itemModify"]); }
            int itemDelete = -1; if (!String.IsNullOrEmpty(Request.Form["itemDelete"])) { itemDelete = Int32.Parse(Request.Form["itemDelete"]); }
            int itemVisible = -1; if (!String.IsNullOrEmpty(Request.Form["itemVisible"])) { itemVisible = Int32.Parse(Request.Form["itemVisible"]); }
            int modifierCreate = -1; if (!String.IsNullOrEmpty(Request.Form["modifierCreate"])) { modifierCreate = Int32.Parse(Request.Form["modifierCreate"]); }
            int modifierModify = -1; if (!String.IsNullOrEmpty(Request.Form["modifierModify"])) { modifierModify = Int32.Parse(Request.Form["modifierModify"]); }
            int modifierDelete = -1; if (!String.IsNullOrEmpty(Request.Form["modifierDelete"])) { modifierDelete = Int32.Parse(Request.Form["modifierDelete"]); }
            int modifierVisible = -1; if (!String.IsNullOrEmpty(Request.Form["modifierVisible"])) { modifierVisible = Int32.Parse(Request.Form["modifierVisible"]); }
            int formatCreate = -1; if (!String.IsNullOrEmpty(Request.Form["formatCreate"])) { formatCreate = Int32.Parse(Request.Form["formatCreate"]); }
            int formatModify = -1; if (!String.IsNullOrEmpty(Request.Form["formatModify"])) { formatModify = Int32.Parse(Request.Form["formatModify"]); }
            int formatDelete = -1; if (!String.IsNullOrEmpty(Request.Form["formatDelete"])) { formatDelete = Int32.Parse(Request.Form["formatDelete"]); }
            int formatVisible = -1; if (!String.IsNullOrEmpty(Request.Form["formatVisible"])) { formatVisible = Int32.Parse(Request.Form["formatVisible"]); }
            int fixedItemCreate = -1; if (!String.IsNullOrEmpty(Request.Form["fixedItemCreate"])) { fixedItemCreate = Int32.Parse(Request.Form["fixedItemCreate"]); }
            int fixedItemModify = -1; if (!String.IsNullOrEmpty(Request.Form["fixedItemModify"])) { fixedItemModify = Int32.Parse(Request.Form["fixedItemModify"]); }
            int fixedItemDelete = -1; if (!String.IsNullOrEmpty(Request.Form["fixedItemDelete"])) { fixedItemDelete = Int32.Parse(Request.Form["fixedItemDelete"]); }
            int fixedItemVisible = -1; if (!String.IsNullOrEmpty(Request.Form["fixedItemVisible"])) { fixedItemVisible = Int32.Parse(Request.Form["fixedItemVisible"]); }
            int priceListCreate = -1; if (!String.IsNullOrEmpty(Request.Form["priceListCreate"])) { priceListCreate = Int32.Parse(Request.Form["priceListCreate"]); }
            int priceListModify = -1; if (!String.IsNullOrEmpty(Request.Form["priceListModify"])) { priceListModify = Int32.Parse(Request.Form["priceListModify"]); }
            int priceListDelete = -1; if (!String.IsNullOrEmpty(Request.Form["priceListDelete"])) { priceListDelete = Int32.Parse(Request.Form["priceListDelete"]); }
            int priceListVisible = -1; if (!String.IsNullOrEmpty(Request.Form["priceListVisible"])) { priceListVisible = Int32.Parse(Request.Form["priceListVisible"]); }
    
            int purchaseOrderCreate = -1; if (!String.IsNullOrEmpty(Request.Form["purchaseOrderCreate"])) { purchaseOrderCreate = Int32.Parse(Request.Form["purchaseOrderCreate"]); }
            int purchaseOrderModify = -1; if (!String.IsNullOrEmpty(Request.Form["purchaseOrderModify"])) { purchaseOrderModify = Int32.Parse(Request.Form["purchaseOrderModify"]); }
            int purchaseOrderDelete = -1; if (!String.IsNullOrEmpty(Request.Form["purchaseOrderDelete"])) { purchaseOrderDelete = Int32.Parse(Request.Form["purchaseOrderDelete"]); }
            int purchaseOrderVisible = -1; if (!String.IsNullOrEmpty(Request.Form["purchaseOrderVisible"])) { purchaseOrderVisible = Int32.Parse(Request.Form["purchaseOrderVisible"]); }
            int purchaseDeliveryCreate = -1; if (!String.IsNullOrEmpty(Request.Form["purchaseDeliveryCreate"])) { purchaseDeliveryCreate = Int32.Parse(Request.Form["purchaseDeliveryCreate"]); }
            int purchaseDeliveryModify = -1; if (!String.IsNullOrEmpty(Request.Form["purchaseDeliveryModify"])) { purchaseDeliveryModify = Int32.Parse(Request.Form["purchaseDeliveryModify"]); }
            int purchaseDeliveryDelete = -1; if (!String.IsNullOrEmpty(Request.Form["purchaseDeliveryDelete"])) { purchaseDeliveryDelete = Int32.Parse(Request.Form["purchaseDeliveryDelete"]); }
            int purchaseDeliveryVisible = -1; if (!String.IsNullOrEmpty(Request.Form["purchaseDeliveryVisible"])) { purchaseDeliveryVisible = Int32.Parse(Request.Form["purchaseDeliveryVisible"]); }
            int supplierCreationCreate = -1; if (!String.IsNullOrEmpty(Request.Form["supplierCreationCreate"])) { supplierCreationCreate = Int32.Parse(Request.Form["supplierCreationCreate"]); }
            int supplierCreationModify = -1; if (!String.IsNullOrEmpty(Request.Form["supplierCreationModify"])) { supplierCreationModify = Int32.Parse(Request.Form["supplierCreationModify"]); }
            int supplierCreationDelete = -1; if (!String.IsNullOrEmpty(Request.Form["supplierCreationDelete"])) { supplierCreationDelete = Int32.Parse(Request.Form["supplierCreationDelete"]); }
            int supplierCreationVisible = -1; if (!String.IsNullOrEmpty(Request.Form["supplierCreationVisible"])) { supplierCreationVisible = Int32.Parse(Request.Form["supplierCreationVisible"]); }
            int supplierPriceListCreate = -1; if (!String.IsNullOrEmpty(Request.Form["supplierPriceListCreate"])) { supplierPriceListCreate = Int32.Parse(Request.Form["supplierPriceListCreate"]); }
            int supplierPriceListModify = -1; if (!String.IsNullOrEmpty(Request.Form["supplierPriceListModify"])) { supplierPriceListModify = Int32.Parse(Request.Form["supplierPriceListModify"]); }
            int supplierPriceListDelete = -1; if (!String.IsNullOrEmpty(Request.Form["supplierPriceListDelete"])) { supplierPriceListDelete = Int32.Parse(Request.Form["supplierPriceListDelete"]); }
            int supplierPriceListVisible = -1; if (!String.IsNullOrEmpty(Request.Form["supplierPriceListVisible"])) { supplierPriceListVisible = Int32.Parse(Request.Form["supplierPriceListVisible"]); }
    
            int purchaseOrderReport = -1; if (!String.IsNullOrEmpty(Request.Form["purchaseOrderReport"])) { purchaseOrderReport = Int32.Parse(Request.Form["purchaseOrderReport"]); }
            int purchaseDeliveryNote = -1; if (!String.IsNullOrEmpty(Request.Form["purchaseDeliveryNote"])) { purchaseDeliveryNote = Int32.Parse(Request.Form["purchaseDeliveryNote"]); }
            int inventory = -1; if (!String.IsNullOrEmpty(Request.Form["inventory"])) { inventory = Int32.Parse(Request.Form["inventory"]); }
            int purchaseSalesAndStock = -1; if (!String.IsNullOrEmpty(Request.Form["purchaseSalesAndStock"])) { purchaseSalesAndStock = Int32.Parse(Request.Form["purchaseSalesAndStock"]); }
            int currentStock = -1; if (!String.IsNullOrEmpty(Request.Form["currentStock"])) { currentStock = Int32.Parse(Request.Form["currentStock"]); }
            int consumption = -1; if (!String.IsNullOrEmpty(Request.Form["consumption"])) { consumption = Int32.Parse(Request.Form["consumption"]); }
    
            int credit = -1; if (!String.IsNullOrEmpty(Request.Form["credit"])) { credit = Int32.Parse(Request.Form["credit"]); }
            int voidBill = -1; if (!String.IsNullOrEmpty(Request.Form["voidBill"])) { voidBill = Int32.Parse(Request.Form["voidBill"]); }
            int roundBill = -1; if (!String.IsNullOrEmpty(Request.Form["roundBill"])) { roundBill = Int32.Parse(Request.Form["roundBill"]); }
            int addItem = -1; if (!String.IsNullOrEmpty(Request.Form["addItem"])) { addItem = Int32.Parse(Request.Form["addItem"]); }
            int discount = -1; if (!String.IsNullOrEmpty(Request.Form["discount"])) { discount = Int32.Parse(Request.Form["discount"]); }
            int billModification = -1; if (!String.IsNullOrEmpty(Request.Form["billModification"])) { billModification = Int32.Parse(Request.Form["billModification"]); }
            int voidLine = -1; if (!String.IsNullOrEmpty(Request.Form["voidLine"])) { voidLine = Int32.Parse(Request.Form["voidLine"]); }
            int returnItem = -1; if (!String.IsNullOrEmpty(Request.Form["returnItem"])) { returnItem = Int32.Parse(Request.Form["returnItem"]); }

            int byPaymentType = -1; if (!String.IsNullOrEmpty(Request.Form["byPaymentType"])) { byPaymentType = Int32.Parse(Request.Form["byPaymentType"]); }
            int salesSummary = -1; if (!String.IsNullOrEmpty(Request.Form["salesSummary"])) { salesSummary = Int32.Parse(Request.Form["salesSummary"]); }
            int byTable = -1; if (!String.IsNullOrEmpty(Request.Form["byTable"])) { byTable = Int32.Parse(Request.Form["byTable"]); }
            int byHours = -1; if (!String.IsNullOrEmpty(Request.Form["byHours"])) { byHours = Int32.Parse(Request.Form["byHours"]); }
            int byDepartment = -1; if (!String.IsNullOrEmpty(Request.Form["byDepartment"])) { byDepartment = Int32.Parse(Request.Form["byDepartment"]); }
            int bySection = -1; if (!String.IsNullOrEmpty(Request.Form["bySection"])) { bySection = Int32.Parse(Request.Form["bySection"]); }
            int byServiceTax = -1; if (!String.IsNullOrEmpty(Request.Form["byServiceTax"])) { byServiceTax = Int32.Parse(Request.Form["byServiceTax"]); }
            int returns = -1; if (!String.IsNullOrEmpty(Request.Form["returns"])) { returns = Int32.Parse(Request.Form["returns"]); }
            int voids = -1; if (!String.IsNullOrEmpty(Request.Form["voids"])) { voids = Int32.Parse(Request.Form["voids"]); }
            int pendingCollection = -1; if (!String.IsNullOrEmpty(Request.Form["pendingCollection"])) { pendingCollection = Int32.Parse(Request.Form["pendingCollection"]); }
            int profitMargin = -1; if (!String.IsNullOrEmpty(Request.Form["profitMargin"])) { profitMargin = Int32.Parse(Request.Form["profitMargin"]); }
            int complimentary_sale_report = -1; if (!String.IsNullOrEmpty(Request.Form["complimentary_sale_report"])) { complimentary_sale_report = Int32.Parse(Request.Form["complimentary_sale_report"]); }
            int vouchers = -1; if (!String.IsNullOrEmpty(Request.Form["vouchers"])) { vouchers = Int32.Parse(Request.Form["vouchers"]); }
            int salesByFormat = -1; if (!String.IsNullOrEmpty(Request.Form["salesByFormat"])) { salesByFormat = Int32.Parse(Request.Form["salesByFormat"]); }
            int staffMealReport = -1; if (!String.IsNullOrEmpty(Request.Form["staffMealReport"])) { staffMealReport = Int32.Parse(Request.Form["staffMealReport"]); }
            int salesByPortion = -1; if (!String.IsNullOrEmpty(Request.Form["salesByPortion"])) { salesByPortion = Int32.Parse(Request.Form["salesByPortion"]); }

            int exitToWindow = -1; if (!String.IsNullOrEmpty(Request.Form["exitToWindow"])) { exitToWindow = Int32.Parse(Request.Form["exitToWindow"]); }

            int openTableOfOtherEmployee = -1; if (!String.IsNullOrEmpty(Request.Form["openTableOfOtherEmployee"])) { openTableOfOtherEmployee = Int32.Parse(Request.Form["openTableOfOtherEmployee"]); }
            int changeRoom = -1; if (!String.IsNullOrEmpty(Request.Form["changeRoom"])) { changeRoom = Int32.Parse(Request.Form["changeRoom"]); }
            int changeTable = -1; if (!String.IsNullOrEmpty(Request.Form["changeTable"])) { changeTable = Int32.Parse(Request.Form["changeTable"]); }
            int modifyCover = -1; if (!String.IsNullOrEmpty(Request.Form["modifyCover"])) { modifyCover = Int32.Parse(Request.Form["modifyCover"]); }

            int createCard = -1; if (!String.IsNullOrEmpty(Request.Form["createCard"])) { createCard = Int32.Parse(Request.Form["createCard"]); }
            int swipeCardOnSale = -1; if (!String.IsNullOrEmpty(Request.Form["swipeCardOnSale"])) { swipeCardOnSale = Int32.Parse(Request.Form["swipeCardOnSale"]); }
            

            DateTime createDate = DateTime.Now;
            int createUser = -1;
            int modifyUser = -1;

            String StatementType = String.Empty;


            if (!String.IsNullOrEmpty(Request.Form["employeeRoleID"])) { employeeRoleID = Int32.Parse(Request.Form["employeeRoleID"]); }

            if (!String.IsNullOrEmpty(Request.Form["createUser"])) { createUser = Int32.Parse(Request.Form["createUser"]); }
            if (!String.IsNullOrEmpty(Request.Form["modifyUser"])) { modifyUser = Int32.Parse(Request.Form["modifyUser"]); }
            if (!String.IsNullOrEmpty(Request.Form["StatementType"])) { StatementType = Request.Form["StatementType"]; }



            //store in DB
            var DBConnectionString = ConfigurationManager.ConnectionStrings["POSDB"].ConnectionString;
            SqlConnection con = new SqlConnection(DBConnectionString);

            string sqlCmd = "employeeRoleSelectInsertUpdateDelete";
            int newID;
            using (SqlCommand cmd = new SqlCommand(sqlCmd, con))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                if (StatementType == "Insert")
                {
                    cmd.Parameters.AddWithValue("@description", description);
                    cmd.Parameters.AddWithValue("@saleMenu", saleMenu);
                    cmd.Parameters.AddWithValue("@userMenu", userMenu);
                    cmd.Parameters.AddWithValue("@tableMenu", tableMenu);
    
                    cmd.Parameters.AddWithValue("@departmentCreate", departmentCreate);
                    cmd.Parameters.AddWithValue("@departmentModify", departmentModify);
                    cmd.Parameters.AddWithValue("@departmentDelete", departmentDelete);
                    cmd.Parameters.AddWithValue("@departmentVisible", departmentVisible);
                    cmd.Parameters.AddWithValue("@sectionCreate", sectionCreate);
                    cmd.Parameters.AddWithValue("@sectionModify", sectionModify);
                    cmd.Parameters.AddWithValue("@sectionDelete", sectionDelete);
                    cmd.Parameters.AddWithValue("@sectionVisible", sectionVisible);
                    cmd.Parameters.AddWithValue("@familyCreate", familyCreate);
                    cmd.Parameters.AddWithValue("@familyModify", familyModify);
                    cmd.Parameters.AddWithValue("@familyDelete", familyDelete);
                    cmd.Parameters.AddWithValue("@familyVisible", familyVisible);
                    cmd.Parameters.AddWithValue("@brandCreate", brandCreate);
                    cmd.Parameters.AddWithValue("@brandModify", brandModify);
                    cmd.Parameters.AddWithValue("@brandDelete", brandDelete);
                    cmd.Parameters.AddWithValue("@brandVisible", brandVisible);
                    cmd.Parameters.AddWithValue("@lineCreate", lineCreate);
                    cmd.Parameters.AddWithValue("@lineModify", lineModify);
                    cmd.Parameters.AddWithValue("@lineDelete", lineDelete);
                    cmd.Parameters.AddWithValue("@lineVisible", lineVisible);
    
                    cmd.Parameters.AddWithValue("@cashCount", cashCount);
                    cmd.Parameters.AddWithValue("@declared", declared);
                    cmd.Parameters.AddWithValue("@reportByPaymentType", reportByPaymentType);
                    cmd.Parameters.AddWithValue("@seller", seller);
                    cmd.Parameters.AddWithValue("@saleSummary", saleSummary);
                    cmd.Parameters.AddWithValue("@collectionsOrPayments", collectionsOrPayments);
                    cmd.Parameters.AddWithValue("@returnSummary", returnSummary);
                    cmd.Parameters.AddWithValue("@returnDetail", returnDetail);
                    cmd.Parameters.AddWithValue("@voidSummary", voidSummary);
                    cmd.Parameters.AddWithValue("@voidDetail", voidDetail);
                    cmd.Parameters.AddWithValue("@complimentary", complimentary);
                    cmd.Parameters.AddWithValue("@saleBySection", saleBySection);
                    cmd.Parameters.AddWithValue("@saleByItem", saleByItem);
                    cmd.Parameters.AddWithValue("@discountDetail", discountDetail);
    
                    cmd.Parameters.AddWithValue("@customerMasterCreate", customerMasterCreate);
                    cmd.Parameters.AddWithValue("@customerMasterModify", customerMasterModify);
                    cmd.Parameters.AddWithValue("@customerMasterDelete", customerMasterDelete);
                    cmd.Parameters.AddWithValue("@customerMasterVisible", customerMasterVisible);
                    cmd.Parameters.AddWithValue("@consultBalanceCreate", consultBalanceCreate);
                    cmd.Parameters.AddWithValue("@consultBalanceModify", consultBalanceModify);
                    cmd.Parameters.AddWithValue("@consultBalanceDelete", consultBalanceDelete);
                    cmd.Parameters.AddWithValue("@consultBalanceVisible", consultBalanceVisible);
    
                    cmd.Parameters.AddWithValue("@tableCreate", tableCreate);
                    cmd.Parameters.AddWithValue("@tableModify", tableModify);
                    cmd.Parameters.AddWithValue("@tableDelete", tableDelete);
                    cmd.Parameters.AddWithValue("@tableVisible", tableVisible);
                    cmd.Parameters.AddWithValue("@salesCreate", salesCreate);
                    cmd.Parameters.AddWithValue("@salesModify", salesModify);
                    cmd.Parameters.AddWithValue("@salesDelete", salesDelete);
                    cmd.Parameters.AddWithValue("@salesVisible", salesVisible);
                    cmd.Parameters.AddWithValue("@deliveryCreate", deliveryCreate);
                    cmd.Parameters.AddWithValue("@deliveryModify", deliveryModify);
                    cmd.Parameters.AddWithValue("@deliveryDelete", deliveryDelete);
                    cmd.Parameters.AddWithValue("@deliveryVisible", deliveryVisible);
                    cmd.Parameters.AddWithValue("@takeAwayCreate", takeAwayCreate);
                    cmd.Parameters.AddWithValue("@takeAwayModify", takeAwayModify);
                    cmd.Parameters.AddWithValue("@takeAwayDelete", takeAwayDelete);
                    cmd.Parameters.AddWithValue("@takeAwayVisible", takeAwayVisible);
    
                    cmd.Parameters.AddWithValue("@allowInventoryToGoNegative", allowInventoryToGoNegative);
                    cmd.Parameters.AddWithValue("@declareInventory", declareInventory);
                    cmd.Parameters.AddWithValue("@declareWastage", declareWastage);
                    cmd.Parameters.AddWithValue("@inventoryAdjustment", inventoryAdjustment);
                    cmd.Parameters.AddWithValue("@closeInventory", closeInventory);
    
                    cmd.Parameters.AddWithValue("@salePriceCreate", salePriceCreate);
                    cmd.Parameters.AddWithValue("@salePriceModify", salePriceModify);
                    cmd.Parameters.AddWithValue("@salePriceDelete", salePriceDelete);
                    cmd.Parameters.AddWithValue("@salePriceVisible", salePriceVisible);
                    cmd.Parameters.AddWithValue("@costCreate", costCreate);
                    cmd.Parameters.AddWithValue("@costModify", costModify);
                    cmd.Parameters.AddWithValue("@costDelete", costDelete);
                    cmd.Parameters.AddWithValue("@costVisible", costVisible);
                    cmd.Parameters.AddWithValue("@itemCreate", itemCreate);
                    cmd.Parameters.AddWithValue("@itemModify", itemModify);
                    cmd.Parameters.AddWithValue("@itemDelete", itemDelete);
                    cmd.Parameters.AddWithValue("@itemVisible", itemVisible);
                    cmd.Parameters.AddWithValue("@modifierCreate", modifierCreate);
                    cmd.Parameters.AddWithValue("@modifierModify", modifierModify);
                    cmd.Parameters.AddWithValue("@modifierDelete", modifierDelete);
                    cmd.Parameters.AddWithValue("@modifierVisible", modifierVisible);
                    cmd.Parameters.AddWithValue("@formatCreate", formatCreate);
                    cmd.Parameters.AddWithValue("@formatModify", formatModify);
                    cmd.Parameters.AddWithValue("@formatDelete", formatDelete);
                    cmd.Parameters.AddWithValue("@formatVisible", formatVisible);
                    cmd.Parameters.AddWithValue("@fixedItemCreate", fixedItemCreate);
                    cmd.Parameters.AddWithValue("@fixedItemModify", fixedItemModify);
                    cmd.Parameters.AddWithValue("@fixedItemDelete", fixedItemDelete);
                    cmd.Parameters.AddWithValue("@fixedItemVisible", fixedItemVisible);
                    cmd.Parameters.AddWithValue("@priceListCreate", priceListCreate);
                    cmd.Parameters.AddWithValue("@priceListModify", priceListModify);
                    cmd.Parameters.AddWithValue("@priceListDelete", priceListDelete);
                    cmd.Parameters.AddWithValue("@priceListVisible", priceListVisible);
    
                    cmd.Parameters.AddWithValue("@purchaseOrderCreate", purchaseOrderCreate);
                    cmd.Parameters.AddWithValue("@purchaseOrderModify", purchaseOrderModify);
                    cmd.Parameters.AddWithValue("@purchaseOrderDelete", purchaseOrderDelete);
                    cmd.Parameters.AddWithValue("@purchaseOrderVisible", purchaseOrderVisible);
                    cmd.Parameters.AddWithValue("@purchaseDeliveryCreate", purchaseDeliveryCreate);
                    cmd.Parameters.AddWithValue("@purchaseDeliveryModify", purchaseDeliveryModify);
                    cmd.Parameters.AddWithValue("@purchaseDeliveryDelete", purchaseDeliveryDelete);
                    cmd.Parameters.AddWithValue("@purchaseDeliveryVisible", purchaseDeliveryVisible);
                    cmd.Parameters.AddWithValue("@supplierCreationCreate", supplierCreationCreate);
                    cmd.Parameters.AddWithValue("@supplierCreationModify", supplierCreationModify);
                    cmd.Parameters.AddWithValue("@supplierCreationDelete", supplierCreationDelete);
                    cmd.Parameters.AddWithValue("@supplierCreationVisible", supplierCreationVisible);
                    cmd.Parameters.AddWithValue("@supplierPriceListCreate", supplierPriceListCreate);
                    cmd.Parameters.AddWithValue("@supplierPriceListModify", supplierPriceListModify);
                    cmd.Parameters.AddWithValue("@supplierPriceListDelete", supplierPriceListDelete);
                    cmd.Parameters.AddWithValue("@supplierPriceListVisible", supplierPriceListVisible);
    
                    cmd.Parameters.AddWithValue("@purchaseOrderReport", purchaseOrderReport);
                    cmd.Parameters.AddWithValue("@purchaseDeliveryNote", purchaseDeliveryNote);
                    cmd.Parameters.AddWithValue("@inventory", inventory);
                    cmd.Parameters.AddWithValue("@purchaseSalesAndStock", purchaseSalesAndStock);
                    cmd.Parameters.AddWithValue("@currentStock", currentStock);
                    cmd.Parameters.AddWithValue("@consumption", consumption);
    
                    cmd.Parameters.AddWithValue("@credit", credit);
                    cmd.Parameters.AddWithValue("@voidBill", voidBill);
                    cmd.Parameters.AddWithValue("@roundBill", roundBill);
                    cmd.Parameters.AddWithValue("@addItem", addItem);
                    cmd.Parameters.AddWithValue("@discount", discount);
                    cmd.Parameters.AddWithValue("@billModification", billModification);
                    cmd.Parameters.AddWithValue("@voidLine", voidLine);
                    cmd.Parameters.AddWithValue("@returnItem", returnItem);
    
                    cmd.Parameters.AddWithValue("@byPaymentType", byPaymentType);
                    cmd.Parameters.AddWithValue("@salesSummary", salesSummary);
                    cmd.Parameters.AddWithValue("@byTable", byTable);
                    cmd.Parameters.AddWithValue("@byHours", byHours);
                    cmd.Parameters.AddWithValue("@byDepartment", byDepartment);
                    cmd.Parameters.AddWithValue("@bySection", bySection);
                    cmd.Parameters.AddWithValue("@byServiceTax", byServiceTax);
                    cmd.Parameters.AddWithValue("@returns", returns);
                    cmd.Parameters.AddWithValue("@voids", voids);
                    cmd.Parameters.AddWithValue("@pendingCollection", pendingCollection);
                    cmd.Parameters.AddWithValue("@profitMargin", profitMargin);
                    cmd.Parameters.AddWithValue("@complimentary_sale_report", complimentary_sale_report);
                    cmd.Parameters.AddWithValue("@vouchers", vouchers);
                    cmd.Parameters.AddWithValue("@salesByFormat", salesByFormat);
                    cmd.Parameters.AddWithValue("@staffMealReport", staffMealReport);
                    cmd.Parameters.AddWithValue("@salesByPortion", salesByPortion);
    
                    cmd.Parameters.AddWithValue("@exitToWindow", exitToWindow);
    
                    cmd.Parameters.AddWithValue("@openTableOfOtherEmployee", openTableOfOtherEmployee);
                    cmd.Parameters.AddWithValue("@changeRoom", changeRoom);
                    cmd.Parameters.AddWithValue("@changeTable", changeTable);
                    cmd.Parameters.AddWithValue("@modifyCover", modifyCover);

                    cmd.Parameters.AddWithValue("@createCard", createCard);
                    cmd.Parameters.AddWithValue("@swipeCardOnSale", swipeCardOnSale);

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
                    cmd.Parameters.AddWithValue("@employeeRoleID", employeeRoleID);
                    cmd.Parameters.AddWithValue("@description", description);
                    cmd.Parameters.AddWithValue("@saleMenu", saleMenu);
                    cmd.Parameters.AddWithValue("@userMenu", userMenu);
                    cmd.Parameters.AddWithValue("@tableMenu", tableMenu);

                    cmd.Parameters.AddWithValue("@departmentCreate", departmentCreate);
                    cmd.Parameters.AddWithValue("@departmentModify", departmentModify);
                    cmd.Parameters.AddWithValue("@departmentDelete", departmentDelete);
                    cmd.Parameters.AddWithValue("@departmentVisible", departmentVisible);
                    cmd.Parameters.AddWithValue("@sectionCreate", sectionCreate);
                    cmd.Parameters.AddWithValue("@sectionModify", sectionModify);
                    cmd.Parameters.AddWithValue("@sectionDelete", sectionDelete);
                    cmd.Parameters.AddWithValue("@sectionVisible", sectionVisible);
                    cmd.Parameters.AddWithValue("@familyCreate", familyCreate);
                    cmd.Parameters.AddWithValue("@familyModify", familyModify);
                    cmd.Parameters.AddWithValue("@familyDelete", familyDelete);
                    cmd.Parameters.AddWithValue("@familyVisible", familyVisible);
                    cmd.Parameters.AddWithValue("@brandCreate", brandCreate);
                    cmd.Parameters.AddWithValue("@brandModify", brandModify);
                    cmd.Parameters.AddWithValue("@brandDelete", brandDelete);
                    cmd.Parameters.AddWithValue("@brandVisible", brandVisible);
                    cmd.Parameters.AddWithValue("@lineCreate", lineCreate);
                    cmd.Parameters.AddWithValue("@lineModify", lineModify);
                    cmd.Parameters.AddWithValue("@lineDelete", lineDelete);
                    cmd.Parameters.AddWithValue("@lineVisible", lineVisible);

                    cmd.Parameters.AddWithValue("@cashCount", cashCount);
                    cmd.Parameters.AddWithValue("@declared", declared);
                    cmd.Parameters.AddWithValue("@reportByPaymentType", reportByPaymentType);
                    cmd.Parameters.AddWithValue("@seller", seller);
                    cmd.Parameters.AddWithValue("@saleSummary", saleSummary);
                    cmd.Parameters.AddWithValue("@collectionsOrPayments", collectionsOrPayments);
                    cmd.Parameters.AddWithValue("@returnSummary", returnSummary);
                    cmd.Parameters.AddWithValue("@returnDetail", returnDetail);
                    cmd.Parameters.AddWithValue("@voidSummary", voidSummary);
                    cmd.Parameters.AddWithValue("@voidDetail", voidDetail);
                    cmd.Parameters.AddWithValue("@complimentary", complimentary);
                    cmd.Parameters.AddWithValue("@saleBySection", saleBySection);
                    cmd.Parameters.AddWithValue("@saleByItem", saleByItem);
                    cmd.Parameters.AddWithValue("@discountDetail", discountDetail);

                    cmd.Parameters.AddWithValue("@customerMasterCreate", customerMasterCreate);
                    cmd.Parameters.AddWithValue("@customerMasterModify", customerMasterModify);
                    cmd.Parameters.AddWithValue("@customerMasterDelete", customerMasterDelete);
                    cmd.Parameters.AddWithValue("@customerMasterVisible", customerMasterVisible);
                    cmd.Parameters.AddWithValue("@consultBalanceCreate", consultBalanceCreate);
                    cmd.Parameters.AddWithValue("@consultBalanceModify", consultBalanceModify);
                    cmd.Parameters.AddWithValue("@consultBalanceDelete", consultBalanceDelete);
                    cmd.Parameters.AddWithValue("@consultBalanceVisible", consultBalanceVisible);

                    cmd.Parameters.AddWithValue("@tableCreate", tableCreate);
                    cmd.Parameters.AddWithValue("@tableModify", tableModify);
                    cmd.Parameters.AddWithValue("@tableDelete", tableDelete);
                    cmd.Parameters.AddWithValue("@tableVisible", tableVisible);
                    cmd.Parameters.AddWithValue("@salesCreate", salesCreate);
                    cmd.Parameters.AddWithValue("@salesModify", salesModify);
                    cmd.Parameters.AddWithValue("@salesDelete", salesDelete);
                    cmd.Parameters.AddWithValue("@salesVisible", salesVisible);
                    cmd.Parameters.AddWithValue("@deliveryCreate", deliveryCreate);
                    cmd.Parameters.AddWithValue("@deliveryModify", deliveryModify);
                    cmd.Parameters.AddWithValue("@deliveryDelete", deliveryDelete);
                    cmd.Parameters.AddWithValue("@deliveryVisible", deliveryVisible);
                    cmd.Parameters.AddWithValue("@takeAwayCreate", takeAwayCreate);
                    cmd.Parameters.AddWithValue("@takeAwayModify", takeAwayModify);
                    cmd.Parameters.AddWithValue("@takeAwayDelete", takeAwayDelete);
                    cmd.Parameters.AddWithValue("@takeAwayVisible", takeAwayVisible);

                    cmd.Parameters.AddWithValue("@allowInventoryToGoNegative", allowInventoryToGoNegative);
                    cmd.Parameters.AddWithValue("@declareInventory", declareInventory);
                    cmd.Parameters.AddWithValue("@declareWastage", declareWastage);
                    cmd.Parameters.AddWithValue("@inventoryAdjustment", inventoryAdjustment);
                    cmd.Parameters.AddWithValue("@closeInventory", closeInventory);

                    cmd.Parameters.AddWithValue("@salePriceCreate", salePriceCreate);
                    cmd.Parameters.AddWithValue("@salePriceModify", salePriceModify);
                    cmd.Parameters.AddWithValue("@salePriceDelete", salePriceDelete);
                    cmd.Parameters.AddWithValue("@salePriceVisible", salePriceVisible);
                    cmd.Parameters.AddWithValue("@costCreate", costCreate);
                    cmd.Parameters.AddWithValue("@costModify", costModify);
                    cmd.Parameters.AddWithValue("@costDelete", costDelete);
                    cmd.Parameters.AddWithValue("@costVisible", costVisible);
                    cmd.Parameters.AddWithValue("@itemCreate", itemCreate);
                    cmd.Parameters.AddWithValue("@itemModify", itemModify);
                    cmd.Parameters.AddWithValue("@itemDelete", itemDelete);
                    cmd.Parameters.AddWithValue("@itemVisible", itemVisible);
                    cmd.Parameters.AddWithValue("@modifierCreate", modifierCreate);
                    cmd.Parameters.AddWithValue("@modifierModify", modifierModify);
                    cmd.Parameters.AddWithValue("@modifierDelete", modifierDelete);
                    cmd.Parameters.AddWithValue("@modifierVisible", modifierVisible);
                    cmd.Parameters.AddWithValue("@formatCreate", formatCreate);
                    cmd.Parameters.AddWithValue("@formatModify", formatModify);
                    cmd.Parameters.AddWithValue("@formatDelete", formatDelete);
                    cmd.Parameters.AddWithValue("@formatVisible", formatVisible);
                    cmd.Parameters.AddWithValue("@fixedItemCreate", fixedItemCreate);
                    cmd.Parameters.AddWithValue("@fixedItemModify", fixedItemModify);
                    cmd.Parameters.AddWithValue("@fixedItemDelete", fixedItemDelete);
                    cmd.Parameters.AddWithValue("@fixedItemVisible", fixedItemVisible);
                    cmd.Parameters.AddWithValue("@priceListCreate", priceListCreate);
                    cmd.Parameters.AddWithValue("@priceListModify", priceListModify);
                    cmd.Parameters.AddWithValue("@priceListDelete", priceListDelete);
                    cmd.Parameters.AddWithValue("@priceListVisible", priceListVisible);

                    cmd.Parameters.AddWithValue("@purchaseOrderCreate", purchaseOrderCreate);
                    cmd.Parameters.AddWithValue("@purchaseOrderModify", purchaseOrderModify);
                    cmd.Parameters.AddWithValue("@purchaseOrderDelete", purchaseOrderDelete);
                    cmd.Parameters.AddWithValue("@purchaseOrderVisible", purchaseOrderVisible);
                    cmd.Parameters.AddWithValue("@purchaseDeliveryCreate", purchaseDeliveryCreate);
                    cmd.Parameters.AddWithValue("@purchaseDeliveryModify", purchaseDeliveryModify);
                    cmd.Parameters.AddWithValue("@purchaseDeliveryDelete", purchaseDeliveryDelete);
                    cmd.Parameters.AddWithValue("@purchaseDeliveryVisible", purchaseDeliveryVisible);
                    cmd.Parameters.AddWithValue("@supplierCreationCreate", supplierCreationCreate);
                    cmd.Parameters.AddWithValue("@supplierCreationModify", supplierCreationModify);
                    cmd.Parameters.AddWithValue("@supplierCreationDelete", supplierCreationDelete);
                    cmd.Parameters.AddWithValue("@supplierCreationVisible", supplierCreationVisible);
                    cmd.Parameters.AddWithValue("@supplierPriceListCreate", supplierPriceListCreate);
                    cmd.Parameters.AddWithValue("@supplierPriceListModify", supplierPriceListModify);
                    cmd.Parameters.AddWithValue("@supplierPriceListDelete", supplierPriceListDelete);
                    cmd.Parameters.AddWithValue("@supplierPriceListVisible", supplierPriceListVisible);

                    cmd.Parameters.AddWithValue("@purchaseOrderReport", purchaseOrderReport);
                    cmd.Parameters.AddWithValue("@purchaseDeliveryNote", purchaseDeliveryNote);
                    cmd.Parameters.AddWithValue("@inventory", inventory);
                    cmd.Parameters.AddWithValue("@purchaseSalesAndStock", purchaseSalesAndStock);
                    cmd.Parameters.AddWithValue("@currentStock", currentStock);
                    cmd.Parameters.AddWithValue("@consumption", consumption);

                    cmd.Parameters.AddWithValue("@credit", credit);
                    cmd.Parameters.AddWithValue("@voidBill", voidBill);
                    cmd.Parameters.AddWithValue("@roundBill", roundBill);
                    cmd.Parameters.AddWithValue("@addItem", addItem);
                    cmd.Parameters.AddWithValue("@discount", discount);
                    cmd.Parameters.AddWithValue("@billModification", billModification);
                    cmd.Parameters.AddWithValue("@voidLine", voidLine);
                    cmd.Parameters.AddWithValue("@returnItem", returnItem);

                    cmd.Parameters.AddWithValue("@byPaymentType", byPaymentType);
                    cmd.Parameters.AddWithValue("@salesSummary", salesSummary);
                    cmd.Parameters.AddWithValue("@byTable", byTable);
                    cmd.Parameters.AddWithValue("@byHours", byHours);
                    cmd.Parameters.AddWithValue("@byDepartment", byDepartment);
                    cmd.Parameters.AddWithValue("@bySection", bySection);
                    cmd.Parameters.AddWithValue("@byServiceTax", byServiceTax);
                    cmd.Parameters.AddWithValue("@returns", returns);
                    cmd.Parameters.AddWithValue("@voids", voids);
                    cmd.Parameters.AddWithValue("@pendingCollection", pendingCollection);
                    cmd.Parameters.AddWithValue("@profitMargin", profitMargin);
                    cmd.Parameters.AddWithValue("@complimentary_sale_report", complimentary_sale_report);
                    cmd.Parameters.AddWithValue("@vouchers", vouchers);
                    cmd.Parameters.AddWithValue("@salesByFormat", salesByFormat);
                    cmd.Parameters.AddWithValue("@staffMealReport", staffMealReport);
                    cmd.Parameters.AddWithValue("@salesByPortion", salesByPortion);

                    cmd.Parameters.AddWithValue("@exitToWindow", exitToWindow);

                    cmd.Parameters.AddWithValue("@openTableOfOtherEmployee", openTableOfOtherEmployee);
                    cmd.Parameters.AddWithValue("@changeRoom", changeRoom);
                    cmd.Parameters.AddWithValue("@changeTable", changeTable);
                    cmd.Parameters.AddWithValue("@modifyCover", modifyCover);

                    cmd.Parameters.AddWithValue("@createCard", createCard);
                    cmd.Parameters.AddWithValue("@swipeCardOnSale", swipeCardOnSale);

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
                    cmd.Parameters.AddWithValue("@employeeRoleID", employeeRoleID);
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