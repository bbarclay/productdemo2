<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="page-container">
		<div class="page-content">

<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/css/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/css/digi.css">
<link rel="stylesheet" type="text/css" id="theme"
	href="${pageContext.request.contextPath}/css/theme-default.css" />
	
	
<!-- JS INCLUDE -->

<!-- <style>
	.not-active-continuousDelivery {
   pointer-events: none;
   cursor: default;
}
</style> -->
<script src="${pageContext.request.contextPath}/vendor/jquery/dist/jquery.js"></script>
<script src="${pageContext.request.contextPath}/vendor/angular/angular.js"></script>
<script src="${pageContext.request.contextPath}/vendor/angular-ui-router/release/angular-ui-router.js"></script> <!-- //here for run home -->
<script src="${pageContext.request.contextPath}/vendor/angular-route/angular-route.js"></script>
<script src="${pageContext.request.contextPath}/vendor/angular-ui-bootstrap-bower/ui-bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/vendor/angular-ui-bootstrap-bower/ui-bootstrap-tpls.js"
	type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/vendor/bootstrap/dist/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/js/app/app.js"></script>
<script src="${pageContext.request.contextPath}/js/main.js"></script>
<script src="${pageContext.request.contextPath}/js/crowdsourcingcontroller.js"></script>

<!-- START PLUGINS -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins/jquery/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins/jquery/jquery-ui.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/plugins/bootstrap/bootstrap.min.js"></script>
<!-- END PLUGINS -->

<!-- START THIS PAGE PLUGINS-->
	<script type='text/javascript' src='${pageContext.request.contextPath}/js/plugins/icheck/icheck.min.js'></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/plugins/mcustomscrollbar/jquery.mCustomScrollbar.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/plugins/scrolltotop/scrolltopcontrol.js"></script>

	<script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins/morris/raphael-min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins/morris/morris.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins/rickshaw/d3.v3.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/plugins/rickshaw/rickshaw.min.js"></script>
	<script type='text/javascript'
		src='${pageContext.request.contextPath}/js/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js'></script>
	<script type='text/javascript'
		src='${pageContext.request.contextPath}/js/plugins/jvectormap/jquery-jvectormap-world-mill-en.js'></script>
	<script type='text/javascript'
		src='${pageContext.request.contextPath}/js/plugins/bootstrap/bootstrap-datepicker.js'></script>
				 <script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins/bootstrap/bootstrap-timepicker.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins/owl/owl.carousel.min.js"></script>

	<script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins/moment.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/plugins/daterangepicker/daterangepicker.js"></script>
		<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/plugins/bootstrap/bootstrap-datetimepicker.js"></script>
		
		
<!-- END THIS PAGE PLUGINS-->

<!-- START TEMPLATE -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/settings.js"></script>

	<script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/actions.js"></script>

	<script type="text/javascript" src="${pageContext.request.contextPath}/js/demo_dashboard.js"></script>
	<!-- END TEMPLATE -->
	<!-- END SCRIPTS -->
 
	<script type="text/javascript">

	var r = document.getElementsByName('search');

			function startConverting () {
				var a =getContextPath();
				if('webkitSpeechRecognition' in window){
					var speechRecognizer = new webkitSpeechRecognition();
					speechRecognizer.continuous = true;
					speechRecognizer.interimResults = true;
					speechRecognizer.lang = 'en-IN';
					speechRecognizer.start();

					var finalTranscripts = '';

					speechRecognizer.onresult = function(event){
						var interimTranscripts = '';
						for(var i = event.resultIndex; i < event.results.length; i++){
							var transcript = event.results[i][0].transcript;
							transcript.replace("\n", "<br>");
							if(event.results[i].isFinal){
								finalTranscripts += transcript;
							}else{
								interimTranscripts += transcript;
							}
						}
												 
						//Sentiment Analysis
						if(interimTranscripts.includes("sentiment") ||interimTranscripts.includes("sentiment analysis") ||interimTranscripts.includes(" open sentiment")){
							//alert(interimTranscripts)
							window.location.href=a+'/digitalQAService/userExperienceTesting/sentiment/detailReport.jsp';
						}
						//Accessibility Testing
						else if(interimTranscripts.includes("accessibilty") || interimTranscripts.includes("accessibilty testing") ||interimTranscripts.includes(" open accessibilty") || interimTranscripts.includes("access ability") || interimTranscripts.includes(" open access ability test") ){
							//alert(interimTranscripts)
							window.location.href=a+'/digitalQAService/accessibilityTesting/viewAllocatedBatch';
						}
						//Open Smart Lab
						else if(interimTranscripts.toLowerCase().includes("smart lab")||interimTranscripts.toLowerCase().includes("open Digi smart lab")||interimTranscripts.toLowerCase().includes("open Digi smart Lock")||interimTranscripts.toLowerCase().includes("smartlab")||interimTranscripts.toLowerCase().includes("mobile apps testing")){
							window.location.href=a+'/integratedQALabs/mobileLab/deviceSelectionMatrix/marketTrends?market=1';	
						}
						//Open Smart Lab
						else if(interimTranscripts.includes("open iot") || interimTranscripts.toLowerCase().includes("open internet of things") || interimTranscripts.includes("internet of things")){
							window.location.href=a+'/console/runHome?toolName=CGAF_Perfecto';
						}
						// Functional Testing 
						else if(interimTranscripts.includes("open function") || interimTranscripts.includes("functional testing") || interimTranscripts.includes("functional testing")){
							window.location.href=a+'/continuousDelivery/functionalAutomation/functionalAutomation.jsp';
						}
						// Dashboard 
						else if(interimTranscripts.includes("open dashboard") || interimTranscripts.includes("dashboard")){
							window.location.href=a+'/dashboardAndMonitoring/dashboard/dashboardForCommandCenter.jsp';
						}
						// BDD Automation 
						else if(interimTranscripts.includes("BDD Automation") || interimTranscripts.includes("open bdd Automation ")|| interimTranscripts.includes("open bdd")){
							window.location.href=a+'/console/runHome?toolName=CGAF_Cucumber_Appium';
						}
						// UI Automation 
						else if(interimTranscripts.toLowerCase().includes("ui automation") || interimTranscripts.toLowerCase().toLowerCase().includes("open ui automation")|| interimTranscripts.toLowerCase().toLowerCase().includes("layout testing")){
							window.location.href=a+'/console/runHome?toolName=CGAF_LayoutTesting';
						}
						// MAC
						else if(interimTranscripts.toLowerCase().includes("mac") || interimTranscripts.toLowerCase().toLowerCase().includes("open mac")|| interimTranscripts.toLowerCase().toLowerCase().includes("mobile application certifier")|| interimTranscripts.toLowerCase().toLowerCase().includes("mobile certification testing")){
							window.location.href=a+'/digitalQAService/mobileCertification/mac.jsp';
						}
						// User Experience Testing
						else if(interimTranscripts.toLowerCase().includes("user experience testing") || interimTranscripts.toLowerCase().toLowerCase().includes("open user experience testing")|| interimTranscripts.toLowerCase().toLowerCase().includes("analytics")){
							window.location.href=a+'/digitalQAService/userExperienceTesting/userExperienceTesting.jsp';
						}
						// Predictive Analysis
						else if(interimTranscripts.toLowerCase().includes("predictive analysis") || interimTranscripts.toLowerCase().toLowerCase().includes("open predictive analysis")|| interimTranscripts.toLowerCase().toLowerCase().includes("smart qa")){
							window.location.href=a+'/dashboardAndMonitoring/predictiveAnalysis/smartQA.jsp';
						}
						
						
						//alert(interimTranscripts)
						//r.innerHTML = finalTranscripts + '<span style="color:#999">' + interimTranscripts + '</span>';
					};
					speechRecognizer.onerror = function (event) {
					};
				}else{
					r.innerHTML = 'Your browser is not supported. If google chrome, please upgrade!';
				}
			}
	</script>
 
 <div class="" style="margin-top: 0px; padding-top: 0px">

		
		<div class="">
	<!-- START X-NAVIGATION VERTICAL -->
			<ul class="x-navigation x-navigation-horizontal x-navigation-panel">
				
				<li class="xn-logo">
					<img class="capgeminiLoginLogo" src="${pageContext.request.contextPath}/styles/images/capgemini.png" onclick="goToLandingPage()"></li>
				

				<li><a href="#"onclick="changeViewFromNav('mobile')"><span
						class="fa fa-files-o"></span> <span class="xn-text">IMTA</span></a>
		<!-- 			<ul>
						<li><a href="#" onclick="changeViewFromNav('mobile')"><span
								class="fa fa-image"></span> Mobile Lab</a></li>
						<li><a href="#" onclick="changeViewFromNav('cloud')"><span
								class="fa fa-user"></span> Cloud Testing</a></li>
					<li><a href="#" onclick="changeViewFromNav('iot')"><span
								class="fa fa-users"></span> IOT</a></li> 
				<li><a href="#" onclick="changeViewFromNav('paymentDevice')"><span
								class="fa fa-users"></span> Payment Device</a></li>
					</ul></li> -->
				<li class="xn-openable"><a href="#"><span
						class="fa fa-file-text-o"></span> <span class="xn-text">Digi
							QA Services</span></a>
					<ul>
						<li class="xn-openable"><a href="#"><span
								class="fa fa-file-text-o"></span> <span class="xn-text">User
									Experience Testing</span></a>
							<ul>
								<li><a href="#"
									onclick="changeViewFromNav('userExperienceAnalytics')">User
										Experience Analytics</a></li>
								<li><a href="#"
									onclick="changeViewFromNav('sentimentAnalytics')">Sentiment
										Analysis</a></li>
								<li><a href="#"
									onclick="changeViewFromNav('accessibilityTesting')">Accessibility
										Testing</a></li>
							<!--	<li><a href="#" 
									onclick="changeViewFromNav('userFeedbackTesting')"> User Feedback Testing
											   </a></li> -->
							<!--	<li><a href="#" 
									onclick="changeViewFromNav('socialMediaSentiment')"> Social Media Sentiment
											   </a></li> -->
											   <li><a href="#" 
									onclick="changeViewFromNav('automated_Accessibility')"> Automated Accessibility
											   </a></li>
							</ul></li>


						<li class="xn-openable"><a href="#"><span
								class="fa fa-file-text-o"></span> <span class="xn-text">Digital
									Channels Testing</span></a>
							<ul>
								<li><a href="#"
									onclick="changeViewFromNav('mobileAppsTesting')">Mobile
										Apps Testing </a></li>
								<li><a href="#"
									onclick="changeViewFromNav('crossBrowserTesting')">Cross
										Browser Testing</a></li>
							<!--	<li><a href="#"
									onclick="changeViewFromNav('mobileCertificationTesting')">Mobile
										Certification Testing</a></li> -->
								<!-- <li><a href="#"
									onclick="changeViewFromNav('digitalPaymentTesting')">Digital
										Payment Testing</a></li> -->
							<li><a href="#"
									onclick="changeViewFromNav('internetOfThing')" class="not-active-continuousDelivery">IOT Testing</a></li> 
							
							</li>
							</ul>

						<li class="xn-openable"><a href="#"><span
								class="fa fa-file-text-o"></span> <span class="xn-text">Digital
									NFT</span></a>
							<ul>
								<li><a href="#"
									onclick="changeViewFromNav('performanceTesting')">Performance
										Testing </a></li>
								<!-- <li><a href="#"
									onclick="changeViewFromNav('securityTesting')">Security
										Testing</a></li> -->

							</ul></li>
					</ul></li>


				<li class="xn-openable"><a href="#"><span
						class="fa fa-files-o"></span> <span class="xn-text">Continuous
							Delivery</span></a>
					<ul>
						<li  ><a href="#" onclick="changeViewFromNav('bddAutomation')" class="not-active-continuousDelivery" ><span
								class="fa fa-image" ></span> BDD Automation</a></li>
						<!-- <li><a href="#"
							onclick="changeViewFromNav('serviceAutomation')" class="not-active-continuousDelivery"><span
								class="fa fa-user"></span> Services Automation</a></li> -->
						<li><a href="#" onclick="changeViewFromNav('crossBrowser')" class="not-active-continuousDelivery"><span
								class="fa fa-users"></span> OPTIK (Cross Browser Automation)</a></li>
						<li><a href="#"
							onclick="changeViewFromNav('functionalAutomation')" class="not-active-continuousDelivery"><span
								class="fa fa-users"></span>Usability Automation</a></li>
						<li><a href="#" onclick="changeViewFromNav('uiAutomation')" class="not-active-continuousDelivery"><span
								class="fa fa-users"></span> UI Automation</a></li>
						<li><a href="#" onclick="changeViewFromNav('appiumGrid')" class="not-active-continuousDelivery"><span
								class="fa fa-users"></span> Appium Grid</a></li>
					   <li><a href="#" onclick="changeViewFromNav('IMTAFramework')" class="not-active-continuousDelivery"><span
								class="fa fa-users"></span> IMTAFramework</a></li>
								
								
									
									<!-- <li>
										<a href="#" onclick="changeViewFromNav('internetOfThing')"><span
								class="fa fa-users"></span> CGAF Perfecto</a>
									</li> -->
					</ul></li>


				<li class="xn-openable"><a href="#"><span
						class="fa fa-files-o"></span> <span class="xn-text">Dashboard
							& Monitoring</span></a>
					<ul>
						 <li><a href="#"
							onclick="changeViewFromNav('EnvironmentSetUp')"><span
								class="fa fa-image"></span> Enviornment Setup</a></li>
					<!--	<li><a href="#" onclick="changeViewFromNav('dashboard')"><span
								class="fa fa-user"></span> Dashboard</a></li> -->
					<!--	<li><a href="#"
							onclick="changeViewFromNav('predictiveAnalysis')"><span
								class="fa fa-users"></span>Analytics Driven Plan</a></li> -->
					</ul></li>
					
					<c:if test="${sessionScope.rolename == 'ADMIN'}">
					<li class="xn-openable"><a href="#"><span
						class="fa fa-files-o"></span> <span class="xn-text">Admin Operations</span></a>
					<ul>
						<li><a href="#"
							onclick="changeViewFromNav('Projects')"><span
								class="fa fa-image"></span>Projects</a></li>
						
						<li class="xn-openable"><a href="#"><span
										class="fa fa-pencil"></span> <span class="xn-text">Users</span></a>
									<ul>
										<li><a
											href="${pageContext.request.contextPath}/integratedQALabs/mobileLab/deviceSelectionMatrix/viewUser"><span
												class="fa fa-tasks"></span>View User</a></li>
										<li><a
											href="${pageContext.request.contextPath}/integratedQALabs/mobileLab/deviceSelectionMatrix/beforeAddUser"><span
												class="fa fa-user"></span>Add User</a></li>
									</ul></li>
						<li class="xn-openable"><a href="#"><span
										class="fa fa-pencil"></span> <span class="xn-text">Projects</span></a>
									<ul>
										<li><a
											href="${pageContext.request.contextPath}/integratedQALabs/mobileLab/deviceSelectionMatrix/viewProjects"><span
												class="fa fa-tasks"></span>View Projects</a></li>
										<li><a
											href="${pageContext.request.contextPath}/integratedQALabs/mobileLab/deviceSelectionMatrix/beforeAddProject"><span
												class="fa fa-user"></span>Add Project</a></li>
									</ul></li>
						
					</ul>
					
					
					</li>	
					</c:if>
			 
				<li class="xn-search" onclick="startConverting();">
					<form role="form">
						<input type="text" name="search"
							placeholder="Voice/Text Search..." size="15"  />
					</form>
				</li>
				
				<!-- SIGN OUT -->
				<li class="xn-icon-button pull-right" style="padding-top: 15px">
					<h4 style="color: white;">	${sessionScope.userName }
				<a href="#"
					class="mb-control" data-box="#mb-signout"><span
						class="fa fa-sign-out"></span></a></h4></li>
				<!-- END SEARCH -->

						</ul>
	<!-- MESSAGE BOX-->
	<div class="message-box animated fadeIn" data-sound="alert"
		id="mb-signout">
		<div class="mb-container">
			<div class="mb-middle">
				<div class="mb-title">
					<span class="fa fa-sign-out"></span> Log <strong>Out</strong> ?
				</div>
				<div class="mb-content">
					<p>Are you sure you want to log out?</p>
					<p>Press No if youwant to continue work. Press Yes to logout
						current user.</p>
				</div>
				<div class="mb-footer">
					<div class="pull-right">
						<a href="${pageContext.request.contextPath}/logout"
							class="btn btn-success btn-lg">Yes</a>
						<button class="btn btn-default btn-lg mb-control-close">No</button>
					</div>
				</div>
			</div>
		</div>
	</div>			

	
</div>
</div>