<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="item.aspx.cs" Inherits="POS.views.item" MasterPageFile="~/views/masterPage.Master" %>

<%@ Register src="~/piczardUserControls/simpleImageUploadUserControl/SimpleImageUpload.ascx" tagname="SimpleImageUpload" tagprefix="ccPiczardUC" %>




<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">

    <script type="text/javascript">

        var IU = 'I';
        var ID = -1;
        var warningPic = -1;
        var itemPic = -1;
        var isDelete = false;

        $(document).ready(function () {

            $("#collapseOne").removeClass("in");
            $("#collapseTwo").addClass("in");
            $("#collapseThree").removeClass("in");

            $("#menu .nav li").removeClass("active");
            $("#menu .nav li#item").addClass("active");

            $("#itemPages .btn-group .dropdown-toggle").html("Item <span class='caret'></span>");

            // positioning alertBox
            $("#alertBox").css("top", $(window).outerHeight() / 2);
            $("#alertBox").css("left", $(window).outerWidth() / 2);


            $("#btnCancel").click(function () {
                clearAllElements();
                return false;
            });



            $("#submit").click(function () {

                var isStockItemVal = "0";
                if ($("#<%=isStockItem.ClientID %>").prop("checked")) isStockItemVal = "1";

                var discontinueVal = "0";
                if ($("#<%=discontinue.ClientID %>").prop("checked")) discontinueVal = "1";

                var visibleOnWebVal = "0";
                if ($("#<%=visibleOnWeb.ClientID %>").prop("checked")) visibleOnWebVal = "1";

                var allUserValue = -1;
                if ($('#allUser').is(":checked")) { allUserValue = 1; }
                else { allUserValue = 0; }


                var bgColor = $("#colorSelector > div").css("background-color");
                var textColor = $("#colorSelector_text > div").css("background-color");

                if ($("#<%=byPortion.ClientID %>").prop("checked")) { byPortionVAL = '1'; } else { byPortionVAL = '0'; }
                if ($("#<%=visibleSales.ClientID %>").prop("checked")) { visibleSalesVAL = '1'; } else { visibleSalesVAL = '0'; }
                if ($("#<%=isMenu.ClientID %>").prop("checked")) { isMenuVAL = '1'; } else { isMenuVAL = '0'; }
                if ($("#<%=freePrice.ClientID %>").prop("checked")) { freePriceVAL = '1'; } else { freePriceVAL = '0'; }


                if (window.IU == 'I') {
                    $.post("../Ajax/item.aspx",
                        {
                            itemName: $('#<%=itemName.ClientID %>').val(),
                            reference: $("#<%=reference.ClientID %>").val(),
                            description: $("#<%=description.ClientID %>").val(),
                            shortDescription: $("#<%=shortDescription.ClientID %>").val(),
                            deptID: $("#<%=deptDrplst.ClientID %>").val(),
                            sectionID: $("#<%=sectionDrplst.ClientID %>").val(),
                            familyID: $("#<%=familyDrplst.ClientID %>").val(),
                            brandID: $("#<%=brandDrplst.ClientID %>").val(),
                            lineID: $("#<%=lineDrplst.ClientID %>").val(),
                            isStockItem: isStockItemVal,
                            discontinue: discontinueVal,
                            stockMeasure: $("#<%=stockMeasure.ClientID %>").val(),
                            stockMeasureUnit: $("#<%=stockMeasureUnit.ClientID %>").val(),
                            purchaseMeasure: $("#<%=purchaseMeasure.ClientID %>").val(),
                            purchaseMeasureUnit: $("#<%=purchaseMeasureUnit.ClientID %>").val(),
                            saleMeasure: $("#<%=saleMeasure.ClientID %>").val(),
                            saleMeasureUnit: $("#<%=saleMeasureUnit.ClientID %>").val(),
                            itemType: $("#<%=itemType.ClientID %>").val(),
                            itemClass: $("#<%=itemClass.ClientID %>").val(),
                            saleAccount: $("#<%=saleAccount.ClientID %>").val(),
                            purchaseAccount: $("#<%=purchaseAccount.ClientID %>").val(),
                            costOfSaleAccount: $("#<%=costOfSaleAccount.ClientID %>").val(),
                            saleReturnAccount: $("#<%=saleReturnAccount.ClientID %>").val(),
                            purchaseReturnAccount: $("#<%=purchaseReturnAccount.ClientID %>").val(),
                            visibleOnWeb: visibleOnWebVal,
                            season: $("#<%=season.ClientID %>").val(),
                            characteristics: $("#<%=characteristics.ClientID %>").val(),
                            warningID: $("#<%=itemWarning.ClientID %>").val(),

                            allUser: allUserValue,
                            users: $('#<%=usersDrpLst.ClientID %>').val(),
                            warningMessage: $("#warningMessage").val(),

                            image: "",
                            referencePic: $("#referencePic").val(),
                            descriptionPic: $("#descriptionPic").val(),

                            byPortion: byPortionVAL,
                            visibleSales: visibleSalesVAL,
                            orderNo: $("#orderNo").val(),
                            isMenu: isMenuVAL,
                            freePrice: freePriceVAL,
                            freeMin: $("#freeMin").val(),
                            freeMax: $("#freeMax").val(),
                            couponCode: $("#couponCode").val(),
                            shortcut: $("#shortcut").val(),
                            bgColor: bgColor,
                            textColor: textColor,
                            yield: $("#yield").val(),

                            createDate: '',
                            createUser: '-1',
                            modifyUser: '-1',
                            StatementType: 'Insert'
                        },

                        function (response) {
                            PageMethods.saveImage(response.split(":;:")[0], response.split(":;:")[1]);
                            $(document).trigger("add-alerts", [
                                {
                                    'message': "Data inserted...",
                                    'priority': 'success'
                                }
                              ]);

                                clearAllElements();

                                __doPostBack("<%= UpdatePanel2.ClientID %>");
                        }
                    );

                    return false;
                }
                else if (window.IU == 'U') {


                    $.post("../Ajax/item.aspx",
                        {
                            itemID: window.ID,
                            itemName: $('#<%=itemName.ClientID %>').val(),
                            reference: $("#<%=reference.ClientID %>").val(),
                            description: $("#<%=description.ClientID %>").val(),
                            shortDescription: $("#<%=shortDescription.ClientID %>").val(),
                            deptID: $("#<%=deptDrplst.ClientID %>").val(),
                            sectionID: $("#<%=sectionDrplst.ClientID %>").val(),
                            familyID: $("#<%=familyDrplst.ClientID %>").val(),
                            brandID: $("#<%=brandDrplst.ClientID %>").val(),
                            lineID: $("#<%=lineDrplst.ClientID %>").val(),
                            isStockItem: isStockItemVal,
                            discontinue: $("#<%=discontinue.ClientID %>").val(),
                            stockMeasure: $("#<%=stockMeasure.ClientID %>").val(),
                            stockMeasureUnit: $("#<%=stockMeasureUnit.ClientID %>").val(),
                            purchaseMeasure: $("#<%=purchaseMeasure.ClientID %>").val(),
                            purchaseMeasureUnit: $("#<%=purchaseMeasureUnit.ClientID %>").val(),
                            saleMeasure: $("#<%=saleMeasure.ClientID %>").val(),
                            saleMeasureUnit: $("#<%=saleMeasureUnit.ClientID %>").val(),
                            itemType: $("#<%=itemType.ClientID %>").val(),
                            itemClass: $("#<%=itemClass.ClientID %>").val(),
                            saleAccount: $("#<%=saleAccount.ClientID %>").val(),
                            purchaseAccount: $("#<%=purchaseAccount.ClientID %>").val(),
                            costOfSaleAccount: $("#<%=costOfSaleAccount.ClientID %>").val(),
                            saleReturnAccount: $("#<%=saleReturnAccount.ClientID %>").val(),
                            purchaseReturnAccount: $("#<%=purchaseReturnAccount.ClientID %>").val(),
                            visibleOnWeb: $("#<%=visibleOnWeb.ClientID %>").val(),
                            season: $("#<%=season.ClientID %>").val(),
                            characteristics: $("#<%=characteristics.ClientID %>").val(),
                            
                            warningID: window.warningID,
                            allUser: allUserValue,
                            users: $('#<%=usersDrpLst.ClientID %>').val(),
                            warningMessage: $("#warningMessage").val(),

                            itemPicID: window.itemPicID,
                            itemID: window.ID,
                            image: "",
                            referencePic: $("#referencePic").val(),
                            descriptionPic: $("#descriptionPic").val(),

                            byPortion: byPortionVAL,
                            visibleSales: visibleSalesVAL,
                            orderNo: $("#orderNo").val(),
                            isMenu: isMenuVAL,
                            freePrice: freePriceVAL,
                            freeMin: $("#freeMin").val(),
                            freeMax: $("#freeMax").val(),
                            couponCode: $("#couponCode").val(),
                            shortcut: $("#shortcut").val(),
                            bgColor: bgColor,
                            textColor: textColor,
                            yield: $("#yield").val(),

                            modifyUser: '-1',
                            StatementType: 'Update'
                        },

                        function (response) {
                            window.IU = 'I';
                            PageMethods.saveImage(response.split(":;:")[0], response.split(":;:")[1]);

                            $(document).trigger("add-alerts", [
                                {
                                    'message': "Data updated...",
                                    'priority': 'success'
                                }
                              ]);

                                clearAllElements();

                                __doPostBack("<%= UpdatePanel2.ClientID %>");
                        }
                    );

                    return false;
                }
            });


        });


        function updaterow(itemID, itemName, reference, description, shortDescription, deptID, sectionID, familyID, brandID, lineID, isStockItem, discontinue, stockMeasure, stockMeasureUnit, purchaseMeasure, purchaseMeasureUnit, saleMeasure, saleMeasureUnit, itemType, itemClass, saleAccount, purchaseAccount, costOfSaleAccount, saleReturnAccount, purchaseReturnAccount, visibleOnWeb, season, characteristics, warningID_old, warningID, allUser, users, warningMessage, itemPicID, referencePic, descriptionPic, itemRestaurantID, byPortion, visibleSales, orderNo, isMenu, freePrice, freeMin, freeMax, couponCode, shortcut, bgColor, textColor, yield)
        {
            if (!window.isDelete) {
                window.IU = 'U';
                window.ID = itemID;
                window.warningID = warningID;
                window.itemPicID = itemPicID;
                window.itemRestaurantID = itemRestaurantID;

                $('#<%=itemName.ClientID %>').val(itemName);
                $("#<%=reference.ClientID %>").val(reference);
                $("#<%=description.ClientID %>").val(description);
                $("#<%=shortDescription.ClientID %>").val(shortDescription);
                $("#<%=deptDrplst.ClientID %>").val(deptID);
                $("#<%=sectionDrplst.ClientID %>").val(sectionID);
                $("#<%=familyDrplst.ClientID %>").val(familyID);
                $("#<%=brandDrplst.ClientID %>").val(brandID);
                $("#<%=lineDrplst.ClientID %>").val(lineID);

                $("#<%=stockMeasure.ClientID %>").val(stockMeasure);
                $("#<%=stockMeasureUnit.ClientID %>").val(stockMeasureUnit);
                $("#<%=purchaseMeasure.ClientID %>").val(purchaseMeasure);
                $("#<%=purchaseMeasureUnit.ClientID %>").val(purchaseMeasureUnit);
                $("#<%=saleMeasure.ClientID %>").val(saleMeasure);
                $("#<%=saleMeasureUnit.ClientID %>").val(saleMeasureUnit);
                $("#<%=itemType.ClientID %>").val(itemType);
                $("#<%=itemClass.ClientID %>").val(itemClass);
                $("#<%=saleAccount.ClientID %>").val(saleAccount);
                $("#<%=purchaseAccount.ClientID %>").val(purchaseAccount);
                $("#<%=costOfSaleAccount.ClientID %>").val(costOfSaleAccount);
                $("#<%=saleReturnAccount.ClientID %>").val(saleReturnAccount);
                $("#<%=purchaseReturnAccount.ClientID %>").val(purchaseReturnAccount);

                $("#<%=season.ClientID %>").val(season);
                $("#<%=characteristics.ClientID %>").val(characteristics);
                $("#<%=itemWarning.ClientID %>").val(warningID);

                if (isStockItem == "1") $("#<%=isStockItem.ClientID %>").prop("checked", true);
                else $("#<%=isStockItem.ClientID %>").prop("checked", false);

                if (discontinue == "1") $("#<%=discontinue.ClientID %>").prop("checked", true);
                else $("#<%=discontinue.ClientID %>").prop("checked", false);

                if (visibleOnWeb == "1") $("#<%=visibleOnWeb.ClientID %>").prop("checked", true);
                else $("#<%=visibleOnWeb.ClientID %>").prop("checked", false);



                if (allUser == "1") $("#allUser").prop("checked", true);
                else $("#allUser").prop("checked", false);
                $("#<%=usersDrpLst.ClientID %>").val(users);
                $("#warningMessage").val(warningMessage);

                $("#reference").val(reference);
                $("#description").val(description);

                $("#ctl00_MainContent_ImageUploader_imgPreview").load();

                src = $("#ctl00_MainContent_ImageUploader_imgPreview").attr("src");
                src = "../uploadedImg/itemPics/" + itemID + "/" + itemPicID + ".jpg";
                $("#ctl00_MainContent_ImageUploader_imgPreview").attr("src", src);
                $("#ctl00_MainContent_ImageUploader_imgPreview").css("height", "auto");
                $("#ctl00_MainContent_ImageUploader_imgPreview").css("width", "auto");



                if (byPortion == 1 || byPortion == '1') { $("#<%=byPortion.ClientID %>").prop("checked", true); }
                if (visibleSales == 1 || visibleSales == '1') { $("#<%=visibleSales.ClientID %>").prop("checked", true); }
                $("#orderNo").val(orderNo);
                if (isMenu == 1 || isMenu == '1') { $("#<%=isMenu.ClientID %>").prop("checked", true); }
                if (freePrice == 1 || freePrice == '1') { $("#<%=freePrice.ClientID %>").prop("checked", true); }
                $("#freeMin").val(freeMin);
                $("#freeMax").val(freeMax);
                $("#couponCode").val(couponCode);
                $("#shortcut").val(shortcut);
                $("#colorSelector > div").css("background-color", bgColor);
                $("#colorSelector_text > div").css("background-color", textColor);
                $("#yield").val(yield);

            }
        }


        function deleteRow(itemID) {
            window.isDelete = true;

            if (confirm('Sure To Delete?')) {
                $.post("../Ajax/item.aspx",
                    {
                        itemID: itemID,
                        StatementType: 'Delete'
                    },

                    function (response) {
                        $(document).trigger("add-alerts", [
                                {
                                    'message': "Data deleted...",
                                    'priority': 'error'
                                }
                              ]);

                                __doPostBack("<%= UpdatePanel2.ClientID %>");
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
            $("input[type='checkbox']").prop('checked', false);
            $("input[type='select']").val(-1);
            $("select").val(-1);

            src = "../uploadedImg/" + "dummy" + ".jpg";
            $("#ctl00_MainContent_ImageUploader_imgPreview").attr("src", src);
            $("#ctl00_MainContent_ImageUploader_imgPreview").css("height", "auto");
            $("#ctl00_MainContent_ImageUploader_imgPreview").css("width", "auto");

            $("#colorSelector > div").css("background-color", "transparent");
            $("#colorSelector_text > div").css("background-color", "transparent");
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

    <div id="breadCrum"><h1>Master > Item</h1></div>


    <div id="content">
        <div id="contentbox-wrapper">
            <div class="tabbable contentbox">
          <ul class="nav nav-tabs">
            <li id="tab1Ref" class="active"><a href="#tab1" data-toggle="tab">List</a></li>
            <li id="tab2Ref"><a href="#tab2" data-toggle="tab">Create New</a></li>

            <li  style="float:right">
                <div>
                    <div id="submit" class="btn" >Submit</div>
                    <asp:Button ID="Button1" runat="server" class="btn" Text="Button" Visible="false"/>
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
                                <asp:ListItem Value="itemName" Text="Item Name"></asp:ListItem>
                                <asp:ListItem Value="itemID" Text="Item ID"></asp:ListItem>
                            </asp:DropDownList>
                        
                            <asp:TextBox id="searchText" class="searchText" runat="server" AutoPostBack="false" placeholder="search keyword..."  onkeyup="searchKeyword(this.value);" ></asp:TextBox>

                            <label id="clearSearch" title="Clear Search" onclick="clearSearch();">Clear Search</label>
                        </div>
                       <asp:ListView ID="lstvItem" runat="server">
                                <LayoutTemplate>
                                    <table class="table table-condensed" id="dataRows">
                                        <tr>
                                            <th>Item ID</th>
                                            <th colspan="2">Item Name</th>
                                        </tr>
                                        <asp:PlaceHolder id="itemPlaceholder" runat="server" />
                                    </table>
                                </LayoutTemplate>

                                <ItemTemplate>
                                    <tr ondblclick="updaterow(<%#Eval("itemID") %>, '<%#Eval("itemName") %>', '<%#Eval("reference") %>', '<%#Eval("description") %>', '<%#Eval("shortDescription") %>', '<%#Eval("deptID") %>', '<%#Eval("sectionID") %>', '<%#Eval("familyID") %>', '<%#Eval("brandID") %>', '<%#Eval("lineID") %>', '<%#Eval("isStockItem") %>', '<%#Eval("discontinue") %>', '<%#Eval("stockMeasure") %>', '<%#Eval("stockMeasureUnit") %>', '<%#Eval("purchaseMeasure") %>', '<%#Eval("purchaseMeasureUnit") %>', '<%#Eval("saleMeasure") %>', '<%#Eval("saleMeasureUnit") %>', '<%#Eval("itemType") %>', '<%#Eval("itemClass") %>', '<%#Eval("saleAccount") %>', '<%#Eval("purchaseAccount") %>', '<%#Eval("costOfSaleAccount") %>', '<%#Eval("saleReturnAccount") %>', '<%#Eval("purchaseReturnAccount") %>', '<%#Eval("visibleOnWeb") %>', '<%#Eval("season") %>', '<%#Eval("characteristics") %>', '<%#Eval("warningID") %>',
                                                              <%#Eval("warningID") %>, '<%#Eval("allUser") %>', '<%#Eval("users") %>', '<%#Eval("warningMessage") %>',
                                                              <%#Eval("itemPicID") %>, '<%#Eval("reference") %>', '<%#Eval("description ") %>',
                                                              <%#Eval("itemRestID") %>, '<%#Eval("byPortion") %>', '<%#Eval("visibleSales") %>', <%#Eval("orderNo") %>, '<%#Eval("isMenu") %>', '<%#Eval("freePrice") %>', <%#Eval("freeMin") %>, <%#Eval("freeMax") %>, <%#Eval("couponCode") %>, '<%#Eval("shortcut") %>', '<%#Eval("bgColor") %>', '<%#Eval("textColor") %>', <%#Eval("yield") %>);
                                                    $('#tab2').addClass('active');
                                                    $('#tab2Ref').addClass('active');

                                                    $('#tab1').removeClass('active');
                                                    $('#tab1Ref').removeClass('active');
                                                    $('#tab2Ref a').html('Edit / Update');
                                                    ">
                                        <td>
                                            <asp:Label ID="lblItemID" runat="Server" Text='<%#Eval("itemID") %>' />
                                        </td>

                                        <td>
                                            <asp:Label ID="lblItemName" runat="Server" Text='<%#Eval("itemName") %>' />
                                        </td>

                                        <td class="btn btn-danger btn-mini"  onmouseup="deleteRow(<%#Eval("itemID") %>)" style="cursor:pointer"></td>
                                    </tr>
                                </ItemTemplate>
                            </asp:ListView>


                            <div class="pagination">
                                <asp:DataPager ID="DataPager" runat="server" PagedControlID="lstvItem" 
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
              <form class="navbar-form pull-left" id="itemForm" action="item.aspx">
                    
                    <div id="item">
                        
                        <div class="tabbable"> <!-- Only required for left/right tabs -->
                            <ul class="nav nav-tabs">
                            <li class="active"><a href="#tabOp1" data-toggle="tab">Properties1</a></li>
                            <li><a href="#tabOp2" data-toggle="tab">Properties2</a></li>
                            <li><a href="#tabOp3" data-toggle="tab">Warning</a></li>
                            <li><a href="#tabOp4" data-toggle="tab">Pics</a></li>
                            <li><a href="#tabOp5" data-toggle="tab">Account</a></li>
                            <li><a href="#tabOp6" data-toggle="tab">Other</a></li>
                            <li><a href="#tabOp7" data-toggle="tab">Restaurant</a></li>
                            
                          </ul>
                            <div class="tab-content">
                                <div class="tab-pane active row-fluid" id="tabOp1">
                                    <div class="span6">
                                        <table>
                                        <tr>
                                            <td><label>Item ID</label></td>
                                            <td><asp:TextBox id="nextID" runat="server" class="span2" ReadOnly="true" ></asp:TextBox></td>
                                        </tr>

                                        <tr>
                                            <td><label>Name</label></td>
                                            <td>
                                                <asp:TextBox runat="server" id="itemName" placeholder="Item Name" class="span2"></asp:TextBox>
                                                <div class="astericks">*</div>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td><label>Reference</label></td>
                                            <td><!-- <input id="reference" type="text" placeholder="Reference" class="span2" /> -->
                                                <asp:TextBox runat="server" id="reference" placeholder="Reference" class="span2"></asp:TextBox>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td><label>Description</label></td>
                                            <td><asp:TextBox runat="server" id="description" type="text" placeholder="Description" class="span2"></asp:TextBox></td>
                                        </tr>

                                        <tr>
                                            <td><label>Short Description</label></td>
                                            <td><asp:TextBox runat="server" id="shortDescription" type="text" placeholder="Short Description" class="span2"></asp:TextBox></td>
                                        </tr>


                                        <tr>
                                            <td><label>Item Type</label></td>
                                            <td>
                                                <asp:DropDownList id="itemType" runat="server" AutoPostBack="false">
                                                    <asp:ListItem Value="1" Text="Stock item"></asp:ListItem>
                                                    <asp:ListItem Value="2" Text="Non-stock item"></asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td><label>Item Class</label></td>
                                            <td><asp:TextBox runat="server" id="itemClass" type="text" placeholder="Item Class" class="span2"></asp:TextBox></td>
                                        </tr>
                                    </table>
                                    </div>

                                    <div class="span6">
                                        <table>
                                        
                                            
                                        <tr>
                                            <td><label>Department</label></td>
                                            <td>
                                                <asp:DropDownList ID="deptDrplst" runat="server" 
                                                    onselectedindexchanged="deptDrplst_SelectedIndexChanged" 
                                                    AutoPostBack="True"></asp:DropDownList>

                                                <div class="astericks">*</div>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td><label>Section</label></td>
                                            <td>
                                                <asp:DropDownList ID="sectionDrplst" runat="server" 
                                                    onselectedindexchanged="sectionDrplst_SelectedIndexChanged" 
                                                    AutoPostBack="True"></asp:DropDownList>

                                            </td>
                                        </tr>

                                        <tr>
                                            <td><label>Family</label></td>
                                            <td><asp:DropDownList ID="familyDrplst" runat="server"></asp:DropDownList></td>
                                        </tr>
                            
                                        <tr>
                                            <td><label>Brand</label></td>
                                            <td><asp:DropDownList ID="brandDrplst" runat="server" 
                                                    onselectedindexchanged="brandDrplst_SelectedIndexChanged" 
                                                    AutoPostBack="True"></asp:DropDownList></td>
                                        </tr>

                                        <tr>
                                            <td><label>Line</label></td>
                                            <td><asp:DropDownList ID="lineDrplst" runat="server"></asp:DropDownList></td>
                                        </tr>
                                        
                                        </table>
                                    </div>
                                </div>
                                <div class="tab-pane" id="tabOp2" class="row-fluid">
                                    <div class="span6">
                                    <table>
                                        <tr>
                                            <td><label>Is Stock Item</label></td>
                                            <td><asp:CheckBox runat="server" id="isStockItem" class="span2" /></td>
                                        </tr>

                                        <tr>
                                            <td><label>Discontinue</label></td>
                                            <td><asp:CheckBox runat="server" id="discontinue" class="span2" /></td>
                                        </tr>

                                        <tr>
                                            <td><label>Stock Measure</label></td>
                                            <td>
                                                <!-- <asp:TextBox runat="server" id="stockMeasure_OLD" type="text" placeholder="Stock Measure" class="span2"></asp:TextBox> -->

                                                <asp:DropDownList id="stockMeasure" runat="server" AutoPostBack="false">
                                                    <asp:ListItem Value="piece" Text="Piece"></asp:ListItem>
                                                    <asp:ListItem Value="box" Text="Box"></asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td><label>Stock Measure Unit</label></td>
                                            <td>
                                                <!-- <asp:TextBox runat="server" id="stockMeasureUnit_OLD" type="text" placeholder="Stock Measure Unit" class="span2"></asp:TextBox>
                                                <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Insert only float" Type="Double" ControlToValidate="stockMeasureUnit"></asp:RangeValidator> -->

                                                <asp:DropDownList id="stockMeasureUnit" runat="server" AutoPostBack="false">
                                                    <asp:ListItem Value="1" Text="Piece"></asp:ListItem>
                                                    <asp:ListItem Value="2" Text="Box"></asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td><label>Purchase Measure</label></td>
                                            <td>
                                                <!-- <asp:TextBox runat="server" id="purchaseMeasure_OLD" type="text" placeholder="Purchase Measure" class="span2"></asp:TextBox>-->
                                                
                                                <asp:DropDownList id="purchaseMeasure" runat="server" AutoPostBack="false">
                                                    <asp:ListItem Value="1" Text="Piece"></asp:ListItem>
                                                    <asp:ListItem Value="2" Text="Box"></asp:ListItem>
                                                </asp:DropDownList>    
                                            </td>
                                        </tr>

                                        <tr>
                                            <td><label>Purchase Measure Unit</label></td>
                                            <td>
                                                <!-- <asp:TextBox runat="server" id="purchaseMeasureUnit_OLD" type="text" placeholder="Purchase Measure Unit" class="span2"></asp:TextBox>
                                                <asp:RangeValidator ID="RangeValidator2" runat="server" ErrorMessage="Insert only float" Type="Double" ControlToValidate="purchaseMeasureUnit"></asp:RangeValidator> -->

                                                <asp:DropDownList id="purchaseMeasureUnit" runat="server" AutoPostBack="false">
                                                    <asp:ListItem Value="1" Text="Piece"></asp:ListItem>
                                                    <asp:ListItem Value="2" Text="Box"></asp:ListItem>
                                                </asp:DropDownList>   
                                            </td>
                                        </tr>

                                        <tr>
                                            <td><label>Sale Measure</label></td>
                                            <td>
                                                <!-- <asp:TextBox runat="server" id="saleMeasure_OLD" type="text" placeholder="Sale Measure" class="span2"></asp:TextBox> -->
                                                
                                                <asp:DropDownList id="saleMeasure" runat="server" AutoPostBack="false">
                                                    <asp:ListItem Value="1" Text="Piece"></asp:ListItem>
                                                    <asp:ListItem Value="2" Text="Box"></asp:ListItem>
                                                </asp:DropDownList>  
                                            </td>
                                        </tr>

                                        <tr>
                                            <td><label>Sale Measure Unit</label></td>
                                            <td>
                                                <!-- <asp:TextBox runat="server" id="saleMeasureUnit_OLD" type="text" placeholder="Sale Measure Unit" class="span2"></asp:TextBox>
                                                <asp:RangeValidator ID="RangeValidator3" runat="server" ErrorMessage="Insert only float" Type="Double" ControlToValidate="saleMeasureUnit"></asp:RangeValidator> -->

                                                <asp:DropDownList id="saleMeasureUnit" runat="server" AutoPostBack="false">
                                                    <asp:ListItem Value="1" Text="Piece"></asp:ListItem>
                                                    <asp:ListItem Value="2" Text="Box"></asp:ListItem>
                                                </asp:DropDownList> 
                                            </td>
                                        </tr>
                                    </table>
                                    </div>
                                    <div class="span6"></div>
                                </div>
                                <div class="tab-pane" id="tabOp3" class="row-fluid">
                                    <div class="span6">
                                    <table>
                                        <tr>
                                            <td><label>All Users</label></td>
                                            <td><asp:CheckBox id="allUser" runat="server" type="checkbox" class="span2" ></asp:CheckBox></td>
                                        </tr>

                                        <tr>
                                            <td><label>Users</label></td>
                                            <td><asp:DropDownList ID="usersDrpLst" runat="server"></asp:DropDownList></td>
                                        </tr>

                    
                                        <tr>
                                            <td><label>Warning Message</label></td>
                                            <td><input id="warningMessage" type="text" placeholder="Warning Message" class="span2" /></td>
                                        </tr>
                                    </table>
                                    </div>
                                    <div class="span6"></div>
                                </div>
                                <div class="tab-pane" id="tabOp4"  class="row-fluid">
                                    <div class="span6">
                                    <table>
                                        <tr>
                                            <td><label>Image</label></td>
                                            <td>
                                                 <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Always">
                                                    <ContentTemplate>
                             
                                                    <div class="pageContainer">  
                           
                                                        <ccPiczardUC:SimpleImageUpload ID="ImageUploader" runat="server" 
                                                            Width="500px"
                                                            AutoOpenImageEditPopupAfterUpload="true" Text_BrowseButton=" " Text_RemoveButton=" " 
                                        Text_CancelUploadButton=" "
                                                            Culture="en" 
                                                         EnableEdit="False" />
                                                    </div>
                            
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td><label>Reference</label></td>
                                            <td><input id="referencePic" type="text" placeholder="Reference" class="span2" /></td>
                                        </tr>

                                        <tr>
                                            <td><label>Description</label></td>
                                            <td><input id="descriptionPic" type="text" placeholder="Description" class="span2" /></td>
                                        </tr>
                    
                                                         
                                    </table>
                                    </div>
                                    <div class="span6"></div>
                                </div>
                                <div class="tab-pane" id="tabOp5" class="row-fluid">
                                    <div class="span6">
                                    <table>
                                        <tr>
                                            <td><label>Sale Account</label></td>
                                            <td><asp:TextBox runat="server" id="saleAccount" type="text" placeholder="Sale Account" class="span2"></asp:TextBox></td>
                                        </tr>

                                        <tr>
                                            <td><label>Purchase Account</label></td>
                                            <td><asp:TextBox runat="server" id="purchaseAccount" type="text" placeholder="Purchase Account" class="span2"></asp:TextBox></td>
                                        </tr>

                                        <tr>
                                            <td><label>Cost Of Sale Account</label></td>
                                            <td><asp:TextBox runat="server" id="costOfSaleAccount" type="text" placeholder="Cost Of Sale Account" class="span2"></asp:TextBox></td>
                                        </tr>

                                        <tr>
                                            <td><label>Sale Return Account</label></td>
                                            <td><asp:TextBox runat="server" id="saleReturnAccount" type="text" placeholder="Sale Return Account" class="span2"></asp:TextBox></td>
                                        </tr>

                                        <tr>
                                            <td><label>Purchase Return Account</label></td>
                                            <td><asp:TextBox runat="server" id="purchaseReturnAccount" type="text" placeholder="Purchase Return Account" class="span2"></asp:TextBox></td>
                                        </tr>
                                    </table>
                                    </div>
                                    <div class="span6"></div>
                                </div>
                                <div class="tab-pane" id="tabOp6" class="row-fluid">
                                    <div class="span6">
                                    <table>
                                        <tr>
                                            <td><label>Visible On Web</label></td>
                                            <td><asp:CheckBox runat="server" id="visibleOnWeb" class="span2" /></td>
                                        </tr>

                                        <tr>
                                            <td><label>Season</label></td>
                                            <td><asp:TextBox runat="server" id="season" type="text" placeholder="Season" class="span2"></asp:TextBox></td>
                                        </tr>

                                        <tr>
                                            <td><label>Characteristics</label></td>
                                            <td><asp:TextBox runat="server" id="characteristics" type="text" placeholder="Characteristics" class="span2"></asp:TextBox></td>
                                        </tr>

                                        <!--
                                        <tr>
                                            <td><label>Warning</label></td>
                                            <td><asp:DropDownList ID="itemWarning" runat="server"></asp:DropDownList></td>
                                        </tr>
                                        -->
                                    </table>
                                    </div>
                                    <div class="span6"></div>
                                </div>
                                <div class="tab-pane row-fluid" id="tabOp7">
                                    <div class="span6">
                                        <table>
                                        <tr>
                                            <td><label>By Portion</label></td>
                                            <td><asp:CheckBox ID="byPortion" runat="server" class="span2" /></td>
                                        </tr>

                                        <tr>
                                            <td><label>Visible Sales</label></td>
                                            <td><asp:CheckBox ID="visibleSales" runat="server" class="span2" /></td>
                                        </tr>

                                        <tr>
                                            <td><label>Order No</label></td>
                                            <td><input id="orderNo" type="text" placeholder="Order No" class="span2" /></td>
                                        </tr>

                                        <tr>
                                            <td><label>Is Menu</label></td>
                                            <td><asp:CheckBox ID="isMenu" runat="server" class="span2" /></td>
                                        </tr>

                                        <tr>
                                            <td><label>Free Price</label></td>
                                            <td><asp:CheckBox ID="freePrice" runat="server" class="span2" /></td>
                                        </tr>

                                        <tr>
                                            <td><label>Free Max</label></td>
                                            <td><input id="freeMax" type="text" placeholder="Free Max" class="span2" /></td>
                                        </tr>

                                        <tr>
                                            <td><label>Free Min</label></td>
                                            <td><input id="freeMin" type="text" placeholder="Free Min" class="span2" /></td>
                                        </tr>

                                        <tr>
                                            <td><label>Coupon Code</label></td>
                                            <td><input id="couponCode" type="text" placeholder="Coupon Code" class="span2" /></td>
                                        </tr>

                                        <tr>
                                            <td><label>Shortcut</label></td>
                                            <td><input id="shortcut" type="text" placeholder="Shortcut" class="span2" /></td>
                                        </tr>

                                        

                                        <tr>
                                            <td><label>Yield</label></td>
                                            <td><input id="yield" type="text" placeholder="Yield" class="span2" /></td>
                                        </tr>

                                        
                                    </table>
                                    </div>

                                    <div class="span6">
                                        <table>
                                        <tr>
                                            <td><label>Background Color</label></td>
                                            <td><div id="colorSelector"><div></div></div>
                                                <input class="colorSelectorTxt" id="backgroundColorCode" type="text" placeholder="Background Color Code" />
                                            </td>
                                        </tr>

                                        <tr>
                                            <td><label>Text Color</label></td>
                                            <td><div id="colorSelector_text"><div></div></div>
                                                <input class="colorSelectorTxt" id="textColorCode" type="text" placeholder="Text Color Code" />
                                            </td>
                                        </tr>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="astericsMsg">* indicates required field</div>
                    </div>
                </form>
            </div>
          </div>
        </div>   
        </div>
    </div>    
       
                


        
       
        

        
</asp:Content>
