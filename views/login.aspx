<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="POS.views.login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>


    <!-- Styles -->
	<link rel="stylesheet" href="../css/bootstrap/bootstrap.min.css">
	<link rel="stylesheet" href="../css/bootstrap/bootstrap-responsive.min.css">
	<link rel="stylesheet" href="../css/bootstrap/bootstrap-custom.css">

    <style>
    #headerDiv
    {
        background: #74b042;
        
        border:none;  
    }
    .brand
    {
        color: #fff !important;
    }
    
    #posLogin_RememberMe
    {
        margin:0;
    }
    .rememberMe
    {
        display:inline-block;
        font-style:italic;
    }
    </style>

	<script src="http://code.jquery.com/jquery.js" type="text/javascript"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
    <script src="../Scripts/bootstrap/bootstrap.min.js" type="text/javascript"></script>
    <script src="../Scripts/bootstrap/bootstrapValidation.js" type="text/javascript"></script>

	<script type="text/javascript" src="../Scripts/bootstrap/bootstrap-button.js"></script>
	<script type="text/javascript" src="../Scripts/bootstrap/application.js"></script>

</head>
<body>
    

    <!-- Navbar
    ================================================== -->

	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="navbar-inner" id="headerDiv">
			<div class="container"> 

				<!-- .btn-navbar is used as the toggle for collapsed navbar content -->
				<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</a>

				<a class="brand" href="#">POS</a>
				
			</div>
		</div>
	</div>


    <div id="wrap">
	<div class="container">
		<div class="row">
			<div class="span3 hidden-phone"></div>
			<div class="span6" id="form-login">
				<form class="form-horizontal well" runat="server">

                    <div>
                        <asp:Login ID="posLogin" runat="server" 
                            DestinationPageUrl="~/views/department.aspx" 
                            onauthenticate="posLogin_Authenticate" Visible="true" Width="100%">

                            <LayoutTemplate>
                                <div class="accountInfo">
                                    <fieldset class="login">
                                        <legend>Login</legend>
                                        
                                        <div class="control-group">
							                <div class="control-label">
                                                <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Username:</asp:Label>
                                            </div>
                                            <div class="controls">
                                                <asp:TextBox ID="UserName" runat="server" CssClass="input-large" ></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                                        CssClass="failureNotification" ErrorMessage="User Name is required." ToolTip="User Name is required."
                                                        ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                            
                                        
                                        <div class="control-group">
							                <div class="control-label">
                                                <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                            </div>
                                            <div class="controls">
                                                <asp:TextBox ID="Password" runat="server" CssClass="input-large" TextMode="Password"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                                     CssClass="failureNotification" ErrorMessage="Password is required." ToolTip="Password is required."
                                                     ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        
                                        <div class="control-group">
							                <div class="controls">
                                                <asp:CheckBox ID="RememberMe" runat="server" Checked="True" />
                                                <asp:Label ID="RememberMeLabel" runat="server" AssociatedControlID="RememberMe" CssClass="inline rememberMe">Remember me</asp:Label>
                                            </div>
                                        <//div>

                                        <div class="control-group" style="margin-top: 14px;">
							                <div class="controls">
                                                <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log In" ValidationGroup="LoginUserValidationGroup" CssClass="btn btn-primary button-loading" data-loading-text="Loading..."/>

                                                <button type="button" class="btn btn-secondary button-loading" data-loading-text="Loading...">Forgot Password</button>
							                </div>
						                </div>
                                    </fieldset>
                                    
                                </div>    
                            </LayoutTemplate>
                        </asp:Login>
                    </div>

					
				</form>
    			
			</div>
			<div class="span3 hidden-phone"></div>
		</div>
	</div>
	<div id="push"></div>
	</div>


    
</body>
</html>
