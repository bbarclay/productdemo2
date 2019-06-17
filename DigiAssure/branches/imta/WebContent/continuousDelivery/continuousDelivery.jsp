<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<script type="text/javascript">
function callCloud(){
	window.location.href="mobileLab/mobileLab.jsp";
}
</script>

<link rel="stylesheet" href="../styles/css/bootstrap.css">
<link rel="stylesheet" href="../styles/css/main.css">
<!-- <link rel="stylesheet" href="./styles/css/extraSmallDevice.css">
<link rel="stylesheet" href="./styles/css/smallDevice.css">
<link rel="stylesheet" href="./styles/css/mediumDevice.css">
<link rel="stylesheet" href="./styles/css/largeDevice.css"> -->

<script src="vendor/jquery/dist/jquery.js"></script>
<script src="vendor/angular/angular.js"></script>
<script src="vendor/angular-ui-router/release/angular-ui-router.js"></script>
<script src="vendor/angular-route/angular-route.js"></script>
<script src="vendor/angular-ui-bootstrap-bower/ui-bootstrap.js"></script>
<script src="vendor/angular-ui-bootstrap-bower/ui-bootstrap-tpls.js" type="text/javascript"></script>
<script src="vendor/bootstrap/dist/js/bootstrap.js"></script>
<script src="js/app/app.js"></script>
<script src="../js/main.js"></script>
</head>

<body>
	<div>
		<!-- Header and Navigation Bar -->
		<jsp:include page="../common/logo.jsp"></jsp:include>
		<jsp:include page="../common/nav.jsp"></jsp:include>
		
		<div class="marginTop90px"></div>
		<div class="container">
			<div class="row">
				<div class="qaLabMobileLab paddingBottom15px">
					<div class="col-sm-4 paddingTop50px ">
						<img src="../styles/images/tooltip/bddAutomation_tooltip.png" class="mobileLabImg" />
					</div>
					<div class="col-sm-8 panelContent marginTop15px">
						<h1>BDD Automation</h1>
						<ul class="text-left integratedQALabPanelListDataContent">
							<li>Access to single point Agile-BDD automation framework.</li>
							<li>Convert your user stories into automation scripts with single click.</li>
							<li>Validate your mobile or web applications across multiple devices and browsers using lab.</li>
						</ul>
						<button class="btn btn-info marginTop15px bgWhite blackTextColor" onclick="callCloud()">Continue</button>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="qaLabCloudTesting paddingTop50px paddingBottom15px">
					<div class="col-sm-4">
						<img src="../styles/images/tooltip/serviceAutomation_tooltip.png" class="mobileLabImg" />
					</div>

					<div class="col-sm-8 panelContent text-left">
						<h1>Service Automation</h1>
						<ul class="text-left integratedQALabPanelListDataContent">
							<li>End to end web service and API testing solution </li>
							<li>Quick and easy to update endpoint execution.</li>
							<li>SOAP, XML, JSON messages validation support.</li>
						</ul>
						<button
							class="btn btn-info marginTop15px bgWhite blackTextColor opacityPt5">Continue</button>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">

				<div class="qaLabIOT paddingTop50px paddingBottom15px">
					<div class="col-sm-4">
						<img src="../styles/images/tooltip/crossBrowserAutomation_tooltip.png" class="mobileLabImg" />
					</div>

					<div class="col-sm-8 panelContent text-left">
						<h1>Cross Browser Automation</h1>
						<ul class="text-left integratedQALabPanelListDataContent">
							<li>Test your sites on multiple browsers and devices as your customers use.</li>
							<li>Script less record and play. No requirement of specialized automation skills.</li>
							<li>Use real devices, browsers and perform function, UI validations.</li>
						</ul>
						<button
							class="btn btn-info marginTop15px bgWhite blackTextColor opacityPt5">Continue</button>
					</div>
				</div>

			</div>
		</div>
		<div class="container">
			<div class="row">

				<div class="qaLabPaymentDevice paddingTop50px paddingBottom15px">
					<div class="col-sm-4">
						<img src="../styles/images/tooltip/functional_Automation_tooltip.png"
							class="mobileLabImg" />
					</div>

					<div class="col-sm-8 panelContent text-left">
						<h1>Functional Automation</h1>
						<ul class="text-left integratedQALabPanelListDataContent">
							<li>Perform lifecycle automation for multichannel applications.</li>
							<li>System Integration Test automation, Automation for UAT and Static testing.</li>
							<li>DevOps Enabled continuous automation.</li>
						</ul>
						<a href="functionalAutomation/functionalAutomation.jsp"><button
							class="btn btn-info marginTop15px bgWhite blackTextColor">Continue</button></a>

					</div>


				</div>

			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="qaLabMobileLab paddingTop50px paddingBottom15px">
					<div class="col-sm-4">
						<img src="../styles/images/tooltip/uiAutomation_tooltip.png" class="mobileLabImg" />
					</div>

					<div class="col-sm-8 panelContent text-left">
						<h1>UI Automation</h1>
						<ul class="text-left integratedQALabPanelListDataContent ">
							<li>Automated tests for visual responsive layouts.</li>
							<li>Test the layout according to user defined specs.</li>
							<li>Achieve consistent UX across all digital platforms</li>
						</ul>
						<button
							class="btn btn-info marginTop15px bgWhite blackTextColor opacityPt5">Continue</button>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</div>
</body>
</html>