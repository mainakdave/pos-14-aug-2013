<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="taxType.aspx.cs" Inherits="POS.views.taxType" MasterPageFile="~/views/masterPage.Master" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">

    <script type="text/javascript">

        var IU = 'I';
        var ID = -1;
        var isDelete = false;

        $(document).ready(function () {

            $("#collapseOne").removeClass("in");
            $("#collapseTwo").removeClass("in");
            $("#collapseThree").addClass("in");

            $("#menu .nav li").removeClass("active");
            $("#menu .nav li#taxType").addClass("active");


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



                //$("#<%=Button1.ClientID %>").click();

                if (window.IU == 'I') {


                    $.post("../Ajax/taxType.aspx",
                        {
                            description: $("#description").val(),
                            inputTaxAccount: $("#inputTaxAccount").val(),
                            outputTaxAccount: $("#outputTaxAccount").val(),
                            refundTaxAccount: $("#refundTaxAccount").val(),
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

                                __doPostBack("<%= UpdatePanel2.ClientID %>");
                        }
                    );

                    return false;
                }
                else if (window.IU == 'U') {


                    $.post("../Ajax/taxType.aspx",
                        {
                            taxTypeID: window.ID,
                            description: $("#description").val(),
                            inputTaxAccount: $("#inputTaxAccount").val(),
                            outputTaxAccount: $("#outputTaxAccount").val(),
                            refundTaxAccount: $("#refundTaxAccount").val(),
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


        function updateRow(id, description, inputTaxAccount, outputTaxAccount, refundTaxAccount) {
            if (!window.isDelete) {
                window.IU = 'U';
                window.ID = id;

                $("#description").val(description);
                $("#inputTaxAccount").val(inputTaxAccount);
                $("#outputTaxAccount").val(outputTaxAccount);
                $("#refundTaxAccount").val(refundTaxAccount);
                
            }
        }


        function deleteRow(id) {
            window.isDelete = true;

            if (confirm('Sure To Delete?')) {
                $.post("../Ajax/taxType.aspx",
                    {
                        taxTypeID: id,
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

            $("input[type=text]").val(null);

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

    <div id="breadCrum"><h1>Master > Tax Type</h1></div>

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
                            <asp:ListItem Value="description" Text="Description"></asp:ListItem>
                            <asp:ListItem Value="taxTypeID" Text="Tax Type ID"></asp:ListItem>
                        </asp:DropDownList>
                        
                        <asp:TextBox id="searchText" class="searchText" runat="server" AutoPostBack="false" placeholder="search keyword..."  onkeyup="searchKeyword(this.value);" ></asp:TextBox>

                        <label id="clearSearch" title="Clear Search" onclick="clearSearch();">Clear Search</label>
                    </div>

                    <asp:ListView ID="lstvTaxType" runat="server" >
            <LayoutTemplate >
                <table class="table table-condensed" id="dataRows">
                    <tr>
                        <th>Tax Type ID</th>
                        <th colspan="2">Description</th>
                    </tr>
                    <asp:PlaceHolder id="itemPlaceholder" runat="server" />
                </table>
            </LayoutTemplate>

            <ItemTemplate>
                <tr ondblclick="updateRow(<%#Eval("taxTypeID") %>, '<%#Eval("description ") %>', '<%#Eval("inputTaxAccount") %>', '<%#Eval("outputTaxAccount") %>',  '<%#Eval("refundTaxAccount") %>');
                                $('#tab2').addClass('active');
                                $('#tab2Ref').addClass('active');

                                $('#tab1').removeClass('active');
                                $('#tab1Ref').removeClass('active');
                                $('#tab2Ref a').html('Edit / Update');
                ">
                    <td>
                        <asp:Label ID="lblTaxTypeID" runat="Server" Text='<%#Eval("taxTypeID") %>' />
                    </td>

                    <td>
                        <asp:Label ID="lblDescription" runat="Server" Text='<%#Eval("description") %>' />
                    </td>

                    <td class="btn btn-danger btn-mini"  onmouseup="deleteRow(<%#Eval("taxTypeID") %>)" style="cursor:pointer"></td>
                </tr>
            </ItemTemplate>
        </asp:ListView>
                    
                    <div class="pagination">
                        <asp:DataPager ID="DataPager" runat="server" PagedControlID="lstvTaxType" 
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
              
                    <form class="navbar-form pull-left" id="brandForm" action="taxType.aspx">

                     

                    <div id="taxType" class="row-fluid">
                    <div class="span6">
                <table>
                    <tr>
                        <td><label>Tax Type ID</label></td>
                        <td><asp:TextBox id="nextID" runat="server" class="span2" ReadOnly="true" ></asp:TextBox></td>
                    </tr>

                    <tr>
                        <td><label>Description</label></td>
                        <td><input id="description" type="text" placeholder="Description" class="span2" /></td>
                    </tr>

                    <tr>
                        <td><label>Input Tax Account</label></td>
                        <td><input id="inputTaxAccount" type="text" placeholder="Input Tax Account" class="span2" /></td>
                    </tr>

                    <tr>
                        <td><label>Output Tax Account</label></td>
                        <td><input id="outputTaxAccount" type="text" placeholder="Output Tax Account" class="span2" /></td>
                    </tr>

                    <tr>
                        <td><label>Refund Tax Account</label></td>
                        <td><input id="refundTaxAccount" type="text" placeholder="Refund Tax Account" class="span2" /></td>
                    </tr>

                                    
                                   <!-- Item Name -->
                </table>
                    </div>

                    <div class="span6">
                    </div>
                 
            
                

                
            
                <!-- Item Image -->
           </div>

                </form>

            </div>
          </div>
        </div>

        </div>
        </div>
</asp:Content>

