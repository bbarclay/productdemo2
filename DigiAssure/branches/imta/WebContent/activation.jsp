<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en" data-ng-app="digiAssure" class="no-js">

	<head>
	    <title>IMTA User Activation</title>
	    <meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <!--<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" /> -->
	    <meta name="description" content="">
	    <!-- Tell Phone not to lie about their width -->
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	     <link rel="stylesheet" href="styles/css/newmain.css">
	
	    <!-- CSS entries -->
	    <link rel="stylesheet" href="styles/css/bootstrap.min.css">
	   <link rel="stylesheet" href="./styles/css/main.css">
	     
	    
		<script src="vendor/jquery/dist/jquery.js"></script>
		<script src="vendor/angular/angular.js"></script>
		<script src="vendor/angular-ui-router/release/angular-ui-router.js"></script>
		
		<script src="vendor/angular-route/angular-route.js"></script>
		<script src="vendor/angular-ui-bootstrap-bower/ui-bootstrap.js"></script>
		<script src="vendor/angular-ui-bootstrap-bower/ui-bootstrap-tpls.js" type="text/javascript"></script>
		<script src="vendor/bootstrap/dist/js/bootstrap.js"></script>
		
		<script src="js/app/app.js"></script>
		<script src="js/app/api-interceptor.js"></script>
		<script src="js/app/app-config.js"></script>
		
		<!-- common -->
		<script src="common/common-module.js"></script>
		<script src="common/nav-ctrl.js"></script>
		
		<!-- Login -->
		<script src="js/login/login-module.js"></script>
		<script src="js/login/login-ctrl.js"></script>
		
		<!-- Landing -->
		<script src="landing/landing-module.js"></script>
		<script src="landing/landing-ctrl.js"></script>
		
		<script>
			function registerNow(){
				window.location.href="views/login/register.jsp";
			}
			
			function forgotPassword(){
				window.location.href="views/login/forgotPassword.jsp";
			}
		</script>
	
	</head>
	<body>
		
		<div>
		    <div class="container" >
			    <div class="navbar-fixed-top bgWhite logoBottomBorder">
			        <div class="pull-left">
			            <img class="capgeminiLogo" src="${pageContext.request.contextPath}/styles/images/capgemini.png" >
			        </div>
			        
			       
			        <div class="pull-right">
			       
			            <a href="#" >
			                <img   class="digiassureLogo" src="${pageContext.request.contextPath}/styles/images/digiAssureLogo.png" />
			            </a>
			        </div>
			    </div>
			</div>
		    <div class="marginTop50px"></div>
	    	<div class="container">
	        	<div class="col-sm-8 col-sm-offset-2 marginTop15px">
	        		
	        		
	        		
	        		
	        		
	        		<form action="activate" onSubmit="return validate();" role="form" method="post" >
						<h2 class="form-signin-heading panelContent">User Activation</h2>
							<div class="form-group ">
								<label for="email_id">Email(User Name)</label>
								<input type="text" class="form-control" id="userName" name="userName" required />
							</div>
							
						<div class="form-group">
							<label for="user_pwd">Password</label>
							<input type="password" name="password" class="form-control" required id="password" />
						</div>
										
						<div class="form-group">
							<label for="user_pwd">New Password</label>
							<input type="password" name="userPassword" class="form-control" required id="userPassword" />
						</div>
						<div class="form-group">
							<label for="user_pwd">Confirm Password</label>
							<input type="password" name="repeatPassword" class="form-control" required id="repeatPassword" />
						</div>
									
						
						<button class="btn btn-primary center-block btn-block" type="submit">Activate</button>
					</form><!-- form end -->
				</div><!-- col-sm-8 -->
			</div><!-- /container -->
		    <!-- Footer -->
		    <div class="marginTop50px"></div>
		    <div class="loginFooterMarginFromTop"></div>
	    	<%@ include file="common/footer.jsp"%>
		</div>
	</body>
</html>




























<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en" data-ng-app="digiAssure" class="no-js">
<head>
    <title>DigiAssure</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!--<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" /> -->
    <meta name="description" content="">
    <!-- Tell Phone not to lie about their width -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <link rel="stylesheet" href="styles/css/newmain.css">

    <!-- CSS entries -->
    <link rel="stylesheet" href="styles/css/bootstrap.min.css">
   <link rel="stylesheet" href="./styles/css/main.css">
     
    
	<script src="vendor/jquery/dist/jquery.js"></script>
	<script src="vendor/angular/angular.js"></script>
	<script src="vendor/angular-ui-router/release/angular-ui-router.js"></script>
	
	<script src="vendor/angular-route/angular-route.js"></script>
	<script src="vendor/angular-ui-bootstrap-bower/ui-bootstrap.js"></script>
	<script src="vendor/angular-ui-bootstrap-bower/ui-bootstrap-tpls.js" type="text/javascript"></script>
	<script src="vendor/bootstrap/dist/js/bootstrap.js"></script>
	
	<script src="js/app/app.js"></script>
	<script src="js/app/api-interceptor.js"></script>
	<script src="js/app/app-config.js"></script>
	
	<!-- common -->
	<script src="common/common-module.js"></script>
	<script src="common/nav-ctrl.js"></script>
	
	<!-- Login -->
	<script src="js/login/login-module.js"></script>
	<script src="js/login/login-ctrl.js"></script>
	
	<!-- Landing -->
	<script src="landing/landing-module.js"></script>
	<script src="landing/landing-ctrl.js"></script>
	
	<script>
		function registerNow(){
			window.location.href="views/login/register.jsp";
		}
		
		function forgotPassword(){
			window.location.href="views/login/forgotPassword.jsp";
		}
	</script>
	
	<script type="text/javascript">
	function validate(){
		var	password = document.getElementById('userPassword').value;
		var	repeatPassword = document.getElementById('repeatPassword').value;
	
		if(password == repeatPassword){
			return true;
		}else{
			alert("Password and Confirm Password should be same...");
			return false;
		}
	
	}
	</script>

</head>
<body>
 <!-- <img class="sowTest" src="styles/images/capgemini.png" > -->
<div>
    <div class="container" >
    <div class="navbar-fixed-top bgWhite logoBottomBorder">
        <div class="pull-left">
            <img class="capgeminiLogo" src="${pageContext.request.contextPath}/styles/images/capgemini.png" >
        </div>
        
       
        <div class="pull-right">
       
            <a href="#" >
                <img   class="digiassureLogo" src="${pageContext.request.contextPath}/styles/images/digiAssureLogo.png" />
            </a>
        </div>
    </div>
</div>
	
    <div class="marginTop50px"></div>
    <div class="container">
        <div class="col-sm-12 col-md-8 col-lg-8 col-sm-offset-2 marginTop15px">
            <!-- FORM -->
            <!-- pass in the variable if our form is valid or invalid -->
            <!-- novalidate prevents HTML5 validation since we will be validating ourselves -->
            <form action="activate" onSubmit="return validate();" role="form" method="post" >
				<h2 class="form-signin-heading panelContent">User Activation</h2>
					<div class="form-group col-sm-12 marginTop15px">
									<div class="col-sm-3">
										<label for="email_id">Email(User Name)</label>
									</div>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="userName" name="userName" required
											 />
									</div>
								</div>
					
				<div class="form-group col-sm-12">
									<div class="col-sm-3">
										<label for="user_pwd">Password</label>
									</div>
									<div class="col-sm-9">
										<input type="password" name="password" class="form-control" required
											id="password" />
									</div>
								</div>
								
									<div class="form-group col-sm-12">
									<div class="col-sm-3">
										<label for="user_pwd">New Password</label>
									</div>
									<div class="col-sm-9">
										<input type="password" name="userPassword" class="form-control" required
											id="userPassword" />
									</div>
								</div>
								<div class="form-group col-sm-12">
									<div class="col-sm-3">
										<label for="user_pwd">Confirm Password</label>
									</div>
									<div class="col-sm-9">
										<input type="password" name="repeatPassword" class="form-control" required
											id="repeatPassword" />
									</div>
								</div>
							
				
				<button class="btn btn-primary center-block" type="submit">Activate</button>
			</form><!-- form end -->
             
	        
	       <br>
	       <br>
            
	 	</div><!-- col-sm-12 -->
   </div><!-- /container -->
   <br>
       <br>
    <!-- Footer -->
    <div class="loginFooterMarginFromTop"></div>
    <%@ include file="common/footer.jsp"%>
</div>
</body>
</html> --%>





















<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=IE8" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="css/app.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<script src="jQuery/jquery.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>

<script type="text/javascript">
function validate(){
	var	password = document.getElementById('userPassword').value;
	var	repeatPassword = document.getElementById('repeatPassword').value;

	if(password == repeatPassword){
		return true;
	}else{
		alert("Password and Confirm Password should be same...");
		return false;
	}

}
</script>
<title>DigiAssure | User Activation</title>
</head>
<body>
<c:if test="${not empty error}">
		<div class="alert alert-danger alert-dismissible" role="alert">
			<button type="button" class="close" data-dismiss="alert">
				<span aria-hidden="true">×</span><span class="sr-only">Close</span>
			</button>
			<strong>Error!</strong> ${error}
		</div>
	</c:if>
	<form action="activate" onSubmit="return validate();" role="form" method="post" >
		<h2 class="form-signin-heading">User Activation</h2>
			<div class="form-group col-sm-12">
							<div class="col-sm-3">
								<label for="email_id">Email(User Name)</label>
							</div>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="userName" name="userName" required
									 />
							</div>
						</div>
			
		<div class="form-group col-sm-12">
							<div class="col-sm-3">
								<label for="user_pwd">Password</label>
							</div>
							<div class="col-sm-9">
								<input type="password" name="password" class="form-control" required
									id="password" />
							</div>
						</div>
						
							<div class="form-group col-sm-12">
							<div class="col-sm-3">
								<label for="user_pwd">New Password</label>
							</div>
							<div class="col-sm-9">
								<input type="password" name="userPassword" class="form-control" required
									id="userPassword" />
							</div>
						</div>
						<div class="form-group col-sm-12">
							<div class="col-sm-3">
								<label for="user_pwd">Confirm Password</label>
							</div>
							<div class="col-sm-9">
								<input type="password" name="repeatPassword" class="form-control" required
									id="repeatPassword" />
							</div>
						</div>
					
		
		<button class="btn btn-primary center-block" type="submit">Activate</button>
	</form>
</body>
</html> --%>