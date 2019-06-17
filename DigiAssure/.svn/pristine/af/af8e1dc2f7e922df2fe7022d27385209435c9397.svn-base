<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration</title>
<link rel="stylesheet" href="../../styles/css/bootstrap.css">
<link rel="stylesheet" href="../../styles/css/main.css">
<!-- <link rel="stylesheet" href="./styles/css/extraSmallDevice.css">
<link rel="stylesheet" href="./styles/css/smallDevice.css">
<link rel="stylesheet" href="./styles/css/mediumDevice.css">
<link rel="stylesheet" href="./styles/css/largeDevice.css"> -->

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
		/* var a = window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
		window.location.href = a+"/login.jsp"; */
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
				<img class="digiassureLogo"
					src="${pageContext.request.contextPath}/styles/images/digiAssureLogo.png" />
					</div>
			</div>
		</div>

	<div class="marginTop50px"></div>
	<div></div>

	<div class="container">
		<div class="col-sm-8 col-sm-offset-2 marginTop15px">
			<!-- FORM -->
			<!-- pass in the variable if our form is valid or invalid -->
			<!-- novalidate prevents HTML5 validation since we will be validating ourselves -->
			<form name="registerForm" action="register" method="POST">
				<div class="form-group">
					<label>First Name</label> <span>*</span> <input type="text"
						name="firstName" class="form-control" required
						placeholder="Enter First Name" title="Enter First Name">
				</div>
				<div class="form-group">
					<label>Last Name</label> <span>*</span> <input type="text"
						name="lastName" class="form-control" required
						placeholder="Enter Last Name" title="Enter Last Name">
				</div>
				<div class="form-group">
					<label>Email</label> <span>*</span> <input type="email"
						name="email" class="form-control" required
						placeholder="Enter valid email id" title="Enter Valid email id">
				</div>
				<!-- SUBMIT BUTTON -->
				<!-- <button type="submit" class="btn btn-primary btn-lg btn-block">Register</button> -->
				<span>
					<button type="submit" class="btn btn-primary btn-lg pull-right marginLeft20px">Register</button>
					<button onclick="goToLoginPage()" class="btn btn-primary btn-lg pull-right">Sign In</button>
				</span>
			</form>
			<!-- form end -->
			<br>
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
	<div class="loginFooterMarginFromTop"></div>
	<%@ include file="../../common/footer.jsp"%>
	</div>
</body>
</html>