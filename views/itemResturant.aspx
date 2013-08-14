<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="itemResturant.aspx.cs" Inherits="POS.views.itemResturant" MasterPageFile="~/views/masterPage.Master" %>


<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">

    <script type="text/javascript">

        var IU = 'I';
        var ID = -1;
        var isDelete = false;

        $(document).ready(function () {

            $("#collapseOne").removeClass("in");
            $("#collapseTwo").addClass("in");
            $("#collapseThree").removeClass("in");

            $("#menu .nav li").removeClass("active");
            $("#menu .nav li#itemRestaurant").addClass("active");

            
            // positioning alertBox
            $("#alertBox").css("top", $(window).outerHeight() / 2);
            $("#alertBox").css("left", $(window).outerWidth() / 2);


            $("#btnCancel").click(function () {
                clearAllElements();
                return false;
            });



            $("#submit").click(function () {
                var bgColor = $("#colorSelector > div").css("background-color");
                var textColor = $("#colorSelector_text > div").css("background-color");

                if ($("#<%=byPortion.ClientID %>").prop("checked")) { byPortionVAL = '1'; } else { byPortionVAL = '0'; }
                if ($("#<%=visibleSales.ClientID %>").prop("checked")) { visibleSalesVAL = '1'; } else { visibleSalesVAL = '0'; }
                if ($("#<%=isMenu.ClientID %>").prop("checked")) { isMenuVAL = '1'; } else { isMenuVAL = '0'; }
                if ($("#<%=freePrice.ClientID %>").prop("checked")) { freePriceVAL = '1'; } else { freePriceVAL = '0'; }

                
                if (window.IU == 'I') {
                    $.post("../Ajax/itemRestaurant.aspx",
                        {
                            itemID: $("#<%=itemDrplst.ClientID %>").val(),
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


                    $.post("../Ajax/itemRestaurant.aspx",
                        {
                            itemRestID: window.ID,

                            itemID: $("#<%=itemDrplst.ClientID %>").val(),
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

                                __doPostBack("<%= UpdatePanel2.ClientID %>");
                        }
                    );

                    return false;
                }
            });


        });


        function updateRow(id, itemID, byPortion, visibleSales, orderNo, isMenu, freePrice, freeMin, freeMax, couponCode, shortcut, bgColor, textColor, yield) {
            if (!window.isDelete) {
                window.IU = 'U';
                window.ID = id;


                $("#<%=itemDrplst.ClientID %>").val(itemID);
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


        function deleteRow(id) {
            window.isDelete = true;

            if (confirm('Sure To Delete?')) {
                $.post("../Ajax/itemRestaurant.aspx",
                    {
                        itemRestID: id,
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
                 
        <div class="tabbable"> 

            <ul class="nav nav-tabs">
                <li id="tab1Ref" class="active"><a href="#tab1" data-toggle="tab">List</a></li>
                <li id="tab2Ref"><a href="#tab2" data-toggle="tab">Create New</a></li>
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
                                    <asp:ListItem Value="itemRestID" Text="ItemRestID"></asp:ListItem>
                                </asp:DropDownList>
                        
                                <asp:TextBox id="searchText" class="searchText" runat="server" AutoPostBack="false" placeholder="search keyword..."  onkeyup="searchKeyword(this.value);" ></asp:TextBox>

                                <label id="clearSearch" title="Clear Search" onclick="clearSearch();">Clear Search</label>
                            </div>

                            <asp:ListView ID="lstvItemRestaurant" runat="server" >
                                <LayoutTemplate >
                                    <table class="table table-condensed" id="dataRows">
                                        <tr>
                                            <th>Item Rest ID</th>
                                            <th>Item ID</th>
                                        </tr>
                                        <asp:PlaceHolder id="itemPlaceholder" runat="server" />
                                    </table>
                                </LayoutTemplate>

                                <ItemTemplate>
                                    <tr onmouseup="updateRow(<%#Eval("itemRestID") %>, <%#Eval("itemID") %>, '<%#Eval("byPortion") %>', '<%#Eval("visibleSales") %>', <%#Eval("orderNo") %>, '<%#Eval("isMenu") %>', '<%#Eval("freePrice") %>', <%#Eval("freeMin") %>, <%#Eval("freeMax") %>, <%#Eval("couponCode") %>, '<%#Eval("shortcut") %>', '<%#Eval("bgColor") %>', '<%#Eval("textColor") %>', <%#Eval("yield") %>)">
                                        <td>
                                            <asp:Label ID="lblItemRestID" runat="Server" Text='<%#Eval("itemRestID") %>' />
                                        </td>

                                        <td>
                                            <asp:Label ID="lblItemID" runat="Server" Text='<%#Eval("itemID") %>' />
                                        </td>

                                        <td class="btn btn-danger btn-mini"  onmouseup="deleteRow(<%#Eval("itemRestID") %>)" style="cursor:pointer"></td>
                                    </tr>
                                </ItemTemplate>
                            </asp:ListView>
                    
                            <div class="pagination">
                                <asp:DataPager ID="DataPager" runat="server" PagedControlID="lstvItemRestaurant" 
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
                    <form class="navbar-form pull-left" id="itemRestaurantForm" action="itemResturant.aspx">

                        <div id="itemRestaurant">
                <table>
                    <tr>
                        <td><label>Item Restaurant ID</label></td>
                        <td><asp:TextBox id="nextID" runat="server" class="span2" ReadOnly="true" ></asp:TextBox></td>
                    </tr>

                    <tr>
                        <td><label>Item Name</label></td>
                        <td><asp:DropDownList ID="itemDrplst" runat="server"></asp:DropDownList></td>
                    </tr>

                    <tr>
                        <td><label>By Portion</label></td>
                        <td><asp:CheckBox ID="byPortion" runat="server" /></td>
                    </tr>

                    <tr>
                        <td><label>Visible Sales</label></td>
                        <td><asp:CheckBox ID="visibleSales" runat="server" /></td>
                    </tr>

                    <tr>
                        <td><label>Order No</label></td>
                        <td><input id="orderNo" type="text" placeholder="Order No" class="span2" /></td>
                    </tr>

                    <tr>
                        <td><label>Is Menu</label></td>
                        <td><asp:CheckBox ID="isMenu" runat="server" /></td>
                    </tr>

                    <tr>
                        <td><label>Free Price</label></td>
                        <td><asp:CheckBox ID="freePrice" runat="server" /></td>
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
                        <td><label>Background Color</label></td>
                        <td><div id="colorSelector"><div></div></div></td>
                    </tr>

                    <tr>
                        <td><label>Text Color</label></td>
                        <td><div id="colorSelector_text"><div></div></div></td>
                    </tr>

                    <tr>
                        <td><label>Yield</label></td>
                        <td><input id="yield" type="text" placeholder="Yield" class="span2" /></td>
                    </tr>

                    <tr>
                        <td></td>
                        <td>
                            <div id="submit" class="btn" >Submit</div>
                            <asp:Button ID="Button1" runat="server" class="btn" Text="Button" Visible="false"/>
                            <div id="btnCancel" class="btn" >Cancel</div>
                        </td>
                    </tr>                  
                                   <!-- Item Name -->
                </table>
            
                 
            
                

                
            
                <!-- Item Image -->
           </div>

                    </form>
                </div>
            </div>
        </div>
       
                
   


        
       
        

        
</asp:Content>
