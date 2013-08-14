<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="format.aspx.cs" Inherits="POS.views.format"  MasterPageFile="~/views/masterPage.Master"%>


<%@ Register src="~/piczardUserControls/simpleImageUploadUserControl/SimpleImageUpload.ascx" tagname="SimpleImageUpload" tagprefix="ccPiczardUC" %>




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
            $("#menu .nav li#format").addClass("active");

            // positioning alertBox
            $("#alertBox").css("top", $(window).outerHeight() / 2);
            $("#alertBox").css("left", $(window).outerWidth() / 2);

            //$(".ui-keyboard").css("top", "0");

            

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
                    var bgColor = $("#backgroundColorCode").val();
                    var textColor = $("#textColorCode").val();

                    $.post("../Ajax/format.aspx",
                        {
                            reference: $("#reference").val(),
                            description: $("#description").val(),
                            image: "",
                            bgColor: bgColor,
                            textColor: textColor,
                            combination: $("#combination").val(),
                            portion1: $("#portion1").val(),
                            portion2: $("#portion2").val(),
                            costSecond: $("#costSecond").val(),
                            favoriteCode: $("#favoriteCode").val(),
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

                    $.post("../Ajax/format.aspx",
                        {
                            formatID: window.ID,
                            reference: $("#reference").val(),
                            description: $("#description").val(),
                            image: window.ID,
                            bgColor: bgColor,
                            textColor: textColor,
                            combination: $("#combination").val(),
                            portion1: $("#portion1").val(),
                            portion2: $("#portion2").val(),
                            costSecond: $("#costSecond").val(),
                            favoriteCode: $("#favoriteCode").val(),
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


        function updateRow(id, reference, description, bgColor, textColor, combination, portion1, portion2, costSecond, favoriteCode) {
            if (!window.isDelete) {
                //alert(id);
                //$("#deptName").val(id);
                window.IU = 'U';
                window.ID = id;



                $("#reference").val(reference);
                $("#description").val(description);
                $("#colorSelector > div").css("background-color", "#" + bgColor);
                $("#colorSelector_text > div").css("background-color", "#" + textColor);
                $("#colorSelector").siblings("#backgroundColorCode").val(bgColor);
                $("#colorSelector_text").siblings("#textColorCode").val(textColor);
                $("#combination").val(combination);
                $("#portion1").val(portion1);
                $("#portion2").val(portion2);
                $("#costSecond").val(costSecond);
                $("#favoriteCode").val(favoriteCode);
                PageMethods.updateRow(id);

                $("#ctl00_MainContent_ImageUploader_imgPreview").load();

                src = $("#ctl00_MainContent_ImageUploader_imgPreview").attr("src");
                src = "../uploadedImg/format/" + id + ".jpg";
                $("#ctl00_MainContent_ImageUploader_imgPreview").attr("src", src);
                $("#ctl00_MainContent_ImageUploader_imgPreview").css("height", "auto");
                $("#ctl00_MainContent_ImageUploader_imgPreview").css("width", "auto");

                //args = id + "," + deptName + "," + description
                //__doPostBack("id", id);
                //return false;


                //alert(CodeCarvings.Wcs.Piczard.Upload.SimpleImageUpload.get_hasImage("<% =CodeCarvings.Piczard.Web.Helpers.JSHelper.EncodeString(this.ImageUploader.ClientID) %>"));
            }
        }


        function deleteRow(id) {
            window.isDelete = true;

            if (confirm('Sure To Delete?')) {
                $.post("../Ajax/format.aspx",
                    {
                        formatID: id,
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

            $("#reference").val(null);
            $("#description").val(null);
            $("#colorSelector > div").css("background-color", "transparent");
            $("#colorSelector_text > div").css("background-color", "transparent");
            $("#combination").val(null);
            $("#portion1").val(null);
            $("#portion2").val(null);
            $("#costSecond").val(null);
            $("#favoriteCode").val(null);

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

    <div id="breadCrum"><h1>Master > Format</h1></div>  
        
     
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
                            <asp:ListItem Value="formatID" Text="Format ID"></asp:ListItem>
                        </asp:DropDownList>
                        
                        <asp:TextBox id="searchText" class="searchText" runat="server" AutoPostBack="false" placeholder="search keyword..."  onkeyup="searchKeyword(this.value);" ></asp:TextBox>

                        <label id="clearSearch" title="Clear Search" onclick="clearSearch();">Clear Search</label>
                    </div>

                    <asp:ListView ID="lstvFormat" runat="server">
            <LayoutTemplate >
                <table class="table table-condensed" id="dataRows">
                    <tr>
                        <th>Format ID</th>
                        <th colspan="2">Description</th>
                    </tr>
                    <asp:PlaceHolder id="itemPlaceholder" runat="server" />
                </table>
            </LayoutTemplate>

            <ItemTemplate>
                <tr ondblclick="updateRow(<%#Eval("formatID") %>, '<%#Eval("reference") %>', '<%#Eval("description ") %>', '<%#Eval("bgColor") %>', '<%#Eval("textColor") %>', '<%#Eval("combination") %>', '<%#Eval("portion1") %>', '<%#Eval("portion2") %>', '<%#Eval("costSecond") %>', '<%#Eval("favoriteCode") %>') ;
                                $('#tab2').addClass('active');
                                $('#tab2Ref').addClass('active');

                                $('#tab1').removeClass('active');
                                $('#tab1Ref').removeClass('active');
                                $('#tab2Ref a').html('Edit / Update');
                ">
                    <td>
                        <asp:Label ID="lblFormatID" runat="Server" Text='<%#Eval("formatID") %>' />
                    </td>

                    <td>
                        <asp:Label ID="lblDescription" runat="Server" Text='<%#Eval("description") %>' />
                    </td>

                    <td class="btn btn-danger btn-mini"  onmouseup="deleteRow(<%#Eval("formatID") %>)" style="cursor:pointer"></td>
                </tr>
            </ItemTemplate>
        </asp:ListView>
                    
                     <div class="pagination">
                        <asp:DataPager ID="DataPager" runat="server" PagedControlID="lstvFormat" 
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
                
                <form class="navbar-form pull-left" id="formatForm" action="format.aspx">

                    

                    <div id="format" class="row-fluid">
                        <div class="span6">
                            <table>
                    <tr>
                        <td><label>Format ID</label></td>
                        <td><asp:TextBox id="nextID" runat="server" class="span2" ReadOnly="true" ></asp:TextBox></td>
                    </tr>

                    <tr>
                        <td><label>Reference</label></td>
                        <td><input id="reference" type="text" placeholder="Reference" class="span2" /></td>
                    </tr>

                    <tr>
                        <td><label>Description</label></td>
                        <td>
                            <input id="description" type="text" placeholder="Description" class="span2" />
                            <div class="astericks">*</div>
                        </td>
                    </tr>

                    <tr>
                        <td><label>Combination</label></td>
                        <td><input id="combination" type="text" placeholder="Combination" class="span2" /></td>
                    </tr>

                    <tr>
                        <td><label>Portion1</label></td>
                        <td><input id="portion1" type="text" placeholder="Portion1" class="span2" /></td>
                    </tr>

                    <tr>
                        <td><label>Portion2</label></td>
                        <td><input id="portion2" type="text" placeholder="Portion2" class="span2" /></td>
                    </tr>

                    <tr>
                        <td><label>Approx cost of Portion2</label></td>
                        <td><input id="costSecond" type="text" placeholder="Approx cost of Portion2" class="span2" /></td>
                    </tr>

                    <tr>
                        <td><label>Favorite Code</label></td>
                        <td><input id="favoriteCode" type="text" placeholder="Favorite Code" class="span2" /></td>
                    </tr>

                                     
                                   <!-- Item Name -->
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

                    <div class="astericsMsg">* indicates required field</div>
                </form>

            </div>
            </div>
        </div>      

        </div>
        </div>        
        
       
        

        
</asp:Content>



