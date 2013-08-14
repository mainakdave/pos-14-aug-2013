<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="brand.aspx.cs" Inherits="POS.views.brand" MasterPageFile="~/views/masterPage.Master" %>

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
            $("#menu .nav li#brand").addClass("active");

            
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

                //$("#<%=Button1.ClientID %>").click();

                if (window.IU == 'I') {


                    $.post("../Ajax/brand.aspx",
                        {
                            brandName: $("#brandName").val(),
                            description: $("#description").val(),
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


                    $.post("../Ajax/brand.aspx",
                        {
                            brandID: window.ID,
                            brandName: $("#brandName").val(),
                            description: $("#description").val(),
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


        function updateRow(id, brandName, description) {
            if (!window.isDelete) {
                //alert(id);
                //$("#deptName").val(id);
                window.IU = 'U';
                window.ID = id;

                
                $("#brandName").val(brandName);
                $("#description").val(description);

                $("#<%= nextID.ClientID %>").val(id);
                __doPostBack("<%= upAssociatedItems.ClientID %>", "filterID:=:" + id);

                //args = id + "," + deptName + "," + description
                //__doPostBack("id", id);
                //return false;

                

            }
        }


        function deleteRow(id) {
            window.isDelete = true;

            if (confirm('Sure To Delete?')) {
                $.post("../Ajax/brand.aspx",
                    {
                        brandID: id,
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

    <div id="breadCrum"><h1>Master > Brand</h1></div>
                 
    <div id="content">   
        
        <div class="contentbox-wrapper">

        <div class="tabbable contentbox"" id="tabContent">
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
                <asp:UpdatePanel runat="server" ID="UpdatePanel2" UpdateMode="Conditional">
                <ContentTemplate>

                    <div id="searchArea">
                        <asp:DropDownList id="searchBy" runat="server" AutoPostBack="false">
                            <asp:ListItem Value="brandName" Text="Brand Name"></asp:ListItem>
                            <asp:ListItem Value="brandID" Text="Brand ID"></asp:ListItem>
                        </asp:DropDownList>
                        
                        <asp:TextBox id="searchText" class="searchText" runat="server" AutoPostBack="false" placeholder="search keyword..."  onkeyup="searchKeyword(this.value);" ></asp:TextBox>

                        <label id="clearSearch" title="Clear Search" onclick="clearSearch();">Clear Search</label>
                    </div>

                    <asp:ListView ID="lstvBrand" runat="server" >
            <LayoutTemplate >
                <table class="table table-condensed" id="dataRows">
                    <tr>
                        <th>Brand ID</th>
                        <th colspan="2">Brand Name</th>
                    </tr>
                    <asp:PlaceHolder id="itemPlaceholder" runat="server" />
                </table>
            </LayoutTemplate>

            <ItemTemplate>
                <tr ondblclick="updateRow(<%#Eval("brandID") %>, '<%#Eval("brandName") %>', '<%#Eval("description") %>');  
                            $('#tab2').addClass('active');
                            $('#tab2Ref').addClass('active');

                            $('#tab1').removeClass('active');
                            $('#tab1Ref').removeClass('active');
                            $('#tab2Ref a').html('Edit / Update');

                            $('#filterMarker').html('<%# Eval("brandName") %>');
                ">
                    <td>
                        <asp:Label ID="lblDeptID" runat="Server" Text='<%#Eval("brandID") %>' />
                    </td>

                    <td>
                        <asp:Label ID="lblDeptName" runat="Server" Text='<%#Eval("brandName") %>' />
                    </td>

                    <td class="btn btn-danger btn-mini"  onmouseup="deleteRow(<%#Eval("brandID") %>)" style="cursor:pointer"></td>
                </tr>
            </ItemTemplate>
        </asp:ListView>
                    
                    <div class="pagination">
                        <asp:DataPager ID="DataPager" runat="server" PagedControlID="lstvBrand" 
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
              
                <form class="navbar-form pull-left" id="brandForm" action="brand.aspx">

                     

                    <div id="brand" class="row-fluid">
                    <div class="span6">
                <table>
                    <tr>
                        <td><label>Brand ID</label></td>
                        <td><asp:TextBox id="nextID" runat="server" class="span2" ReadOnly="true" ></asp:TextBox></td>
                    </tr>

                    <tr>
                        <td><label>Description</label></td>
                        <td><input id="description" type="text" placeholder="Description" class="span2" /></td>
                    </tr>

                    <tr>
                        <td><label>Brand</label></td>
                        <td>
                            <span>
                                <input id="brandName" type="text" placeholder="Brand Name" class="span2" />
                                <div class="astericks">*</div>
                            </span>
                        </td>
                    </tr>

                                   
                                   <!-- Item Name -->
                </table>
                    </div>

                    <div class="span6"></div>
                 
            
                

                
            
                <!-- Item Image -->
           </div>

                </form>


                <div id="showAssociatedItems" class='btn'>Show associated Items</div>

                <div class="astericsMsg">* indicates required field</div>
            </div>
          </div>
        </div> 
                 
                
        <div id="associatedItems" class="contentbox">

            <div id="backContainer">
                <div id="back"></div>
                <div id="filterMarker"></div>
            </div>

            <asp:UpdatePanel runat="server" ID="upAssociatedItems" UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:ListView ID="lstvAssociatedItem" runat="server" >
                <LayoutTemplate >
                    <table class="table table-condensed" id="dataAssociatedRows">
                        <tr>
                            <th>Item ID</th>
                            <th>Item Name</th>
                        </tr>
                        <asp:PlaceHolder id="itemPlaceholder" runat="server" />
                    </table>
                </LayoutTemplate>

                <ItemTemplate>
                    <tr ondblclick="">
                        <td>
                            <asp:Label ID="lblAssociatedItemID" runat="Server" Text='<%#Eval("itemID") %>' />
                        </td>

                        <td>
                            <asp:Label ID="lblAssociatedItemName" runat="Server" Text='<%#Eval("itemName") %>' />
                        </td>

                    </tr>
                </ItemTemplate>
            </asp:ListView>
                    
                    <div class="pagination">
                        <asp:DataPager ID="dataPagerAssociatedItem" runat="server" PagedControlID="lstvAssociatedItem" 
                            PageSize="5" onprerender="dataPagerAssociatedItem_PreRender" >
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

        </div>
    
    </div>   
        

        
</asp:Content>

