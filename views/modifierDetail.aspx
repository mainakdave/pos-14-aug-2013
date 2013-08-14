<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="modifierDetail.aspx.cs" Inherits="POS.views.modifierDetail" MasterPageFile="~/views/masterPage.Master" %>


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
            $("#menu .nav li#modifierDetail").addClass("active");

            
            // positioning alertBox
            $("#alertBox").css("top", $(window).outerHeight() / 2);
            $("#alertBox").css("left", $(window).outerWidth() / 2);


            $("#btnCancel").click(function () {
                clearAllElements();
                return false;
            });



            $("#submit").click(function () {

                if ($("#<%=isItem.ClientID %>").prop("checked")) { isItemVAL = '1'; } else { isItemVAL = '0'; }


                if (window.IU == 'I') {
                    $.post("../Ajax/modifierDetail.aspx",
                        {
                            modifierID: $("#<%=modifierDrplst.ClientID %>").val(),
                            itemID: $("#<%=itemDrplst.ClientID %>").val(),
                            isItem: isItemVAL,
                            portion: $("#portion").val(),
                            priceChange: $("#priceChange").val(),
                            position: $("#position").val(),
                            formatID: $("#formatID").val(),

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


                    $.post("../Ajax/modifierDetail.aspx",
                        {
                            ID: window.ID,

                            modifierID: $("#<%=modifierDrplst.ClientID %>").val(),
                            itemID: $("#<%=itemDrplst.ClientID %>").val(),
                            isItem: isItemVAL,
                            portion: $("#portion").val(),
                            priceChange: $("#priceChange").val(),
                            position: $("#position").val(),
                            formatID: $("#formatID").val(),

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


        function updateRow(id, modifierID, itemID, isItem, portion, priceChange, position, formatID) {
            if (!window.isDelete) {
                window.IU = 'U';
                window.ID = id;

                $("#<%=modifierDrplst.ClientID %>").val(modifierID);
                $("#<%=itemDrplst.ClientID %>").val(itemID);
                if (isItem == 1 || isItem == '1') { $("#<%=isItem.ClientID %>").prop("checked", true); }
                $("#portion").val(portion);
                $("#priceChange").val(priceChange);
                $("#position").val(position);
                $("#formatID").val(formatID);
            }
        }


        function deleteRow(id) {
            window.isDelete = true;

            if (confirm('Sure To Delete?')) {
                $.post("../Ajax/modifierDetail.aspx",
                    {
                        ID: id,
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

                 
        <div class="tabbable">
          <ul class="nav nav-tabs">
             <li id="tab1Ref" class="active"><a href="#tab1" data-toggle="tab">List</a></li>
             <li id="tab2Ref"><a href="#tab2" data-toggle="tab">Create New</a></li>
          </ul>
          <div class="tab-content">
            <div class="tab-pane active" id="tab1">
              
              <asp:ScriptManager runat="server" ID="ScriptManager1" EnablePageMethods="true" EnablePartialRendering="true">
                            </asp:ScriptManager>  

              <asp:UpdatePanel runat="server" ID="UpdatePanel2" UpdateMode="Always">
                <ContentTemplate>

                    <div id="searchArea">
                        <asp:DropDownList id="searchBy" runat="server" AutoPostBack="false">
                            <asp:ListItem Value="-1" Text="Select Search By"></asp:ListItem>
                            <asp:ListItem Value="ID" Text="ID"></asp:ListItem>
                            <asp:ListItem Value="modifierID" Text="Modifier ID"></asp:ListItem>
                        </asp:DropDownList>
                        
                        <asp:TextBox id="searchText" class="searchText" runat="server" AutoPostBack="false" placeholder="search keyword..."  onkeyup="searchKeyword(this.value);" ></asp:TextBox>

                        <label id="clearSearch" title="Clear Search" onclick="clearSearch();">Clear Search</label>
                    </div>

                    <asp:ListView ID="lstvModifierDetail" runat="server" >
            <LayoutTemplate >
                <table class="table table-condensed" id="dataRows">
                    <tr>
                        <th>ID</th>
                        <th>Modifier ID</th>
                    </tr>
                    <asp:PlaceHolder id="itemPlaceholder" runat="server" />
                </table>
            </LayoutTemplate>

            <ItemTemplate>
                <tr ondblclick="updateRow(<%#Eval("id") %>, <%#Eval("modifierID") %>, <%#Eval("itemID") %>, '<%#Eval("isItem") %>', <%#Eval("portion") %>, <%#Eval("priceChange") %>, <%#Eval("position") %>, <%#Eval("formatID") %>);
                                $('#tab2').addClass('active');
                                $('#tab2Ref').addClass('active');

                                $('#tab1').removeClass('active');
                                $('#tab1Ref').removeClass('active');
                                $('#tab2Ref a').html('Edit / Update');
                ">
                    <td>
                        <asp:Label ID="lblID" runat="Server" Text='<%#Eval("id") %>' />
                    </td>

                    <td>
                        <asp:Label ID="lblModifierID" runat="Server" Text='<%#Eval("modifierID") %>' />
                    </td>

                    <td class="btn btn-danger btn-mini"  onmouseup="deleteRow(<%#Eval("id") %>)" style="cursor:pointer"></td>
                </tr>
            </ItemTemplate>
        </asp:ListView>
                    
                    <div class="pagination">
                        <asp:DataPager ID="DataPager" runat="server" PagedControlID="lstvModifierDetail" 
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
              
              <form class="navbar-form pull-left" id="modifierDetailForm" action="modifierDetail.aspx">

                    
                    <div id="modifierDetail">
                <table>
                    <tr>
                        <td><label>Modifier Detail ID</label></td>
                        <td><asp:TextBox id="nextID" runat="server" class="span2" ReadOnly="true" ></asp:TextBox></td>
                    </tr>

                    <tr>
                        <td><label>Modifier</label></td>
                        <td><asp:DropDownList ID="modifierDrplst" runat="server"></asp:DropDownList></td>
                    </tr>

                    <tr>
                        <td><label>Item</label></td>
                        <td><asp:DropDownList ID="itemDrplst" runat="server"></asp:DropDownList></td>
                    </tr>

                    <tr>
                        <td><label>Is Item</label></td>
                        <td><asp:CheckBox ID="isItem" runat="server" class="span2" /></td>
                    </tr>

                    <tr>
                        <td><label>Portion</label></td>
                        <td><input id="portion" type="text" placeholder="Portion" class="span2" /></td>
                    </tr>

                    <tr>
                        <td><label>Price Change</label></td>
                        <td><input id="priceChange" type="text" placeholder="Price Change" class="span2" /></td>
                    </tr>

                    <tr>
                        <td><label>Position</label></td>
                        <td><input id="position" type="text" placeholder="Position" class="span2" /></td>
                    </tr>

                    <tr>
                        <td><label>Format ID</label></td>
                        <td><input id="formatID" type="text" placeholder="Format ID" class="span2" /></td>
                    </tr>
                    
                    <tr>
                        <td></td>
                        <td>
                            <div id="submit" class="btn" >Submit</div>
                            <asp:Button ID="Button1" runat="server" class="btn" Text="Button" Visible="false"/>
                            <div id="btnCancel" class="btn" >Cancel</div>
                        </td>
                    </tr>                  
                                   <!-- Item Name -->
                </table>
            
                 
            
                

                
            
                <!-- Item Image -->
           </div>

                </form>

            </div>
          </div>
        </div>
       
                


        
       
        

        
</asp:Content>
