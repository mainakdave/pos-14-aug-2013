<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="paymentType.aspx.cs" Inherits="POS.views.paymentType"   MasterPageFile="~/views/masterPage.Master" %>

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
            $("#menu .nav li#paymentType").addClass("active");


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

                roundVal = $('input[name=round]:checked').val();
                keepTheChangeVal = $('input[name=keepTheChange]:checked').val();

                isCashPaymentVal = "0";
                if ($("#<%=isCashPayment.ClientID %>").prop("checked")) isCashPaymentVal = "1";

                isAssociateTheClientVal = "0";
                if ($("#<%=isAssociateTheClient.ClientID %>").prop("checked")) isAssociateTheClientVal = "1";

                isVisibleAtPOSVal = "0";
                if ($("#<%=isVisibleAtPOS.ClientID %>").prop("checked")) isVisibleAtPOSVal = "1";

                isPendingVal = "0";
                if ($("#<%=isPending.ClientID %>").prop("checked")) isPendingVal = "1";

                isDisableOverPaymentVal = "0";
                if ($("#<%=isDisableOverPayment.ClientID %>").prop("checked")) isDisableOverPaymentVal = "1";

                isOpenCashDrawerVal = "0";
                if ($("#<%=isOpenCashDrawer.ClientID %>").prop("checked")) isOpenCashDrawerVal = "1";

                isLinkSoftwareForHotelVal = "0";
                if ($("#<%=isLinkSoftwareForHotel.ClientID %>").prop("checked")) isLinkSoftwareForHotelVal = "1";

                isApplicableWithOtherPaymentTypeVal = "0";
                if ($("#<%=isApplicableWithOtherPaymentType.ClientID %>").prop("checked")) isApplicableWithOtherPaymentTypeVal = "1";

                if (window.IU == 'I') {


                    $.post("../Ajax/paymentType.aspx",
                        {
                            description: $("#description").val(),
                            currencyCode: $("#<%=currencyDrplst.ClientID %>").val(),
                            isCashPayment: isCashPaymentVal,
                            isAssociateTheClient: isAssociateTheClientVal,
                            isVisibleAtPOS: isVisibleAtPOSVal,
                            isPending: isPendingVal,
                            round: roundVal,
                            keepTheChange: keepTheChangeVal,
                            bankCommission: $("#bankCommission").val(),
                            isDisableOverPayment: isDisableOverPaymentVal,
                            isOpenCashDrawer: isOpenCashDrawerVal,
                            isLinkSoftwareForHotel: isLinkSoftwareForHotelVal,
                            isApplicableWithOtherPaymentType: isApplicableWithOtherPaymentTypeVal,
                            associatedDLL: $("#associatedDLL").val(),
                            image: "",
                            paymentGroupID: $("#<%=paymentGroupDrp.ClientID %>").val(),

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


                    $.post("../Ajax/paymentType.aspx",
                        {
                            paymentTypeID: window.ID,
                            description: $("#description").val(),
                            currencyCode: $("#<%=currencyDrplst.ClientID %>").val(),
                            isCashPayment: isCashPaymentVal,
                            isAssociateTheClient: isAssociateTheClientVal,
                            isVisibleAtPOS: isVisibleAtPOSVal,
                            isPending: isPendingVal,
                            round: roundVal,
                            keepTheChange: keepTheChangeVal,
                            bankCommission: $("#bankCommission").val(),
                            isDisableOverPayment: isDisableOverPaymentVal,
                            isOpenCashDrawer: isOpenCashDrawerVal,
                            isLinkSoftwareForHotel: isLinkSoftwareForHotelVal,
                            isApplicableWithOtherPaymentType: isApplicableWithOtherPaymentTypeVal,
                            associatedDLL: $("#associatedDLL").val(),
                            image: window.ID,
                            paymentGroupID: $("#<%=paymentGroupDrp.ClientID %>").val(),

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

                            
        function updateRow(id, description, currencyCode, isCashPayment, isAssociateTheClient, isVisibleAtPOS, isPending, round, keepTheChange, bankCommission, isDisableOverPayment, isOpenCashDrawer, isLinkSoftwareForHotel, isApplicableWithOtherPaymentType, associatedDLL, paymentGroupID) {
            if (!window.isDelete) {
                //alert(id);
                //$("#deptName").val(id);
                window.IU = 'U';
                window.ID = id;


                $("#description").val(description);
                $("#<%=currencyDrplst.ClientID %>").val(currencyCode);

                if (isCashPayment == "1") $("#<%=isCashPayment.ClientID %>").prop("checked", true);
                else $("#<%=isCashPayment.ClientID %>").prop("checked", false);

                if (isAssociateTheClient == "1") $("#<%=isAssociateTheClient.ClientID %>").prop("checked", true);
                else $("#<%=isAssociateTheClient.ClientID %>").prop("checked", false);

                if (isVisibleAtPOS == "1") $("#<%=isVisibleAtPOS.ClientID %>").prop("checked", true);
                else $("#<%=isVisibleAtPOS.ClientID %>").prop("checked", false);

                if (isPending == "1") $("#<%=isPending.ClientID %>").prop("checked", true);
                else $("#<%=isPending.ClientID %>").prop("checked", false);

                $("input[name='round'][value='" + round + "']").attr("checked", true);
                $("input[name='keepTheChange'][value='" + keepTheChange + "']").attr("checked", true);

                $("#bankCommission").val(bankCommission);

                if (isDisableOverPayment == "1") $("#<%=isDisableOverPayment.ClientID %>").prop("checked", true);
                else $("#<%=isDisableOverPayment.ClientID %>").prop("checked", false);

                if (isOpenCashDrawer == "1") $("#<%=isOpenCashDrawer.ClientID %>").prop("checked", true);
                else $("#<%=isOpenCashDrawer.ClientID %>").prop("checked", false);

                if (isLinkSoftwareForHotel == "1") $("#<%=isLinkSoftwareForHotel.ClientID %>").prop("checked", true);
                else $("#<%=isLinkSoftwareForHotel.ClientID %>").prop("checked", false);

                if (isApplicableWithOtherPaymentType == "1") $("#<%=isApplicableWithOtherPaymentType.ClientID %>").prop("checked", true);
                else $("#<%=isApplicableWithOtherPaymentType.ClientID %>").prop("checked", false);

                $("#associatedDLL").val(associatedDLL);

                $("#<%=paymentGroupDrp.ClientID %>").val(paymentGroupID);

                $("#ctl00_MainContent_ImageUploader_imgPreview").load();

                src = $("#ctl00_MainContent_ImageUploader_imgPreview").attr("src");
                src = "../uploadedImg/paymentType/" + id + ".jpg";
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
                $.post("../Ajax/paymentType.aspx",
                    {
                        paymentTypeID: id,
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

    <div id="breadCrum"><h1>Master > Payment Type</h1></div>
                 
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
                            <asp:ListItem Value="paymentTypeID" Text="Payment Type ID"></asp:ListItem>
                        </asp:DropDownList>
                        
                        <asp:TextBox id="searchText" class="searchText" runat="server" AutoPostBack="false" placeholder="search keyword..."  onkeyup="searchKeyword(this.value);" ></asp:TextBox>

                        <label id="clearSearch" title="Clear Search" onclick="clearSearch();">Clear Search</label>
                    </div>

                    <asp:ListView ID="lstvPaymentType" runat="server" >
            <LayoutTemplate >
                <table class="table table-condensed" id="dataRows">
                    <tr>
                        <th>Payment Type ID</th>
                        <th colspan="2">Description</th>
                    </tr>
                    <asp:PlaceHolder id="itemPlaceholder" runat="server" />
                </table>
            </LayoutTemplate>

            <ItemTemplate>
                <tr ondblclick="updateRow(<%#Eval("paymentTypeID") %>, '<%#Eval("description") %>', <%#Eval("currencyCode") %>, '<%#Eval("isCashPayment") %>', '<%#Eval("isAssociateTheClient") %>', '<%#Eval("isVisibleAtPOS") %>', '<%#Eval("isPending") %>', <%#Eval("round") %>, <%#Eval("keepTheChange") %>, '<%#Eval("bankCommission") %>', '<%#Eval("isDisableOverPayment") %>', '<%#Eval("isOpenCashDrawer") %>', '<%#Eval("isLinkSoftwareForHotel") %>', '<%#Eval("isApplicableWithOtherPaymentType") %>', '<%#Eval("associatedDLL") %>', '<%#Eval("paymentGroupID") %>');  
                            $('#tab2').addClass('active');
                            $('#tab2Ref').addClass('active');

                            $('#tab1').removeClass('active');
                            $('#tab1Ref').removeClass('active');
                            $('#tab2Ref a').html('Edit / Update');

                ">
                    <td>
                        <asp:Label ID="lblPaymentTypeID" runat="Server" Text='<%#Eval("paymentTypeID") %>' />
                    </td>

                    <td>
                        <asp:Label ID="lblDescription" runat="Server" Text='<%#Eval("description") %>' />
                    </td>

                    <td class="btn btn-danger btn-mini"  onmouseup="deleteRow(<%#Eval("paymentTypeID") %>)" style="cursor:pointer"></td>
                </tr>
            </ItemTemplate>
        </asp:ListView>
                    
                    <div class="pagination">
                        <asp:DataPager ID="DataPager" runat="server" PagedControlID="lstvPaymentType" 
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
              
                <form class="navbar-form pull-left" id="paymentTypeForm" action="paymentType.aspx">

                     

                    <div id="paymentType" class="row-fluid">
                    <div class="span6">
                <table>
                    <tr>
                        <td><label>Payment Type ID</label></td>
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
                        <td><label>Currency</label></td>
                        <td>
                            <asp:DropDownList ID="currencyDrplst" runat="server" AutoPostBack="False"></asp:DropDownList>
                            <div class="astericks">*</div>
                        </td>
                    </tr>

                    <tr>
                        <td><label>Cash Payment</label></td>
                        <td><asp:CheckBox ID="isCashPayment" runat="server" class="span2" /></td>
                    </tr>

                    <tr>
                        <td><label>Associate with Client</label></td>
                        <td><asp:CheckBox ID="isAssociateTheClient" runat="server" class="span2" /></td>
                    </tr>

                    <tr>
                        <td><label>Visible At POS</label></td>
                        <td><asp:CheckBox ID="isVisibleAtPOS" runat="server" class="span2" /></td>
                    </tr>
                    <tr>
                        <td><label>Pending/On Credit</label></td>
                        <td><asp:CheckBox ID="isPending" runat="server" class="span2" /></td>
                    </tr>
                    
                    <tr>
                        <td><label>Round</label></td>
                        <td>
                            <table style="margin: 14px 0; width: 100%;">
                                <tr>
                                    <td valign="top">
                                        <input type="radio" name="round" value="1" style="width: auto; margin-right: 4px; margin-top: -4px;" checked="checked"><span>Withous rounding</span>
                                    </td>
                                    <td valign="top">
                                        <input type="radio" name="round" value="2" style="width: auto; margin-right: 4px; margin-top: -4px;"><span>0, 0.5</span>
                                    </td>
                                </tr>

                                <tr>
                                    <td valign="top">
                                        <input type="radio" name="round" value="3" style="width: auto; margin-right: 4px; margin-top: -4px;"><span>end in 0 or 5</span>
                                    </td>
                                    <td valign="top">
                                        <input type="radio" name="round" value="4" style="width: auto; margin-right: 4px; margin-top: -4px;"><span>Without decimals</span>
                                    </td>
                                </tr>

                                <tr>
                                    <td valign="top">
                                        <input type="radio" name="round" value="5" style="width: auto; margin-right: 4px; margin-top: -4px;"><span>0, 0.25, 0.5, 0.75</span>
                                    </td>
                                    <td valign="top">
                                        <input type="radio" name="round" value="6" style="width: auto; margin-right: 4px; margin-top: -4px;"><span>0, 10, 20, 30...</span>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>

                    <tr>
                        <td><label>Keep The Change</label></td>
                        <td>
                            <table style="margin: 14px 0; width: 100%;">
                                <tr>
                                    <td valign="top">
                                        <input type="radio" name="keepTheChange" value="1" style="width: auto; margin-right: 4px; margin-top: -4px;"><span>Give As Tip</span>
                                    </td>

                                    <td valign="top">
                                        <input type="radio" name="keepTheChange" value="2" style="width: auto; margin-right: 4px; margin-top: -4px;"><span>Change in main currency</span>
                                    </td

                                    <td valign="top">
                                        <input type="radio" name="keepTheChange" value="3" style="width: auto; margin-right: 4px; margin-top: -4px;"><span>Other</span>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>

                </table>
                    </div>

                    <div class="span6">
                        <table>
                            <tr>
                                <td><label>Payment group</label></td>
                                <td>
                                    <asp:DropDownList ID="paymentGroupDrp" runat="server" AutoPostBack="False"></asp:DropDownList>
                                </td>
                            </tr>

                            <tr>
                                <td><label>Bank Commission</label></td>
                                <td><input id="bankCommission" type="text" placeholder="Bank Commission" class="span2" /></td>
                            </tr>
                            
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
                                <td><label>Disable Over Payment</label></td>
                                <td><asp:CheckBox ID="isDisableOverPayment" runat="server" class="span2" /></td>
                            </tr>

                            <tr>
                                <td><label>Open Cash Drawer</label></td>
                                <td><asp:CheckBox ID="isOpenCashDrawer" runat="server" class="span2" /></td>
                            </tr>

                            <!--
                            <tr>
                                <td><label>Link Software For Hotel</label></td>
                                <td><asp:CheckBox ID="isLinkSoftwareForHotel" runat="server" class="span2" /></td>
                            </tr>
                            -->

                            <tr>
                                <td><label>Applicable With Other Payment Type</label></td>
                                <td><asp:CheckBox ID="isApplicableWithOtherPaymentType" runat="server" class="span2" /></td>
                            </tr>

                            <tr>
                                <td><label>Associated DLL</label></td>
                                <td><input id="associatedDLL" type="text" placeholder="Associated DLL" class="span2" /></td>
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