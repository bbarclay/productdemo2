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
	window.open('http://igteblrwfmobt:9191','_blank');
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
<body onload="changeAccordion('crossBrowserTesting','digitalQAService')">

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
							<h1 class="greyTextColor">Cross Browser Testing - Coming Soon</h1>
						</div>

						<div class="panel panel-default">
							<div class="panel-heading"
								data-ng-click="digitalQALabObjective()" data-toggle="collapse">
								<b>Objective</b>
							</div>
							<div class="panel-body">
								<ul>
									<li>Testing Web application on multiple Browser Combinations which includes Desktop and Mobile Browsers</li>
									<li>Test your web applications on grids which has both Desktop and Mobile Browser Components</li>
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
										<li>Setup the appropriate grid with the required browser configuration. DigiAssure provides the grids for 
											Cross Browser Testing. If you do not have credentials. Contact Us <a onclick="sendMail()">
												<i class="glyphicon glyphicon-envelope"></i>
											</a>
										</li>
										<li>Download the latest build for testing on multiple browsers</li>
										<li>For Cross Browser Automation , please refer to the Cross Browser Automation  Page(Link)</li>
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
										<li>1. Login to Browser Grid</li>
										<li>2.	Select your Desktop/Mobile Browser</li>
										<li>3.	Install your application</li>
										<li>4.	Download your Test Plan</li>
										<li>5.	Start Manual testing</li>
										<li>6.	For automation testing – After step 3 Continue from "Continuous Delivery->Cross Browser Automation"</li>
									</ul>
								</div>
							</div>
						</div>
						
						<!-- <div class="marginTop15px">
							<span class="marginLeft20px">
								<button class="btn btn-primary" onclick="runSeeTest()">Try
									Now "Mobile Test lab"</button> <a href="downloadExcelUtility"><button
										class="btn btn-primary">Download Template</button></a>
										
										<button class="btn btn-warning" onclick="">Device Selection Matrix</button>
							</span>
						</div> -->
						
						<div class="marginTop15px">
							<div class="panel panel-default">
								<div class="panel-heading">
									<b>Artifacts</b>
								</div>
								<div class="panel-body">
									<ul>
										<li>Automation Framework User Manual</li>
										<li>Policies around Cloud Usage</li>
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