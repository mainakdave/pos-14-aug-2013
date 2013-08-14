<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="employee.aspx.cs" Inherits="POS.views.employee" MasterPageFile="~/views/masterPage.Master" %>

<%@ Register src="~/piczardUserControls/simpleImageUploadUserControl/SimpleImageUpload.ascx" tagname="SimpleImageUpload" tagprefix="ccPiczardUC" %>




<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">

    <script type="text/javascript">

        var IU = 'I';
        var ID = -1;
        var isDelete = false;

        $(document).ready(function () {

            $( "#birthdate" ).datepicker();
            $( "#anniversary" ).datepicker();

            //$("#dataRows tr").first().remove();

            $("#collapseOne").addClass("in");
            $("#collapseTwo").removeClass("in");
            $("#collapseThree").removeClass("in");

            $("#menu .nav li").removeClass("active");
            $("#menu .nav li#employee").addClass("active");



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

                var lockedVal = "0";
                if ($("#<%=locked.ClientID %>").prop("checked")) isStockItemVal = "1";

                var activeVal = "0";
                if ($("#<%=active.ClientID %>").prop("checked")) discontinueVal = "1";

                if (window.IU == 'I') {
                    
                    $.post("../Ajax/employee.aspx",
                        {
                            userName:$("#userName").val(),
                            displayName:$("#displayName").val(),
                            firstName:$("#firstName").val(),
                            lastName:$("#lastName").val(),
                            employeeLevel:$("#<%= employeeLevel.ClientID %>").val(),
                            salesPassword:$("#salesPassword").val(),
                            clockinPassword: $("#clockinPassword").val(),
                            employeeRole: $("#<%= employeeRole.ClientID %>").val(),
                            locked: lockedVal,
                            active: activeVal,
                            
                            organization:$("#organization").val(),
                            pobox:$("#pobox").val(),
                            addr1:$("#addr1").val(),
                            addr2:$("#addr2").val(),
                            city:$("#city").val(),
                            state:$("#state").val(),
                            country:$("#country").val(),
                            landline:$("#landline").val(),
                            mobile1:$("#mobile1").val(),
                            mobile2:$("#mobile2").val(),
                            birthdate:$("#birthdate").val(),
                            anniversary:$("#anniversary").val(),
                            wife:$("#wife").val(),
                            child1:$("#child1").val(),
                            child2:$("#child2").val(),

                            emailID:$("#emailID").val(),
                            mailServerID:$("#mailServerID").val(),
                            emailUserName:$("#emailUserName").val(),
                            emailPassword: $("#emailPassword").val(),

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
                    

                    $.post("../Ajax/employee.aspx",
                        {
                            employeeID: window.ID,
                            
                            userName:$("#userName").val(),
                            displayName:$("#displayName").val(),
                            firstName:$("#firstName").val(),
                            lastName:$("#lastName").val(),
                            employeeLevel:$("#<%= employeeLevel.ClientID %>").val(),
                            salesPassword:$("#salesPassword").val(),
                            clockinPassword: $("#clockinPassword").val(),
                            employeeRole: $("#<%= employeeRole.ClientID %>").val(),
                            locked: lockedVal,
                            active: activeVal,
                            
                            organization:$("#organization").val(),
                            pobox:$("#pobox").val(),
                            addr1:$("#addr1").val(),
                            addr2:$("#addr2").val(),
                            city:$("#city").val(),
                            state:$("#state").val(),
                            country:$("#country").val(),
                            landline:$("#landline").val(),
                            mobile1:$("#mobile1").val(),
                            mobile2:$("#mobile2").val(),
                            birthdate:$("#birthdate").val(),
                            anniversary:$("#anniversary").val(),
                            wife:$("#wife").val(),
                            child1:$("#child1").val(),
                            child2:$("#child2").val(),

                            emailID:$("#emailID").val(),
                            mailServerID:$("#mailServerID").val(),
                            emailUserName:$("#emailUserName").val(),
                            emailPassword:$("#emailPassword").val(),

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


        function updateRow(id, userName, displayName, firstName, lastName, employeeLevel, salesPassword, clockinPassword, employeeRole, locked, active, language, location, organization, pobox, addr1, addr2, city, state, country, landline, mobile1, mobile2, birthdate, anniversary, wife, child1, child2, emailID, mailServerID, emailUserName, emailPassword) {
            if (!window.isDelete) {
                //alert(id);
                //$("#deptName").val(id);
                window.IU = 'U';
                window.ID = id;



                $("#userName").val(userName);
                $("#displayName").val(displayName);
                $("#firstName").val(firstName);
                $("#lastName").val(lastName);
                $("#<%= employeeLevel.ClientID %>").val(employeeLevel);
                $("#salesPassword").val(salesPassword);
                $("#clockinPassword").val(clockinPassword);
                $("#<%= employeeRole.ClientID %>").val(employeeRole);

                if (locked == 1 || locked == '1') { $("#<%=locked.ClientID %>").prop("checked", true); }
                if (active == 1 || active == '1') { $("#<%=active.ClientID %>").prop("checked", true); }

                $("#language").val(language);
                $("#location").val(location);
                //PageMethods.updateRow(id);

                $("#ctl00_MainContent_ImageUploader_imgPreview").load();

                src = $("#ctl00_MainContent_ImageUploader_imgPreview").attr("src");
                src = "../uploadedImg/employee/" + id + ".jpg";
                $("#ctl00_MainContent_ImageUploader_imgPreview").attr("src", src);
                $("#ctl00_MainContent_ImageUploader_imgPreview").css("height", "auto");
                $("#ctl00_MainContent_ImageUploader_imgPreview").css("width", "auto");


                $("#organization").val(organization);
                $("#pobox").val(pobox);
                $("#addr1").val(addr1);
                $("#addr2").val(addr2);
                $("#city").val(city);
                $("#state").val(state);
                $("#country").val(country);
                $("#landline").val(landline);
                $("#mobile1").val(mobile1);
                $("#mobile2").val(mobile2);
                $("#birthdate").val(birthdate);
                $("#anniversary").val(anniversary);
                $("#wife").val(wife);
                $("#child1").val(child1);
                $("#child2").val(child2);
                $("#emailID").val(emailID);
                $("#mailServerID").val(mailServerID);
                $("#emailUserName").val(emailUserName);
                $("#emailPassword").val(emailPassword);


                $("#<%= nextID.ClientID %>").val(id);

                
                
                //args = id + "," + deptName + "," + description
                //__doPostBack("id", id);
                //return false;
            }
        }


        function deleteRow(id) {
            window.isDelete = true;

            if (confirm('Sure To Delete?')) {
                $.post("../Ajax/employee.aspx",
                    {
                        employeeID: id,
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

    <div id="breadCrum"><h1>Master > Employee</h1></div>

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
                            <asp:ListItem Value="employeeName" Text="Employee Name"></asp:ListItem>
                            <asp:ListItem Value="employeeID" Text="Employee ID"></asp:ListItem>
                        </asp:DropDownList>
                        
                        <asp:TextBox id="searchText" class="searchText" runat="server" AutoPostBack="false" placeholder="search keyword..."  onkeyup="searchKeyword(this.value);" ></asp:TextBox>

                        <label id="clearSearch" title="Clear Search" onclick="clearSearch();">Clear Search</label>
                    </div>

                    <!-- <asp:Panel ID="Panel1" ScrollBars="Vertical" Height="300" runat="server"> -->
                        <asp:ListView ID="lstvEmployee" runat="server">
            <LayoutTemplate >
                <!-- <label style="background:#00ffff; font-size:medium; padding:10px 7px;">Department Name List</label> -->

                <table class="table table-condensed" id="dataRows">
                    <tr>
                        <th>Employee ID</th>
                        <th colspan="2">Employee Name</th>
                    </tr>
                    <asp:PlaceHolder id="itemPlaceholder" runat="server" />
                </table>
            </LayoutTemplate>

            <ItemTemplate>
             

                <asp:PlaceHolder id="itemPlaceholder" runat="server" />
                <tr ondblclick="updateRow(<%#Eval("employeeID") %>, '<%#Eval("userName") %>', '<%#Eval("displayName") %>', '<%#Eval("firstName") %>', '<%#Eval("lastName") %>', <%#Eval("employeeLevel") %>, '<%#Eval("sp") %>', '<%#Eval("cp") %>', <%# Eval("employeeRole") %>, <%# Eval("locked") %>, <%# Eval("active") %>, '<%# Eval("language") %>', '<%# Eval("location") %>', '<%# Eval("organization") %>', '<%# Eval("pobox") %>', '<%# Eval("addr1") %>', '<%# Eval("addr2") %>', '<%# Eval("city") %>', '<%# Eval("state") %>', '<%# Eval("country") %>', '<%# Eval("landline") %>', '<%# Eval("mobile1") %>', '<%# Eval("mobile2") %>', '<%# Eval("birthdate") %>', '<%# Eval("anniversary") %>', '<%# Eval("wife") %>', '<%# Eval("child1") %>', '<%# Eval("child2") %>', '<%# Eval("emailID") %>', '<%# Eval("mailServerID") %>', '<%# Eval("emailUserName") %>', '<%# Eval("ep") %>') ;
                                $('#tab2').addClass('active');
                                $('#tab2Ref').addClass('active');

                                $('#tab1').removeClass('active');
                                $('#tab1Ref').removeClass('active');
                                $('#tab2Ref a').html('Edit / Update');

                ">
                    <td>
                        <asp:Label ID="lblEmployeeID" runat="Server" Text='<%#Eval("employeeID") %>' />
                    </td>

                    <td>
                        <asp:Label ID="lblEmployeeName" runat="Server" Text='<%#Eval("userName") %>' />
                    </td>

                    <td class="btn btn-danger btn-mini"  onmouseup="deleteRow(<%#Eval("employeeID") %>)" style="cursor:pointer"></td>
                </tr>
            </ItemTemplate>
        </asp:ListView>
                        
                       

                    <!-- </asp:Panel> -->


                    <div class="pagination">
                        <asp:DataPager ID="DataPager" runat="server" PagedControlID="lstvEmployee" 
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


                

                    <form class="navbar-form pull-left" id="employeeForm" action="employee.aspx">

                     

                   <div id="employee" class="row-fluid">

                    <div class="tabbable"> <!-- Only required for left/right tabs -->
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#tabOp1" data-toggle="tab">General</a></li>
                            <li><a href="#tabOp2" data-toggle="tab">Address</a></li>
                            <li><a href="#tabOp3" data-toggle="tab">Email</a></li>
                        </ul>

                        <div class="tab-content">
                        <div class="tab-pane active row-fluid" id="tabOp1">
                            <div class="span6">
                        <table>
                    <tr>
                        <td><label>Employee ID</label></td>
                        <td><asp:TextBox id="nextID" runat="server" class="span2" ReadOnly="true" ></asp:TextBox></td>
                    </tr>

                    <tr>
                        <td><label>User Name</label></td>
                        <td>
                            <input id="userName" type="text" placeholder="User Name" class="span2"  />
                            <div class="astericks">*</div>
                        </td>
                    </tr>

                    <tr>
                        <td><label>Display Name</label></td>
                        <td>
                            <input id="displayName" type="text" placeholder="Display Name" class="span2" />
                            <div class="astericks">*</div>
                        </td>
                    </tr>

                    

                    <tr>
                        <td><label>First Name</label></td>
                        <td><input id="firstName" type="text" placeholder="First Name" class="span2" /></td>
                    </tr>

                    <tr>
                        <td><label>Last Name</label></td>
                        <td><input id="lastName" type="text" placeholder="Last Name" class="span2" /></td>
                    </tr>

                    <tr>
                        <td><label>Employee Level</label></td>
                        <td>
                            <asp:DropDownList id="employeeLevel" runat="server" AutoPostBack="false">
                                <asp:ListItem Value="1" Text="Level1"></asp:ListItem>
                                <asp:ListItem Value="2" Text="Level2"></asp:ListItem>
                            </asp:DropDownList>
                            <div class="astericks">*</div>
                        </td>
                    </tr>

                    <tr>
                        <td><label>Sales Password</label></td>
                        <td><input id="salesPassword" type="password" placeholder="Sales Password" class="span2" /></td>
                    </tr>

                    <tr>
                        <td><label>Clockin Password</label></td>
                        <td><input id="clockinPassword" type="password" placeholder="Clockin Password" class="span2" /></td>
                    </tr>

                    <tr>
                        <td><label>Employee Role</label></td>
                        <td>
                            <asp:DropDownList id="employeeRole" runat="server" AutoPostBack="false">
                                <asp:ListItem Value="1" Text="Role1"></asp:ListItem>
                                <asp:ListItem Value="2" Text="Role2"></asp:ListItem>
                            </asp:DropDownList>
                            <div class="astericks">*</div>
                        </td>
                    </tr>
                    

                            <!-- Item Name -->
                </table>
                    </div>

                            <div class="span6">
                        <table>
                            <tr>
                                <td><label>Locked</label></td>
                                <td><asp:checkbox runat="server" id="locked"  class="span2" ></asp:checkbox></td>
                            </tr>

                            <tr>
                                <td><label>Active</label></td>
                                <td><asp:checkbox runat="server" id="active"  class="span2" ></asp:checkbox></td>
                            </tr>

                            <tr>
                        <td><label>Photo</label></td>
                        <td>

                                      


                             <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Always">
                                <ContentTemplate>
                             
                                <div class="pageContainer">  
                           
                                    <ccPiczardUC:SimpleImageUpload ID="ImageUploader" runat="server" 
                                        Width="500px"
                                        AutoOpenImageEditPopupAfterUpload="true"
                                        Culture="en" 
                                     EnableEdit="False" Text_BrowseButton=" " Text_RemoveButton=" " 
                                        Text_CancelUploadButton="Cancel" />
                
                
                                </div>
                            
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            
                        </td>
                    </tr>

                    <tr>
                        <td><label>Language</label></td>
                        <td><input id="language" type="text" placeholder="Language" class="span2" /></td>
                    </tr>

                    <tr>
                        <td><label>Location</label></td>
                        <td><input id="location" type="text" placeholder="Location" class="span2" /></td>
                    </tr>

                        </table>
                    </div>
                        </div>

                        <div class="tab-pane" id="tabOp2">
                            <div class="span6">
                        <table>
                    

                    <tr>
                        <td><label>Organization</label></td>
                        <td>
                            <input id="organization" type="text" placeholder="Organization" class="span2"  />
                        </td>
                    </tr>

                    <tr>
                        <td><label>P.O.Box</label></td>
                        <td>
                            <input id="pobox" type="text" placeholder="P.O.Box" class="span2" />
                        </td>
                    </tr>

                    

                    <tr>
                        <td><label>Address 1</label></td>
                        <td><input id="addr1" type="text" placeholder="Address1" class="span2" /></td>
                    </tr>

                    <tr>
                        <td><label>Address 2</label></td>
                        <td><input id="addr2" type="text" placeholder="Address2" class="span2" /></td>
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
                    </tr>

                    

                            <!-- Item Name -->
                </table>
                    </div>

                            <div class="span6">
                        <table>
                            <tr>
                                <td><label>Landline</label></td>
                                <td><input id="landline" type="text" placeholder="Landline" class="span2" /></td>
                            </tr>

                            <tr>
                                <td><label>Mobile1</label></td>
                                <td><input id="mobile1" type="text" placeholder="Mobile1" class="span2" /></td>
                            </tr>

                            <tr>
                                <td><label>Mobile2</label></td>
                                <td><input id="mobile2" type="text" placeholder="Mobile2" class="span2" /></td>
                            </tr>

                            <tr>
                                <td><label>Birthdate</label></td>
                                <td><input id="birthdate" type="text" placeholder="Birthdate" class="span2" /></td>
                            </tr>

                            <tr>
                                <td><label>Anniversary</label></td>
                                <td><input id="anniversary" type="text" placeholder="Anniversary" class="span2" /></td>
                            </tr>

                            <tr>
                                <td><label>Wife</label></td>
                                <td><input id="wife" type="text" placeholder="Wife" class="span2" /></td>
                            </tr>

                            <tr>
                                <td><label>Child1</label></td>
                                <td><input id="child1" type="text" placeholder="Child1" class="span2" /></td>
                            </tr>

                            <tr>
                                <td><label>Child2</label></td>
                                <td><input id="child2" type="text" placeholder="Child2" class="span2" /></td>
                            </tr>
                            

                        </table>
                    </div>
                        </div>

                        <div class="tab-pane" id="tabOp3">
                            <div class="span6">
                        <table>
                    

                    <tr>
                        <td><label>Email ID</label></td>
                        <td>
                            <input id="emailID" type="text" placeholder="Email ID" class="span2"  />
                        </td>
                    </tr>

                    <tr>
                        <td><label>Mail Server ID</label></td>
                        <td>
                            <input id="mailServerID" type="text" placeholder="Mail Server ID" class="span2" />
                        </td>
                    </tr>

                    

                    <tr>
                        <td><label>Email User Name</label></td>
                        <td><input id="emailUserName" type="text" placeholder="Email User Name" class="span2" /></td>
                    </tr>

                    <tr>
                        <td><label>Email Password</label></td>
                        <td><input id="emailPassword" type="password" placeholder="Email Password" class="span2" /></td>
                    </tr>

                    

                            <!-- Item Name -->
                </table>
                    </div>

                            <div class="span6">
                        <table>
                            

                            
                        </table>
                    </div>
                        </div>
                        <//div>
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
