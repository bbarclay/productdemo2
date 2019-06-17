<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/styles/css/bootstrap.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/styles/css/main.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/styles/css/digi.css">
<script
	src="${pageContext.request.contextPath}/vendor/jquery/dist/jquery.js"></script>
<script
	src="${pageContext.request.contextPath}/vendor/angular/angular.js"></script>
<script
	src="${pageContext.request.contextPath}/vendor/angular-ui-router/release/angular-ui-router.js"></script>
<script
	src="${pageContext.request.contextPath}/vendor/angular-route/angular-route.js"></script>
<script
	src="${pageContext.request.contextPath}/vendor/angular-ui-bootstrap-bower/ui-bootstrap.js"></script>
<script
	src="${pageContext.request.contextPath}/vendor/angular-ui-bootstrap-bower/ui-bootstrap-tpls.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/vendor/bootstrap/dist/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/js/app/app.js"></script>
<script src="${pageContext.request.contextPath}/js/main.js"></script>
<script type="text/javascript">
	// Function to start seetest URL in New Tab
	function runSeeTest() {
		window.open('http://10.51.25.10:9191', '_blank');
	}

	/* function sendMail() {
		window.open('mailto:gaurav.dua@capgemini.com');
	} */
</script>
</head>
<body onload="changeAccordion('mobileCertification','digitalQAService')">

	<div>
		<!-- Header and Navigation Bar -->

		<jsp:include page="../../common/logo.jsp"></jsp:include>

		<div class="marginTop15px"></div>
		<div class="container">
			<div class="">
				<div class="col-sm-4 col-md-3 marginTop50px">
					<jsp:include page="../../accordion/accordion.jsp"></jsp:include>
				</div>
				<div class="col-sm-8 col-md-9 verticalLine">
					<div class="marginTop65px">
						<div class="page-header">
							<h1 class="greyTextColor">Mobile Certification Testing</h1>
						</div>

						<div class="panel panel-default">
							<div class="panel-heading"
								data-ng-click="digitalQALabObjective()" data-toggle="collapse">
								<b>Objective</b>
							</div>
							<div class="panel-body">
								<ul>
									<li>An interactive platform for the testers/developers to identify any submission guideline defects.</li>
									<li>Assures the readiness of the mobile application before submission.</li>
									<li>Its unique score based system helps in making a decision whether to submit app to store or not.</li>
									<li>Supports iOS & Android platforms.</li>
									<li>Extendable reporting capability</li>
									<li>Can be integrated with major Development and Configuration environments like Jenkins</li>
								</ul>
							</div>
						</div>

						<div class="marginTop15px">
							<div class="panel panel-default">
								<div class="panel-heading">
									<b>Pre-requisites</b>
								</div>
								<div class="panel-body">
									<ul>
										<li>Android SDK</li>
										<li>Machintosh OS EL Caption or latest version</li>
										<li>XCode 8</li>
									</ul>
								</div>
							</div>
						</div>

						<div class="marginTop15px">
							<div class="panel panel-default">
								<div class="panel-heading">
									<b>Approach</b>
								</div>
								<div class="panel-body">
									<ol>
										<li>Login to MAC page</li>  
										<li>Select the OS we want to test on iOS/Android? </li>
										<li>Upload the Application Under Test.</li>
										<li>Run through the auto populated checklist and select the tests for automation</li>
										<li>Run through manual checks</li>
									</ol>
								</div>
							</div>
						</div>
						 <%-- <span class="marginLeft20px"> 
							<a href='http://10.51.118.219:8091/MobileApplicationCertifier/pages/login.jsp' target="_blank" ><button class="btn btn-primary">Try MAC</button></a>
							<a href='${pageContext.request.contextPath}/console/runHome?toolName=Cafe_Perfecto'><button class="btn btn-primary">Cafe Perfecto</button></a>
							<a href='${pageContext.request.contextPath}/console/runHome?toolName=Sprintest_Appium'><button class="btn btn-primary">Cafe Appium</button></a>
							<a href='${pageContext.request.contextPath}/console/runHome?toolName=Sprintest_Optik'><button class="btn btn-primary">Cafe Optik</button></a>
						
						</span> --%>

						<div class="marginTop15px">
							<div class="panel panel-default">
								<div class="panel-heading">
									<b>Artifacts</b>
								</div>
								<div class="panel-body">
									<ul>
										<li>Mac user manual</li>
									</ul>
								</div>
							</div>
						</div>
						<div class="marginTop15px"></div>
					</div>
				</div>
			</div>
		</div>
		<!-- Footer -->
		<jsp:include page="../../common/footer.jsp"></jsp:include>
	</div>
</body>
</html>