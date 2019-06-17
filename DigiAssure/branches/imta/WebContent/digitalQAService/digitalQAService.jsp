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
		        <div class="col-sm-3 paddingRight0px paddingLeft0px">
		            <div class="userExperience">
		                <div class="paddingTop50px"></div>
		                <img src="../styles/images/tooltip/userExperience_tooltip.png" class="mobileLabImg" />
		               <!--  <img src="styles/images/qa_lab_final.png" class="panelImg img-responsive"/> -->
		                <div class="panelContent">
		                    <h3><a href="${pageContext.request.contextPath}/digitalQAService/userExperienceTesting/userExperienceTesting.jsp">User Experience Testing</a></h3>
		                </div>
		            </div>
		        </div>
		        <div class="col-sm-3 paddingRight0px paddingLeft0px">
		            <div class="mobileAppTesting">
		                <div class="paddingTop50px"></div>
		                <!-- <img src="styles/images/digital__qa_testing_final.png" class="panelImg img-responsive"/> -->
		                <img src="../styles/images/tooltip/mobileApplication_tooltip.png" class="mobileLabImg" />
		                <div class="panelContent">
		                    <h3><a href="javascript:void(0)" class="blackTextColor" onclick="changeView('digitalQAService')">Mobile App Testing</a></h3>
		                    
		                </div>
		            </div>
			        
		        </div>
		        <div class="col-sm-3 paddingRight0px paddingLeft0px">
			            <div class="webAppTesting">
			                <div class="paddingTop50px"></div>
			                <!-- <img src="styles/images/continuousDelivery_final.png" class="panelImg img-responsive"/> -->
			                <img src="../styles/images/tooltip/accessibility_tooltip.png" class="mobileLabImg" />
			                <div class="panelContent">
			                    <h3><a href="javascript:void(0)" class="blackTextColor" onclick="changeView('continuousDelivery')">Accessibility Testing</a></h3>
			                    
			                </div>
			            </div>
			        </div>
			        <div class="col-sm-3 paddingRight0px paddingLeft0px">
			            <div class="crossBrowserTesting">
			                <div class="paddingTop50px"></div>
			               <!--  <img src="styles/images/dashboard_final.png" class="panelImg img-responsive"/> -->
			               <img src="../styles/images/tooltip/crossBrowserTesting_tooltip.png" class="mobileLabImg" />
			                <div class="panelContent">
			                    <h3> <a href="javascript:void(0)" class="blackTextColor" onclick="changeView('dashboard')">Cross Browser Testing</a></h3>
			                   
			                </div>
			            </div>
			        </div>
		    </div>
		    
		    
		    <div class="row">
		        <div class="col-sm-3 paddingRight0px paddingLeft0px">
		            <div class="cmsTesting">
		                <div class="paddingTop50px"></div>
		               <img src="../styles/images/tooltip/cms_tooltip.png" class="mobileLabImg" />
		                <div class="panelContent">
		                    <h3><a href="javascript:void(0)" class="blackTextColor" onclick="changeView('integratedQALab')"><p>Content Management</p><p>System Testing</p></a></h3>
		                </div>
		            </div>
		        </div>
		        <div class="col-sm-3 paddingRight0px paddingLeft0px">
		            <div class="bptTesting">
		                <div class="paddingTop50px"></div>
		                <img src="../styles/images/tooltip/bpt_tooltip.png" class="mobileLabImg" />
		                <div class="panelContent">
		                    <h3><a href="javascript:void(0)" class="blackTextColor" onclick="changeView('digitalQAService')">Business Process Testing</a></h3>
		                    
		                </div>
		            </div>
			        
		        </div>
		        <div class="col-sm-3 paddingRight0px paddingLeft0px">
			            <div class="crmTesting">
			                <div class="paddingTop50px"></div>
			                <img src="../styles/images/tooltip/crm_tooltip.png" class="mobileLabImg" />
			                <div class="panelContent">
			                    <h3><a href="javascript:void(0)" class="blackTextColor" onclick="changeView('continuousDelivery')"><p>Customer Relationship</p><p> Management Testing</p></a></h3>
			                    
			                </div>
			            </div>
			        </div>
			        <div class="col-sm-3 paddingRight0px paddingLeft0px">
			            <div class="iotDigitalQAService">
			                <div class="paddingTop50px"></div>
			              <img src="../styles/images/tooltip/iot_tooltip.png" class="mobileLabImg" />
			                <div class="panelContent">
			                    <h3> <a href="javascript:void(0)" class="blackTextColor" onclick="changeView('dashboard')">Internet of Things</a></h3>
			                   
			                </div>
			            </div>
			        </div>
		    </div>
		    
		    
		    
		    <div class="row">
		        <div class="col-sm-3 paddingRight0px paddingLeft0px">
		            <div class="digitalPaymentTesting">
		                <div class="paddingTop50px"></div>
		               	<img src="../styles/images/tooltip/digitalPaymentTesting_tooltip.png" class="mobileLabImg" />
		                <div class="panelContent">
		                    <h3><a href="javascript:void(0)" class="blackTextColor" onclick="changeView('integratedQALab')">Digital Payment Testing</a></h3>
		                </div>
		            </div>
		        </div>
		        <div class="col-sm-3 paddingRight0px paddingLeft0px">
		            <div class="performanceTesting">
		                <div class="paddingTop50px"></div>
		               <img src="../styles/images/tooltip/performance_tooltip.png" class="mobileLabImg" />
		                <div class="panelContent">
		                    <h3><a href="javascript:void(0)" class="blackTextColor" onclick="changeView('digitalQAService')">Performance Testing</a></h3>
		                    
		                </div>
		            </div>
			        
		        </div>
		        <div class="col-sm-3 paddingRight0px paddingLeft0px">
		            <div class="securityTesting">
		                <div class="paddingTop50px"></div>
		                <img src="../styles/images/tooltip/security_tooltip.png" class="mobileLabImg" />
		                <div class="panelContent">
		                    <h3><a href="javascript:void(0)" class="blackTextColor" onclick="changeView('continuousDelivery')">Security Testing</a></h3>
		                    
		                </div>
		            </div>
		        </div>
		        <div class="col-sm-3 paddingRight0px paddingLeft0px">
		            <div class="mobileCertificationTesting">
		                <div class="paddingTop50px"></div>
		                <img src="../styles/images/tooltip/mobileCertification_tooltip.png" class="mobileLabImg" />
		                <div class="panelContent">
		                    <h3><a href="javascript:void(0)" class="blackTextColor" onclick="changeView('continuousDelivery')">Mobile Certification Testing</a></h3>
		                    
		                </div>
		            </div>
		        </div>
		    </div>
		    
		
		
		</div>
		
		
		<!-- <div class="container">
			<div class="row">
				<div class="userExperience paddingBottom15px">
					<div class="col-sm-4 paddingTop50px ">
						<img src="../styles/images/user_experience.jpg" class="mobileLabImg" />
					</div>
					<div class="col-sm-8 panelContent marginTop15px">
						<h1>User Experience Testing</h1>
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
				<div class="mobileAppTesting paddingTop50px paddingBottom15px">
					<div class="col-sm-4">
						<img src="../styles/images/mobile_app_testing.jpg" class="mobileLabImg" />
					</div>

					<div class="col-sm-8 panelContent text-left">
						<h1>Mobile App Testing</h1>
						<div class="marginTop50px"></div>
						<button
							class="btn btn-info marginTop15px bgWhite blackTextColor opacityPt5">Continue</button>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">

				<div class="webAppTesting paddingTop50px paddingBottom15px">
					<div class="col-sm-4">
						<img src="../styles/images/web_app_testing.jpg" class="mobileLabImg" />
					</div>

					<div class="col-sm-8 panelContent text-left">
						<h1>Web App Testing</h1>
						<div class="marginTop50px"></div>
						<button
							class="btn btn-info marginTop15px bgWhite blackTextColor opacityPt5">Continue</button>
					</div>
				</div>

			</div>
		</div>
		<div class="container">
			<div class="row">

				<div class="crossBrowserTesting paddingTop50px paddingBottom15px">
					<div class="col-sm-4">
						<img src="../styles/images/cross_browser_testing.jpg"
							class="mobileLabImg" />
					</div>

					<div class="col-sm-8 panelContent text-left">
						<h1>Cross Browser Testing</h1>
						<div class="marginTop50px"></div>
						<button
							class="btn btn-info marginTop15px bgWhite blackTextColor opacityPt5">Continue</button>
					</div>
				</div>
			</div>
		</div>
		
		
		
		
		
		<div class="container">
			<div class="row">

				<div class="digitalPaymentSystem paddingTop50px paddingBottom15px">
					<div class="col-sm-4">
						<img src="../styles/images/digital_payment_system.jpg"
							class="mobileLabImg" />
					</div>
					<div class="col-sm-8 panelContent text-left">
						<h1>Digital Payment System</h1>
						<div class="marginTop50px"></div>
						<button
							class="btn btn-info marginTop15px bgWhite blackTextColor opacityPt5">Continue</button>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="performanceTesting paddingTop50px paddingBottom15px">
					<div class="col-sm-4">
						<img src="../styles/images/performance_testing.png" class="mobileLabImg" />
					</div>

					<div class="col-sm-8 panelContent text-left">
						<h1>Performance Testing</h1>
						<div class="marginTop50px"></div>
						<button
							class="btn btn-info marginTop15px bgWhite blackTextColor opacityPt5">Continue</button>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">

				<div class="securityTesting paddingTop50px paddingBottom15px">
					<div class="col-sm-4">
						<img src="../styles/images/security.jpg" class="mobileLabImg" />
					</div>

					<div class="col-sm-8 panelContent text-left">
						<h1>Security Testing</h1>
						<div class="marginTop50px"></div>
						<button
							class="btn btn-info marginTop15px bgWhite blackTextColor opacityPt5">Continue</button>
					</div>
				</div>

			</div>
		</div>
		
		<div class="container">
			<div class="row">

				<div class="cmsTesting paddingTop50px paddingBottom15px">
					<div class="col-sm-4">
						<img src="../styles/images/content_management_system_testing.png"
							class="mobileLabImg" />
					</div>

					<div class="col-sm-8 panelContent text-left">
						<h1>Content Management System Testing</h1>
						<div class="marginTop50px"></div>
						<button
							class="btn btn-info marginTop15px bgWhite blackTextColor opacityPt5">Continue</button>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">

				<div class="bptTesting paddingTop50px paddingBottom15px">
					<div class="col-sm-4">
						<img src="../styles/images/business_process_testing.jpg"
							class="mobileLabImg" />
					</div>
					<div class="col-sm-8 panelContent text-left">
						<h1>Business Process Testing</h1>
						<div class="marginTop50px"></div>
						<button
							class="btn btn-info marginTop15px bgWhite blackTextColor opacityPt5">Continue</button>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="crmTesting paddingTop50px paddingBottom15px">
					<div class="col-sm-4">
						<img src="../styles/images/customer_relationship_management.jpg" class="mobileLabImg" />
					</div>

					<div class="col-sm-8 panelContent text-left">
						<h1>Customer Relationship Management Testing</h1>
						<div class="marginTop50px"></div>
						<button
							class="btn btn-info marginTop15px bgWhite blackTextColor opacityPt5">Continue</button>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">

				<div class="iotDigitalQAService paddingTop50px paddingBottom15px">
					<div class="col-sm-4">
						<img src="../styles/images/iot_2.jpg" class="mobileLabImg" />
					</div>

					<div class="col-sm-8 panelContent text-left">
						<h1>Internet of Things</h1>
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