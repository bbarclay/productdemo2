<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en"class="no-js">
<head>
<script type="text/javascript">
function speak(msg){
	var msg  = new SpeechSynthesisUtterance(msg);
window.speechSynthesis.speak(msg);
}
</script>

    <title>IMTA Login</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!--<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" /> -->
    <meta name="description" content="">
    <!-- Tell Phone not to lie about their width -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- CSS entries -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/css/bootstrap.min.css">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/css/main.css">
     

	<script src="./vendor/angular-ui-bootstrap-bower/ui-bootstrap.js"></script>
	<script src="./vendor/angular-ui-bootstrap-bower/ui-bootstrap-tpls.js" type="text/javascript"></script>
	<script src="./vendor/bootstrap/dist/js/bootstrap.js"></script>
	
	<script src="./js/app/app.js"></script>
	<script src="./js/app/api-interceptor.js"></script>
	<script src="./js/app/app-config.js"></script>

	<script>
		function registerNow(){
			window.location.href="views/login/register.jsp";
		}
		
		function forgotPassword(){
			window.location.href="views/login/forgotPassword.jsp";
		}
	</script>
	<script type="text/javascript">
function speak(msg){
	var msg  = new SpeechSynthesisUtterance(msg);
window.speechSynthesis.speak(msg);
}
</script> 

</head>
<body>
 <!-- <img class="sowTest" src="styles/images/capgemini.png" > -->
  <div style="height:80%;">
    <div class="container" >
    <div class="navbar-fixed-top bgWhite logoBottomBorder">
        <div class="pull-left">
            <img class="capgeminiLoginLogo" src="${pageContext.request.contextPath}/styles/images/cg.png" >
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
        <div class="col-sm-8 col-sm-offset-2 marginTop50px">
            <!-- FORM -->
            <!-- pass in the variable if our form is valid or invalid -->
            <!-- novalidate prevents HTML5 validation since we will be validating ourselves -->
            <form name="loginForm" action="login" method="POST">
                <!-- EMAIL -->
                <div class="form-group">
                    <label>Email</label>
                    <span>*</span>
                    <input type="email" name="username" class="form-control" required placeholder="Enter valid email id" title="Enter Valid email id" >
                </div>
                <!-- PASSWORD -->
                <div class="form-group blackTextColor">
                    <label >Password</label>
                    <span>*</span>
                    <input type="password" name="password" class="form-control" required title="Enter passpord" placeholder="Enter password">
                </div>
                <!-- SUBMIT BUTTON -->
                <button type="submit" class="btn btn-primary btn-lg btn-block" >Login</button>
            </form><!-- form end -->
             <span>
	        	<a href="javascript:void(0)" onclick="registerNow()">Register Now</a>
	        </span>
	        <span class="marginLeft20px">
	        	<a href="javascript:void(0)" onclick="forgotPassword()">Forgot Password</a>
	        </span>
       <br>
       <br>
                 <c:if test="${not empty error}">
           
		<div class="alert alert-danger alert-dismissible" role="alert" >
			<button type="button" class="close" data-dismiss="alert">
				<span aria-hidden="true">×</span><span class="sr-only">Close</span>
			</button>

			<strong>Error!<script> speak('${error}')</script></strong> ${error}

		</div>
		
		
	</c:if>
	 </div><!-- col-sm-8 -->
         </div><!-- /container -->
 </div>  
    <!-- Footer -->
  <div class="loginFooterMarginFromTop">
    <!-- <div class="loginFooterMarginFromTop"></div> -->
    <%@ include file="common/footer.jsp"%>
</div>
</body>
</html>