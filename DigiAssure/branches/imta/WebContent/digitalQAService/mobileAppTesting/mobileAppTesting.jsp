<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/css/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/css/digi.css">

<script src="${pageContext.request.contextPath}/vendor/jquery/dist/jquery.js"></script>
<script src="${pageContext.request.contextPath}/vendor/angular/angular.js"></script>
<script
	src="${pageContext.request.contextPath}/vendor/angular-ui-router/release/angular-ui-router.js"></script>
<script src="${pageContext.request.contextPath}/vendor/angular-route/angular-route.js"></script>
<script src="${pageContext.request.contextPath}/vendor/angular-ui-bootstrap-bower/ui-bootstrap.js"></script>
<script
	src="${pageContext.request.contextPath}/vendor/angular-ui-bootstrap-bower/ui-bootstrap-tpls.js"
	type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/vendor/bootstrap/dist/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/js/app/app.js"></script>
<script src="${pageContext.request.contextPath}/js/main.js"></script>
<script type="text/javascript">

// Function to start seetest URL in New Tab
function runSeeTest(){
	window.open('http://10.102.19.142','_blank');
}

//function calling DigiAssure Controller method for Downloading Excel Template
function downloadExcelTemplate(){
	//window.location.href = 'downloadExcelUtility';
        alert("Click Ok to Download Template");
        $.ajax({  
            type : 'GET',  
            url : "downloadExcelUtility",  
        });
        alert("Download Success");
    }
    
function sendMail(){
	window.open('mailto:gaurav.dua@capgemini.com');
}

</script>
</head>
<body onload="changeAccordion('mobileAppsTesting','digitalQAService')">

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
							<h1 class="greyTextColor">Mobile App Testing</h1>
						</div>

						<div class="panel panel-default">
							<div class="panel-heading"
								data-ng-click="digitalQALabObjective()" data-toggle="collapse">
								<b>Objective</b>
							</div>
							<div class="panel-body">
								<ul>
									<li>Testing Mobile application on multiple devices and OS Combinations</li>
									<li>Test your mobile native/hybrid applications remotely using real devices on cloud</li>
									<li>Combination of Manual and Automated testing for E-2-E Test Execution</li>
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
										<li>Do you have login credentials to access the lab. Contact Us <a onclick="sendMail()">
												<i class="glyphicon glyphicon-envelope"></i>
											</a> 
										</li>
										<li>Download apk/ipa from your build server path to install on device</li>
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
									<ul style="list-style: none;">
										<li>1. Login Lab</li>
										<li>2. Select your device</li>
										<li>3. Install your application</li>
										<li>4. Download your Test Plan</li>
										<li>5. Start Manual testing</li>
										<li>6. For automation testing – After step 3 Continue from "Continuous Delivery->Cross Browser Automation"</li>
										<li>7. Manage your devices on Cloud using the provided login. If you do not have the credentials please Contact us <a onclick="sendMail()">
												<i class="glyphicon glyphicon-envelope"></i>
											</a>
									</ul>
								</div>
							</div>
						</div>
						
					<%-- <div class="marginTop15px">
							<span class="marginLeft20px">
								<a href="../../integratedQALabs/mobileLab/deviceSelectionMatrix/DSHomePage"><button class="btn btn-primary" onclick="">Device Recommendation</button></a>
								 <a href="${pageContext.request.contextPath}/integratedQALabs/mobileLab/downloadExcelUtility"><button
										class="btn btn-primary">Download Testplan</button></a>
										<button class="btn btn-primary" onclick="runSeeTest()">Access Mobile Lab</button>
							</span>
						</div> --%>
						
						<div class="marginTop15px">
							<div class="panel panel-default">
								<div class="panel-heading">
									<b>Artifacts</b>
								</div>
								<div class="panel-body">
									<ul>
										<li>Cross Browser Automation Framework User Manual</li>
										<li>Policies around Grid Usage</li>
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
		<!--     <div ng-include="'common/footer.html'"></div> -->
	</div>
</body>
</html>