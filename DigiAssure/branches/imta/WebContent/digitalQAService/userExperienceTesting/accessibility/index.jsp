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
    
function sendMail(){
	window.open('mailto:gaurav.dua@capgemini.com');
}

</script>
</head>
<body>

	<div>
		<!-- Header and Navigation Bar -->
	 
		<jsp:include page="../../../common/logo.jsp"></jsp:include>
		
		
		<div class="marginTop15px"></div>
		<!-- <div class="container" style="background-color: #fa565a;"> -->
		<div class="container">
			<div class="">
				<div class="col-sm-4 col-md-3 marginTop50px">
					<jsp:include page="../../../accordion/accordion.jsp"></jsp:include>
				</div>
				<div class="col-sm-8 col-md-9 verticalLine">
					<div class="marginTop50px">
						<div class="page-header">
							<h1>Accessibility Testing</h1>
						</div>

						<div class="panel panel-default">
							<div class="panel-heading"
								data-ng-click="digitalQALabObjective()" data-toggle="collapse">
								<b>Web and Mobile Accessibility</b>
							</div>
							<div class="panel-body">
								<ul>
									<li><b>Web accessibility means the people with disabilities can use the Web application.</b> Accessibility refers to the design of products, devices, services, or environments for people with disabilities. Accessibility policies vary from country to country, but most countries have adopted the standards based on the Web Content Accessibility Guidelines (WCAG). Web Content Accessibility Guidelines (WCAG) is part of a series of Web accessibility guidelines published by the Web Accessibility Initiative (WAI) of the World Wide Web Consortium (W3C). </li>
									<li>There are a set of guidelines that specify how to make content accessible for people with disabilities. For more details click on <a href="#">WCAG 2.0</a> link.</li>
									<li>The information of key laws and documents that relate to web accessibility in many countries throughout the world, is available on <a href="#">Country Law's link.</a></li>
								
								<li> People with disabilities are using the Website with the help of software called a 'Screen reader'. Some tools are available in the market to carry out the accessibility testing. Some of them are JAWS (Job Access with Speech) and NVDA (Non Visual desktop Application).</li>
								<li>Mobile Accessibility generally refers to make Websites and applications more accessible to people with disabilities when they are using mobile phones. Some Screen Reader tools are available for mobile accessibility testing like Talkback and Voiceover. To get the more details about mobile accessibility and its tools click on<a href="#"> Mobile Accessibility </a>link.</li>
								<li><b>World Wide Web's Consortium (W3C)</b> is the international community, where members of different organizations work together to develop Web standards.<b> Web Accessibility Initiative (WAI)</b> has developed to carry out the W3C standards.</li>
								</ul>
							</div>
						</div>

						<div class="marginTop15px">
							<div class="panel panel-default">
								<div class="panel-heading">
									<b>Accessibility Testing Solution</b>
								</div>
								<div class="panel-body">
									<ul>
										<li>Physical mobile devices will be connected to network
											machine inside client VPN. </li> 
										<li>Mobile testers seeking access to mobile devices
											having valid "Userid" and "Password".</li>
										<li>In case you don't have mobile lab cloud login
											credentials, please contact us via <!-- <a href=""
											data-ng-click="sendEmail('emailId','subject','message')"><i
												class="glyphicon glyphicon-envelope"></i></a>  -->
											<button onclick="sendMail()">
												<i class="glyphicon glyphicon-envelope"></i>
											</button>
										</li>
										<li>To install app on cloud devices, please use < Server
											Location > to save your app installers. ( Note: Allocated
											space is of limited size on server therefore maintain app
											installer versioning on server accordingly)</li>
									</ul>
								</div>
								<span class="marginLeft20px"> 
									<a href="${pageContext.request.contextPath}/digitalQAService/userExperienceTesting/accessibility/index.jsp"><button class="btn btn-primary">Accessibility Testing</button></a>
									
									<!-- <a href="./addManualChecklisttestCase?toolName=AccessibilityTesting"><button class="btn btn-primary">ADD Test case </button></a> -->
								</span>
								<div class="marginTop15px"></div>
							</div>
						</div>
						<div class="marginTop15px">
							<div class="panel panel-default">
								<div class="panel-heading">
									<b>Key Features</b>
								</div>
								<div class="panel-body">
									<ul>
										<li>Private cloud solution with more than 50 devices
											available for testing.</li>
										<li>Supports both Automated testing tools and Manual
											testing.</li>
										<li>Availability of all latest devices from different OS
											platforms</li>
									</ul>
								</div>
							</div>
						</div>

						<div class="marginTop15px">
							<div class="panel panel-default">
								<div class="panel-heading">
									<b>Artifacts</b>
								</div>
								<div class="panel-body">
									<ul>
										<li>Test lab User Manual</li>
										<li>Device Adoption Strategy</li>
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
		<jsp:include page="../../../common/footer.jsp"></jsp:include>
	</div>
</body>
</html>