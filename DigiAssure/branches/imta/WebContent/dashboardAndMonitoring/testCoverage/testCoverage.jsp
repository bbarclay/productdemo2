<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/css/main.css">

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
<body>

	<div>
		<!-- Header and Navigation Bar -->
	 
		<jsp:include page="../../common/logo.jsp"></jsp:include>
		<%-- <jsp:include page="../../common/nav.jsp"></jsp:include> --%>
		
		
		<div class="marginTop15px"></div>
		<!-- <div class="container" style="background-color: #fa565a;"> -->
		<div class="container">
			<div class="">
				<div class="col-sm-4 col-md-2 marginTop50px">
					<jsp:include page="../../accordion/accordion.jsp"></jsp:include>
				</div>
				<div class="col-sm-8 col-md-10 verticalLine">
					<div class="marginTop50px">
						<div class="page-header">
							<h1>Test Coverage - Coming Soon</h1>
						</div>

						<div class="panel panel-default">
							<div class="panel-heading"
								data-ng-click="digitalQALabObjective()" data-toggle="collapse">
								<b>Objective</b>
							</div>
							<div class="panel-body">
								<ul>
									<li>Testing IOT application on multiple devices and platform Combinations</li>
									<li>Test your IOT/Wearable applications remotely using real devices/ Wearables on cloud</li>
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
										<li>Do you have login credentials to access the IOT lab. Contact Us 
											<a href="" onclick="sendMail()"><i class="glyphicon glyphicon-envelope"></i></a> 
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
									<ol>
										<li>1.	Login to Lab</li>  
										<li>2.	Select your device/Wearables </li>
										<li>3.	Install your application</li>
										<li>4.	Download your Test Plan</li>
										<li>5.	Start Manual testing</li>
										<li>6.	For automation testing – After step 3 Continue from “Continuous Delivery-> "Functional Testing"</li>
										<li>7.	Manage your devices/Wearables on Cloud using the provided login. If you do not have the credentials. Contact us
											<a href="" onclick="sendMail()"><i class="glyphicon glyphicon-envelope"></i></a> 
										</li>
									</ol>
								</div>
							</div>
						</div>
						<span class="marginLeft20px"> 
							<a href='${pageContext.request.contextPath}/console/runHome?toolName=Cafe_Seetest'><button class="btn btn-primary">Mobile Test Lab</button></a>
						</span>
						<%-- <span class="marginLeft20px"> 
							<a href='${pageContext.request.contextPath}/console/runHome?toolName=Cafe_Seetest'><button class="btn btn-primary">Cafe Seetest</button></a>
							<a href='${pageContext.request.contextPath}/console/runHome?toolName=Cafe_Perfecto'><button class="btn btn-primary">Cafe Perfecto</button></a>
							<a href='${pageContext.request.contextPath}/console/runHome?toolName=Sprintest_Appium'><button class="btn btn-primary">Cafe Appium</button></a>
							<a href='${pageContext.request.contextPath}/console/runHome?toolName=Sprintest_Optik'><button class="btn btn-primary">Cafe Optik</button></a>
							<a href='${pageContext.request.contextPath}/console/runHome?toolName=Cukes_Digital'><button class="btn btn-primary">Cukes Digital</button></a>
							<!-- <button class="btn btn-primary" onclick="downloadExcelTemplate()">Download Template</button> -->
						</span> --%>
						<div class="marginTop15px">
							<div class="panel panel-default">
								<div class="panel-heading">
									<b>Artifacts</b>
								</div>
								<div class="panel-body">
									<ul>
										<!-- <li>Test lab User Manual</li> -->
										<!-- <li><i class="glyphicon glyphicon-file"> </i><a href="javascript:void(0);" onclick="javascipt:window.open('../../userManual/Mobile_Lab_User_Manual.pdf');" class="popup"><b>Mobile Lab User Manual</b></a></li> -->
										<!-- <li>Device Adoption Strategy</li> -->
										<li>Policies around lab usage</li>
										<!-- <li>Policies around Lab/Grid Usage</li> -->
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