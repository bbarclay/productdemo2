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
							window.location.href=a+'/integratedQALabs/mobileLab/deviceSelectionMatrix/DSGlobalPage';	
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


<div class="page-sidebar">
			<!-- START X-NAVIGATION -->
			<ul class="x-navigation">
				<li class="xn-logo">
					<a
					href="./" class="x-navigation-control"><img class="capgeminiLogo" src="${pageContext.request.contextPath}/styles/images/capgemini.png" ></a></li>
				<li class="xn-profile"><a href="#" class="profile-mini"> <img
						src="assets/images/users/avatar.jpg" alt="John Doe" />
				</a>
					<div class="profile">
						<div class="profile-data">
							<div class="profile-data-name">${sessionScope.userName }</div>
							<div class="profile-data-title">${sessionScope.rolename }</div>
						</div>
					</div></li>

				<li class="xn-openable"><a href="#"><span
						class="fa fa-files-o"></span> <span class="xn-text">Digi
							Smart Lab</span></a>
					<ul>
						<li><a href="#" onclick="changeViewFromNav('mobile')"><span
								class="fa fa-image"></span> Mobile Lab</a></li>
						<li><a href="#" onclick="changeViewFromNav('cloud')"><span
								class="fa fa-user"></span> Cloud Testing</a></li>
						<li><a href="#" onclick="changeViewFromNav('iot')"><span
								class="fa fa-users"></span> IOT</a></li>
						<li><a href="#" onclick="changeViewFromNav('paymentDevice')"><span
								class="fa fa-users"></span> Payment Device</a></li>
					</ul></li>
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
								<li><a href="#"
									onclick="changeViewFromNav('mobileCertificationTesting')">Mobile
										Certification Testing</a></li>
								<li><a href="#"
									onclick="changeViewFromNav('digitalPaymentTesting')">Digital
										Payment Testing</a></li>
								<li><a href="#"
									onclick="changeViewFromNav('internetOfThing')">IOT Testing</a></li>
							</ul></li>


						<li class="xn-openable"><a href="#"><span
								class="fa fa-file-text-o"></span> <span class="xn-text">Digital
									NFT</span></a>
							<ul>
								<li><a href="#"
									onclick="changeViewFromNav('performanceTesting')">Performance
										Testing </a></li>
								<li><a href="#"
									onclick="changeViewFromNav('securityTesting')">Security
										Testing</a></li>

							</ul></li>
					</ul></li>


				<li class="xn-openable"><a href="#"><span
						class="fa fa-files-o"></span> <span class="xn-text">Continuous
							Delivery</span></a>
					<ul>
						<li><a href="#" onclick="changeViewFromNav('bddAutomation')"><span
								class="fa fa-image"></span> BDD Automation</a></li>
						<li><a href="#"
							onclick="changeViewFromNav('serviceAutomation')"><span
								class="fa fa-user"></span> Services Automation</a></li>
						<li><a href="#" onclick="changeViewFromNav('crossBrowser')"><span
								class="fa fa-users"></span> Cross Browser Automation</a></li>
						<li><a href="#"
							onclick="changeViewFromNav('functionalAutomation')"><span
								class="fa fa-users"></span> Functional Automation</a></li>
						<li><a href="#" onclick="changeViewFromNav('uiAutomation')"><span
								class="fa fa-users"></span> UI Automation</a></li>
					</ul></li>


				<li class="xn-openable"><a href="#"><span
						class="fa fa-files-o"></span> <span class="xn-text">Dashboard
							& Monitoring</span></a>
					<ul>
						<li><a href="#"
							onclick="changeViewFromNav('EnvironmentSetUp')"><span
								class="fa fa-image"></span> Enviornment Setup</a></li>
						<li><a href="#" onclick="changeViewFromNav('dashboard')"><span
								class="fa fa-user"></span> Dashboard</a></li>
						<li><a href="#"
							onclick="changeViewFromNav('predictiveAnalysis')"><span
								class="fa fa-users"></span>Predictive Analysis</a></li>
					</ul></li>
			</ul>
			<!-- END X-NAVIGATION -->
		</div>
		<!-- END PAGE SIDEBAR -->




		<div class="col-sm-1 col-md-1 marginTop5px" id="result"><button onclick="startConverting();" class="btn btn-primary "><i class="fa fa-microphone" aria-hidden="true"></i></button></div>

