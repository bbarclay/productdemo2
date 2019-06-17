<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<script type="text/javascript">

			var r = document.getElementById('result');

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
					alert("browser support agalla  !!!!");
					r.innerHTML = 'Your browser is not supported. If google chrome, please upgrade!';
				}
			}
	</script>



<div data-ng-controller="">
	<nav
		class="navbar navbar-default navbar-fixed-top nav-justified navBGColor navDistFromTop navFontSize"
		role="navigation col-sm-12 col-md-12">
		<div class="container-fluid col-sm-11 col-md-11" >
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					data-ng-click="displayPopUP()">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav nav-pills nav-justified">
					<li class="dropdown with-dropdown">
						<a class="dropdown-toggle whiteTextColor" data-toggle="dropdown"> Digi Smart Lab<span class="caret"></span>
						</a>
						<div class="dropdown-content dropdown-menu show marginLeft80px">
							<div>
								<ul class="list-unstyled">
									<li>
										<a href="#" onclick="changeViewFromNav('mobile')"><%-- <img src="${pageContext.request.contextPath}/styles/images/tooltip/mobileLab_tooltip.png" class="navImgResolution" /> --%> Mobile Lab</a>
									</li>
									<li>
										<a href="#" onclick="changeViewFromNav('cloud')"><%-- <img src="${pageContext.request.contextPath}/styles/images/tooltip/cloud_tooltip.png" class="navImgResolution" /> --%> Cloud Testing</a>
									</li>
									<li>
										<a href="#" onclick="changeViewFromNav('iot')"><%-- <img src="${pageContext.request.contextPath}/styles/images/tooltip/iot_tooltip.png" class="navImgResolution" /> --%> IOT</a>
									</li>
									<li>
										<a href="#" onclick="changeViewFromNav('paymentDevice')"><%-- <img src="${pageContext.request.contextPath}/styles/images/tooltip/paymentDevice_tooltip.png" class="navImgResolution" /> --%> Payment Device</a>
									</li>
								</ul>
							</div>
						</div>
					</li>
					<!-- Split button Angular Dropdown -->
					<li class="dropdown with-dropdown ">
						<a class="dropdown-toggle whiteTextColor" data-toggle="dropdown"
							data-ng-click="changeViewFromNav('qaService')"> Digital QA
								Services<span class="caret"></span>
						</a>
						<div class="dropdown-content dropdown-menu show marginLeft80px">
							<%-- <div>
								<ul class="list-unstyled">
									<li>
										<a href="#" onclick="changeViewFromNav('userExperienceTesting')"><img src="${pageContext.request.contextPath}/styles/images/tooltip/userExperience_tooltip.png" class="navImgResolution" /> User Experience Testing</a>
									</li>
									<li>
										<a href="#" onclick="changeViewFromNav('mobileAppsTesting')"><img src="${pageContext.request.contextPath}/styles/images/tooltip/mobileApplication_tooltip.png" class="navImgResolution" /> Mobile Apps Testing</a>
									</li>
									<li>
										<a href="#" onclick="changeViewFromNav('accessibilityTesting')"><img src="${pageContext.request.contextPath}/styles/images/tooltip/accessibility_tooltip.png" class="navImgResolution" /> Accessibility Testing</a>
									</li>
									<li>
										<a href="#" onclick="changeViewFromNav('crossBrowserTesting')"><img src="${pageContext.request.contextPath}/styles/images/tooltip/crossBrowserTesting_tooltip.png" class="navImgResolution" /> Cross Browser Testing</a>
									</li>
									<li>
										<a href="#" onclick="changeViewFromNav('digitalPaymentTesting')"><img src="${pageContext.request.contextPath}/styles/images/tooltip/digitalPaymentTesting_tooltip.png" class="navImgResolution" /> Digital Payment Testing</a>
									</li>
									<li>
										<a href="#" onclick="changeViewFromNav('performanceTesting')"><img src="${pageContext.request.contextPath}/styles/images/tooltip/performance_tooltip.png" class="navImgResolution" /> Performance Testing</a>
									</li>
									<li>
										<a href="#" onclick="changeViewFromNav('securityTesting')"><img src="${pageContext.request.contextPath}/styles/images/tooltip/security_tooltip.png" class="navImgResolution" /> Security Testing</a>
									</li>
									<li>
										<a href="#" onclick="changeViewFromNav('contentManagementSystemTesting')"><img src="${pageContext.request.contextPath}/styles/images/tooltip/cms_tooltip.png" class="navImgResolution" /> Content Management System Testing</a>
									</li>
									<li>
										<a href="#" onclick="changeViewFromNav('businessProcessTesting')"><img src="${pageContext.request.contextPath}/styles/images/tooltip/bpt_tooltip.png" class="navImgResolution" /> Business Process Testing</a>
									</li>
									<li>
										<a href="#" onclick="changeViewFromNav('customerRelationshipManagementTesting')"><img src="${pageContext.request.contextPath}/styles/images/tooltip/crm_tooltip.png" class="navImgResolution" /> Customer Relation Management Testing</a>
									</li>
									<li>
										<a href="#" onclick="changeViewFromNav('internetOfThing')"><img src="${pageContext.request.contextPath}/styles/images/tooltip/iot_tooltip.png" class="navImgResolution" /> Internet Of Things</a>
									</li>
									<li>
										<a href="#" onclick="changeViewFromNav('mobileCertification')"><img src="${pageContext.request.contextPath}/styles/images/tooltip/mobileCertification_tooltip.png" class="navImgResolution" /> Mobile Certification Testing </a>
									</li>
								</ul>
							</div> --%>
							<div>
								<ul class="list-unstyled">
									<li class="greybg">User Experience Testing</li>
									<li>
										<a href="#" onclick="changeViewFromNav('userExperienceAnalytics')"> User Experience Analytics </a>
									</li>
									<li>
										<a href="#" onclick="changeViewFromNav('sentimentAnalytics')"> Sentiment Analytics </a>
									</li>
									<li>
										<a href="#" onclick="changeViewFromNav('accessibilityTesting')"> Accessibility Testing</a>
									</li>
									 <li class="divider"></li>
									 <li class="greybg"">Digital Channels Testing</li>
									<li>
										<a href="#" onclick="changeViewFromNav('mobileAppsTesting')"> Mobile Apps Testing</a>
									</li>
									<li>
										<a href="#" onclick="changeViewFromNav('crossBrowserTesting')"> Cross Browser Testing</a>
									</li>
									<li>
										<a href="#" onclick="changeViewFromNav('mobileCertificationTesting')"> Mobile Certification Testing </a>
									</li>
									<li>
										<a href="#" onclick="changeViewFromNav('digitalPaymentTesting')"> Digital Payments Testing</a>
									</li>
									<li>
										<a href="#" onclick="changeViewFromNav('internetOfThing')"> IOT Testing</a>
									</li>
									<li>
										<a href="#" onclick="changeViewFromNav('documentTesting')"> Document Testing</a>
									</li>
									 <li class="divider"></li>
									 <li class="greybg">Digital NFT</li>
									<li>
										<a href="#" onclick="changeViewFromNav('performanceTesting')"> Performance Testing</a>
									</li>
									<li>
										<a href="#" onclick="changeViewFromNav('securityTesting')"> Security Testing </a>
									</li>
								</ul>
							</div>
						</div>
					</li>
					<li class="dropdown with-dropdown">
						<a class="dropdown-toggle whiteTextColor" data-toggle="dropdown"
							data-ng-click="goToQALab();"> Continuous Delivery<span
							class="caret"></span>
						</a>
						<div class="dropdown-content dropdown-menu show marginLeft80px">
							<div>
								<ul class="list-unstyled">
									<li>
										<a href="#" onclick="changeViewFromNav('bddAutomation')"><%-- <img src="${pageContext.request.contextPath}/styles/images/tooltip/bddAutomation_tooltip.png" class="navImgResolution" /> --%> BDD Automation</a>
									</li>
									<li>
										<a href="#" onclick="changeViewFromNav('serviceAutomation')"><%-- <img src="${pageContext.request.contextPath}/styles/images/tooltip/serviceAutomation_tooltip.png" class="navImgResolution" /> --%> Service Automation</a>
									</li>
									<li>
										<a href="#" onclick="changeViewFromNav('crossBrowser')"><%-- <img src="${pageContext.request.contextPath}/styles/images/tooltip/crossBrowserAutomation_tooltip.png" class="navImgResolution" /> --%> Cross Browser Automation</a>
									</li>
									<li>
										<a href="#" onclick="changeViewFromNav('functionalAutomation')"><%-- <img src="${pageContext.request.contextPath}/styles/images/tooltip/functional_Automation_tooltip.png" class="navImgResolution" /> --%> Usability Automation</a>
									</li>
									<li>
										<a href="#" onclick="changeViewFromNav('uiAutomation')"><%-- <img src="${pageContext.request.contextPath}/styles/images/tooltip/uiAutomation_tooltip.png" class="navImgResolution" /> --%> UI Automation</a>
									</li>
								</ul>
							</div>
						</div>
					</li>
					
					<li class="dropdown with-dropdown">
						<a class="dropdown-toggle whiteTextColor" data-toggle="dropdown"
							data-ng-click="goToQALab();"> Dashboard & Monitoring<span
								class="caret"></span>
						</a>
						
						<div class="dropdown-content dropdown-menu show marginLeft80px">
							<div>
								<ul class="list-unstyled">
								<li>
										<a href="#" onclick="changeViewFromNav('EnvironmentSetUp')">Environment Set Up</a>
									</li>
									<%-- <a href="http://in-pnq-coe01/QvAJAXZfc/opendoc.htm?document=DigiAssure.qvw&host=QVS%40in-pnq-coe01" target="_blank"><img src="${pageContext.request.contextPath}/styles/images/tooltip/dashboard_tooltip.png" class="navImgResolution" /> Dashboard</a> --%>
									<li>
										<a href="#" onclick="changeViewFromNav('dashboard')">Dashboard</a>
									</li>
									<%-- <li>
										<a href="#" onclick="changeViewFromNav('testCoverage')"><img src="${pageContext.request.contextPath}/styles/images/tooltip/testCoverage_tooltip.png" class="navImgResolution" /> Test Coverage</a>
									</li> --%>
									<li>
										<a href="#" onclick="changeViewFromNav('predictiveAnalysis')"><%-- <img src="${pageContext.request.contextPath}/styles/images/tooltip/predictive_tooltip.png" class="navImgResolution" /> --%> Predictive Analysis</a>
									</li>
								
								</ul>
							</div>
						</div>
					</li>
					
					<!-- <li><div id="result"></div> -->
					<!-- <button onclick="startConverting();" class="btn btn-primary "><i class="fa fa-microphone" aria-hidden="true"></i></button> 
					</li> -->
				</ul>
			</div>
			
		</div>
		<div class="col-sm-1 col-md-1 marginTop5px" id="result"><button onclick="startConverting();" class="btn btn-primary "><i class="fa fa-microphone" aria-hidden="true"></i></button></div>
	</nav>
</div>
