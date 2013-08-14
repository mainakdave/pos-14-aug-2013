<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="modifierMaster.aspx.cs" Inherits="POS.views.modifierMaster" MasterPageFile="~/views/masterPage.Master" %>


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
            $("#menu .nav li#modifierMaster").addClass("active");

            // positioning alertBox
            $("#alertBox").css("top", $(window).outerHeight() / 2);
            $("#alertBox").css("left", $(window).outerWidth() / 2);


            $("#btnCancel").click(function () {
                clearAllElements();
                return false;
            });



            $("#submit").click(function () {

                

                if ($("#<%=divisible.ClientID %>").prop("checked")) { divisibleVAL = '1'; } else { divisibleVAL = '0'; }


                if (window.IU == 'I') {
                    $.post("../Ajax/modifierMaster.aspx",
                        {
                            reference: $("#reference").val(),
                            description: $("#description").val(),
                            divisible: divisibleVAL,
                            comment: $("#comment1").val(),

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


                    $.post("../Ajax/modifierMaster.aspx",
                        {
                            modifierID: window.ID,

                            reference: $("#reference").val(),
                            description: $("#description").val(),
                            divisible: divisibleVAL,
                            comment: $("#comment1").val(),

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


        function updateRow(id, reference, description, divisible, comment) {
            if (!window.isDelete) {
                window.IU = 'U';
                window.ID = id;

                $("#reference").val(reference);
                $("#description").val(description);
                if (divisible == 1 || divisible == '1') { $("#<%=divisible.ClientID %>").prop("checked", true); }
                $("#comment1").val(comment);
            }
        }


        function deleteRow(id) {
            window.isDelete = true;

            if (confirm('Sure To Delete?')) {
                $.post("../Ajax/modifierMaster.aspx",
                    {
                        modifierID: id,
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

    <div id="breadCrum"><h1>Master > Modifier</h1></div> 
        
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
                            <asp:ListItem Value="reference" Text="Reference"></asp:ListItem>
                            <asp:ListItem Value="modifierID" Text="Modifier ID"></asp:ListItem>
                        </asp:DropDownList>
                        
                        <asp:TextBox id="searchText" class="searchText" runat="server" AutoPostBack="false" placeholder="search keyword..."  onkeyup="searchKeyword(this.value);" ></asp:TextBox>

                        <label id="clearSearch" title="Clear Search" onclick="clearSearch();">Clear Search</label>
                    </div>

                    <asp:ListView ID="lstvModifierMaster" runat="server" >
            <LayoutTemplate >
                <table class="table table-condensed" id="dataRows">
                    <tr>
                        <th>Modifier ID</th>
                        <th colspan="2">Reference</th>
                    </tr>
                    <asp:PlaceHolder id="itemPlaceholder" runat="server" />
                </table>
            </LayoutTemplate>

            <ItemTemplate>
                <tr ondblclick="updateRow(<%#Eval("modifierID") %>, '<%#Eval("reference") %>', '<%#Eval("description") %>', '<%#Eval("divisible") %>', '<%#Eval("comment") %>');
                                $('#tab2').addClass('active');
                                $('#tab2Ref').addClass('active');

                                $('#tab1').removeClass('active');
                                $('#tab1Ref').removeClass('active');
                                $('#tab2Ref a').html('Edit / Update');
                ">
                    <td>
                        <asp:Label ID="lblModifierID" runat="Server" Text='<%#Eval("modifierID") %>' />
                    </td>

                    <td>
                        <asp:Label ID="lblReference" runat="Server" Text='<%#Eval("reference") %>' />
                    </td>

                    <td class="btn btn-danger btn-mini"  onmouseup="deleteRow(<%#Eval("modifierID") %>)" style="cursor:pointer"></td>
                </tr>
            </ItemTemplate>
        </asp:ListView>
                    
                    
                    <div class="pagination">
                        <asp:DataPager ID="DataPager" runat="server" PagedControlID="lstvModifierMaster" 
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
              
              <form class="navbar-form pull-left" id="modifierMasterForm" action="modifierMaster.aspx">

                    <div id="modifierMaster">
                <table>
                    <tr>
                        <td><label>Modifier Master ID</label></td>
                        <td><asp:TextBox id="nextID" runat="server" class="span2" ReadOnly="true" ></asp:TextBox></td>
                    </tr>

                    <tr>
                        <td><label>Reference</label></td>
                        <td><input id="reference" type="text" placeholder="Reference" class="span2" /></td>
                    </tr>

                    <tr>
                        <td><label>Description</label></td>
                        <td><input id="description" type="text" placeholder="Description" class="span2" /></td>
                    </tr>

                    <tr>
                        <td><label>Divisible</label></td>
                        <td><asp:CheckBox ID="divisible" runat="server" class="span2" /></td>
                    </tr>

                    <tr>
                        <td><label>Comment</label></td>
                        <td><input id="comment1" type="text" placeholder="Comment" class="span2" /></td>
                    </tr>

                    
                                      
                                   <!-- Item Name -->
                </table>
            
                 
            
                

                
            
                <!-- Item Image -->
           </div>

                </form>

            </div>
          </div>
        </div>
       
        </div>
        </div>       


        
       
        

        
</asp:Content>
