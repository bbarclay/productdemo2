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
<body onload="changeAccordion('functionalAutomation','continuousDelivery')">

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
							<h1 class="greyTextColor">Functional Automation</h1>
						</div>

						<div class="panel panel-default">
							<div class="panel-heading"
								data-ng-click="digitalQALabObjective()" data-toggle="collapse">
								<b>Objective</b>
							</div>
							<div class="panel-body">
								<ul>
									<li>DigiAssure solution provides frameworks to automate functional requirements of application and allows continuous integration environment using Jenkins</li>
									<li>Automation support is available for different digital platforms i.e. mobile, wearable’s and desktop</li>
									<li>Functional automation environment support extends to various cloud solutions i.e. Perfecto, Seetest and Appium</li>
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
										<li>Functional automation test plan should be ready and tester should get test cases segregated for automation</li>
										<li>JDK and Eclipse should be installed on tester machine to create automation scripts.</li>
										<li>Functional automation test plan should be ready and tester should get test cases segregated for automation . Contact Us 
											<a href="" onclick="sendMail()"><i class="glyphicon glyphicon-envelope"></i></a> 
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
										<li>Download framework from DigiAssure platform</li>  
										<li>Import project to Eclipse workbench</li>
										<li>Refer framework user manual</li>
										<li>Create scripts using Eclipse </li>
										<li>Upload required files back to framework execution console section on DigiAssure</li>
										
									</ol>
								</div>
							</div>
						</div>
						<%-- <span class="marginLeft20px"> 
							<a href='${pageContext.request.contextPath}/console/runHome?toolName=Cafe_Seetest'><button class="btn btn-primary">CGAF SEETEST</button></a>
							<a href='${pageContext.request.contextPath}/console/runHome?toolName=Cafe_Perfecto'><button class="btn btn-primary">Cafe Perfecto</button></a>
							<a href='${pageContext.request.contextPath}/console/runHome?toolName=Sprintest_Appium'><button class="btn btn-primary">Cafe Appium</button></a>
 							<a href='http://in-pnq-coe19:8081/OPTIK/landing' target="_blank"><button class="btn btn-primary">OPTIK</button></a>  

						</span> --%>
						<div class="marginTop15px">
							<div class="panel panel-default">
								<div class="panel-heading">
									<b>Artifacts</b>
								</div>
								<div class="panel-body">
									<ul>
										<li><i class="glyphicon glyphicon-file"> </i><a
											href='${pageContext.request.contextPath}/integratedQALabs/mobileLab/downloadManual?toolName=FunctionalSeetestManual'><b>CGAF Seetest User Manual</b></a></li>
								 <li><i class="glyphicon glyphicon-file"> </i><a
											href='${pageContext.request.contextPath}/integratedQALabs/mobileLab/downloadManual?toolName=OPTIKUserManual'><b>OPTIK User Manual</b></a></li>
									 
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