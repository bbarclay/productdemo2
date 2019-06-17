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
				<div class="dashboard paddingBottom15px">
					<div class="col-sm-4 paddingTop50px ">
						<img src="../styles/images/tooltip/dashboard_tooltip.png" class="mobileLabImg" />
					</div>
					<div class="col-sm-8 panelContent marginTop15px">
						<h1>Dashboard</h1>
						<ul class="text-left integratedQALabPanelListDataContent">
							<li>Test mobile apps (Web/Native/Hybrid) remotely on real
								devices hosted on cloud.</li>
							<li>Share and manage devices within different teams using
								cloud based infrastructure.</li>
							<li>Entire infrastructure resides within client VPN thus
								ensuring top speed and security.</li>
						</ul>
						<button class="btn btn-info marginTop15px bgWhite blackTextColor" onclick="callCloud()">Continue</button>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="testCoverage paddingTop50px paddingBottom15px">
					<div class="col-sm-4">
						<img src="../styles/images/tooltip/testCoverage_tooltip.png" class="mobileLabImg" />
					</div>

					<div class="col-sm-8 panelContent text-left">
						<h1>Test Coverage</h1>
						<div class="marginTop50px"></div>
						<button
							class="btn btn-info marginTop15px bgWhite blackTextColor opacityPt5">Continue</button>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">

				<div class="predictiveAnalysis paddingTop50px paddingBottom15px">
					<div class="col-sm-4">
						<img src="../styles/images/tooltip/predictive_tooltip.png" class="mobileLabImg" />
					</div>

					<div class="col-sm-8 panelContent text-left">
						<h1>Predictive Analysis</h1>
						<div class="marginTop50px"></div>
						<button
							class="btn btn-info marginTop15px bgWhite blackTextColor opacityPt5">Continue</button>
					</div>
				</div>

			</div>
		</div>
		<!-- <div class="container">
			<div class="row">

				<div class="qaLabPaymentDevice paddingTop50px paddingBottom15px">
					<div class="col-sm-4">
						<img src="../styles/images/paymentDevice_2.png"
							class="mobileLabImg" />
					</div>

					<div class="col-sm-8 panelContent text-left">
						<h1>Payment Devices</h1>
						<div class="marginTop50px"></div>
						<button
							class="btn btn-info marginTop15px bgWhite blackTextColor opacityPt5">Continue</button>

					</div>


				</div>

			</div>
		</div> -->
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</div>
</body>
</html>