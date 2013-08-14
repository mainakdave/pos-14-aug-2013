<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="line.aspx.cs" Inherits="POS.views.line" MasterPageFile="~/views/masterPage.Master" %>

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
            $("#menu .nav li#line").addClass("active");

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


                    $.post("../Ajax/line.aspx",
                        {
                            brandID: $('#<%=brandDrplst.ClientID %>').val(),
                            lineName: $("#lineName").val(),
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


                    $.post("../Ajax/line.aspx",
                        {
                            brandID: $('#<%=brandDrplst.ClientID %>').val(),
                            lineID: window.ID,
                            lineName: $("#lineName").val(),
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


        function updateRow(brandID, lineID, lineName, description) {
            if (!window.isDelete) {
                //alert(id);
                //$("#deptName").val(id);
                window.IU = 'U';
                window.ID = lineID;

                $("#<%=brandDrplst.ClientID %>").val(brandID);
                $("#lineID").val(lineID);
                $("#lineName").val(lineName);
                $("#description").val(description);

                $("#<%= nextID.ClientID %>").val(lineID);
                __doPostBack("<%= upAssociatedItems.ClientID %>", "filterID:=:" + lineID);

                //args = id + "," + deptName + "," + description
                //__doPostBack("id", id);
                //return false;


            }
        }


        function deleteRow(brandID, lineID) {
            window.isDelete = true;

            if (confirm('Sure To Delete?')) {
                $.post("../Ajax/line.aspx",
                    {
                        brandID: brandID,
                        lineID: lineID,
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

            $('#<%=brandDrplst.ClientID %>').val(-1);
            $("#lineName").val(null);
            $("#description").val(null);

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


    <div id="breadCrum"><h1>Master > Line</h1></div>
                    
        <div id="content">   
        
        <div class="contentbox-wrapper">
                
                 
        
            <div class="tabbable contentbox" id="tabContent">
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
                            <asp:ListItem Value="lineName" Text="Line Name"></asp:ListItem>
                            <asp:ListItem Value="lineID" Text="Line ID"></asp:ListItem>
                        </asp:DropDownList>
                        
                        <asp:TextBox id="searchText" class="searchText" runat="server" AutoPostBack="false" placeholder="search keyword..."  onkeyup="searchKeyword(this.value);" ></asp:TextBox>

                        <label id="clearSearch" title="Clear Search" onclick="clearSearch();">Clear Search</label>
                    </div>

                    <asp:ListView ID="lstvLine" runat="server" >
            <LayoutTemplate >
                <table class="table table-condensed" id="dataRows">
                    <tr>
                        <th>Line ID</th>
                        <th colspan="2">Line Name</th>
                    </tr>
                    <asp:PlaceHolder id="itemPlaceholder" runat="server" />
                </table>
            </LayoutTemplate>

            <ItemTemplate>
                <tr ondblclick="updateRow(<%#Eval("brandID") %>, <%#Eval("lineID") %>, '<%#Eval("lineName") %>', '<%#Eval("description ") %>');
                                $('#tab2').addClass('active');
                                $('#tab2Ref').addClass('active');

                                $('#tab1').removeClass('active');
                                $('#tab1Ref').removeClass('active');
                                $('#tab2Ref a').html('Edit / Update');

                                $('#filterMarker').html('<%# Eval("lineName") %>');
                ">
                    <td>
                        <asp:Label ID="lblDeptID" runat="Server" Text='<%#Eval("lineID") %>' />
                    </td>

                    <td>
                        <asp:Label ID="lblDeptName" runat="Server" Text='<%#Eval("lineName") %>' />
                    </td>

                    <td class="btn btn-danger btn-mini"  onmouseup="deleteRow(<%#Eval("brandID") %>, <%#Eval("lineID") %>)" style="cursor:pointer"></td>
                </tr>
            </ItemTemplate>
        </asp:ListView>
                    
                    <div class="pagination">
                        <asp:DataPager ID="DataPager" runat="server" PagedControlID="lstvLine" 
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
               <form class="navbar-form pull-left" id="lineForm" action="line.aspx">

                    

                    <div id="line" class="row-fluid">
                    <div class="span6">
                <table>
                    <tr>
                        <td><label>Line ID</label></td>
                        <td><asp:TextBox id="nextID" runat="server" class="span2" ReadOnly="true" ></asp:TextBox></td>
                    </tr>

                    <tr>
                        <td><label>Reference</label></td>
                        <td><input id="reference" type="text" placeholder="Reference" class="span2" /></td>
                    </tr>

                    <tr>
                        <td><label>Line Name</label></td>
                        <td>
                            <input id="lineName" type="text" placeholder="Line Name" class="span2" />
                            <div class="astericks">*</div>
                        </td>
                    </tr>

                    <tr>
                        <td><label>Brand</label></td>
                        <td>
                            <asp:DropDownList ID="brandDrplst" runat="server"></asp:DropDownList>
                            <div class="astericks">*</div>
                        </td>
                    </tr>

                    <tr>
                        <td><label>Description</label></td>
                        <td><input id="description" type="text" placeholder="Description" class="span2" /></td>
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



