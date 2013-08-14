<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="section.aspx.cs" Inherits="POS.views.section" MasterPageFile="~/views/masterPage.Master"%>

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
            $("#menu .nav li#section").addClass("active");


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

                if (window.IU == 'I') {
                    var bgColor = $("#backgroundColorCode").val();
                    var textColor = $("#textColorCode").val();


                    $.post("../Ajax/section.aspx",
                        {
                            deptID: $('#<%=deptDrplst.ClientID %>').val(),
                            sectionName: $("#sectionName").val(),
                            reference: $("#reference").val(),
                            description: $("#description").val(),
                            image: "",
                            bgColor: bgColor,
                            textColor: textColor,
                            costCenter: $("#costCenter").val(),
                            saleAcct: $("#saleAcct").val(),
                            purchaseAcct: $("#purchaseAcct").val(),
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

                                __doPostBack("<%= UpdatePanel1.ClientID %>");
                        }
                    );

                    return false;
                }
                else if (window.IU == 'U') {
                    var bgColor = $("#backgroundColorCode").val();
                    var textColor = $("#textColorCode").val();

                    $.post("../Ajax/section.aspx",
                        {
                            deptID: $('#<%=deptDrplst.ClientID %>').val(),
                            sectionID: window.ID,
                            sectionName: $("#sectionName").val(),
                            reference: $("#reference").val(),
                            description: $("#description").val(),
                            image: window.ID,
                            bgColor: bgColor,
                            textColor: textColor,
                            costCenter: $("#costCenter").val(),
                            saleAcct: $("#saleAcct").val(),
                            purchaseAcct: $("#purchaseAcct").val(),
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

                                __doPostBack("<%= UpdatePanel1.ClientID %>");
                        }
                    );

                    return false;
                }
            });


        });


        function updateRow(deptID, sectionID, sectionName, reference, description, bgColor, textColor, costCenter, saleAcct, purchaseAcct) {
            if (!window.isDelete) {
                //alert(id);
                //$("#deptName").val(id);
                id = sectionID;
                window.IU = 'U';
                window.ID = id;

                
                $("#<%=deptDrplst.ClientID %>").val(deptID);
                $("#sectionName").val(sectionName);
                $("#reference").val(reference);
                $("#description").val(description);
                $("#colorSelector > div").css("background-color", "#" + bgColor);
                $("#colorSelector_text > div").css("background-color", "#" + textColor);
                $("#colorSelector").siblings("#backgroundColorCode").val(bgColor);
                $("#colorSelector_text").siblings("#textColorCode").val(textColor);
                $("#costCenter").val(costCenter);
                $("#saleAcct").val(saleAcct);
                $("#purchaseAcct").val(purchaseAcct);
                PageMethods.updateRow(id);

                $("#ctl00_MainContent_ImageUploader_imgPreview").load();

                src = $("#ctl00_MainContent_ImageUploader_imgPreview").attr("src");
                src = "../uploadedImg/section/" + id + ".jpg";
                $("#ctl00_MainContent_ImageUploader_imgPreview").attr("src", src);


                $("#<%= nextID.ClientID %>").val(sectionID);
                __doPostBack("<%= upAssociatedItems.ClientID %>", "filterID:=:" + sectionID);

                //args = id + "," + deptName + "," + description
                //__doPostBack("id", id);
                //return false;


                //alert(CodeCarvings.Wcs.Piczard.Upload.SimpleImageUpload.get_hasImage("<% =CodeCarvings.Piczard.Web.Helpers.JSHelper.EncodeString(this.ImageUploader.ClientID) %>"));
            }
        }


        function deleteRow(deptID, sectionID) {
            window.isDelete = true;

            if (confirm('Sure To Delete?')) {
                $.post("../Ajax/section.aspx",
                    {
                        deptID: deptID,
                        sectionID: sectionID,
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

                                __doPostBack("<%= UpdatePanel1.ClientID %>");
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

            $('#<%=deptDrplst.ClientID %>').val(-1);
            $("#sectionName").val(null);
            $("#reference").val(null);
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
                __doPostBack("<%= UpdatePanel1.ClientID %>", $("#<%= searchBy.ClientID %>").val() + ":,:" + searchText);
            }
            else {
                alert("Select search criteria!!!");
            }
        }

        function clearSearch() {
            $("#<%= searchBy.ClientID %>").val("-1");
            $("#<%= searchText.ClientID %>").val(null);

            __doPostBack("<%= UpdatePanel1.ClientID %>", "clearSearch");

        }
    </script>

</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">

    <div id="alertBox" data-alerts="alerts"  data-fade="3000"></div>
  
    <div id="breadCrum"><h1>Master > Section</h1></div>

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
              
                <asp:ScriptManager runat="server" ID="ScriptManager2" EnablePageMethods="true" EnablePartialRendering="true">
                            </asp:ScriptManager>

                <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Always">
                    <ContentTemplate>

                    <div id="searchArea">
                        <asp:DropDownList id="searchBy" runat="server" AutoPostBack="false">
                            <asp:ListItem Value="sectionName" Text="Section Name"></asp:ListItem>
                            <asp:ListItem Value="sectionID" Text="Section ID"></asp:ListItem>
                        </asp:DropDownList>
                        
                        <asp:TextBox id="searchText" class="searchText" runat="server" AutoPostBack="false" placeholder="search keyword..."  onkeyup="searchKeyword(this.value);" ></asp:TextBox>

                        <label id="clearSearch" title="Clear Search" onclick="clearSearch();">Clear Search</label>
                    </div>

                    <asp:ListView ID="lstvSection" runat="server">
            <LayoutTemplate >
                <table class="table table-condensed" id="dataRows">
                    <tr>
                        <th>Section ID</th>
                        <th colspan="2">Section Name</th>
                    </tr>
                    <asp:PlaceHolder id="itemPlaceholder" runat="server" />
                </table>
            </LayoutTemplate>

            <ItemTemplate>
                <tr ondblclick="updateRow(<%#Eval("deptID") %>, <%#Eval("sectionID") %>, '<%#Eval("sectionName") %>', '<%#Eval("reference") %>', '<%#Eval("description") %>', '<%#Eval("bgColor") %>', '<%#Eval("textColor") %>', '<%#Eval("costCenter") %>', '<%#Eval("saleAcct") %>', '<%#Eval("purchaseAcct") %>') ;
                                $('#tab2').addClass('active');
                                $('#tab2Ref').addClass('active');

                                $('#tab1').removeClass('active');
                                $('#tab1Ref').removeClass('active');
                                $('#tab2Ref a').html('Edit / Update');

                                $('#filterMarker').html('<%# Eval("sectionName") %>');
                ">
                    <td>
                        <asp:Label ID="lblDeptID" runat="Server" Text='<%#Eval("sectionID") %>' />
                    </td>

                    <td>
                        <asp:Label ID="lblDeptName" runat="Server" Text='<%#Eval("sectionName") %>' />
                    </td>

                    <td class="btn btn-danger btn-mini"  onmouseup="deleteRow(<%#Eval("deptID") %>, <%#Eval("sectionID") %>)" style="cursor:pointer"></td>
                </tr>
            </ItemTemplate>
        </asp:ListView>
                    

                    <div class="pagination">
                        <asp:DataPager ID="DataPager" runat="server" PagedControlID="lstvSection" 
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

                <form class="navbar-form pull-left" id="Form1" action="section.aspx">

                      

                    <div id="section" class="row-fluid">
                        
                        <div class="span6">
                            <table>
                                <tr>
                                    <td><label>Section ID</label></td>
                                    <td><asp:TextBox id="nextID" runat="server" class="span2" ReadOnly="true" ></asp:TextBox></td>
                                </tr>

                                <tr>
                                    <td><label>Reference</label></td>
                                    <td><input id="reference" type="text" placeholder="Reference" class="span2" /></td>
                                </tr>

                                <tr>
                                    <td><label>Section Name</label></td>
                                    <td><input id="sectionName" type="text" placeholder="Section Name" class="span2" />
                                        <div class="astericks">*</div>    
                                    </td>
                                </tr>

                                <tr>
                                    <td><label>Department Name</label></td>
                                    <td><!-- <input id="deptName" type="text" placeholder="Department Name" class="span2" /> -->
                                        <asp:DropDownList ID="deptDrplst" runat="server"></asp:DropDownList>
                                        <div class="astericks">*</div>
                                    </td>
                                </tr>

                                <tr>
                                    <td><label>Description</label></td>
                                    <td><input id="description" type="text" placeholder="Description" class="span2" /></td>
                                </tr>

                                <tr>
                                    <td><label>Cost Center</label></td>
                                    <td><input id="costCenter" type="text" placeholder="Cost Center" class="span2" /></td>
                                </tr>

                                <tr>
                                    <td><label>Sale Acct</label></td>
                                    <td><input id="saleAcct" type="text" placeholder="Sale Acct" class="span2" /></td>
                                </tr>

                                <tr>
                                    <td><label>Purchase Acct</label></td>
                                    <td><input id="purchaseAcct" type="text" placeholder="Purchase Acct" class="span2" /></td>
                                </tr>

                                      
                                               <!-- Item Name -->
                            </table>
                        </div>

                        <div class="span6">
                            <table>
                                <tr>
                                    <td><label>Image</label></td>
                                    <td>

                                      


                                         <asp:UpdatePanel runat="server" ID="UpdatePanel4" UpdateMode="Always">
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
                                    <td><label>Background Coloror</label></td>
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
