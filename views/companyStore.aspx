<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="companyStore.aspx.cs" Inherits="POS.views.companyStore" MasterPageFile="~/views/masterPage.Master" %>

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
            $("#menu .nav li#companyStore").addClass("active");



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

                    $.post("../Ajax/companyStore.aspx",
                        {
                            companyID: $('#<%=companyDrplst.ClientID %>').val(),
                            name: $("#name").val(),
                            address1: $("#address1").val(),
                            address2: $("#address2").val(),
                            city: $("#city").val(),
                            state: $("#state").val(),
                            country: $("#country").val(),
                            zipcode: $("#zipcode").val(),
                            region: $("#region").val(),
                            officePhone: $("#officePhone").val(),
                            officeFax: $("#officeFax").val(),
                            taxtID: $("#taxtID").val(),
                            logo: "",
                            salesEmail: $("#salesEmail").val(),
                            supportEmail: $("#supportEmail").val(),
                            contactUsEmail: $("#contactUsEmail").val(),

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

                    $.post("../Ajax/companyStore.aspx",
                        {
                            storeID: window.ID,
                            companyID: $('#<%=companyDrplst.ClientID %>').val(),
                            name: $("#name").val(),
                            address1: $("#address1").val(),
                            address2: $("#address2").val(),
                            city: $("#city").val(),
                            state: $("#state").val(),
                            country: $("#country").val(),
                            zipcode: $("#zipcode").val(),
                            region: $("#region").val(),
                            officePhone: $("#officePhone").val(),
                            officeFax: $("#officeFax").val(),
                            taxtID: $("#taxtID").val(),
                            logo: "",
                            salesEmail: $("#salesEmail").val(),
                            supportEmail: $("#supportEmail").val(),
                            contactUsEmail: $("#contactUsEmail").val(),

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


        function updateRow(id, companyID, name, address1, address2, city, state, country, zipcode, region, officePhone, officeFax, taxtID, salesEmail, supportEmail, contactUsEmail) {

            if (!window.isDelete) {
                //alert(id);
                //$("#deptName").val(id);
                window.IU = 'U';
                window.ID = id;


                $('#<%=companyDrplst.ClientID %>').val(companyID),
                $("#name").val(name);
                $("#address1").val(address1);
                $("#address2").val(address2);
                $("#city").val(city);
                $("#state").val(state);
                $("#country").val(country);
                $("#zipcode").val(zipcode);
                $("#region").val(region);
                $("#officePhone").val(officePhone);
                $("#officeFax").val(officeFax);
                $("#taxtID").val(taxtID);
                $("#salesEmail").val(salesEmail);
                $("#supportEmail").val(supportEmail);
                $("#contactUsEmail").val(contactUsEmail);

                //PageMethods.updateRow(id);

                $("#ctl00_MainContent_ImageUploader_imgPreview").load();

                src = $("#ctl00_MainContent_ImageUploader_imgPreview").attr("src");
                src = "../uploadedImg/companyStore/" + id + ".jpg";
                $("#ctl00_MainContent_ImageUploader_imgPreview").attr("src", src);
                $("#ctl00_MainContent_ImageUploader_imgPreview").css("height", "auto");
                $("#ctl00_MainContent_ImageUploader_imgPreview").css("width", "auto");

                $("#<%= nextID.ClientID %>").val(id);

                //args = id + "," + deptName + "," + description
                //__doPostBack("id", id);
                //return false;


                //alert(CodeCarvings.Wcs.Piczard.Upload.SimpleImageUpload.get_hasImage("<% =CodeCarvings.Piczard.Web.Helpers.JSHelper.EncodeString(this.ImageUploader.ClientID) %>"));
            }
        }


        function deleteRow(id) {
            window.isDelete = true;

            if (confirm('Sure To Delete?')) {
                $.post("../Ajax/companyStore.aspx",
                    {
                        storeID: id,
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

            src = "../uploadedImg/" + "dummy" + ".jpg";
            $("#ctl00_MainContent_ImageUploader_imgPreview").attr("src", src);
            $("#ctl00_MainContent_ImageUploader_imgPreview").css("height", "auto");
            $("#ctl00_MainContent_ImageUploader_imgPreview").css("width", "auto");

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

    <div id="breadCrum"><h1>Master > Company Store</h1></div>

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
                            <asp:ListItem Value="storeName" Text="Store Name"></asp:ListItem>
                            <asp:ListItem Value="storeID" Text="Store ID"></asp:ListItem>
                        </asp:DropDownList>
                        
                        <asp:TextBox id="searchText" class="searchText" runat="server" AutoPostBack="false" placeholder="search keyword..."  onkeyup="searchKeyword(this.value);" ></asp:TextBox>

                        <label id="clearSearch" title="Clear Search" onclick="clearSearch();">Clear Search</label>
                    </div>

                    <!-- <asp:Panel ID="Panel1" ScrollBars="Vertical" Height="300" runat="server"> -->
                        <asp:ListView ID="lstvStore" runat="server">
            <LayoutTemplate >
                <!-- <label style="background:#00ffff; font-size:medium; padding:10px 7px;">Department Name List</label> -->

                <table class="table table-condensed" id="dataRows">
                    <tr>
                        <th>Store ID</th>
                        <th colspan="2">Store Name</th>
                    </tr>
                    <asp:PlaceHolder id="itemPlaceholder" runat="server" />
                </table>
            </LayoutTemplate>

            <ItemTemplate>
             

                <asp:PlaceHolder id="itemPlaceholder" runat="server" />
                <tr ondblclick="updateRow(<%#Eval("storeID") %>, <%#Eval("companyID") %>, '<%#Eval("name") %>', '<%#Eval("address1") %>', '<%#Eval("address2") %>', '<%#Eval("city") %>', '<%#Eval("state") %>', '<%#Eval("country") %>', '<%#Eval("zipcode") %>', '<%#Eval("region") %>', '<%#Eval("officePhone") %>', '<%#Eval("officeFax") %>', '<%#Eval("taxtID") %>') ;
                                $('#tab2').addClass('active');
                                $('#tab2Ref').addClass('active');

                                $('#tab1').removeClass('active');
                                $('#tab1Ref').removeClass('active');
                                $('#tab2Ref a').html('Edit / Update');
                               
                ">
                    <td>
                        <asp:Label ID="lbStoreID" runat="Server" Text='<%#Eval("storeID") %>' />
                    </td>

                    <td>
                        <asp:Label ID="lbStoreName" runat="Server" Text='<%#Eval("name") %>' />
                    </td>

                    <td class="btn btn-danger btn-mini"  onmouseup="deleteRow(<%#Eval("storeID") %>)" style="cursor:pointer"></td>
                </tr>
            </ItemTemplate>
        </asp:ListView>
                        
                        

                    <!-- </asp:Panel> -->


                    <div class="pagination">
                        <asp:DataPager ID="DataPager" runat="server" PagedControlID="lstvStore" 
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


                

                    <form class="navbar-form pull-left" id="companyStoreForm" action="companyStore.aspx">

                     

                   <div id="companyStore" class="row-fluid">
                    <div class="span6">
                        <table>
                    <tr>
                        <td><label>Company Store ID</label></td>
                        <td><asp:TextBox id="nextID" runat="server" class="span2" ReadOnly="true" ></asp:TextBox></td>
                    </tr>

                    <tr>
                        <td><label>Company name</label></td>
                        <td>
                            <asp:DropDownList ID="companyDrplst" runat="server"></asp:DropDownList>
                            <div class="astericks">*</div>
                        </td>
                    </tr>

                    <tr>
                        <td><label>Company store name</label></td>
                        <td>
                            <input id="name" type="text" placeholder="Company store name" class="span2"  />
                            <div class="astericks">*</div>
                        </td>
                    </tr>

                    <tr>
                        <td><label>Address 1</label></td>
                        <td><input id="address1" type="text" placeholder="Address 1" class="span2" /></td>
                    </tr>

                    

                    <tr>
                        <td><label>Address 2</label></td>
                        <td><input id="address2" type="text" placeholder="Address 2" class="span2" /></td>
                    </tr>

                    <tr>
                        <td><label>City</label></td>
                        <td><input id="city" type="text" placeholder="City" class="span2" /></td>
                    </tr>

                    <tr>
                        <td><label>State</label></td>
                        <td><input id="state" type="text" placeholder="State" class="span2" /></td>
                    </tr>

                    <tr>
                        <td><label>Country</label></td>
                        <td><input id="country" type="text" placeholder="Country" class="span2" /></td>
                    </tr

                    <tr>
                        <td><label>Zipcode</label></td>
                        <td><input id="zipcode" type="text" placeholder="Zipcode" class="span2" /></td>
                    </tr>

                    <tr>
                        <td><label>Region</label></td>
                        <td><input id="region" type="text" placeholder="Region" class="span2" /></td>
                    </tr>

                    

                    <tr>
                        <td><label>Taxt ID</label></td>
                        <td><input id="taxtID" type="text" placeholder="Taxt ID" class="span2" /></td>
                    </tr>

                    <tr>
                        <td><label>Vat ID</label></td>
                        <td><input id="vatID" type="text" placeholder="Vat ID" class="span2" /></td>
                    </tr>
                            <!-- Item Name -->
                </table>
                    </div>

                    <div class="span6">
                        <table>

                            

                            <tr>
                        <td><label>Logo</label></td>
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
                        <td><label>Office Phone</label></td>
                        <td><input id="officePhone" type="text" placeholder="Office Phone" class="span2" /></td>
                    </tr>

                    <tr>
                        <td><label>Office Fax</label></td>
                        <td><input id="officeFax" type="text" placeholder="Office Fax" class="span2" /></td>
                    </tr>

                    
                    <tr>
                        <td><label>Sales Email</label></td>
                        <td><input id="salesEmail" type="text" placeholder="salesEmail" class="span2" /></td>
                    </tr>

                    <tr>
                        <td><label>Support Email</label></td>
                        <td><input id="supportEmail" type="text" placeholder="supportEmail" class="span2" /></td>
                    </tr>

                    <tr>
                        <td><label>Contact Us Email</label></td>
                        <td><input id="contactUsEmail" type="text" placeholder="contactUsEmail" class="span2" /></td>
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
