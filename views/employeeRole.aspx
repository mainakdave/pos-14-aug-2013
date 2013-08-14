<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="employeeRole.aspx.cs" Inherits="POS.views.employeeRole" MasterPageFile="~/views/masterPage.Master" %>

<%@ Register src="~/piczardUserControls/simpleImageUploadUserControl/SimpleImageUpload.ascx" tagname="SimpleImageUpload" tagprefix="ccPiczardUC" %>




<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">

    <script type="text/javascript">

        var IU = 'I';
        var ID = -1;
        var isDelete = false;

        $(document).ready(function () {

            //$("#dataRows tr").first().remove();

            $("#collapseOne").addClass("in");
            $("#collapseTwo").removeClass("in");
            $("#collapseThree").removeClass("in");

            $("#menu .nav li").removeClass("active");
            $("#menu .nav li#employeeRole").addClass("active");



            // positioning alertBox
            $("#alertBox").css("top", $(window).outerHeight() / 2);
            $("#alertBox").css("left", $(window).outerWidth() / 2);


            /*
            var IU = 'I';
            var ID = -1;
            var isDelete = false;
            */



            $("#btnCancel").click(function () {
                //alert(document.forms[0].name);
                //var theForm = document.forms['#departmentForm'];

                //document.getElementById("departmentForm").submit()
                //document.forms[0].submit();

                clearAllElements();
                return false;
            });



            $("#submit").click(function () {

                departmentCreateVal = "0";
                if ($("#<%=departmentCreate.ClientID %>").prop("checked")) departmentCreateVal = "1";

                departmentModifyVal = "0";
                if ($("#<%=departmentModify.ClientID %>").prop("checked")) departmentModifyVal = "1";

                departmentDeleteVal = "0";
                if ($("#<%=departmentDelete.ClientID %>").prop("checked")) departmentDeleteVal = "1";

                departmentVisibleVal = "0";
                if ($("#<%=departmentVisible.ClientID %>").prop("checked")) departmentVisibleVal = "1";

                sectionCreateVal = "0";
                if ($("#<%=sectionCreate.ClientID %>").prop("checked")) sectionCreateVal = "1";

                sectionModifyVal = "0";
                if ($("#<%=sectionModify.ClientID %>").prop("checked")) sectionModifyVal = "1";

                sectionDeleteVal = "0";
                if ($("#<%=sectionDelete.ClientID %>").prop("checked")) sectionDeleteVal = "1";

                sectionVisibleVal = "0";
                if ($("#<%=sectionVisible.ClientID %>").prop("checked")) sectionVisibleVal = "1";

                familyCreateVal = "0";
                if ($("#<%=familyCreate.ClientID %>").prop("checked")) familyCreateVal = "1";

                familyModifyVal = "0";
                if ($("#<%=familyModify.ClientID %>").prop("checked")) familyModifyVal = "1";

                familyDeleteVal = "0";
                if ($("#<%=familyDelete.ClientID %>").prop("checked")) familyDeleteVal = "1";

                familyVisibleVal = "0";
                if ($("#<%=familyVisible.ClientID %>").prop("checked")) familyVisibleVal = "1";

                brandCreateVal = "0";
                if ($("#<%=brandCreate.ClientID %>").prop("checked")) brandCreateVal = "1";

                brandModifyVal = "0";
                if ($("#<%=brandModify.ClientID %>").prop("checked")) brandModifyVal = "1";

                brandDeleteVal = "0";
                if ($("#<%=brandDelete.ClientID %>").prop("checked")) brandDeleteVal = "1";

                brandVisibleVal = "0";
                if ($("#<%=brandVisible.ClientID %>").prop("checked")) brandVisibleVal = "1";

                lineCreateVal = "0";
                if ($("#<%=lineCreate.ClientID %>").prop("checked")) lineCreateVal = "1";

                lineModifyVal = "0";
                if ($("#<%=lineModify.ClientID %>").prop("checked")) lineModifyVal = "1";

                lineDeleteVal = "0";
                if ($("#<%=lineDelete.ClientID %>").prop("checked")) lineDeleteVal = "1";

                lineVisibleVal = "0";
                if ($("#<%=lineVisible.ClientID %>").prop("checked")) lineVisibleVal = "1";

                cashCountVal = "0";
                if ($("#<%=cashCount.ClientID %>").prop("checked")) cashCountVal = "1";

                declaredVal = "0";
                if ($("#<%=declared.ClientID %>").prop("checked")) declaredVal = "1";

                reportByPaymentTypeVal = "0";
                if ($("#<%=reportByPaymentType.ClientID %>").prop("checked")) reportByPaymentTypeVal = "1";

                sellerVal = "0";
                if ($("#<%=seller.ClientID %>").prop("checked")) sellerVal = "1";

                saleSummaryVal = "0";
                if ($("#<%=saleSummary.ClientID %>").prop("checked")) saleSummaryVal = "1";

                collectionsOrPaymentsVal = "0";
                if ($("#<%=collectionsOrPayments.ClientID %>").prop("checked")) collectionsOrPaymentsVal = "1";

                returnSummaryVal = "0";
                if ($("#<%=returnSummary.ClientID %>").prop("checked")) returnSummaryVal = "1";

                returnDetailVal = "0";
                if ($("#<%=returnDetail.ClientID %>").prop("checked")) returnDetailVal = "1";

                voidSummaryVal = "0";
                if ($("#<%=voidSummary.ClientID %>").prop("checked")) voidSummaryVal = "1";

                voidDetailVal = "0";
                if ($("#<%=voidDetail.ClientID %>").prop("checked")) voidDetailVal = "1";

                complimentaryVal = "0";
                if ($("#<%=complimentary.ClientID %>").prop("checked")) complimentaryVal = "1";

                saleBySectionVal = "0";
                if ($("#<%=saleBySection.ClientID %>").prop("checked")) saleBySectionVal = "1";

                saleByItemVal = "0";
                if ($("#<%=saleByItem.ClientID %>").prop("checked")) saleByItemVal = "1";

                discountDetailVal = "0";
                if ($("#<%=discountDetail.ClientID %>").prop("checked")) discountDetailVal = "1";

                customerMasterCreateVal = "0";
                if ($("#<%=customerMasterCreate.ClientID %>").prop("checked")) customerMasterCreateVal = "1";

                customerMasterModifyVal = "0";
                if ($("#<%=customerMasterModify.ClientID %>").prop("checked")) customerMasterModifyVal = "1";

                customerMasterDeleteVal = "0";
                if ($("#<%=customerMasterDelete.ClientID %>").prop("checked")) customerMasterDeleteVal = "1";

                customerMasterVisibleVal = "0";
                if ($("#<%=customerMasterVisible.ClientID %>").prop("checked")) customerMasterVisibleVal = "1";

                consultBalanceCreateVal = "0";
                if ($("#<%=consultBalanceCreate.ClientID %>").prop("checked")) consultBalanceCreateVal = "1";

                consultBalanceModifyVal = "0";
                if ($("#<%=consultBalanceModify.ClientID %>").prop("checked")) consultBalanceModifyVal = "1";

                consultBalanceDeleteVal = "0";
                if ($("#<%=consultBalanceDelete.ClientID %>").prop("checked")) consultBalanceDeleteVal = "1";

                consultBalanceVisibleVal = "0";
                if ($("#<%=consultBalanceVisible.ClientID %>").prop("checked")) consultBalanceVisibleVal = "1";

                tableCreateVal = "0";
                if ($("#<%=tableCreate.ClientID %>").prop("checked")) tableCreateVal = "1";

                tableModifyVal = "0";
                if ($("#<%=tableModify.ClientID %>").prop("checked")) tableModifyVal = "1";

                tableDeleteVal = "0";
                if ($("#<%=tableDelete.ClientID %>").prop("checked")) tableDeleteVal = "1";

                tableVisibleVal = "0";
                if ($("#<%=tableVisible.ClientID %>").prop("checked")) tableVisibleVal = "1";

                salesCreateVal = "0";
                if ($("#<%=salesCreate.ClientID %>").prop("checked")) salesCreateVal = "1";

                salesModifyVal = "0";
                if ($("#<%=salesModify.ClientID %>").prop("checked")) salesModifyVal = "1";

                salesDeleteVal = "0";
                if ($("#<%=salesDelete.ClientID %>").prop("checked")) salesDeleteVal = "1";

                salesVisibleVal = "0";
                if ($("#<%=salesVisible.ClientID %>").prop("checked")) salesVisibleVal = "1";

                deliveryCreateVal = "0";
                if ($("#<%=deliveryCreate.ClientID %>").prop("checked")) deliveryCreateVal = "1";

                deliveryModifyVal = "0";
                if ($("#<%=deliveryModify.ClientID %>").prop("checked")) deliveryModifyVal = "1";

                deliveryDeleteVal = "0";
                if ($("#<%=deliveryDelete.ClientID %>").prop("checked")) deliveryDeleteVal = "1";

                deliveryVisibleVal = "0";
                if ($("#<%=deliveryVisible.ClientID %>").prop("checked")) deliveryVisibleVal = "1";

                takeAwayCreateVal = "0";
                if ($("#<%=takeAwayCreate.ClientID %>").prop("checked")) takeAwayCreateVal = "1";

                takeAwayModifyVal = "0";
                if ($("#<%=takeAwayModify.ClientID %>").prop("checked")) takeAwayModifyVal = "1";

                takeAwayDeleteVal = "0";
                if ($("#<%=takeAwayDelete.ClientID %>").prop("checked")) takeAwayDeleteVal = "1";

                takeAwayVisibleVal = "0";
                if ($("#<%=takeAwayVisible.ClientID %>").prop("checked")) takeAwayVisibleVal = "1";

                allowInventoryToGoNegativeVal = "0";
                if ($("#<%=allowInventoryToGoNegative.ClientID %>").prop("checked")) allowInventoryToGoNegativeVal = "1";

                declareInventoryVal = "0";
                if ($("#<%=declareInventory.ClientID %>").prop("checked")) declareInventoryVal = "1";

                declareWastageVal = "0";
                if ($("#<%=declareWastage.ClientID %>").prop("checked")) declareWastageVal = "1";

                inventoryAdjustmentVal = "0";
                if ($("#<%=inventoryAdjustment.ClientID %>").prop("checked")) inventoryAdjustmentVal = "1";

                closeInventoryVal = "0";
                if ($("#<%=closeInventory.ClientID %>").prop("checked")) closeInventoryVal = "1";

                salePriceCreateVal = "0";
                if ($("#<%=salePriceCreate.ClientID %>").prop("checked")) salePriceCreateVal = "1";

                salePriceModifyVal = "0";
                if ($("#<%=salePriceModify.ClientID %>").prop("checked")) salePriceModifyVal = "1";

                salePriceDeleteVal = "0";
                if ($("#<%=salePriceDelete.ClientID %>").prop("checked")) salePriceDeleteVal = "1";

                salePriceVisibleVal = "0";
                if ($("#<%=salePriceVisible.ClientID %>").prop("checked")) salePriceVisibleVal = "1";

                costCreateVal = "0";
                if ($("#<%=costCreate.ClientID %>").prop("checked")) costCreateVal = "1";

                costModifyVal = "0";
                if ($("#<%=costModify.ClientID %>").prop("checked")) costModifyVal = "1";

                costDeleteVal = "0";
                if ($("#<%=costDelete.ClientID %>").prop("checked")) costDeleteVal = "1";

                costVisibleVal = "0";
                if ($("#<%=costVisible.ClientID %>").prop("checked")) costVisibleVal = "1";

                itemCreateVal = "0";
                if ($("#<%=itemCreate.ClientID %>").prop("checked")) itemCreateVal = "1";

                itemModifyVal = "0";
                if ($("#<%=itemModify.ClientID %>").prop("checked")) itemModifyVal = "1";

                itemDeleteVal = "0";
                if ($("#<%=itemDelete.ClientID %>").prop("checked")) itemDeleteVal = "1";

                itemVisibleVal = "0";
                if ($("#<%=itemVisible.ClientID %>").prop("checked")) itemVisibleVal = "1";

                modifierCreateVal = "0";
                if ($("#<%=modifierCreate.ClientID %>").prop("checked")) modifierCreateVal = "1";

                modifierModifyVal = "0";
                if ($("#<%=modifierModify.ClientID %>").prop("checked")) modifierModifyVal = "1";

                modifierDeleteVal = "0";
                if ($("#<%=modifierDelete.ClientID %>").prop("checked")) modifierDeleteVal = "1";

                modifierVisibleVal = "0";
                if ($("#<%=modifierVisible.ClientID %>").prop("checked")) modifierVisibleVal = "1";

                formatCreateVal = "0";
                if ($("#<%=formatCreate.ClientID %>").prop("checked")) formatCreateVal = "1";

                formatModifyVal = "0";
                if ($("#<%=formatModify.ClientID %>").prop("checked")) formatModifyVal = "1";

                formatDeleteVal = "0";
                if ($("#<%=formatDelete.ClientID %>").prop("checked")) formatDeleteVal = "1";

                formatVisibleVal = "0";
                if ($("#<%=formatVisible.ClientID %>").prop("checked")) formatVisibleVal = "1";

                fixedItemCreateVal = "0";
                if ($("#<%=fixedItemCreate.ClientID %>").prop("checked")) fixedItemCreateVal = "1";

                fixedItemModifyVal = "0";
                if ($("#<%=fixedItemModify.ClientID %>").prop("checked")) fixedItemModifyVal = "1";

                fixedItemDeleteVal = "0";
                if ($("#<%=fixedItemDelete.ClientID %>").prop("checked")) fixedItemDeleteVal = "1";

                fixedItemVisibleVal = "0";
                if ($("#<%=fixedItemVisible.ClientID %>").prop("checked")) fixedItemVisibleVal = "1";

                priceListCreateVal = "0";
                if ($("#<%=priceListCreate.ClientID %>").prop("checked")) priceListCreateVal = "1";

                priceListModifyVal = "0";
                if ($("#<%=priceListModify.ClientID %>").prop("checked")) priceListModifyVal = "1";

                priceListDeleteVal = "0";
                if ($("#<%=priceListDelete.ClientID %>").prop("checked")) priceListDeleteVal = "1";

                priceListVisibleVal = "0";
                if ($("#<%=priceListVisible.ClientID %>").prop("checked")) priceListVisibleVal = "1";

                purchaseOrderCreateVal = "0";
                if ($("#<%=purchaseOrderCreate.ClientID %>").prop("checked")) purchaseOrderCreateVal = "1";

                purchaseOrderModifyVal = "0";
                if ($("#<%=purchaseOrderModify.ClientID %>").prop("checked")) purchaseOrderModifyVal = "1";

                purchaseOrderDeleteVal = "0";
                if ($("#<%=purchaseOrderDelete.ClientID %>").prop("checked")) purchaseOrderDeleteVal = "1";

                purchaseOrderVisibleVal = "0";
                if ($("#<%=purchaseOrderVisible.ClientID %>").prop("checked")) purchaseOrderVisibleVal = "1";

                purchaseDeliveryCreateVal = "0";
                if ($("#<%=purchaseDeliveryCreate.ClientID %>").prop("checked")) purchaseDeliveryCreateVal = "1";

                purchaseDeliveryModifyVal = "0";
                if ($("#<%=purchaseDeliveryModify.ClientID %>").prop("checked")) purchaseDeliveryModifyVal = "1";

                purchaseDeliveryDeleteVal = "0";
                if ($("#<%=purchaseDeliveryDelete.ClientID %>").prop("checked")) purchaseDeliveryDeleteVal = "1";

                purchaseDeliveryVisibleVal = "0";
                if ($("#<%=purchaseDeliveryVisible.ClientID %>").prop("checked")) purchaseDeliveryVisibleVal = "1";

                supplierCreationCreateVal = "0";
                if ($("#<%=supplierCreationCreate.ClientID %>").prop("checked")) supplierCreationCreateVal = "1";

                supplierCreationModifyVal = "0";
                if ($("#<%=supplierCreationModify.ClientID %>").prop("checked")) supplierCreationModifyVal = "1";

                supplierCreationDeleteVal = "0";
                if ($("#<%=supplierCreationDelete.ClientID %>").prop("checked")) supplierCreationDeleteVal = "1";

                supplierCreationVisibleVal = "0";
                if ($("#<%=supplierCreationVisible.ClientID %>").prop("checked")) supplierCreationVisibleVal = "1";

                supplierPriceListCreateVal = "0";
                if ($("#<%=supplierPriceListCreate.ClientID %>").prop("checked")) supplierPriceListCreateVal = "1";

                supplierPriceListModifyVal = "0";
                if ($("#<%=supplierPriceListModify.ClientID %>").prop("checked")) supplierPriceListModifyVal = "1";

                supplierPriceListDeleteVal = "0";
                if ($("#<%=supplierPriceListDelete.ClientID %>").prop("checked")) supplierPriceListDeleteVal = "1";

                supplierPriceListVisibleVal = "0";
                if ($("#<%=supplierPriceListVisible.ClientID %>").prop("checked")) supplierPriceListVisibleVal = "1";

                purchaseOrderReportVal = "0";
                if ($("#<%=purchaseOrderReport.ClientID %>").prop("checked")) purchaseOrderReportVal = "1";

                purchaseDeliveryNoteVal = "0";
                if ($("#<%=purchaseDeliveryNote.ClientID %>").prop("checked")) purchaseDeliveryNoteVal = "1";

                inventoryVal = "0";
                if ($("#<%=inventory.ClientID %>").prop("checked")) inventoryVal = "1";

                purchaseSalesAndStockVal = "0";
                if ($("#<%=purchaseSalesAndStock.ClientID %>").prop("checked")) purchaseSalesAndStockVal = "1";

                currentStockVal = "0";
                if ($("#<%=currentStock.ClientID %>").prop("checked")) currentStockVal = "1";

                consumptionVal = "0";
                if ($("#<%=consumption.ClientID %>").prop("checked")) consumptionVal = "1";

                creditVal = "0";
                if ($("#<%=credit.ClientID %>").prop("checked")) creditVal = "1";

                voidBillVal = "0";
                if ($("#<%=voidBill.ClientID %>").prop("checked")) voidBillVal = "1";

                roundBillVal = "0";
                if ($("#<%=roundBill.ClientID %>").prop("checked")) roundBillVal = "1";

                addItemVal = "0";
                if ($("#<%=addItem.ClientID %>").prop("checked")) addItemVal = "1";

                discountVal = "0";
                if ($("#<%=discount.ClientID %>").prop("checked")) discountVal = "1";

                billModificationVal = "0";
                if ($("#<%=billModification.ClientID %>").prop("checked")) billModificationVal = "1";

                voidLineVal = "0";
                if ($("#<%=voidLine.ClientID %>").prop("checked")) voidLineVal = "1";

                returnItemVal = "0";
                if ($("#<%=returnItem.ClientID %>").prop("checked")) returnItemVal = "1";

                byPaymentTypeVal = "0";
                if ($("#<%=byPaymentType.ClientID %>").prop("checked")) byPaymentTypeVal = "1";

                salesSummaryVal = "0";
                if ($("#<%=salesSummary.ClientID %>").prop("checked")) salesSummaryVal = "1";

                byTableVal = "0";
                if ($("#<%=byTable.ClientID %>").prop("checked")) byTableVal = "1";

                byHoursVal = "0";
                if ($("#<%=byHours.ClientID %>").prop("checked")) byHoursVal = "1";

                byDepartmentVal = "0";
                if ($("#<%=byDepartment.ClientID %>").prop("checked")) byDepartmentVal = "1";

                bySectionVal = "0";
                if ($("#<%=bySection.ClientID %>").prop("checked")) bySectionVal = "1";

                byServiceTaxVal = "0";
                if ($("#<%=byServiceTax.ClientID %>").prop("checked")) byServiceTaxVal = "1";

                returnsVal = "0";
                if ($("#<%=returns.ClientID %>").prop("checked")) returnsVal = "1";

                voidsVal = "0";
                if ($("#<%=voids.ClientID %>").prop("checked")) voidsVal = "1";

                pendingCollectionVal = "0";
                if ($("#<%=pendingCollection.ClientID %>").prop("checked")) pendingCollectionVal = "1";

                profitMarginVal = "0";
                if ($("#<%=profitMargin.ClientID %>").prop("checked")) profitMarginVal = "1";

                complimentary_sale_reportVal = "0";
                if ($("#<%=complimentary_sale_report.ClientID %>").prop("checked")) complimentary_sale_reportVal = "1";

                vouchersVal = "0";
                if ($("#<%=vouchers.ClientID %>").prop("checked")) vouchersVal = "1";

                salesByFormatVal = "0";
                if ($("#<%=salesByFormat.ClientID %>").prop("checked")) salesByFormatVal = "1";

                staffMealReportVal = "0";
                if ($("#<%=staffMealReport.ClientID %>").prop("checked")) staffMealReportVal = "1";

                salesByPortionVal = "0";
                if ($("#<%=salesByPortion.ClientID %>").prop("checked")) salesByPortionVal = "1";

                exitToWindowVal = "0";
                if ($("#<%=exitToWindow.ClientID %>").prop("checked")) exitToWindowVal = "1";

                openTableOfOtherEmployeeVal = "0";
                if ($("#<%=openTableOfOtherEmployee.ClientID %>").prop("checked")) openTableOfOtherEmployeeVal = "1";

                changeRoomVal = "0";
                if ($("#<%=changeRoom.ClientID %>").prop("checked")) changeRoomVal = "1";

                changeTableVal = "0";
                if ($("#<%=changeTable.ClientID %>").prop("checked")) changeTableVal = "1";

                modifyCoverVal = "0";
                if ($("#<%=modifyCover.ClientID %>").prop("checked")) modifyCoverVal = "1";

                createCardVal = "0";
                if ($("#<%=createCard.ClientID %>").prop("checked")) createCardVal = "1";

                swipeCardOnSaleVal = "0";
                if ($("#<%=swipeCardOnSale.ClientID %>").prop("checked")) swipeCardOnSaleVal = "1";



                if (window.IU == 'I') {


                    $.post("../Ajax/employeeRole.aspx",
                        {
                            description: $("#description").val(),
                            saleMenu: $("#saleMenu").val(),
                            userMenu: $("#userMenu").val(),
                            tableMenu: $("#tableMenu").val(),

                            departmentCreate: departmentCreateVal,
                            departmentModify: departmentModifyVal,
                            departmentDelete: departmentDeleteVal,
                            departmentVisible: departmentVisibleVal,
                            sectionCreate: sectionCreateVal,
                            sectionModify: sectionModifyVal,
                            sectionDelete: sectionDeleteVal,
                            sectionVisible: sectionVisibleVal,
                            familyCreate: familyCreateVal,
                            familyModify: familyModifyVal,
                            familyDelete: familyDeleteVal,
                            familyVisible: familyVisibleVal,
                            brandCreate: brandCreateVal,
                            brandModify: brandModifyVal,
                            brandDelete: brandDeleteVal,
                            brandVisible: brandVisibleVal,
                            lineCreate: lineCreateVal,
                            lineModify: lineModifyVal,
                            lineDelete: lineDeleteVal,
                            lineVisible: lineVisibleVal,

                            cashCount: cashCountVal,
                            declared: declaredVal,
                            reportByPaymentType: reportByPaymentTypeVal,
                            seller: sellerVal,
                            saleSummary: saleSummaryVal,
                            collectionsOrPayments: collectionsOrPaymentsVal,
                            returnSummary: returnSummaryVal,
                            returnDetail: returnDetailVal,
                            voidSummary: voidSummaryVal,
                            voidDetail: voidDetailVal,
                            complimentary: complimentaryVal,
                            saleBySection: saleBySectionVal,
                            saleByItem: saleByItemVal,
                            discountDetail: discountDetailVal,

                            customerMasterCreate: customerMasterCreateVal,
                            customerMasterModify: customerMasterModifyVal,
                            customerMasterDelete: customerMasterDeleteVal,
                            customerMasterVisible: customerMasterVisibleVal,
                            consultBalanceCreate: consultBalanceCreateVal,
                            consultBalanceModify: consultBalanceModifyVal,
                            consultBalanceDelete: consultBalanceDeleteVal,
                            consultBalanceVisible: consultBalanceVisibleVal,

                            tableCreate: tableCreateVal,
                            tableModify: tableModifyVal,
                            tableDelete: tableDeleteVal,
                            tableVisible: tableVisibleVal,
                            salesCreate: salesCreateVal,
                            salesModify: salesModifyVal,
                            salesDelete: salesDeleteVal,
                            salesVisible: salesVisibleVal,
                            deliveryCreate: deliveryCreateVal,
                            deliveryModify: deliveryModifyVal,
                            deliveryDelete: deliveryDeleteVal,
                            deliveryVisible: deliveryVisibleVal,
                            takeAwayCreate: takeAwayCreateVal,
                            takeAwayModify: takeAwayModifyVal,
                            takeAwayDelete: takeAwayDeleteVal,
                            takeAwayVisible: takeAwayVisibleVal,

                            allowInventoryToGoNegative: allowInventoryToGoNegativeVal,
                            declareInventory: declareInventoryVal,
                            declareWastage: declareWastageVal,
                            inventoryAdjustment: inventoryAdjustmentVal,
                            closeInventory: closeInventoryVal,

                            salePriceCreate: salePriceCreateVal,
                            salePriceModify: salePriceModifyVal,
                            salePriceDelete: salePriceDeleteVal,
                            salePriceVisible: salePriceVisibleVal,
                            costCreate: costCreateVal,
                            costModify: costModifyVal,
                            costDelete: costDeleteVal,
                            costVisible: costVisibleVal,
                            itemCreate: itemCreateVal,
                            itemModify: itemModifyVal,
                            itemDelete: itemDeleteVal,
                            itemVisible: itemVisibleVal,
                            modifierCreate: modifierCreateVal,
                            modifierModify: modifierModifyVal,
                            modifierDelete: modifierDeleteVal,
                            modifierVisible: modifierVisibleVal,
                            formatCreate: formatCreateVal,
                            formatModify: formatModifyVal,
                            formatDelete: formatDeleteVal,
                            formatVisible: formatVisibleVal,
                            fixedItemCreate: fixedItemCreateVal,
                            fixedItemModify: fixedItemModifyVal,
                            fixedItemDelete: fixedItemDeleteVal,
                            fixedItemVisible: fixedItemVisibleVal,
                            priceListCreate: priceListCreateVal,
                            priceListModify: priceListModifyVal,
                            priceListDelete: priceListDeleteVal,
                            priceListVisible: priceListVisibleVal,

                            purchaseOrderCreate: purchaseOrderCreateVal,
                            purchaseOrderModify: purchaseOrderModifyVal,
                            purchaseOrderDelete: purchaseOrderDeleteVal,
                            purchaseOrderVisible: purchaseOrderVisibleVal,
                            purchaseDeliveryCreate: purchaseDeliveryCreateVal,
                            purchaseDeliveryModify: purchaseDeliveryModifyVal,
                            purchaseDeliveryDelete: purchaseDeliveryDeleteVal,
                            purchaseDeliveryVisible: purchaseDeliveryVisibleVal,
                            supplierCreationCreate: supplierCreationCreateVal,
                            supplierCreationModify: supplierCreationModifyVal,
                            supplierCreationDelete: supplierCreationDeleteVal,
                            supplierCreationVisible: supplierCreationVisibleVal,
                            supplierPriceListCreate: supplierPriceListCreateVal,
                            supplierPriceListModify: supplierPriceListModifyVal,
                            supplierPriceListDelete: supplierPriceListDeleteVal,
                            supplierPriceListVisible: supplierPriceListVisibleVal,

                            purchaseOrderReport: purchaseOrderReportVal,
                            purchaseDeliveryNote: purchaseDeliveryNoteVal,
                            inventory: inventoryVal,
                            purchaseSalesAndStock: purchaseSalesAndStockVal,
                            currentStock: currentStockVal,
                            consumption: consumptionVal,

                            credit: creditVal,
                            voidBill: voidBillVal,
                            roundBill: roundBillVal,
                            addItem: addItemVal,
                            discount: discountVal,
                            billModification: billModificationVal,
                            voidLine: voidLineVal,
                            returnItem: returnItemVal,

                            byPaymentType: byPaymentTypeVal,
                            salesSummary: salesSummaryVal,
                            byTable: byTableVal,
                            byHours: byHoursVal,
                            byDepartment: byDepartmentVal,
                            bySection: bySectionVal,
                            byServiceTax: byServiceTaxVal,
                            returns: returnsVal,
                            voids: voidsVal,
                            pendingCollection: pendingCollectionVal,
                            profitMargin: profitMarginVal,
                            complimentary_sale_report: complimentary_sale_reportVal,
                            vouchers: vouchersVal,
                            salesByFormat: salesByFormatVal,
                            staffMealReport: staffMealReportVal,
                            salesByPortion: salesByPortionVal,

                            exitToWindow: exitToWindowVal,

                            openTableOfOtherEmployee: openTableOfOtherEmployeeVal,
                            changeRoom: changeRoomVal,
                            changeTable: changeTableVal,
                            modifyCover: modifyCoverVal,

                            createCard: createCardVal,
                            swipeCardOnSale: swipeCardOnSaleVal,

                            createDate: '',
                            createUser: '-1',
                            modifyUser: '-1',
                            StatementType: 'Insert'
                        },

                        function (response) {
                            //alert(response);
                            //PageMethods.SendForm(response);
                            //PageMethods.saveImage(response);

                            //alert("Data inserted...");
                            $(document).trigger("add-alerts", [
                                {
                                    'message': "Data inserted...",
                                    'priority': 'success'
                                }
                              ]);

                            clearAllElements();


                        }
                    );

                    return false;
                }
                else if (window.IU == 'U') {


                    $.post("../Ajax/employeeRole.aspx",
                        {
                            employeeRoleID: window.ID,
                            description: $("#description").val(),
                            saleMenu: $("#saleMenu").val(),
                            userMenu: $("#userMenu").val(),
                            tableMenu: $("#tableMenu").val(),

                            departmentCreate: departmentCreateVal,
                            departmentModify: departmentModifyVal,
                            departmentDelete: departmentDeleteVal,
                            departmentVisible: departmentVisibleVal,
                            sectionCreate: sectionCreateVal,
                            sectionModify: sectionModifyVal,
                            sectionDelete: sectionDeleteVal,
                            sectionVisible: sectionVisibleVal,
                            familyCreate: familyCreateVal,
                            familyModify: familyModifyVal,
                            familyDelete: familyDeleteVal,
                            familyVisible: familyVisibleVal,
                            brandCreate: brandCreateVal,
                            brandModify: brandModifyVal,
                            brandDelete: brandDeleteVal,
                            brandVisible: brandVisibleVal,
                            lineCreate: lineCreateVal,
                            lineModify: lineModifyVal,
                            lineDelete: lineDeleteVal,
                            lineVisible: lineVisibleVal,

                            cashCount: cashCountVal,
                            declared: declaredVal,
                            reportByPaymentType: reportByPaymentTypeVal,
                            seller: sellerVal,
                            saleSummary: saleSummaryVal,
                            collectionsOrPayments: collectionsOrPaymentsVal,
                            returnSummary: returnSummaryVal,
                            returnDetail: returnDetailVal,
                            voidSummary: voidSummaryVal,
                            voidDetail: voidDetailVal,
                            complimentary: complimentaryVal,
                            saleBySection: saleBySectionVal,
                            saleByItem: saleByItemVal,
                            discountDetail: discountDetailVal,

                            customerMasterCreate: customerMasterCreateVal,
                            customerMasterModify: customerMasterModifyVal,
                            customerMasterDelete: customerMasterDeleteVal,
                            customerMasterVisible: customerMasterVisibleVal,
                            consultBalanceCreate: consultBalanceCreateVal,
                            consultBalanceModify: consultBalanceModifyVal,
                            consultBalanceDelete: consultBalanceDeleteVal,
                            consultBalanceVisible: consultBalanceVisibleVal,

                            tableCreate: tableCreateVal,
                            tableModify: tableModifyVal,
                            tableDelete: tableDeleteVal,
                            tableVisible: tableVisibleVal,
                            salesCreate: salesCreateVal,
                            salesModify: salesModifyVal,
                            salesDelete: salesDeleteVal,
                            salesVisible: salesVisibleVal,
                            deliveryCreate: deliveryCreateVal,
                            deliveryModify: deliveryModifyVal,
                            deliveryDelete: deliveryDeleteVal,
                            deliveryVisible: deliveryVisibleVal,
                            takeAwayCreate: takeAwayCreateVal,
                            takeAwayModify: takeAwayModifyVal,
                            takeAwayDelete: takeAwayDeleteVal,
                            takeAwayVisible: takeAwayVisibleVal,

                            allowInventoryToGoNegative: allowInventoryToGoNegativeVal,
                            declareInventory: declareInventoryVal,
                            declareWastage: declareWastageVal,
                            inventoryAdjustment: inventoryAdjustmentVal,
                            closeInventory: closeInventoryVal,

                            salePriceCreate: salePriceCreateVal,
                            salePriceModify: salePriceModifyVal,
                            salePriceDelete: salePriceDeleteVal,
                            salePriceVisible: salePriceVisibleVal,
                            costCreate: costCreateVal,
                            costModify: costModifyVal,
                            costDelete: costDeleteVal,
                            costVisible: costVisibleVal,
                            itemCreate: itemCreateVal,
                            itemModify: itemModifyVal,
                            itemDelete: itemDeleteVal,
                            itemVisible: itemVisibleVal,
                            modifierCreate: modifierCreateVal,
                            modifierModify: modifierModifyVal,
                            modifierDelete: modifierDeleteVal,
                            modifierVisible: modifierVisibleVal,
                            formatCreate: formatCreateVal,
                            formatModify: formatModifyVal,
                            formatDelete: formatDeleteVal,
                            formatVisible: formatVisibleVal,
                            fixedItemCreate: fixedItemCreateVal,
                            fixedItemModify: fixedItemModifyVal,
                            fixedItemDelete: fixedItemDeleteVal,
                            fixedItemVisible: fixedItemVisibleVal,
                            priceListCreate: priceListCreateVal,
                            priceListModify: priceListModifyVal,
                            priceListDelete: priceListDeleteVal,
                            priceListVisible: priceListVisibleVal,

                            purchaseOrderCreate: purchaseOrderCreateVal,
                            purchaseOrderModify: purchaseOrderModifyVal,
                            purchaseOrderDelete: purchaseOrderDeleteVal,
                            purchaseOrderVisible: purchaseOrderVisibleVal,
                            purchaseDeliveryCreate: purchaseDeliveryCreateVal,
                            purchaseDeliveryModify: purchaseDeliveryModifyVal,
                            purchaseDeliveryDelete: purchaseDeliveryDeleteVal,
                            purchaseDeliveryVisible: purchaseDeliveryVisibleVal,
                            supplierCreationCreate: supplierCreationCreateVal,
                            supplierCreationModify: supplierCreationModifyVal,
                            supplierCreationDelete: supplierCreationDeleteVal,
                            supplierCreationVisible: supplierCreationVisibleVal,
                            supplierPriceListCreate: supplierPriceListCreateVal,
                            supplierPriceListModify: supplierPriceListModifyVal,
                            supplierPriceListDelete: supplierPriceListDeleteVal,
                            supplierPriceListVisible: supplierPriceListVisibleVal,

                            purchaseOrderReport: purchaseOrderReportVal,
                            purchaseDeliveryNote: purchaseDeliveryNoteVal,
                            inventory: inventoryVal,
                            purchaseSalesAndStock: purchaseSalesAndStockVal,
                            currentStock: currentStockVal,
                            consumption: consumptionVal,

                            credit: creditVal,
                            voidBill: voidBillVal,
                            roundBill: roundBillVal,
                            addItem: addItemVal,
                            discount: discountVal,
                            billModification: billModificationVal,
                            voidLine: voidLineVal,
                            returnItem: returnItemVal,

                            byPaymentType: byPaymentTypeVal,
                            salesSummary: salesSummaryVal,
                            byTable: byTableVal,
                            byHours: byHoursVal,
                            byDepartment: byDepartmentVal,
                            bySection: bySectionVal,
                            byServiceTax: byServiceTaxVal,
                            returns: returnsVal,
                            voids: voidsVal,
                            pendingCollection: pendingCollectionVal,
                            profitMargin: profitMarginVal,
                            complimentary_sale_report: complimentary_sale_reportVal,
                            vouchers: vouchersVal,
                            salesByFormat: salesByFormatVal,
                            staffMealReport: staffMealReportVal,
                            salesByPortion: salesByPortionVal,

                            exitToWindow: exitToWindowVal,

                            openTableOfOtherEmployee: openTableOfOtherEmployeeVal,
                            changeRoom: changeRoomVal,
                            changeTable: changeTableVal,
                            modifyCover: modifyCoverVal,

                            createCard: createCardVal,
                            swipeCardOnSale: swipeCardOnSaleVal,

                            modifyUser: '-1',
                            StatementType: 'Update'
                        },

                        function (response) {
                            //alert(response);
                            //PageMethods.SendForm(response);
                            //PageMethods.saveImage(window.ID);
                            window.IU = 'I';

                            //alert("Data updated...");
                            $(document).trigger("add-alerts", [
                                {
                                    'message': "Data updated...",
                                    'priority': 'success'
                                }
                              ]);

                            clearAllElements();


                        }
                    );

                    return false;
                }
            });


        });


        function updateRow(id, description, saleMenu, userMenu, tableMenu, 
                 departmentCreate, departmentModify, departmentDelete, departmentVisible, sectionCreate, sectionModify, sectionDelete, sectionVisible, familyCreate, familyModify, familyDelete, familyVisible, brandCreate, brandModify, brandDelete, brandVisible, lineCreate, lineModify, lineDelete, lineVisible, 
                 cashCount, declared, reportByPaymentType, seller, saleSummary, collectionsOrPayments, returnSummary, returnDetail, voidSummary, voidDetail, complimentary, saleBySection, saleByItem, discountDetail, 
                 customerMasterCreate, customerMasterModify, customerMasterDelete, customerMasterVisible, consultBalanceCreate, consultBalanceModify, consultBalanceDelete, consultBalanceVisible, 
                 tableCreate, tableModify, tableDelete, tableVisible, salesCreate, salesModify, salesDelete, salesVisible, deliveryCreate, deliveryModify, deliveryDelete, deliveryVisible, takeAwayCreate, takeAwayModify, takeAwayDelete, takeAwayVisible,
                 allowInventoryToGoNegative, declareInventory, declareWastage, inventoryAdjustment, closeInventory,
                 salePriceCreate, salePriceModify, salePriceDelete, salePriceVisible, costCreate, costModify, costDelete, costVisible, itemCreate, itemModify, itemDelete, itemVisible, modifierCreate, modifierModify, modifierDelete, modifierVisible, formatCreate, formatModify, formatDelete, formatVisible, fixedItemCreate, fixedItemModify, fixedItemDelete, fixedItemVisible, priceListCreate, priceListModify, priceListDelete, priceListVisible,
                 purchaseOrderCreate, purchaseOrderModify, purchaseOrderDelete, purchaseOrderVisible, purchaseDeliveryCreate, purchaseDeliveryModify, purchaseDeliveryDelete, purchaseDeliveryVisible, supplierCreationCreate, supplierCreationModify, supplierCreationDelete, supplierCreationVisible, supplierPriceListCreate, supplierPriceListModify, supplierPriceListDelete, supplierPriceListVisible,
                 purchaseOrderReport, purchaseDeliveryNote, inventory, purchaseSalesAndStock, currentStock, consumption,
                 credit, voidBill, roundBill, addItem, discount, billModification, voidLine, returnItem,
                 byPaymentType, salesSummary, byTable, byHours, byDepartment, bySection, byServiceTax, returns, voids, pendingCollection, profitMargin, complimentary_sale_report, vouchers, salesByFormat, staffMealReport, salesByPortion,
                 exitToWindow,
                 openTableOfOtherEmployee, changeRoom, changeTable, modifyCover,
                 createCard, swipeCardOnSale) {
            if (!window.isDelete) {
                //alert(id);
                //$("#deptName").val(id);
                window.IU = 'U';
                window.ID = id;



                $("#<%= nextID.ClientID %>").val(id);
                $("#description").val(description);
                $("#saleMenu").val(saleMenu);
                $("#userMenu").val(userMenu);
                $("#tableMenu").val(tableMenu);

                if (departmentCreate == "1") $("#<%=departmentCreate.ClientID %>").prop("checked", true);
                else $("#<%=departmentCreate.ClientID %>").prop("checked", false);

                if (departmentModify == "1") $("#<%=departmentModify.ClientID %>").prop("checked", true);
                else $("#<%=departmentModify.ClientID %>").prop("checked", false);

                if (departmentDelete == "1") $("#<%=departmentDelete.ClientID %>").prop("checked", true);
                else $("#<%=departmentDelete.ClientID %>").prop("checked", false);

                if (departmentVisible == "1") $("#<%=departmentVisible.ClientID %>").prop("checked", true);
                else $("#<%=departmentVisible.ClientID %>").prop("checked", false);

                if (sectionCreate == "1") $("#<%=sectionCreate.ClientID %>").prop("checked", true);
                else $("#<%=sectionCreate.ClientID %>").prop("checked", false);

                if (sectionModify == "1") $("#<%=sectionModify.ClientID %>").prop("checked", true);
                else $("#<%=sectionModify.ClientID %>").prop("checked", false);

                if (sectionDelete == "1") $("#<%=sectionDelete.ClientID %>").prop("checked", true);
                else $("#<%=sectionDelete.ClientID %>").prop("checked", false);

                if (sectionVisible == "1") $("#<%=sectionVisible.ClientID %>").prop("checked", true);
                else $("#<%=sectionVisible.ClientID %>").prop("checked", false);

                if (familyCreate == "1") $("#<%=familyCreate.ClientID %>").prop("checked", true);
                else $("#<%=familyCreate.ClientID %>").prop("checked", false);

                if (familyModify == "1") $("#<%=familyModify.ClientID %>").prop("checked", true);
                else $("#<%=familyModify.ClientID %>").prop("checked", false);

                if (familyDelete == "1") $("#<%=familyDelete.ClientID %>").prop("checked", true);
                else $("#<%=familyDelete.ClientID %>").prop("checked", false);

                if (familyVisible == "1") $("#<%=familyVisible.ClientID %>").prop("checked", true);
                else $("#<%=familyVisible.ClientID %>").prop("checked", false);

                if (brandCreate == "1") $("#<%=brandCreate.ClientID %>").prop("checked", true);
                else $("#<%=brandCreate.ClientID %>").prop("checked", false);

                if (brandModify == "1") $("#<%=brandModify.ClientID %>").prop("checked", true);
                else $("#<%=brandModify.ClientID %>").prop("checked", false);

                if (brandDelete == "1") $("#<%=brandDelete.ClientID %>").prop("checked", true);
                else $("#<%=brandDelete.ClientID %>").prop("checked", false);

                if (brandVisible == "1") $("#<%=brandVisible.ClientID %>").prop("checked", true);
                else $("#<%=brandVisible.ClientID %>").prop("checked", false);

                if (lineCreate == "1") $("#<%=lineCreate.ClientID %>").prop("checked", true);
                else $("#<%=lineCreate.ClientID %>").prop("checked", false);

                if (lineModify == "1") $("#<%=lineModify.ClientID %>").prop("checked", true);
                else $("#<%=lineModify.ClientID %>").prop("checked", false);

                if (lineDelete == "1") $("#<%=lineDelete.ClientID %>").prop("checked", true);
                else $("#<%=lineDelete.ClientID %>").prop("checked", false);

                if (lineVisible == "1") $("#<%=lineVisible.ClientID %>").prop("checked", true);
                else $("#<%=lineVisible.ClientID %>").prop("checked", false);

                if (cashCount == "1") $("#<%=cashCount.ClientID %>").prop("checked", true);
                else $("#<%=cashCount.ClientID %>").prop("checked", false);

                if (declared == "1") $("#<%=declared.ClientID %>").prop("checked", true);
                else $("#<%=declared.ClientID %>").prop("checked", false);

                if (reportByPaymentType == "1") $("#<%=reportByPaymentType.ClientID %>").prop("checked", true);
                else $("#<%=reportByPaymentType.ClientID %>").prop("checked", false);

                if (seller == "1") $("#<%=seller.ClientID %>").prop("checked", true);
                else $("#<%=seller.ClientID %>").prop("checked", false);

                if (saleSummary == "1") $("#<%=saleSummary.ClientID %>").prop("checked", true);
                else $("#<%=saleSummary.ClientID %>").prop("checked", false);

                if (collectionsOrPayments == "1") $("#<%=collectionsOrPayments.ClientID %>").prop("checked", true);
                else $("#<%=collectionsOrPayments.ClientID %>").prop("checked", false);

                if (returnSummary == "1") $("#<%=returnSummary.ClientID %>").prop("checked", true);
                else $("#<%=returnSummary.ClientID %>").prop("checked", false);

                if (returnDetail == "1") $("#<%=returnDetail.ClientID %>").prop("checked", true);
                else $("#<%=returnDetail.ClientID %>").prop("checked", false);

                if (voidSummary == "1") $("#<%=voidSummary.ClientID %>").prop("checked", true);
                else $("#<%=voidSummary.ClientID %>").prop("checked", false);

                if (voidDetail == "1") $("#<%=voidDetail.ClientID %>").prop("checked", true);
                else $("#<%=voidDetail.ClientID %>").prop("checked", false);

                if (complimentary == "1") $("#<%=complimentary.ClientID %>").prop("checked", true);
                else $("#<%=complimentary.ClientID %>").prop("checked", false);

                if (saleBySection == "1") $("#<%=saleBySection.ClientID %>").prop("checked", true);
                else $("#<%=saleBySection.ClientID %>").prop("checked", false);

                if (saleByItem == "1") $("#<%=saleByItem.ClientID %>").prop("checked", true);
                else $("#<%=saleByItem.ClientID %>").prop("checked", false);

                if (discountDetail == "1") $("#<%=discountDetail.ClientID %>").prop("checked", true);
                else $("#<%=discountDetail.ClientID %>").prop("checked", false);

                if (customerMasterCreate == "1") $("#<%=customerMasterCreate.ClientID %>").prop("checked", true);
                else $("#<%=customerMasterCreate.ClientID %>").prop("checked", false);

                if (customerMasterModify == "1") $("#<%=customerMasterModify.ClientID %>").prop("checked", true);
                else $("#<%=customerMasterModify.ClientID %>").prop("checked", false);

                if (customerMasterDelete == "1") $("#<%=customerMasterDelete.ClientID %>").prop("checked", true);
                else $("#<%=customerMasterDelete.ClientID %>").prop("checked", false);

                if (customerMasterVisible == "1") $("#<%=customerMasterVisible.ClientID %>").prop("checked", true);
                else $("#<%=customerMasterVisible.ClientID %>").prop("checked", false);

                if (consultBalanceCreate == "1") $("#<%=consultBalanceCreate.ClientID %>").prop("checked", true);
                else $("#<%=consultBalanceCreate.ClientID %>").prop("checked", false);

                if (consultBalanceModify == "1") $("#<%=consultBalanceModify.ClientID %>").prop("checked", true);
                else $("#<%=consultBalanceModify.ClientID %>").prop("checked", false);

                if (consultBalanceDelete == "1") $("#<%=consultBalanceDelete.ClientID %>").prop("checked", true);
                else $("#<%=consultBalanceDelete.ClientID %>").prop("checked", false);

                if (consultBalanceVisible == "1") $("#<%=consultBalanceVisible.ClientID %>").prop("checked", true);
                else $("#<%=consultBalanceVisible.ClientID %>").prop("checked", false);

                if (tableCreate == "1") $("#<%=tableCreate.ClientID %>").prop("checked", true);
                else $("#<%=tableCreate.ClientID %>").prop("checked", false);

                if (tableModify == "1") $("#<%=tableModify.ClientID %>").prop("checked", true);
                else $("#<%=tableModify.ClientID %>").prop("checked", false);

                if (tableDelete == "1") $("#<%=tableDelete.ClientID %>").prop("checked", true);
                else $("#<%=tableDelete.ClientID %>").prop("checked", false);

                if (tableVisible == "1") $("#<%=tableVisible.ClientID %>").prop("checked", true);
                else $("#<%=tableVisible.ClientID %>").prop("checked", false);

                if (salesCreate == "1") $("#<%=salesCreate.ClientID %>").prop("checked", true);
                else $("#<%=salesCreate.ClientID %>").prop("checked", false);

                if (salesModify == "1") $("#<%=salesModify.ClientID %>").prop("checked", true);
                else $("#<%=salesModify.ClientID %>").prop("checked", false);

                if (salesDelete == "1") $("#<%=salesDelete.ClientID %>").prop("checked", true);
                else $("#<%=salesDelete.ClientID %>").prop("checked", false);

                if (salesVisible == "1") $("#<%=salesVisible.ClientID %>").prop("checked", true);
                else $("#<%=salesVisible.ClientID %>").prop("checked", false);

                if (deliveryCreate == "1") $("#<%=deliveryCreate.ClientID %>").prop("checked", true);
                else $("#<%=deliveryCreate.ClientID %>").prop("checked", false);

                if (deliveryModify == "1") $("#<%=deliveryModify.ClientID %>").prop("checked", true);
                else $("#<%=deliveryModify.ClientID %>").prop("checked", false);

                if (deliveryDelete == "1") $("#<%=deliveryDelete.ClientID %>").prop("checked", true);
                else $("#<%=deliveryDelete.ClientID %>").prop("checked", false);

                if (deliveryVisible == "1") $("#<%=deliveryVisible.ClientID %>").prop("checked", true);
                else $("#<%=deliveryVisible.ClientID %>").prop("checked", false);

                if (takeAwayCreate == "1") $("#<%=takeAwayCreate.ClientID %>").prop("checked", true);
                else $("#<%=takeAwayCreate.ClientID %>").prop("checked", false);

                if (takeAwayModify == "1") $("#<%=takeAwayModify.ClientID %>").prop("checked", true);
                else $("#<%=takeAwayModify.ClientID %>").prop("checked", false);

                if (takeAwayDelete == "1") $("#<%=takeAwayDelete.ClientID %>").prop("checked", true);
                else $("#<%=takeAwayDelete.ClientID %>").prop("checked", false);

                if (takeAwayVisible == "1") $("#<%=takeAwayVisible.ClientID %>").prop("checked", true);
                else $("#<%=takeAwayVisible.ClientID %>").prop("checked", false);

                if (allowInventoryToGoNegative == "1") $("#<%=allowInventoryToGoNegative.ClientID %>").prop("checked", true);
                else $("#<%=allowInventoryToGoNegative.ClientID %>").prop("checked", false);

                if (declareInventory == "1") $("#<%=declareInventory.ClientID %>").prop("checked", true);
                else $("#<%=declareInventory.ClientID %>").prop("checked", false);

                if (declareWastage == "1") $("#<%=declareWastage.ClientID %>").prop("checked", true);
                else $("#<%=declareWastage.ClientID %>").prop("checked", false);

                if (inventoryAdjustment == "1") $("#<%=inventoryAdjustment.ClientID %>").prop("checked", true);
                else $("#<%=inventoryAdjustment.ClientID %>").prop("checked", false);

                if (closeInventory == "1") $("#<%=closeInventory.ClientID %>").prop("checked", true);
                else $("#<%=closeInventory.ClientID %>").prop("checked", false);

                if (salePriceCreate == "1") $("#<%=salePriceCreate.ClientID %>").prop("checked", true);
                else $("#<%=salePriceCreate.ClientID %>").prop("checked", false);

                if (salePriceModify == "1") $("#<%=salePriceModify.ClientID %>").prop("checked", true);
                else $("#<%=salePriceModify.ClientID %>").prop("checked", false);

                if (salePriceDelete == "1") $("#<%=salePriceDelete.ClientID %>").prop("checked", true);
                else $("#<%=salePriceDelete.ClientID %>").prop("checked", false);

                if (salePriceVisible == "1") $("#<%=salePriceVisible.ClientID %>").prop("checked", true);
                else $("#<%=salePriceVisible.ClientID %>").prop("checked", false);

                if (costCreate == "1") $("#<%=costCreate.ClientID %>").prop("checked", true);
                else $("#<%=costCreate.ClientID %>").prop("checked", false);

                if (costModify == "1") $("#<%=costModify.ClientID %>").prop("checked", true);
                else $("#<%=costModify.ClientID %>").prop("checked", false);

                if (costDelete == "1") $("#<%=costDelete.ClientID %>").prop("checked", true);
                else $("#<%=costDelete.ClientID %>").prop("checked", false);

                if (costVisible == "1") $("#<%=costVisible.ClientID %>").prop("checked", true);
                else $("#<%=costVisible.ClientID %>").prop("checked", false);

                if (itemCreate == "1") $("#<%=itemCreate.ClientID %>").prop("checked", true);
                else $("#<%=itemCreate.ClientID %>").prop("checked", false);

                if (itemModify == "1") $("#<%=itemModify.ClientID %>").prop("checked", true);
                else $("#<%=itemModify.ClientID %>").prop("checked", false);

                if (itemDelete == "1") $("#<%=itemDelete.ClientID %>").prop("checked", true);
                else $("#<%=itemDelete.ClientID %>").prop("checked", false);

                if (itemVisible == "1") $("#<%=itemVisible.ClientID %>").prop("checked", true);
                else $("#<%=itemVisible.ClientID %>").prop("checked", false);

                if (modifierCreate == "1") $("#<%=modifierCreate.ClientID %>").prop("checked", true);
                else $("#<%=modifierCreate.ClientID %>").prop("checked", false);

                if (modifierModify == "1") $("#<%=modifierModify.ClientID %>").prop("checked", true);
                else $("#<%=modifierModify.ClientID %>").prop("checked", false);

                if (modifierDelete == "1") $("#<%=modifierDelete.ClientID %>").prop("checked", true);
                else $("#<%=modifierDelete.ClientID %>").prop("checked", false);

                if (modifierVisible == "1") $("#<%=modifierVisible.ClientID %>").prop("checked", true);
                else $("#<%=modifierVisible.ClientID %>").prop("checked", false);

                if (formatCreate == "1") $("#<%=formatCreate.ClientID %>").prop("checked", true);
                else $("#<%=formatCreate.ClientID %>").prop("checked", false);

                if (formatModify == "1") $("#<%=formatModify.ClientID %>").prop("checked", true);
                else $("#<%=formatModify.ClientID %>").prop("checked", false);

                if (formatDelete == "1") $("#<%=formatDelete.ClientID %>").prop("checked", true);
                else $("#<%=formatDelete.ClientID %>").prop("checked", false);

                if (formatVisible == "1") $("#<%=formatVisible.ClientID %>").prop("checked", true);
                else $("#<%=formatVisible.ClientID %>").prop("checked", false);

                if (fixedItemCreate == "1") $("#<%=fixedItemCreate.ClientID %>").prop("checked", true);
                else $("#<%=fixedItemCreate.ClientID %>").prop("checked", false);

                if (fixedItemModify == "1") $("#<%=fixedItemModify.ClientID %>").prop("checked", true);
                else $("#<%=fixedItemModify.ClientID %>").prop("checked", false);

                if (fixedItemDelete == "1") $("#<%=fixedItemDelete.ClientID %>").prop("checked", true);
                else $("#<%=fixedItemDelete.ClientID %>").prop("checked", false);

                if (fixedItemVisible == "1") $("#<%=fixedItemVisible.ClientID %>").prop("checked", true);
                else $("#<%=fixedItemVisible.ClientID %>").prop("checked", false);

                if (priceListCreate == "1") $("#<%=priceListCreate.ClientID %>").prop("checked", true);
                else $("#<%=priceListCreate.ClientID %>").prop("checked", false);

                if (priceListModify == "1") $("#<%=priceListModify.ClientID %>").prop("checked", true);
                else $("#<%=priceListModify.ClientID %>").prop("checked", false);

                if (priceListDelete == "1") $("#<%=priceListDelete.ClientID %>").prop("checked", true);
                else $("#<%=priceListDelete.ClientID %>").prop("checked", false);

                if (priceListVisible == "1") $("#<%=priceListVisible.ClientID %>").prop("checked", true);
                else $("#<%=priceListVisible.ClientID %>").prop("checked", false);

                if (purchaseOrderCreate == "1") $("#<%=purchaseOrderCreate.ClientID %>").prop("checked", true);
                else $("#<%=purchaseOrderCreate.ClientID %>").prop("checked", false);

                if (purchaseOrderModify == "1") $("#<%=purchaseOrderModify.ClientID %>").prop("checked", true);
                else $("#<%=purchaseOrderModify.ClientID %>").prop("checked", false);

                if (purchaseOrderDelete == "1") $("#<%=purchaseOrderDelete.ClientID %>").prop("checked", true);
                else $("#<%=purchaseOrderDelete.ClientID %>").prop("checked", false);

                if (purchaseOrderVisible == "1") $("#<%=purchaseOrderVisible.ClientID %>").prop("checked", true);
                else $("#<%=purchaseOrderVisible.ClientID %>").prop("checked", false);

                if (purchaseDeliveryCreate == "1") $("#<%=purchaseDeliveryCreate.ClientID %>").prop("checked", true);
                else $("#<%=purchaseDeliveryCreate.ClientID %>").prop("checked", false);

                if (purchaseDeliveryModify == "1") $("#<%=purchaseDeliveryModify.ClientID %>").prop("checked", true);
                else $("#<%=purchaseDeliveryModify.ClientID %>").prop("checked", false);

                if (purchaseDeliveryDelete == "1") $("#<%=purchaseDeliveryDelete.ClientID %>").prop("checked", true);
                else $("#<%=purchaseDeliveryDelete.ClientID %>").prop("checked", false);

                if (purchaseDeliveryVisible == "1") $("#<%=purchaseDeliveryVisible.ClientID %>").prop("checked", true);
                else $("#<%=purchaseDeliveryVisible.ClientID %>").prop("checked", false);

                if (supplierCreationCreate == "1") $("#<%=supplierCreationCreate.ClientID %>").prop("checked", true);
                else $("#<%=supplierCreationCreate.ClientID %>").prop("checked", false);

                if (supplierCreationModify == "1") $("#<%=supplierCreationModify.ClientID %>").prop("checked", true);
                else $("#<%=supplierCreationModify.ClientID %>").prop("checked", false);

                if (supplierCreationDelete == "1") $("#<%=supplierCreationDelete.ClientID %>").prop("checked", true);
                else $("#<%=supplierCreationDelete.ClientID %>").prop("checked", false);

                if (supplierCreationVisible == "1") $("#<%=supplierCreationVisible.ClientID %>").prop("checked", true);
                else $("#<%=supplierCreationVisible.ClientID %>").prop("checked", false);

                if (supplierPriceListCreate == "1") $("#<%=supplierPriceListCreate.ClientID %>").prop("checked", true);
                else $("#<%=supplierPriceListCreate.ClientID %>").prop("checked", false);

                if (supplierPriceListModify == "1") $("#<%=supplierPriceListModify.ClientID %>").prop("checked", true);
                else $("#<%=supplierPriceListModify.ClientID %>").prop("checked", false);

                if (supplierPriceListDelete == "1") $("#<%=supplierPriceListDelete.ClientID %>").prop("checked", true);
                else $("#<%=supplierPriceListDelete.ClientID %>").prop("checked", false);

                if (supplierPriceListVisible == "1") $("#<%=supplierPriceListVisible.ClientID %>").prop("checked", true);
                else $("#<%=supplierPriceListVisible.ClientID %>").prop("checked", false);

                if (purchaseOrderReport == "1") $("#<%=purchaseOrderReport.ClientID %>").prop("checked", true);
                else $("#<%=purchaseOrderReport.ClientID %>").prop("checked", false);

                if (purchaseDeliveryNote == "1") $("#<%=purchaseDeliveryNote.ClientID %>").prop("checked", true);
                else $("#<%=purchaseDeliveryNote.ClientID %>").prop("checked", false);

                if (inventory == "1") $("#<%=inventory.ClientID %>").prop("checked", true);
                else $("#<%=inventory.ClientID %>").prop("checked", false);

                if (purchaseSalesAndStock == "1") $("#<%=purchaseSalesAndStock.ClientID %>").prop("checked", true);
                else $("#<%=purchaseSalesAndStock.ClientID %>").prop("checked", false);

                if (currentStock == "1") $("#<%=currentStock.ClientID %>").prop("checked", true);
                else $("#<%=currentStock.ClientID %>").prop("checked", false);

                if (consumption == "1") $("#<%=consumption.ClientID %>").prop("checked", true);
                else $("#<%=consumption.ClientID %>").prop("checked", false);

                if (credit == "1") $("#<%=credit.ClientID %>").prop("checked", true);
                else $("#<%=credit.ClientID %>").prop("checked", false);

                if (voidBill == "1") $("#<%=voidBill.ClientID %>").prop("checked", true);
                else $("#<%=voidBill.ClientID %>").prop("checked", false);

                if (roundBill == "1") $("#<%=roundBill.ClientID %>").prop("checked", true);
                else $("#<%=roundBill.ClientID %>").prop("checked", false);

                if (addItem == "1") $("#<%=addItem.ClientID %>").prop("checked", true);
                else $("#<%=addItem.ClientID %>").prop("checked", false);

                if (discount == "1") $("#<%=discount.ClientID %>").prop("checked", true);
                else $("#<%=discount.ClientID %>").prop("checked", false);

                if (billModification == "1") $("#<%=billModification.ClientID %>").prop("checked", true);
                else $("#<%=billModification.ClientID %>").prop("checked", false);

                if (voidLine == "1") $("#<%=voidLine.ClientID %>").prop("checked", true);
                else $("#<%=voidLine.ClientID %>").prop("checked", false);

                if (returnItem == "1") $("#<%=returnItem.ClientID %>").prop("checked", true);
                else $("#<%=returnItem.ClientID %>").prop("checked", false);

                if (byPaymentType == "1") $("#<%=byPaymentType.ClientID %>").prop("checked", true);
                else $("#<%=byPaymentType.ClientID %>").prop("checked", false);

                if (salesSummary == "1") $("#<%=salesSummary.ClientID %>").prop("checked", true);
                else $("#<%=salesSummary.ClientID %>").prop("checked", false);

                if (byTable == "1") $("#<%=byTable.ClientID %>").prop("checked", true);
                else $("#<%=byTable.ClientID %>").prop("checked", false);

                if (byHours == "1") $("#<%=byHours.ClientID %>").prop("checked", true);
                else $("#<%=byHours.ClientID %>").prop("checked", false);

                if (byDepartment == "1") $("#<%=byDepartment.ClientID %>").prop("checked", true);
                else $("#<%=byDepartment.ClientID %>").prop("checked", false);

                if (bySection == "1") $("#<%=bySection.ClientID %>").prop("checked", true);
                else $("#<%=bySection.ClientID %>").prop("checked", false);

                if (byServiceTax == "1") $("#<%=byServiceTax.ClientID %>").prop("checked", true);
                else $("#<%=byServiceTax.ClientID %>").prop("checked", false);

                if (returns == "1") $("#<%=returns.ClientID %>").prop("checked", true);
                else $("#<%=returns.ClientID %>").prop("checked", false);

                if (voids == "1") $("#<%=voids.ClientID %>").prop("checked", true);
                else $("#<%=voids.ClientID %>").prop("checked", false);

                if (pendingCollection == "1") $("#<%=pendingCollection.ClientID %>").prop("checked", true);
                else $("#<%=pendingCollection.ClientID %>").prop("checked", false);

                if (profitMargin == "1") $("#<%=profitMargin.ClientID %>").prop("checked", true);
                else $("#<%=profitMargin.ClientID %>").prop("checked", false);

                if (complimentary_sale_report == "1") $("#<%=complimentary_sale_report.ClientID %>").prop("checked", true);
                else $("#<%=complimentary_sale_report.ClientID %>").prop("checked", false);

                if (vouchers == "1") $("#<%=vouchers.ClientID %>").prop("checked", true);
                else $("#<%=vouchers.ClientID %>").prop("checked", false);

                if (salesByFormat == "1") $("#<%=salesByFormat.ClientID %>").prop("checked", true);
                else $("#<%=salesByFormat.ClientID %>").prop("checked", false);

                if (staffMealReport == "1") $("#<%=staffMealReport.ClientID %>").prop("checked", true);
                else $("#<%=staffMealReport.ClientID %>").prop("checked", false);

                if (salesByPortion == "1") $("#<%=salesByPortion.ClientID %>").prop("checked", true);
                else $("#<%=salesByPortion.ClientID %>").prop("checked", false);

                if (exitToWindow == "1") $("#<%=exitToWindow.ClientID %>").prop("checked", true);
                else $("#<%=exitToWindow.ClientID %>").prop("checked", false);

                if (openTableOfOtherEmployee == "1") $("#<%=openTableOfOtherEmployee.ClientID %>").prop("checked", true);
                else $("#<%=openTableOfOtherEmployee.ClientID %>").prop("checked", false);

                if (changeRoom == "1") $("#<%=changeRoom.ClientID %>").prop("checked", true);
                else $("#<%=changeRoom.ClientID %>").prop("checked", false);

                if (changeTable == "1") $("#<%=changeTable.ClientID %>").prop("checked", true);
                else $("#<%=changeTable.ClientID %>").prop("checked", false);

                if (modifyCover == "1") $("#<%=modifyCover.ClientID %>").prop("checked", true);
                else $("#<%=modifyCover.ClientID %>").prop("checked", false);

                if (createCard == "1") $("#<%=createCard.ClientID %>").prop("checked", true);
                else $("#<%=createCard.ClientID %>").prop("checked", false);

                if (swipeCardOnSale == "1") $("#<%=swipeCardOnSale.ClientID %>").prop("checked", true);
                else $("#<%=swipeCardOnSale.ClientID %>").prop("checked", false);
                
                //args = id + "," + deptName + "," + description
                //__doPostBack("id", id);
                //return false;



            }
        }


        function deleteRow(id) {
            window.isDelete = true;

            if (confirm('Sure To Delete?')) {
                $.post("../Ajax/employeeRole.aspx",
                    {
                        employeeRoleID: id,
                        StatementType: 'Delete'
                    },

                    function (response) {
                        //alert(response);
                        //PageMethods.SendForm(response);
                        //PageMethods.saveImage(window.ID);

                        //alert("Data deleted...");
                        $(document).trigger("add-alerts", [
                                {
                                    'message': "Data deleted...",
                                    'priority': 'error'
                                }
                              ]);


                    }
                );
            } else {
                // Do nothing!
            }

            //clearAllElements();
            return false;
        }

        function clearAllElements() {
            window.IU = 'I';
            window.ID = -1;
            window.isDelete = false;

            $("input[type='text']").val(null);

            $("#deptName").val(null);
            $("#description").val(null);
            $("#colorSelector > div").css("background-color", "transparent");
            $("#colorSelector_text > div").css("background-color", "transparent");
            $("#costCenter").val(null);
            $("#saleAcct").val(null);
            $("#purchaseAcct").val(null);

            src = "../uploadedImg/" + "dummy" + ".jpg";
            $("#ctl00_MainContent_ImageUploader_imgPreview").attr("src", src);
            $("#ctl00_MainContent_ImageUploader_imgPreview").css("height", "auto");
            $("#ctl00_MainContent_ImageUploader_imgPreview").css("width", "auto");
        }

        function searchKeyword(searchText) {
            if ($("#<%= searchBy.ClientID %>").val() != -1) {
                __doPostBack("<%= UpdatePanel2.ClientID %>", $("#<%= searchBy.ClientID %>").val() + ":,:" + searchText);
            }
            else {
                alert("Select search criteria!!!");
            }
        }

        function clearSearch() {
            $("#<%= searchBy.ClientID %>").val("-1");
            $("#<%= searchText.ClientID %>").val(null);

            __doPostBack("<%= UpdatePanel2.ClientID %>", "clearSearch");

        }
      </script>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">

    <div id="alertBox" data-alerts="alerts"  data-fade="3000"></div>

    <div id="breadCrum"><h1>Master > Employee Role</h1></div>

    <div id="content">   
        
        <div class="contentbox-wrapper">

        <div class="tabbable contentbox" id="tabContent"> 

            <ul class="nav nav-tabs">
                <li id="tab1Ref" class="active"><a href="#tab1" data-toggle="tab">List</a></li>
                <li id="tab2Ref"><a href="#tab2" data-toggle="tab">Create New</a></li>

                <li  style="float:right">
                    <div>
                        <div id="submit" class="btn" >Submit</div>
                        <div id="btnCancel" class="btn" >Cancel</div>
                    </div>
                </li>
            </ul>

            <div class="tab-content">
                <div class="tab-pane active" id="tab1">

                    <asp:ScriptManager runat="server" ID="ScriptManager1" EnablePageMethods="true" EnablePartialRendering="true">
                    </asp:ScriptManager> 

                    <asp:UpdatePanel runat="server" ID="UpdatePanel2" UpdateMode="Always">
                        <ContentTemplate>

                    <div id="searchArea">
                        <asp:DropDownList id="searchBy" runat="server" AutoPostBack="false">
                            <asp:ListItem Value="-1" Text="Select Search By"></asp:ListItem>
                            <asp:ListItem Value="employeeRole" Text="Employee role"></asp:ListItem>
                            <asp:ListItem Value="employeeRoleID" Text="Employee role ID"></asp:ListItem>
                        </asp:DropDownList>
                        
                        <asp:TextBox id="searchText" class="searchText" runat="server" AutoPostBack="false" placeholder="search keyword..."  onkeyup="searchKeyword(this.value);" ></asp:TextBox>

                        <label id="clearSearch" title="Clear Search" onclick="clearSearch();">Clear Search</label>
                    </div>

                    <!-- <asp:Panel ID="Panel1" ScrollBars="Vertical" Height="300" runat="server"> -->
                        <asp:ListView ID="lstvEmployeeRole" runat="server">
            <LayoutTemplate >
                <!-- <label style="background:#00ffff; font-size:medium; padding:10px 7px;">Department Name List</label> -->

                <table class="table table-condensed" id="dataRows">
                    <tr>
                        <th>Employee Role ID</th>
                        <th colspan="2">Employee Role</th>
                    </tr>
                    <asp:PlaceHolder id="itemPlaceholder" runat="server" />
                </table>
            </LayoutTemplate>

            <ItemTemplate>
             

                <asp:PlaceHolder id="itemPlaceholder" runat="server" />
                <tr ondblclick="updateRow(<%#Eval("employeeRoleID") %>, '<%#Eval("description") %>', <%#Eval("saleMenu") %>, <%#Eval("userMenu") %>, <%#Eval("tableMenu") %>, 
                 <%#Eval("departmentCreate") %>, <%#Eval("departmentModify") %>, <%#Eval("departmentDelete") %>, <%#Eval("departmentVisible") %>, <%#Eval("sectionCreate") %>, <%#Eval("sectionModify") %>, <%#Eval("sectionDelete") %>, <%#Eval("sectionVisible") %>, <%#Eval("familyCreate") %>, <%#Eval("familyModify") %>, <%#Eval("familyDelete") %>, <%#Eval("familyVisible") %>, <%#Eval("brandCreate") %>, <%#Eval("brandModify") %>, <%#Eval("brandDelete") %>, <%#Eval("brandVisible") %>, <%#Eval("lineCreate") %>, <%#Eval("lineModify") %>, <%#Eval("lineDelete") %>, <%#Eval("lineVisible") %>, 
                 <%#Eval("cashCount") %>, <%#Eval("declared") %>, <%#Eval("reportByPaymentType") %>, <%#Eval("seller") %>, <%#Eval("saleSummary") %>, <%#Eval("collectionsOrPayments") %>, <%#Eval("returnSummary") %>, <%#Eval("returnDetail") %>, <%#Eval("voidSummary") %>, <%#Eval("voidDetail") %>, <%#Eval("complimentary") %>, <%#Eval("saleBySection") %>, <%#Eval("saleByItem") %>, <%#Eval("discountDetail") %>, 
                 <%#Eval("customerMasterCreate") %>, <%#Eval("customerMasterModify") %>, <%#Eval("customerMasterDelete") %>, <%#Eval("customerMasterVisible") %>, <%#Eval("consultBalanceCreate") %>, <%#Eval("consultBalanceModify") %>, <%#Eval("consultBalanceDelete") %>, <%#Eval("consultBalanceVisible") %>, 
                 <%#Eval("tableCreate") %>, <%#Eval("tableModify") %>, <%#Eval("tableDelete") %>, <%#Eval("tableVisible") %>, <%#Eval("salesCreate") %>, <%#Eval("salesModify") %>, <%#Eval("salesDelete") %>, <%#Eval("salesVisible") %>, <%#Eval("deliveryCreate") %>, <%#Eval("deliveryModify") %>, <%#Eval("deliveryDelete") %>, <%#Eval("deliveryVisible") %>, <%#Eval("takeAwayCreate") %>, <%#Eval("takeAwayModify") %>, <%#Eval("takeAwayDelete") %>, <%#Eval("takeAwayVisible") %>,
                 <%#Eval("allowInventoryToGoNegative") %>, <%#Eval("declareInventory") %>, <%#Eval("declareWastage") %>, <%#Eval("inventoryAdjustment") %>, <%#Eval("closeInventory") %>,
                 <%#Eval("salePriceCreate") %>, <%#Eval("salePriceModify") %>, <%#Eval("salePriceDelete") %>, <%#Eval("salePriceVisible") %>, <%#Eval("costCreate") %>, <%#Eval("costModify") %>, <%#Eval("costDelete") %>, <%#Eval("costVisible") %>, <%#Eval("itemCreate") %>, <%#Eval("itemModify") %>, <%#Eval("itemDelete") %>, <%#Eval("itemVisible") %>, <%#Eval("modifierCreate") %>, <%#Eval("modifierModify") %>, <%#Eval("modifierDelete") %>, <%#Eval("modifierVisible") %>, <%#Eval("formatCreate") %>, <%#Eval("formatModify") %>, <%#Eval("formatDelete") %>, <%#Eval("formatVisible") %>, <%#Eval("fixedItemCreate") %>, <%#Eval("fixedItemModify") %>, <%#Eval("fixedItemDelete") %>, <%#Eval("fixedItemVisible") %>, <%#Eval("priceListCreate") %>, <%#Eval("priceListModify") %>, <%#Eval("priceListDelete") %>, <%#Eval("priceListVisible") %>,
                 <%#Eval("purchaseOrderCreate") %>, <%#Eval("purchaseOrderModify") %>, <%#Eval("purchaseOrderDelete") %>, <%#Eval("purchaseOrderVisible") %>, <%#Eval("purchaseDeliveryCreate") %>, <%#Eval("purchaseDeliveryModify") %>, <%#Eval("purchaseDeliveryDelete") %>, <%#Eval("purchaseDeliveryVisible") %>, <%#Eval("supplierCreationCreate") %>, <%#Eval("supplierCreationModify") %>, <%#Eval("supplierCreationDelete") %>, <%#Eval("supplierCreationVisible") %>, <%#Eval("supplierPriceListCreate") %>, <%#Eval("supplierPriceListModify") %>, <%#Eval("supplierPriceListDelete") %>, <%#Eval("supplierPriceListVisible") %>,
                 <%#Eval("purchaseOrderReport") %>, <%#Eval("purchaseDeliveryNote") %>, <%#Eval("inventory") %>, <%#Eval("purchaseSalesAndStock") %>, <%#Eval("currentStock") %>, <%#Eval("consumption") %>,
                 <%#Eval("credit") %>, <%#Eval("voidBill") %>, <%#Eval("roundBill") %>, <%#Eval("addItem") %>, <%#Eval("discount") %>, <%#Eval("billModification") %>, <%#Eval("voidLine") %>, <%#Eval("returnItem") %>,
                 <%#Eval("byPaymentType") %>, <%#Eval("salesSummary") %>, <%#Eval("byTable") %>, <%#Eval("byHours") %>, <%#Eval("byDepartment") %>, <%#Eval("bySection") %>, <%#Eval("byServiceTax") %>, <%#Eval("returns") %>, <%#Eval("voids") %>, <%#Eval("pendingCollection") %>, <%#Eval("profitMargin") %>, <%#Eval("complimentary_sale_report") %>, <%#Eval("vouchers") %>, <%#Eval("salesByFormat") %>, <%#Eval("staffMealReport") %>, <%#Eval("salesByPortion") %>,
                 <%#Eval("exitToWindow") %>,
                 <%#Eval("openTableOfOtherEmployee") %>, <%#Eval("changeRoom") %>, <%#Eval("changeTable") %>, <%#Eval("modifyCover") %>,
                 <%#Eval("createCard") %>, <%#Eval("swipeCardOnSale") %>) ;
                                $('#tab2').addClass('active');
                                $('#tab2Ref').addClass('active');

                                $('#tab1').removeClass('active');
                                $('#tab1Ref').removeClass('active');
                                $('#tab2Ref a').html('Edit / Update');
                ">
                    <td>
                        <asp:Label ID="lblEmployeeRoleID" runat="Server" Text='<%#Eval("employeeRoleID") %>' />
                    </td>

                    <td>
                        <asp:Label ID="lblDescription" runat="Server" Text='<%#Eval("description") %>' />
                    </td>

                    <td class="btn btn-danger btn-mini"  onmouseup="deleteRow(<%#Eval("employeeRoleID") %>)" style="cursor:pointer"></td>
                </tr>
            </ItemTemplate>
        </asp:ListView>
                        
                        
                    <!-- </asp:Panel> -->


                    <div class="pagination">
                        <asp:DataPager ID="DataPager" runat="server" PagedControlID="lstvEmployeeRole" 
                            PageSize="5" onprerender="DataPager_PreRender" >
                            <Fields>
                                <asp:NextPreviousPagerField PreviousPageText="<" FirstPageText="<<" ShowFirstPageButton="true" ShowNextPageButton="False" />
                                <asp:NumericPagerField  />
                                <asp:NextPreviousPagerField NextPageText=">" LastPageText=">>" ShowLastPageButton="true" ShowPreviousPageButton="False" />
                                <asp:TemplatePagerField>
                                    <PagerTemplate>
                                        <b>
                                            Page
                                            <asp:Label runat="server" ID="CurrentPageLabel" 
                                              Text="<%# Container.TotalRowCount>0 ? (Container.StartRowIndex / Container.PageSize) + 1 : 0 %>" />
                                            of
                                            <asp:Label runat="server" ID="TotalPagesLabel" 
                                              Text="<%# Math.Ceiling ((double)Container.TotalRowCount / Container.PageSize) %>" />
                                            [ Total Records = 
                                            <asp:Label runat="server" ID="TotalItemsLabel" 
                                              Text="<%# Container.TotalRowCount%>" />
                                            ]
                                            <br />
                                         </b>
                                    </PagerTemplate>
                                </asp:TemplatePagerField>
                            </Fields>
                        </asp:DataPager>
                    </div>

                </ContentTemplate>
                    </asp:UpdatePanel>


                    
            
                </div>

                <div class="tab-pane" id="tab2">
                    <form class="navbar-form pull-left" id="employeeRoleForm" action="employeeRole.aspx">

                     

                   <div id="employeeRole" class="row-fluid">

                        <div class="tabbable"> <!-- Only required for left/right tabs -->
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#tabOp1" data-toggle="tab">Property</a></li>
                                <li><a href="#tabOp2" data-toggle="tab">Classification</a></li>
                                <li><a href="#tabOp3" data-toggle="tab">Clossing report</a></li>
                                <li><a href="#tabOp4" data-toggle="tab">Cunstomer</a></li>
                                <li><a href="#tabOp5" data-toggle="tab">Form</a></li>
                                <li><a href="#tabOp6" data-toggle="tab">Inventory</a></li>
                                <li><a href="#tabOp7" data-toggle="tab">Item</a></li>
                                <li><a href="#tabOp8" data-toggle="tab">Purchase</a></li>
                                <li><a href="#tabOp9" data-toggle="tab">Purchase & inventory report</a></li>
                                <li><a href="#tabOp10" data-toggle="tab">Sales</a></li>
                                <li><a href="#tabOp11" data-toggle="tab">Sales report</a></li>
                                <li><a href="#tabOp12" data-toggle="tab">System</a></li>
                                <li><a href="#tabOp13" data-toggle="tab">Table</a></li>
                                <li><a href="#tabOp14" data-toggle="tab">Loyalty</a></li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane active" id="tabOp1">
                                        <div class="span6">
                                            <table>
                                                <tr>
                                                    <td><label>Employee Role ID</label></td>
                                                    <td><asp:TextBox id="nextID" runat="server" class="span2" ReadOnly="true" ></asp:TextBox></td>
                                                </tr>

                                                <tr>
                                                    <td><label>Description</label></td>
                                                    <td><input id="description" type="text" placeholder="description" class="span2" /></td>
                                                </tr>

                                                <tr>
                                                    <td><label>Sale Menu</label></td>
                                                    <td><input id="saleMenu" type="text" placeholder="Sale Menu" class="span2" /></td>
                                                </tr>

                                                <tr>
                                                    <td><label>User Menu</label></td>
                                                    <td><input id="userMenu" type="text" placeholder="User Menu" class="span2" /></td>
                                                </tr>

                                                <tr>
                                                    <td><label>Table Menu</label></td>
                                                    <td><input id="tableMenu" type="text" placeholder="Table Menu" class="span2" /></td>
                                                </tr>

                                                <tr>
                                                    <td></td>
                                                    <td></td>
                                                </tr>                  
                                                               <!-- Item Name -->
                                            </table>
                                        </div>

                                        <div class="span6">
                                            <table>
                            
                                            </table>
                                        </div>
                                </div>

                                <div class="tab-pane" id="tabOp2">
                                        <div class="span6">
                                            <table>
                                                <tr>
                                                    <th></th>
                                                    <th>Create</th>
                                                    <th>Modify</th>
                                                    <th>Delete</th>
                                                    <th>Verify</th>
                                                </tr>

                                                <tr>
                                                    <td><label>Department</label></td>
                                                    <td><asp:CheckBox id="departmentCreate" runat="server" class="span2" /></td>
                                                    <td><asp:CheckBox id="departmentModify" runat="server" class="span2" /></td>
                                                    <td><asp:CheckBox id="departmentDelete" runat="server" class="span2" /></td>
                                                    <td><asp:CheckBox id="departmentVisible" runat="server" class="span2" /></td>
                                                </tr>

                                                <tr>
                                                    <td><label>Section</label></td>
                                                    <td><asp:CheckBox id="sectionCreate" runat="server" class="span2" /></td>
                                                    <td><asp:CheckBox id="sectionModify" runat="server" class="span2" /></td>
                                                    <td><asp:CheckBox id="sectionDelete" runat="server" class="span2" /></td>
                                                    <td><asp:CheckBox id="sectionVisible" runat="server" class="span2" /></td>
                                                </tr>

                                                <tr>
                                                    <td><label>Family</label></td>
                                                    <td><asp:CheckBox id="familyCreate" runat="server" class="span2" /></td>
                                                    <td><asp:CheckBox id="familyModify" runat="server" class="span2" /></td>
                                                    <td><asp:CheckBox id="familyDelete" runat="server" class="span2" /></td>
                                                    <td><asp:CheckBox id="familyVisible" runat="server" class="span2" /></td>
                                                </tr>

                                                <tr>
                                                    <td><label>Brand</label></td>
                                                    <td><asp:CheckBox id="brandCreate" runat="server" class="span2" /></td>
                                                    <td><asp:CheckBox id="brandModify" runat="server" class="span2" /></td>
                                                    <td><asp:CheckBox id="brandDelete" runat="server" class="span2" /></td>
                                                    <td><asp:CheckBox id="brandVisible" runat="server" class="span2" /></td>
                                                </tr>

                                                <tr>
                                                    <td><label>Line</label></td>
                                                    <td><asp:CheckBox id="lineCreate" runat="server" class="span2" /></td>
                                                    <td><asp:CheckBox id="lineModify" runat="server" class="span2" /></td>
                                                    <td><asp:CheckBox id="lineDelete" runat="server" class="span2" /></td>
                                                    <td><asp:CheckBox id="lineVisible" runat="server" class="span2" /></td>
                                                </tr>

                                                <tr>
                                                    <td></td>
                                                    <td></td>
                                                </tr>                  
                                                               <!-- Item Name -->
                                            </table>
                                        </div>

                                        <div class="span6">
                                            <table>
                            
                                            </table>
                                        </div>
                                </div>

                                <div class="tab-pane" id="tabOp3">
                                        <div class="span6">
                                            <table>
                                                <tr>
                                                    <td><label>Cash Count</label></td>
                                                    <td><asp:CheckBox id="cashCount" runat="server" class="span2" /></td>
                                                </tr>

                                                <tr>
                                                    <td><label>Declared</label></td>
                                                    <td><asp:CheckBox id="declared" runat="server" class="span2" /></td>
                                                </tr>

                                                <tr>
                                                    <td><label>Report By Payment Type</label></td>
                                                    <td><asp:CheckBox id="reportByPaymentType" runat="server" class="span2" /></td>
                                                </tr>

                                                <tr>
                                                    <td><label>Seller</label></td>
                                                    <td><asp:CheckBox id="seller" runat="server" class="span2" /></td>
                                                </tr>

                                                <tr>
                                                    <td><label>Sale Summary</label></td>
                                                    <td><asp:CheckBox id="saleSummary" runat="server" class="span2" /></td>
                                                </tr>

                                                <tr>
                                                    <td><label>Collections Or Payments</label></td>
                                                    <td><asp:CheckBox id="collectionsOrPayments" runat="server" class="span2" /></td>
                                                </tr>

                                                <tr>
                                                    <td><label>Return Summary</label></td>
                                                    <td><asp:CheckBox id="returnSummary" runat="server" class="span2" /></td>
                                                </tr>

                                                

                                                <tr>
                                                    <td></td>
                                                    <td></td>
                                                </tr>                  
                                                               <!-- Item Name -->
                                            </table>
                                        </div>

                                        <div class="span6">
                                            <table>
                                                <tr>
                                                    <td><label>Return Detail</label></td>
                                                    <td><asp:CheckBox id="returnDetail" runat="server" class="span2" /></td>
                                                </tr>

                                                <tr>
                                                    <td><label>Void Summary</label></td>
                                                    <td><asp:CheckBox id="voidSummary" runat="server" class="span2" /></td>
                                                </tr>

                                                <tr>
                                                    <td><label>Void Detail</label></td>
                                                    <td><asp:CheckBox id="voidDetail" runat="server" class="span2" /></td>
                                                </tr>

                                                <tr>
                                                    <td><label>Complimentary</label></td>
                                                    <td><asp:CheckBox id="complimentary" runat="server" class="span2" /></td>
                                                </tr>

                                                <tr>
                                                    <td><label>Sale By Section</label></td>
                                                    <td><asp:CheckBox id="saleBySection" runat="server" class="span2" /></td>
                                                </tr>

                                                <tr>
                                                    <td><label>Sale By Item</label></td>
                                                    <td><asp:CheckBox id="saleByItem" runat="server" class="span2" /></td>
                                                </tr>

                                                <tr>
                                                    <td><label>Discount Detail</label></td>
                                                    <td><asp:CheckBox id="discountDetail" runat="server" class="span2" /></td>
                                                </tr>
                                            </table>
                                        </div>
                                </div>

                                <div class="tab-pane" id="tabOp4">
                                        <div class="span6">
                                            <table>
                                                <tr>
                                                    <th></th>
                                                    <th>Create</th>
                                                    <th>Modify</th>
                                                    <th>Delete</th>
                                                    <th>Verify</th>
                                                </tr>

                                                <tr>
                                                    <td><label>Customer Master</label></td>
                                                    <td><asp:CheckBox id="customerMasterCreate" runat="server" class="span2" /></td>
                                                    <td><asp:CheckBox id="customerMasterModify" runat="server" class="span2" /></td>
                                                    <td><asp:CheckBox id="customerMasterDelete" runat="server" class="span2" /></td>
                                                    <td><asp:CheckBox id="customerMasterVisible" runat="server" class="span2" /></td>
                                                </tr>

                                                <tr>
                                                    <td><label>Consult Balance</label></td>
                                                    <td><asp:CheckBox id="consultBalanceCreate" runat="server" class="span2" /></td>
                                                    <td><asp:CheckBox id="consultBalanceModify" runat="server" class="span2" /></td>
                                                    <td><asp:CheckBox id="consultBalanceDelete" runat="server" class="span2" /></td>
                                                    <td><asp:CheckBox id="consultBalanceVisible" runat="server" class="span2" /></td>
                                                </tr>

                                                <tr>
                                                    <td></td>
                                                    <td></td>
                                                </tr>                  
                                                               <!-- Item Name -->
                                            </table>
                                        </div>

                                        <div class="span6">
                                            <table>
                            
                                            </table>
                                        </div>
                                </div>

                                <div class="tab-pane" id="tabOp5">
                                        <div class="span6">
                                            <table>
                                                <tr>
                                                    <th></th>
                                                    <th>Create</th>
                                                    <th>Modify</th>
                                                    <th>Delete</th>
                                                    <th>Verify</th>
                                                </tr>

                                                <tr>
                                                    <td><label>Table</label></td>
                                                    <td><asp:CheckBox id="tableCreate" runat="server" class="span2" /></td>
                                                    <td><asp:CheckBox id="tableModify" runat="server" class="span2" /></td>
                                                    <td><asp:CheckBox id="tableDelete" runat="server" class="span2" /></td>
                                                    <td><asp:CheckBox id="tableVisible" runat="server" class="span2" /></td>
                                                </tr>

                                                <tr>
                                                    <td><label>Sales</label></td>
                                                    <td><asp:CheckBox id="salesCreate" runat="server" class="span2" /></td>
                                                    <td><asp:CheckBox id="salesModify" runat="server" class="span2" /></td>
                                                    <td><asp:CheckBox id="salesDelete" runat="server" class="span2" /></td>
                                                    <td><asp:CheckBox id="salesVisible" runat="server" class="span2" /></td>
                                                </tr>

                                                <tr>
                                                    <td><label>Delivery</label></td>
                                                    <td><asp:CheckBox id="deliveryCreate" runat="server" class="span2" /></td>
                                                    <td><asp:CheckBox id="deliveryModify" runat="server" class="span2" /></td>
                                                    <td><asp:CheckBox id="deliveryDelete" runat="server" class="span2" /></td>
                                                    <td><asp:CheckBox id="deliveryVisible" runat="server" class="span2" /></td>
                                                </tr>

                                                <tr>
                                                    <td><label>Take Away</label></td>
                                                    <td><asp:CheckBox id="takeAwayCreate" runat="server" class="span2" /></td>
                                                    <td><asp:CheckBox id="takeAwayModify" runat="server" class="span2" /></td>
                                                    <td><asp:CheckBox id="takeAwayDelete" runat="server" class="span2" /></td>
                                                    <td><asp:CheckBox id="takeAwayVisible" runat="server" class="span2" /></td>
                                                </tr>

                                                <tr>
                                                    <td></td>
                                                    <td></td>
                                                </tr>                  
                                                               <!-- Item Name -->
                                            </table>
                                        </div>

                                        <div class="span6">
                                            <table>
                            
                                            </table>
                                        </div>
                                </div>

                                <div class="tab-pane" id="tabOp6">
                                        <div class="span6">
                                            <table>
                                                <tr>
                                                    <td><label>Allow Inventory To Go Negative</label></td>
                                                    <td><asp:CheckBox id="allowInventoryToGoNegative" runat="server" class="span2" /></td>
                                                </tr>

                                                <tr>
                                                    <td><label>Declare Inventory</label></td>
                                                    <td><asp:CheckBox id="declareInventory" runat="server" class="span2" /></td>
                                                </tr>

                                                <tr>
                                                    <td><label>Declare Wastage</label></td>
                                                    <td><asp:CheckBox id="declareWastage" runat="server" class="span2" /></td>
                                                </tr>

                                                <tr>
                                                    <td><label>Inventory Adjustment</label></td>
                                                    <td><asp:CheckBox id="inventoryAdjustment" runat="server" class="span2" /></td>
                                                </tr>

                                                <tr>
                                                    <td><label>Close Inventory</label></td>
                                                    <td><asp:CheckBox id="closeInventory" runat="server" class="span2" /></td>
                                                </tr>

                                                <tr>
                                                    <td></td>
                                                    <td></td>
                                                </tr>                  
                                                               <!-- Item Name -->
                                            </table>
                                        </div>

                                        <div class="span6">
                                            <table>
                                                
                                            </table>
                                        </div>
                                </div>

                                <div class="tab-pane" id="tabOp7">
                                        <div class="span6">
                                            <table>
                                                <tr>
                                                    <th></th>
                                                    <th>Create</th>
                                                    <th>Modify</th>
                                                    <th>Delete</th>
                                                    <th>Verify</th>
                                                </tr>

                                                <tr>
                                                    <td><label>Sale Price</label></td>
                                                    <td><asp:CheckBox id="salePriceCreate" runat="server" class="span2" /></td>
                                                    <td><asp:CheckBox id="salePriceModify" runat="server" class="span2" /></td>
                                                    <td><asp:CheckBox id="salePriceDelete" runat="server" class="span2" /></td>
                                                    <td><asp:CheckBox id="salePriceVisible" runat="server" class="span2" /></td>
                                                </tr>

                                                <tr>
                                                    <td><label>Cost</label></td>
                                                    <td><asp:CheckBox id="costCreate" runat="server" class="span2" /></td>
                                                    <td><asp:CheckBox id="costModify" runat="server" class="span2" /></td>
                                                    <td><asp:CheckBox id="costDelete" runat="server" class="span2" /></td>
                                                    <td><asp:CheckBox id="costVisible" runat="server" class="span2" /></td>
                                                </tr>

                                                <tr>
                                                    <td><label>Item</label></td>
                                                    <td><asp:CheckBox id="itemCreate" runat="server" class="span2" /></td>
                                                    <td><asp:CheckBox id="itemModify" runat="server" class="span2" /></td>
                                                    <td><asp:CheckBox id="itemDelete" runat="server" class="span2" /></td>
                                                    <td><asp:CheckBox id="itemVisible" runat="server" class="span2" /></td>
                                                </tr>

                                                <tr>
                                                    <td><label>Modifier</label></td>
                                                    <td><asp:CheckBox id="modifierCreate" runat="server" class="span2" /></td>
                                                    <td><asp:CheckBox id="modifierModify" runat="server" class="span2" /></td>
                                                    <td><asp:CheckBox id="modifierDelete" runat="server" class="span2" /></td>
                                                    <td><asp:CheckBox id="modifierVisible" runat="server" class="span2" /></td>
                                                </tr>

                                                <tr>
                                                    <td><label>Format</label></td>
                                                    <td><asp:CheckBox id="formatCreate" runat="server" class="span2" /></td>
                                                    <td><asp:CheckBox id="formatModify" runat="server" class="span2" /></td>
                                                    <td><asp:CheckBox id="formatDelete" runat="server" class="span2" /></td>
                                                    <td><asp:CheckBox id="formatVisible" runat="server" class="span2" /></td>
                                                </tr>

                                                <tr>
                                                    <td><label>Fixed Item</label></td>
                                                    <td><asp:CheckBox id="fixedItemCreate" runat="server" class="span2" /></td>
                                                    <td><asp:CheckBox id="fixedItemModify" runat="server" class="span2" /></td>
                                                    <td><asp:CheckBox id="fixedItemDelete" runat="server" class="span2" /></td>
                                                    <td><asp:CheckBox id="fixedItemVisible" runat="server" class="span2" /></td>
                                                </tr>

                                                <tr>
                                                    <td><label>Price List</label></td>
                                                    <td><asp:CheckBox id="priceListCreate" runat="server" class="span2" /></td>
                                                    <td><asp:CheckBox id="priceListModify" runat="server" class="span2" /></td>
                                                    <td><asp:CheckBox id="priceListDelete" runat="server" class="span2" /></td>
                                                    <td><asp:CheckBox id="priceListVisible" runat="server" class="span2" /></td>
                                                </tr>

                                                <tr>
                                                    <td></td>
                                                    <td></td>
                                                </tr>                  
                                                               <!-- Item Name -->
                                            </table>
                                        </div>

                                        <div class="span6">
                                            <table>
                            
                                            </table>
                                        </div>
                                </div>

                                <div class="tab-pane" id="tabOp8">
                                        <div class="span6">
                                            <table>
                                                <tr>
                                                    <th></th>
                                                    <th>Create</th>
                                                    <th>Modify</th>
                                                    <th>Delete</th>
                                                    <th>Verify</th>
                                                </tr>

                                                <tr>
                                                    <td><label>Purchase Order</label></td>
                                                    <td><asp:CheckBox id="purchaseOrderCreate" runat="server" class="span2" /></td>
                                                    <td><asp:CheckBox id="purchaseOrderModify" runat="server" class="span2" /></td>
                                                    <td><asp:CheckBox id="purchaseOrderDelete" runat="server" class="span2" /></td>
                                                    <td><asp:CheckBox id="purchaseOrderVisible" runat="server" class="span2" /></td>
                                                </tr>

                                                <tr>
                                                    <td><label>Purchase Delivery</label></td>
                                                    <td><asp:CheckBox id="purchaseDeliveryCreate" runat="server" class="span2" /></td>
                                                    <td><asp:CheckBox id="purchaseDeliveryModify" runat="server" class="span2" /></td>
                                                    <td><asp:CheckBox id="purchaseDeliveryDelete" runat="server" class="span2" /></td>
                                                    <td><asp:CheckBox id="purchaseDeliveryVisible" runat="server" class="span2" /></td>
                                                </tr>

                                                <tr>
                                                    <td><label>Supplier Creation</label></td>
                                                    <td><asp:CheckBox id="supplierCreationCreate" runat="server" class="span2" /></td>
                                                    <td><asp:CheckBox id="supplierCreationModify" runat="server" class="span2" /></td>
                                                    <td><asp:CheckBox id="supplierCreationDelete" runat="server" class="span2" /></td>
                                                    <td><asp:CheckBox id="supplierCreationVisible" runat="server" class="span2" /></td>
                                                </tr>

                                                <tr>
                                                    <td><label>Modifier</label></td>
                                                    <td><asp:CheckBox id="CheckBox13" runat="server" class="span2" /></td>
                                                    <td><asp:CheckBox id="CheckBox14" runat="server" class="span2" /></td>
                                                    <td><asp:CheckBox id="CheckBox15" runat="server" class="span2" /></td>
                                                    <td><asp:CheckBox id="CheckBox16" runat="server" class="span2" /></td>
                                                </tr>

                                                <tr>
                                                    <td><label>Supplier Price List</label></td>
                                                    <td><asp:CheckBox id="supplierPriceListCreate" runat="server" class="span2" /></td>
                                                    <td><asp:CheckBox id="supplierPriceListModify" runat="server" class="span2" /></td>
                                                    <td><asp:CheckBox id="supplierPriceListDelete" runat="server" class="span2" /></td>
                                                    <td><asp:CheckBox id="supplierPriceListVisible" runat="server" class="span2" /></td>
                                                </tr>

                                                <tr>
                                                    <td></td>
                                                    <td></td>
                                                </tr>                  
                                                               <!-- Item Name -->
                                            </table>
                                        </div>

                                        <div class="span6">
                                            <table>
                            
                                            </table>
                                        </div>
                                </div>


                                <div class="tab-pane" id="tabOp9">
                                        <div class="span6">
                                            <table>
                                                <tr>
                                                    <td><label>Purchase Order Report</label></td>
                                                    <td><asp:CheckBox id="purchaseOrderReport" runat="server" class="span2" /></td>
                                                </tr>

                                                <tr>
                                                    <td><label>Purchase Delivery Note</label></td>
                                                    <td><asp:CheckBox id="purchaseDeliveryNote" runat="server" class="span2" /></td>
                                                </tr>

                                                <tr>
                                                    <td><label>Inventory</label></td>
                                                    <td><asp:CheckBox id="inventory" runat="server" class="span2" /></td>
                                                </tr>

                                                <tr>
                                                    <td><label>Purchase Sales And Stock</label></td>
                                                    <td><asp:CheckBox id="purchaseSalesAndStock" runat="server" class="span2" /></td>
                                                </tr>

                                                <tr>
                                                    <td><label>Current Stock</label></td>
                                                    <td><asp:CheckBox id="currentStock" runat="server" class="span2" /></td>
                                                </tr>

                                                <tr>
                                                    <td><label>Consumption</label></td>
                                                    <td><asp:CheckBox id="consumption" runat="server" class="span2" /></td>
                                                </tr>

                                                <tr>
                                                    <td></td>
                                                    <td></td>
                                                </tr>                  
                                                               <!-- Item Name -->
                                            </table>
                                        </div>

                                        <div class="span6">
                                            <table>
                                                
                                            </table>
                                        </div>
                                </div>

                                <div class="tab-pane" id="tabOp10">
                                        <div class="span6">
                                            <table>
                                                <tr>
                                                    <td><label>Credit</label></td>
                                                    <td><asp:CheckBox id="credit" runat="server" class="span2" /></td>
                                                </tr>

                                                <tr>
                                                    <td><label>Void Bill</label></td>
                                                    <td><asp:CheckBox id="voidBill" runat="server" class="span2" /></td>
                                                </tr>

                                                <tr>
                                                    <td><label>Round Bill</label></td>
                                                    <td><asp:CheckBox id="roundBill" runat="server" class="span2" /></td>
                                                </tr>

                                                <tr>
                                                    <td><label>Add Item</label></td>
                                                    <td><asp:CheckBox id="addItem" runat="server" class="span2" /></td>
                                                </tr>

                                                <tr>
                                                    <td><label>Discount</label></td>
                                                    <td><asp:CheckBox id="discount" runat="server" class="span2" /></td>
                                                </tr>

                                                <tr>
                                                    <td><label>Bill Modification</label></td>
                                                    <td><asp:CheckBox id="billModification" runat="server" class="span2" /></td>
                                                </tr>

                                                <tr>
                                                    <td><label>Void Line</label></td>
                                                    <td><asp:CheckBox id="voidLine" runat="server" class="span2" /></td>
                                                </tr>

                                                <tr>
                                                    <td><label>Return Item</label></td>
                                                    <td><asp:CheckBox id="returnItem" runat="server" class="span2" /></td>
                                                </tr>

                                                <tr>
                                                    <td></td>
                                                    <td></td>
                                                </tr>                  
                                                               <!-- Item Name -->
                                            </table>
                                        </div>

                                        <div class="span6">
                                            <table>
                                                
                                            </table>
                                        </div>
                                </div>

                                <div class="tab-pane" id="tabOp11">
                                        <div class="span6">
                                            <table>
                                                <tr>
                                                    <td><label>By Payment Type</label></td>
                                                    <td><asp:CheckBox id="byPaymentType" runat="server" class="span2" /></td>
                                                </tr>

                                                <tr>
                                                    <td><label>Sales Summary</label></td>
                                                    <td><asp:CheckBox id="salesSummary" runat="server" class="span2" /></td>
                                                </tr>

                                                <tr>
                                                    <td><label>By Table</label></td>
                                                    <td><asp:CheckBox id="byTable" runat="server" class="span2" /></td>
                                                </tr>

                                                <tr>
                                                    <td><label>By Hours</label></td>
                                                    <td><asp:CheckBox id="byHours" runat="server" class="span2" /></td>
                                                </tr>

                                                <tr>
                                                    <td><label>By Department</label></td>
                                                    <td><asp:CheckBox id="byDepartment" runat="server" class="span2" /></td>
                                                </tr>

                                                <tr>
                                                    <td><label>By Section</label></td>
                                                    <td><asp:CheckBox id="bySection" runat="server" class="span2" /></td>
                                                </tr>

                                                <tr>
                                                    <td><label>By Service Tax</label></td>
                                                    <td><asp:CheckBox id="byServiceTax" runat="server" class="span2" /></td>
                                                </tr>

                                                <tr>
                                                    <td><label>Returns</label></td>
                                                    <td><asp:CheckBox id="returns" runat="server" class="span2" /></td>
                                                </tr>

                                                <tr>
                                                    <td></td>
                                                    <td></td>
                                                </tr>                  
                                                               <!-- Item Name -->
                                            </table>
                                        </div>

                                        <div class="span6">
                                            <table>
                                                <tr>
                                                    <td><label>Voids</label></td>
                                                    <td><asp:CheckBox id="voids" runat="server" class="span2" /></td>
                                                </tr>

                                                <tr>
                                                    <td><label>Pending Collection</label></td>
                                                    <td><asp:CheckBox id="pendingCollection" runat="server" class="span2" /></td>
                                                </tr>

                                                <tr>
                                                    <td><label>Profit Margin</label></td>
                                                    <td><asp:CheckBox id="profitMargin" runat="server" class="span2" /></td>
                                                </tr>

                                                <tr>
                                                    <td><label>Complimentary</label></td>
                                                    <td><asp:CheckBox id="complimentary_sale_report" runat="server" class="span2" /></td>
                                                </tr>

                                                <tr>
                                                    <td><label>Vouchers</label></td>
                                                    <td><asp:CheckBox id="vouchers" runat="server" class="span2" /></td>
                                                </tr>

                                                <tr>
                                                    <td><label>Sales By Format</label></td>
                                                    <td><asp:CheckBox id="salesByFormat" runat="server" class="span2" /></td>
                                                </tr>

                                                <tr>
                                                    <td><label>Staff Meal Report</label></td>
                                                    <td><asp:CheckBox id="staffMealReport" runat="server" class="span2" /></td>
                                                </tr>

                                                <tr>
                                                    <td><label>Sales By Portion</label></td>
                                                    <td><asp:CheckBox id="salesByPortion" runat="server" class="span2" /></td>
                                                </tr>
                                            </table>
                                        </div>
                                </div>

                                <div class="tab-pane" id="tabOp12">
                                        <div class="span6">
                                            <table>
                                                <tr>
                                                    <td><label>Exit To Window</label></td>
                                                    <td><asp:CheckBox id="exitToWindow" runat="server" class="span2" /></td>
                                                </tr>
                                            </table>
                                        </div>

                                        <div class="span6">
                                            <table>
                                                
                                            </table>
                                        </div>
                                </div>

                                <div class="tab-pane" id="tabOp13">
                                        <div class="span6">
                                            <table>
                                                <tr>
                                                    <td><label>Exit To Window</label></td>
                                                    <td><asp:CheckBox id="openTableOfOtherEmployee" runat="server" class="span2" /></td>
                                                </tr>

                                                <tr>
                                                    <td><label>Change Room</label></td>
                                                    <td><asp:CheckBox id="changeRoom" runat="server" class="span2" /></td>
                                                </tr>

                                                <tr>
                                                    <td><label>Change Table</label></td>
                                                    <td><asp:CheckBox id="changeTable" runat="server" class="span2" /></td>
                                                </tr>

                                                <tr>
                                                    <td><label>Modify Cover</label></td>
                                                    <td><asp:CheckBox id="modifyCover" runat="server" class="span2" /></td>
                                                </tr>
                                            </table>
                                        </div>

                                        <div class="span6">
                                            <table>
                                                
                                            </table>
                                        </div>
                                </div>

                                <div class="tab-pane" id="tabOp14">
                                        <div class="span6">
                                            <table>
                                                <tr>
                                                    <td><label>Create card</label></td>
                                                    <td><asp:CheckBox id="createCard" runat="server" class="span2" /></td>
                                                </tr>

                                                <tr>
                                                    <td><label>Swipe card on sale</label></td>
                                                    <td><asp:CheckBox id="swipeCardOnSale" runat="server" class="span2" /></td>
                                                </tr>
                                                
                                            </table>
                                        </div>

                                        <div class="span6">
                                            <table>
                                                
                                            </table>
                                        </div>
                                </div>
                            </div>

                        
                   </div>


                   
                </form>
                </div>
            </div>
        </div>
                
        </div>
    </div>
     
        
       
                


        
       
        

        
</asp:Content>



