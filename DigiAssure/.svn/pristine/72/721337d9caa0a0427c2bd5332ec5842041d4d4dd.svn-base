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
		window.open('http://igteblrwfmobt:9191', '_blank');
	}

	//function calling DigiAssure Controller method for Downloading Excel Template
	function downloadExcelTemplate() {
		//window.location.href = 'downloadExcelUtility';
		alert("Click Ok to Download Template");
		$.ajax({
			type : 'GET',
			url : "downloadExcelUtility",
		});
		alert("Download Success");
	}

	function sendMail() {
		window.open('mailto:gaurav.dua@capgemini.com');
	}
</script>
</head>
<body onload="changeAccordion('bddAutomation','continuousDelivery')">

	<div>
		<!-- Header and Navigation Bar -->

		<jsp:include page="../../common/logo.jsp"></jsp:include>
		<%-- <jsp:include page="../../common/nav.jsp"></jsp:include> --%>


		<div class="marginTop15px"></div>
		<!-- <div class="container" style="background-color: #fa565a;"> -->
		<div class="container">
			<div class="">
				<div class="col-sm-4 col-md-3 marginTop50px">
					<jsp:include page="../../accordion/accordion.jsp"></jsp:include>
				</div>
				<div class="col-sm-8 col-md-9 verticalLine">
					<div class="marginTop65px">
						<div class="page-header">
							<h1 class="greyTextColor">BDD Automation</h1>
						</div>

						<div class="panel panel-default">
							<div class="panel-heading"
								data-ng-click="digitalQALabObjective()" data-toggle="collapse">
								<b>Objective</b>
							</div>
							<div class="panel-body">
								<ul>
									<li>Automated test execution on the applications using BDD
										techniques</li>
									<li>Linking Gerkin language with BDD Automation frameworks
										such as Cucumber and executing the automation scripts on
										Mobile Devices</li>
									<li>BDD Automation framework integrated with tools such as
										Perfecto, Appium and BrowserStack</li>
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
										<li>Install enabler tools for BDD Automation such as
											Cucumber on the system</li>
										<li>JDK and Eclipse should be installed on tester machine
											to create automation scripts.</li>
										<li>Functional automation test plan should be ready and
											tester should get test cases segregated for automation .
											Contact Us <a onclick="sendMail()">
												<i class="glyphicon glyphicon-envelope"></i>
											</a>
										</li>
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
										<li>Login to DigiAssure Server with appropriate
											Credentials</li>
										<li>For BDD Automation, go to Continuous Delivery->BDD
											Automation</li>
										<li>Download the Cukes Digital framework from DigiAssure</li>
										<li>Create the scripts on the framework as per the
											application functionality</li>
										<li>Select your devices from Lab/Grid</li>
										<li>Install your application on the required Devices</li>
										<li>Start the execution from Execution console after
											putting the required values</li>
										<li>Download the report from Execution Console</li>
									</ol>
								</div>
							</div>
						</div>
						<%-- <span class="marginLeft20px"> <a
							href='${pageContext.request.contextPath}/console/runHome?toolName=Cucumber_mobile_web'><button
									class="btn btn-primary">CGAF Cucumber Appium</button></a>

						</span> --%>
						<div class="marginTop15px">
							<div class="panel panel-default">
								<div class="panel-heading">
									<b>Artifacts</b>
								</div>
								<div class="panel-body">
									<ul>
										<li><i class="glyphicon glyphicon-file"> </i><a
											href='${pageContext.request.contextPath}/integratedQALabs/mobileLab/downloadManual?toolName=BDDCucumberAppium'><b>BDD
													Automation Frameworks User Manual</b></a></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="marginTop15px"></div>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="../../common/footer.jsp"></jsp:include>
	</div>
</body>
</html>