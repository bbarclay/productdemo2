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
	function sendMail() {
		window.open('mailto:gaurav.dua@capgemini.com');
	}
</script>
</head>
<body>

	<div>
		<!-- Header and Navigation Bar -->

		<jsp:include page="../../common/logo.jsp"></jsp:include>


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
							<h1>Accessibility Testing</h1>
						</div>

						<div class="panel panel-default">
							<div class="panel-heading"
								data-ng-click="digitalQALabObjective()" data-toggle="collapse">
								<!-- <b>Web and Mobile Accessibility</b> -->
								<b>Objective</b>
							</div>
							<div class="panel-body">
								<ul>
									<li><b>Web accessibility means the people with
											disabilities can use the Web application.</b> Accessibility
										refers to the design of products, devices, services, or
										environments for people with disabilities. Accessibility
										policies vary from country to country, but most countries have
										adopted the standards based on the Web Content Accessibility
										Guidelines (WCAG). Web Content Accessibility Guidelines (WCAG)
										is part of a series of Web accessibility guidelines published
										by the Web Accessibility Initiative (WAI) of the World Wide
										Web Consortium (W3C).</li>
									<li>There are a set of guidelines that specify how to make
										content accessible for people with disabilities. For more
										details click on <a href="http://10.102.22.88:8081/AccessibilityTestingPortal/demo.html">WCAG 2.0</a> link.
									</li>
									<li>The information of key laws and documents that relate
										to web accessibility in many countries throughout the world,
										is available on <a href="http://10.102.22.88:8081/AccessibilityTestingPortal/index.html">Country Law's link.</a>
									</li>

									<li>People with disabilities are using the Website with
										the help of software called a 'Screen reader'. Some tools are
										available in the market to carry out the accessibility
										testing. Some of them are JAWS (Job Access with Speech) and
										NVDA (Non Visual desktop Application).</li>
									<li>Mobile Accessibility generally refers to make Websites
										and applications more accessible to people with disabilities
										when they are using mobile phones. Some Screen Reader tools
										are available for mobile accessibility testing like Talkback
										and Voiceover. To get the more details about mobile
										accessibility and its tools click on<a href="http://10.102.22.88:8081/AccessibilityTestingPortal/Mobileaccessibility.html"> Mobile
											Accessibility </a>link.
									</li>
									<li><b>World Wide Web's Consortium (W3C)</b> is the
										international community, where members of different
										organizations work together to develop Web standards.<b>
											Web Accessibility Initiative (WAI)</b> has developed to carry out
										the W3C standards.</li>
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
										<li>Finalize usability requirements covering all guidelines applicable to application under test</li>
										<li>Finalize scope of accessibility testing in project test plan document</li>
									</ul>
								</div>
							</div>
						</div>

						<div class="marginTop15px">
							<div class="panel panel-default">
								<div class="panel-heading">
									<!-- <b>Accessibility Testing Solution</b> -->
									<b>Approach</b>
								</div>
								<div class="panel-body">
									<b>Follow 3 fold accessiblity testing methodology covering:</b>
									<ul>
										<!-- <ins> Capgemini recommends 3 fold accessibility testing
											methodology</ins> -->
										<!-- <li></li>
										<br /> -->
										<!-- <b>- Functional Testing </b> -->
										<li>Functional testing is a software testing process used
											within software development in which software is tested to
											ensure that it conforms to all requirements. It usually
											describes what the system does. Functional Testing tests the
											functional flow of the application. Capgemini Accessibility
											Testing team is focusing on Keyboard Accessibility and Error
											Message validation under functional testing scope. <!-- To know
											more about functional testing click on the below link.<a
											href="#">Functional Testing</a> -->
										</li>
										<!-- <br /> -->
										<!-- <b>- Screen Reader Testing </b> -->

										<li>Screen Reader is a software application that
											identifies & interprets what is being displayed on the screen
											and represented to the user with text-to-speech. Screen
											Reader Testing includes checking of Full Page Reading, Form
											Fields, Headings, Links, Graphics, and Tables. JAWS, NVDA,
											Voiceover and Talkback are popular screen readers that can be
											used for screen reader testing. <!-- To know more about screen
											reader testing click on the below link.<a href="#">-
												Screen Reader Testing</a> -->
										</li>
										<!-- <br />
										<b>- Element Testing</b> -->

										<li>Element testing tests HTML tags and attributes, Image
											Format, CSS Features, Font magnification, Color Contrast
											Ratio. <!-- To know more about element testing click on the below
											link. <a href="#">- Element Testing</a> -->
										</li>
									</ul>
								</div>
								<span class="marginLeft20px">
 
											 <a
									href="${pageContext.request.contextPath}/digitalQAService/accessibilityTesting/viewAllocatedBatch"><button
											class="btn btn-primary">Accessibility Test Plan</button></a> 	 
 									
 									
 									<c:if test="${sessionScope.rolename == 'ADMIN'}">  
										 <a
									href="./addManualChecklisttestCase"><button
											class="btn btn-primary">Add Test Case</button></a>
											<a
									href="./batchHome"><button
											class="btn btn-primary">Allocation</button></a>
											</c:if>
								</span>
								<div class="marginTop15px"></div>
							</div>
						</div>
			
						<div class="marginTop15px">
							<div class="panel panel-default">
								<div class="panel-heading">
									<b>Artifacts</b>
								</div>
								<div class="panel-body">
									<ul>
				
										<li>Accessibility Testing User Manual</li>
										<!-- <li>Policies around Lab/Grid Usage</li> -->
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- Footer -->
		<jsp:include page="../../common/footer.jsp"></jsp:include>
	</div>
</body>
</html>