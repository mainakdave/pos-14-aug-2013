<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="currency.aspx.cs" Inherits="POS.views.currency"  MasterPageFile="~/views/masterPage.Master" %>

<%@ Register src="~/piczardUserControls/simpleImageUploadUserControl/SimpleImageUpload.ascx" tagname="SimpleImageUpload" tagprefix="ccPiczardUC" %>





<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">

    <script type="text/javascript">

        var IU = 'I';
        var ID = -1;
        var isDelete = false;

        $(document).ready(function () {

            $("#collapseOne").addClass("in");
            $("#collapseTwo").removeClass("in");
            $("#collapseThree").removeClass("in");

            $("#menu .nav li").removeClass("active");
            $("#menu .nav li#currency").addClass("active");


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

                if (!window.validate) {
                    return false;
                }

                isMainVal = "0";
                if ($("#<%=isMain.ClientID %>").prop("checked")) isMainVal = "1";

                isReturnGivenInMainCurrencyVal = "0";
                if ($("#<%=isReturnGivenInMainCurrency.ClientID %>").prop("checked")) isReturnGivenInMainCurrencyVal = "1";

                isApplyExchangeRateByDefaultVal = "0";
                if ($("#<%=isApplyExchangeRateByDefault.ClientID %>").prop("checked")) isApplyExchangeRateByDefaultVal = "1";

                isShowInitialInFrontOfTotalVal = "0";
                if ($("#<%=isShowInitialInFrontOfTotal.ClientID %>").prop("checked")) isShowInitialInFrontOfTotalVal = "1";

                
                if (window.IU == 'I') {


                    $.post("../Ajax/currency.aspx",
                        {
                            description: $("#description").val(),
                            isMain: isMainVal,
                            decimalsQuantity: $("#decimalsQuantity").val(),
                            initials: $("#initials").val(),
                            ISOCurrencyCode: $("#ISOCurrencyCode").val(),
                            defaultExchangeRate: $("#defaultExchangeRate").val(),
                            isReturnGivenInMainCurrency: isReturnGivenInMainCurrencyVal,
                            isApplyExchangeRateByDefault: isApplyExchangeRateByDefaultVal,
                            isShowInitialInFrontOfTotal: isShowInitialInFrontOfTotalVal,
                            image: "",

                            createDate: '',
                            createUser: '-1',
                            modifyUser: '-1',
                            StatementType: 'Insert'
                        },

                        function (response) {
                            //alert(response);
                            //PageMethods.SendForm(response);
                            PageMethods.saveImage(response);

                            //alert("Data inserted...");
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


                    $.post("../Ajax/currency.aspx",
                        {
                            currencyID: window.ID,
                            description: $("#description").val(),
                            isMain: isMainVal,
                            decimalsQuantity: $("#decimalsQuantity").val(),
                            initials: $("#initials").val(),
                            ISOCurrencyCode: $("#ISOCurrencyCode").val(),
                            defaultExchangeRate: $("#defaultExchangeRate").val(),
                            isReturnGivenInMainCurrency: isReturnGivenInMainCurrencyVal,
                            isApplyExchangeRateByDefault: isApplyExchangeRateByDefaultVal,
                            isShowInitialInFrontOfTotal: isShowInitialInFrontOfTotalVal,
                            image: window.ID,

                            modifyUser: '-1',
                            StatementType: 'Update'
                        },

                        function (response) {
                            //alert(response);
                            //PageMethods.SendForm(response);
                            PageMethods.saveImage(window.ID);
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


        function updateRow(id, description, isMain, decimalsQuantity, initials, ISOCurrencyCode, defaultExchangeRate, isReturnGivenInMainCurrency, isApplyExchangeRateByDefault, isShowInitialInFrontOfTotal) {
            if (!window.isDelete) {
                //alert(id);
                //$("#deptName").val(id);
                window.IU = 'U';
                window.ID = id;


                $("#description").val(description);
                $("#decimalsQuantity").val(decimalsQuantity);
                $("#initials").val(initials);
                $("#ISOCurrencyCode").val(ISOCurrencyCode);
                $("#defaultExchangeRate").val(defaultExchangeRate);

                if (isMain == "1") $("#<%=isMain.ClientID %>").prop("checked", true);
                else $("#<%=isMain.ClientID %>").prop("checked", false);

                if (isReturnGivenInMainCurrency == "1") $("#<%=isReturnGivenInMainCurrency.ClientID %>").prop("checked", true);
                else $("#<%=isReturnGivenInMainCurrency.ClientID %>").prop("checked", false);

                if (isApplyExchangeRateByDefault == "1") $("#<%=isApplyExchangeRateByDefault.ClientID %>").prop("checked", true);
                else $("#<%=isApplyExchangeRateByDefault.ClientID %>").prop("checked", false);

                if (isShowInitialInFrontOfTotal == "1") $("#<%=isShowInitialInFrontOfTotal.ClientID %>").prop("checked", true);
                else $("#<%=isShowInitialInFrontOfTotal.ClientID %>").prop("checked", false);


                $("#ctl00_MainContent_ImageUploader_imgPreview").load();

                src = $("#ctl00_MainContent_ImageUploader_imgPreview").attr("src");
                src = "../uploadedImg/currency/" + id + ".jpg";
                $("#ctl00_MainContent_ImageUploader_imgPreview").attr("src", src);
                $("#ctl00_MainContent_ImageUploader_imgPreview").css("height", "auto");
                $("#ctl00_MainContent_ImageUploader_imgPreview").css("width", "auto");

                $("#<%= nextID.ClientID %>").val(id);
                
                //args = id + "," + deptName + "," + description
                //__doPostBack("id", id);
                //return false;



            }
        }


        function deleteRow(id) {
            window.isDelete = true;

            if (confirm('Sure To Delete?')) {
                $.post("../Ajax/currency.aspx",
                    {
                        currencyID: id,
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

    <div id="breadCrum"><h1>Master > Currency</h1></div>
                 
    <div id="content">   
        
        <div class="contentbox-wrapper">

        <div class="tabbable contentbox"" id="tabContent">
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
                <asp:UpdatePanel runat="server" ID="UpdatePanel2" UpdateMode="Conditional">
                <ContentTemplate>

                    <div id="searchArea">
                        <asp:DropDownList id="searchBy" runat="server" AutoPostBack="false">
                            <asp:ListItem Value="description" Text="Description"></asp:ListItem>
                            <asp:ListItem Value="currencyID" Text="Currency ID"></asp:ListItem>
                        </asp:DropDownList>
                        
                        <asp:TextBox id="searchText" class="searchText" runat="server" AutoPostBack="false" placeholder="search keyword..."  onkeyup="searchKeyword(this.value);" ></asp:TextBox>

                        <label id="clearSearch" title="Clear Search" onclick="clearSearch();">Clear Search</label>
                    </div>

                    <asp:ListView ID="lstvCurrency" runat="server" >
            <LayoutTemplate >
                <table class="table table-condensed" id="dataRows">
                    <tr>
                        <th>Currency ID</th>
                        <th colspan="2">Description</th>
                    </tr>
                    <asp:PlaceHolder id="itemPlaceholder" runat="server" />
                </table>
            </LayoutTemplate>

            <ItemTemplate>
                <tr ondblclick="updateRow(<%#Eval("currencyID") %>, '<%#Eval("description") %>', '<%#Eval("isMain") %>', <%#Eval("decimalsQuantity") %>, '<%#Eval("initials") %>', '<%#Eval("ISOCurrencyCode") %>', <%#Eval("defaultExchangeRate") %>, '<%#Eval("isReturnGivenInMainCurrency") %>', '<%#Eval("isApplyExchangeRateByDefault") %>', '<%#Eval("isShowInitialInFrontOfTotal") %>');  
                            $('#tab2').addClass('active');
                            $('#tab2Ref').addClass('active');

                            $('#tab1').removeClass('active');
                            $('#tab1Ref').removeClass('active');
                            $('#tab2Ref a').html('Edit / Update');

                ">
                    <td>
                        <asp:Label ID="lblCurrencyID" runat="Server" Text='<%#Eval("currencyID") %>' />
                    </td>

                    <td>
                        <asp:Label ID="lblDescription" runat="Server" Text='<%#Eval("description") %>' />
                    </td>

                    <td class="btn btn-danger btn-mini"  onmouseup="deleteRow(<%#Eval("currencyID") %>)" style="cursor:pointer"></td>
                </tr>
            </ItemTemplate>
        </asp:ListView>
                    
                    <div class="pagination">
                        <asp:DataPager ID="DataPager" runat="server" PagedControlID="lstvCurrency" 
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
              
                <form class="navbar-form pull-left" id="currencyForm" action="currency.aspx">

                     

                    <div id="currency" class="row-fluid">
                    <div class="span6">
                <table>
                    <tr>
                        <td><label>Currency ID</label></td>
                        <td><asp:TextBox id="nextID" runat="server" class="span2" ReadOnly="true" ></asp:TextBox></td>
                    </tr>

                    <tr>
                        <td><label>Description</label></td>
                        <td>
                            <span>
                                <input id="description" type="text" placeholder="Description" class="span2" />
                                <div class="astericks">*</div>
                            </span>
                        </td>
                    </tr>

                    <tr>
                        <td><label>Main</label></td>
                        <td><asp:CheckBox ID="isMain" runat="server" class="span2" /></td>
                    </tr>

                    <tr>
                        <td><label>Decimals Quantity</label></td>
                        <td><input id="decimalsQuantity" type="text" placeholder="Decimals Quantity" class="span2" /></td>
                    </tr>

                    <tr>
                        <td><label>Initials</label></td>
                        <td><input id="initials" type="text" placeholder="Initials" class="span2" /></td>
                    </tr>

                    <tr>
                        <td><label>ISO Currency Code</label></td>
                        <td><input id="ISOCurrencyCode" type="text" placeholder="ISO Currency Code" class="span2" /></td>
                    </tr>

                    <tr>
                        <td><label>Default Exchange Rate</label></td>
                        <td><input id="defaultExchangeRate" type="text" placeholder="Default Exchange Rate" class="span2" /></td>
                    </tr>

                </table>
                    </div>

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
                                                AutoOpenImageEditPopupAfterUpload="true"
                                                Culture="en" 
                                             EnableEdit="False" Text_BrowseButton=" " Text_RemoveButton=" " 
                                                Text_CancelUploadButton=" " />
                
                
                                        </div>
                            
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>

                            <tr>
                                <td><label>Return Given In Main Currency</label></td>
                                <td><asp:CheckBox ID="isReturnGivenInMainCurrency" runat="server" class="span2" /></td>
                            </tr>

                            <tr>
                                <td><label>Apply Exchange Rate By Default</label></td>
                                <td><asp:CheckBox ID="isApplyExchangeRateByDefault" runat="server" class="span2" /></td>
                            </tr>
                            <tr>
                                <td><label>Show Initial In Front Of Total</label></td>
                                <td><asp:CheckBox ID="isShowInitialInFrontOfTotal" runat="server" class="span2" /></td>
                            </tr>

                        </table>




                    </div>

           </div>

                </form>


                <div class="astericsMsg">* indicates required field</div>
            </div>
          </div>
        </div> 
                 
                
        

        </div>
    
    </div>   
        

        
</asp:Content>