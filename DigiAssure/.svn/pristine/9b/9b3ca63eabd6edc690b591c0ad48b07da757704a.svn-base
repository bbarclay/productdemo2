<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Forgot Password</title>
<link rel="stylesheet" href="../../styles/css/bootstrap.css">
<link rel="stylesheet" href="../../styles/css/main.css">


<script src="../../vendor/jquery/dist/jquery.js"></script>
<script src="../../vendor/angular/angular.js"></script>
<script
	src="../../vendor/angular-ui-router/release/angular-ui-router.js"></script>
<script src="../../vendor/angular-route/angular-route.js"></script>
<script src="../../vendor/angular-ui-bootstrap-bower/ui-bootstrap.js"></script>
<script
	src="../../vendor/angular-ui-bootstrap-bower/ui-bootstrap-tpls.js"
	type="text/javascript"></script>
<script src="../../vendor/bootstrap/dist/js/bootstrap.js"></script>
<script src="../../js/app/app.js"></script>

<!-- common -->
<script src="../../common/common-module.js"></script>
<script src="../../common/nav-ctrl.js"></script>

<!-- Login -->
<script src="../../js/login/login-module.js"></script>
<script src="../../js/login/login-ctrl.js"></script>

<!-- Landing -->
<script src="../../landing/landing-module.js"></script>
<script src="../../landing/landing-ctrl.js"></script>
<script type="text/javascript">
	function goToLoginPage(){
		window.history.back();
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
	<div>
		<!-- Header and Navigation Bar -->
		<div class="container">
			<div class="navbar-fixed-top bgWhite logoBottomBorder">
				<div class="pull-left">
					<img class="capgeminiLogo"
						src="${pageContext.request.contextPath}/styles/images/capgemini.png">
				</div>
				<div class="pull-right">
				<a href="#"> <img class="digiassureLogo"
					src="${pageContext.request.contextPath}/styles/images/digiAssureLogo.png" />
				</a>
				</div>
			</div>
		</div>
	</div>

	<div class="marginTop50px"></div>
	<div></div>

	<div class="container">
		<div class="col-sm-8 col-sm-offset-2 marginTop15px">
			<!-- FORM -->
			<form name="forgotForm" action="forgotPassword" method="POST">
				<!-- EMAIL -->
				<div class="form-group">
					<label>Email</label> <span>*</span> <input class="form-control"
						type="email" name="forgotEmailId"
						placeholder="Enter valid email id" title="Enter Valid email id">
				</div>
				<!-- PASSWORD -->

				<!-- SUBMIT BUTTON -->
				<!-- <button type="submit" class="btn btn-primary btn-lg btn-block">Submit</button> -->
				<span>
					<input type="submit" class="btn btn-primary btn-lg pull-right marginLeft20px" value="Submit">
					<button onclick="goToLoginPage()" class="btn btn-primary btn-lg pull-right ">Sign In</button>
				</span>
			</form>
			<br/>
			<br/>
			<br>
			<br/>
			<c:if test="${not empty error}">
				<div class="alert alert-danger alert-dismissible" role="alert">
					<button type="button" class="close" data-dismiss="alert">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<strong>Error!</strong> ${error}<script> speak('${error}')</script>
				</div>
			</c:if>

			<c:if test="${not empty message}">
				<div class="alert alert-info alert-dismissible" role="alert">
					<button type="button" class="close" data-dismiss="alert">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<strong>Success!</strong> ${message} ${message1}<script> speak('${message}') speak('${message1}')</script>
				</div>
			</c:if>
		</div>
	</div>
	<!-- Footer -->
	<!-- Footer -->
	<div class="loginFooterMarginFromTop"></div>
	<%@ include file="../../common/footer.jsp"%>
</body>
</html>