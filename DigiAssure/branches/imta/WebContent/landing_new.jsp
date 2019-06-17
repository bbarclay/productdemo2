<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file = "DigiChatBot.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- META SECTION -->
<title>IMTA Home</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />


<link rel="icon" href="favicon.ico" type="image/x-icon" />






<!-- END META SECTION -->


<!-- CSS INCLUDE -->
<!-- <link rel="stylesheet" href="./styles/css/bootstrap.css">

<link rel="stylesheet" href="./styles/css/digi.css">
<link rel="stylesheet" type="text/css" id="theme"
	href="css/theme-default.css" />
	<link rel="stylesheet" href="./styles/css/main.css"> -->
<!-- EOF CSS INCLUDE -->


<!-- JS INCLUDE -->

<script src="vendor/jquery/dist/jquery.js"></script>
<script src="vendor/angular/angular.js"></script>
<script src="vendor/angular-ui-router/release/angular-ui-router.js"></script>
<script src="vendor/angular-route/angular-route.js"></script>
<script src="vendor/angular-ui-bootstrap-bower/ui-bootstrap.js"></script>
<script src="vendor/angular-ui-bootstrap-bower/ui-bootstrap-tpls.js"
	type="text/javascript"></script>
<script src="vendor/bootstrap/dist/js/bootstrap.js"></script>
<script src="js/app/app.js"></script>
<script src="js/main.js"></script>
<script type="text/javascript">
	$(function() {
		$('#carousel-example-generic').carousel({
			interval : 5000
		});

		var i;

		$('.carousel-control').on("mouseover", function() {
			var control = $(this), interval = 2000;

			i = setInterval(function() {
				control.trigger("click");
			}, interval);
		}).on("mouseout", function() {
			clearInterval(i);
		});

	});
</script>
<script type="text/javascript">
	$(function() {
		$('#carousel-example-generic').carousel({
			interval : 5000
		});

		var i;

		$('.carousel-control').on("mouseover", function() {
			var control = $(this), interval = 2000;

			i = setInterval(function() {
				control.trigger("click");
			}, interval);
		}).on("mouseout", function() {
			clearInterval(i);
		});

	});
</script>
<script type="text/javascript">
	function getContextPath() {
		return window.location.pathname.substring(0, window.location.pathname
				.indexOf("/", 2));
	}

	function openSentiment() {
		var a = getContextPath();
		window.location.href = a
				+ '/digitalQAService/userExperienceTesting/sentiment/detailReport.jsp';
	}
</script>




<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- chatbot  -->	

<!-- uncomment if bot doesn't work  
<style>
body {
  font-family: Arial, Helvetica, sans-serif;
  font-size: 20px;
}
</style>

-->
</head>
<body>



	<!-- START PAGE CONTAINER -->
<!-- 	<div class="page-container">

		
		<div class="page-content"> -->

			<!-- START X-NAVIGATION VERTICAL -->
			<%-- <ul class="x-navigation x-navigation-horizontal x-navigation-panel">
				<!-- TOGGLE NAVIGATION -->
			<!-- 	<li class="xn-icon-button"><a href="#"
					class="x-navigation-minimize"><span class="fa fa-dedent"></span></a>
				</li> -->
				<!-- END TOGGLE NAVIGATION -->
				<!-- SEARCH -->
				
				
				
				
				
				
				<li class="xn-logo">
					<img class="capgeminiLoginLogo" src="${pageContext.request.contextPath}/styles/images/capgemini.png" ></li>
				

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
			
				
				
				
				
				
				
				
				
				
				<li class="xn-search">
					<form role="form">
						<input type="text" name="search"
							placeholder="Voice/Text Search..." size="15" /> MIC
					</form>
				</li>
				
				<!-- SIGN OUT -->
				<li class="xn-icon-button pull-right" style="padding-top: 15px">
					<h4 style="color: white;">	${sessionScope.userName }
				<a href="#"
					class="mb-control" data-box="#mb-signout"><span
						class="fa fa-sign-out"></span></a></h4></li>
						</ul> --%>
			

	<jsp:include page="./common/logo.jsp"></jsp:include>
			<div class="marginTop15px"></div>
			<jsp:include page="./landing/landingCarousel.jsp"></jsp:include>

			<div class="marginTop15px"></div>
			<div class="marginTop15px"></div>


			<!-- CAROSUEL ENDING -->



			<!-- 			<!-- PAGE CONTENT WRAPPER -->
			<!-- 			<div class="page-content-wrap"> -->

			<!-- 				START WIDGETS -->
			<!-- 				<div class="row"> -->
			<!-- 					<div class="col-md-3"> -->

			<!-- 						START WIDGET SLIDER -->
			<!-- 						<div class="widget widget-default widget-carousel"> -->
			<!-- 							<div class="owl-carousel" id="owl-example"> -->
			<!-- 								<div> -->
			<!-- 									<div class="widget-title">Total Visitors</div> -->
			<!-- 									<div class="widget-subtitle">27/08/2014 15:23</div> -->
			<!-- 									<div class="widget-int">3,548</div> -->
			<!-- 								</div> -->
			<!-- 								<div> -->
			<!-- 									<div class="widget-title">Returned</div> -->
			<!-- 									<div class="widget-subtitle">Visitors</div> -->
			<!-- 									<div class="widget-int">1,695</div> -->
			<!-- 								</div> -->
			<!-- 								<div> -->
			<!-- 									<div class="widget-title">New</div> -->
			<!-- 									<div class="widget-subtitle">Visitors</div> -->
			<!-- 									<div class="widget-int">1,977</div> -->
			<!-- 								</div> -->
			<!-- 							</div> -->
			<!-- 							<div class="widget-controls"> -->
			<!-- 								<a href="#" class="widget-control-right widget-remove" -->
			<!-- 									data-toggle="tooltip" data-placement="top" -->
			<!-- 									title="Remove Widget"><span class="fa fa-times"></span></a> -->
			<!-- 							</div> -->
			<!-- 						</div> -->
			<!-- 						END WIDGET SLIDER -->

			<!-- 					</div> -->
			<!-- 					<div class="col-md-3"> -->

			<!-- 						START WIDGET MESSAGES -->
			<!-- 						<div class="widget widget-default widget-item-icon" -->
			<!-- 							onclick="location.href='pages-messages.html';"> -->
			<!-- 							<div class="widget-item-left"> -->
			<!-- 								<span class="fa fa-envelope"></span> -->
			<!-- 							</div> -->
			<!-- 							<div class="widget-data"> -->
			<!-- 								<div class="widget-int num-count">48</div> -->
			<!-- 								<div class="widget-title">New messages</div> -->
			<!-- 								<div class="widget-subtitle">In your mailbox</div> -->
			<!-- 							</div> -->
			<!-- 							<div class="widget-controls"> -->
			<!-- 								<a href="#" class="widget-control-right widget-remove" -->
			<!-- 									data-toggle="tooltip" data-placement="top" -->
			<!-- 									title="Remove Widget"><span class="fa fa-times"></span></a> -->
			<!-- 							</div> -->
			<!-- 						</div> -->
			<!-- 						END WIDGET MESSAGES -->

			<!-- 					</div> -->
			<!-- 					<div class="col-md-3"> -->

			<!-- 						START WIDGET REGISTRED -->
			<!-- 						<div class="widget widget-default widget-item-icon" -->
			<!-- 							onclick="location.href='pages-address-book.html';"> -->
			<!-- 							<div class="widget-item-left"> -->
			<!-- 								<span class="fa fa-user"></span> -->
			<!-- 							</div> -->
			<!-- 							<div class="widget-data"> -->
			<!-- 								<div class="widget-int num-count">375</div> -->
			<!-- 								<div class="widget-title">Registred users</div> -->
			<!-- 								<div class="widget-subtitle">On your website</div> -->
			<!-- 							</div> -->
			<!-- 							<div class="widget-controls"> -->
			<!-- 								<a href="#" class="widget-control-right widget-remove" -->
			<!-- 									data-toggle="tooltip" data-placement="top" -->
			<!-- 									title="Remove Widget"><span class="fa fa-times"></span></a> -->
			<!-- 							</div> -->
			<!-- 						</div> -->
			<!-- 						END WIDGET REGISTRED -->

			<!-- 					</div> -->
			<!-- 					<div class="col-md-3"> -->

			<!-- 						START WIDGET CLOCK -->
			<!-- <!-- 						<div class="widget widget-info widget-padding-sm"> -->
			<!-- <!-- 							<div class="widget-big-int plugin-clock">00:00</div> -->
			<!-- <!-- 							<div class="widget-subtitle plugin-date">Loading...</div> -->
			<!-- <!-- 							<div class="widget-controls"> -->
			<!-- <!-- 								<a href="#" class="widget-control-right widget-remove" -->
			<!-- <!-- 									data-toggle="tooltip" data-placement="left" -->
			<!-- <!-- 									title="Remove Widget"><span class="fa fa-times"></span></a> -->
			<!-- <!-- 							</div> -->
			<!-- <!-- 							<div class="widget-buttons widget-c3"> -->
			<!-- <!-- 								<div class="col"> -->
			<!-- <!-- 									<a href="#"><span class="fa fa-clock-o"></span></a> -->
			<!-- <!-- 								</div> -->
			<!-- <!-- 								<div class="col"> -->
			<!-- <!-- 									<a href="#"><span class="fa fa-bell"></span></a> -->
			<!-- <!-- 								</div> -->
			<!-- <!-- 								<div class="col"> -->
			<!-- <!-- 									<a href="#"><span class="fa fa-calendar"></span></a> -->
			<!-- <!-- 								</div> -->
			<!-- <!-- 							</div> -->
			<!-- <!-- 						</div> -->
			<!-- 						END WIDGET CLOCK -->

			<!-- 					</div> -->
			<!-- 				</div> -->
			<!-- END WIDGETS -->

			<div class="row">
				<div class="col-md-4">

					<!-- START USERS ACTIVITY BLOCK -->
					<div class="panel panel-default">
						<div class="panel-heading">
							<div class="panel-title-box">
								<h3>Digital QA Dashboard</h3>

							</div>
							<ul class="panel-controls" style="margin-top: 2px;">
								<li><a href="#" class="panel-fullscreen"><span
										class="fa fa-expand"></span></a></li>
								<li><a href="#" class="panel-refresh"><span
										class="fa fa-refresh"></span></a></li>
								<li class="dropdown">
									<!-- <a href="#" class="dropdown-toggle"
										data-toggle="dropdown"><span class="fa fa-cog"></span></a> -->
									<ul class="dropdown-menu">
										<li><a href="#" class="panel-collapse"><span
												class="fa fa-angle-down"></span> Collapse</a></li>
										<!-- <li><a href="#" class="panel-remove"><span
													class="fa fa-times"></span> Remove</a></li> -->
									</ul>
								</li>
							</ul>
						</div>
						<div class="panel-body padding-0">
							<div class="chart-holder" id="dashboard-bar-1">
								<a href="#" onclick="changeViewFromNav('dashboard')"> <img
									src="styles/images/digitalqa.png" height="400" width="315" />
								</a>
							</div>
						</div>
					</div>
					<!-- END USERS ACTIVITY BLOCK -->

				</div>
				<div class="col-md-4">

					<!-- START VISITORS BLOCK -->
					<div class="panel panel-default">
						<div class="panel-heading">
							<div class="panel-title-box">
								<h3>Mobile Lab</h3>

							</div>
							<ul class="panel-controls" style="margin-top: 2px;">
								<li><a href="#" class="panel-fullscreen"><span
										class="fa fa-expand"></span></a></li>
								<li><a href="#" class="panel-refresh"><span
										class="fa fa-refresh"></span></a></li>
								<li class="dropdown">
									<!-- 									<a href="#" class="dropdown-toggle" --> <!-- 										data-toggle="dropdown"><span class="fa fa-cog"></span></a> -->

									<ul class="dropdown-menu">
										<li><a href="#" class="panel-collapse"><span
												class="fa fa-angle-down"></span> Collapse</a></li>
										<li><a href="#" class="panel-remove"><span
												class="fa fa-times"></span> Remove</a></li>
									</ul>
								</li>
							</ul>
						</div>
						<div class="panel-body padding-0">
							<div>
								<a href="#" onclick="changeViewFromNav('mobile')"> <img
									src="styles/images/smartQALab.png" height="400" width="350" />
								</a>
							</div>
						</div>
					</div>
					<!-- MOBILE LAB BLOCK ENDS -->

				</div>

				<div class="col-md-4">

					<!-- SENTIMENT BLOCK STARTS -->
					<div class="panel panel-default" onclick="openSentiment()">
						<div class="panel-heading">
							<div class="panel-title-box">
								<h3>Sentiment Analysis</h3>
								<!-- 									<span>Projects activity</span> -->
							</div>
							<ul class="panel-controls" style="margin-top: 2px;">
								<li><a href="#" class="panel-fullscreen"><span
										class="fa fa-expand"></span></a></li>
								<li><a href="#" class="panel-refresh"><span
										class="fa fa-refresh"></span></a></li>
								<li class="dropdown">
									<ul class="dropdown-menu">
										<li><a href="#" class="panel-collapse"><span
												class="fa fa-angle-down"></span> Collapse</a></li>
										<li><a href="#" class="panel-remove"><span
												class="fa fa-times"></span> Remove</a></li>
									</ul>
								</li>
							</ul>
						</div>
						<div class="panel-body panel-body-table">

							<div class="table-responsive">
								<table class="table table-bordered table-striped">
									<thead>
										<tr>
											<th width="50%">Words</th>
											<th width="20%">Topic</th>
											<th width="30%">Progress</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td><strong>Crashing</strong></td>
											<td><span class="label label-danger" style="font-size: 12px">Error</span></td>
											<td>
												<div class="progress progress-small progress-striped active">
													<div class="progress-bar progress-bar-danger"
														role="progressbar" aria-valuenow="50" aria-valuemin="0"
														aria-valuemax="100" style="width: 85%;">85%</div>
												</div>
											</td>
										</tr>
										<tr>
											<td><strong>Sign Up & Login</strong></td>
											<td><span class="label label-danger" style="font-size: 12px">Error</span></td>
											<td>
												<div class="progress progress-small progress-striped active">
													<div class="progress-bar progress-bar-danger"
														role="progressbar" aria-valuenow="50" aria-valuemin="0"
														aria-valuemax="100" style="width: 40%;">20%</div>
												</div>
											</td>
										</tr>
										<tr>
											<td><strong>Performance</strong></td>
											<td><span class="label label-warning" style="font-size: 12px">Sentiment</span></td>
											<td>
												<div class="progress progress-small progress-striped active">
													<div class="progress-bar progress-bar-warning"
														role="progressbar" aria-valuenow="50" aria-valuemin="0"
														aria-valuemax="100" style="width: 72%;">72%</div>
												</div>
											</td>
										</tr>
										<tr>
											<td><strong>Design & UX</strong></td>
											<td><span class="label label-success" style="font-size: 12px">Sentiment</span></td>
											<td>
												<div class="progress progress-small progress-striped active">
													<div class="progress-bar progress-bar-success"
														role="progressbar" aria-valuenow="50" aria-valuemin="0"
														aria-valuemax="100" style="width: 60%;">60%</div>
												</div>
											</td>
										</tr>
										<tr>
											<td><strong>Discounts</strong></td>
											<td><span class="label label-success" style="font-size: 12px">Offers</span></td>
											<td>
												<div class="progress progress-small progress-striped active">
													<div class="progress-bar progress-bar-success"
														role="progressbar" aria-valuenow="50" aria-valuemin="0"
														aria-valuemax="100" style="width: 90%;">90%</div>
												</div>
											</td>
										</tr>
										<tr>
											<td><strong>Location Services</strong></td>
											<td><span class="label label-warning" style="font-size: 12px">Topics</span></td>
											<td>
												<div class="progress progress-small progress-striped active">
													<div class="progress-bar progress-bar-warning"
														role="progressbar" aria-valuenow="50" aria-valuemin="0"
														aria-valuemax="100" style="width: 72%;">42%</div>
												</div>
											</td>
										</tr>
										<tr>
											<td><strong>Bug</strong></td>
											<td><span class="label label-danger" style="font-size: 12px">Error</span></td>
											<td>
												<div class="progress progress-small progress-striped active">
													<div class="progress-bar progress-bar-danger"
														role="progressbar" aria-valuenow="50" aria-valuemin="0"
														aria-valuemax="100" style="width: 72%;">22%</div>
												</div>
											</td>
										</tr>
										<tr>
											<td><strong>Battery Drains</strong></td>
											<td><span class="label label-warning" style="font-size: 12px">Error</span></td>
											<td>
												<div class="progress progress-small progress-striped active">
													<div class="progress-bar progress-bar-warning"
														role="progressbar" aria-valuenow="50" aria-valuemin="0"
														aria-valuemax="100" style="width: 72%;">12%</div>
												</div>
											</td>
										</tr>
										<tr>
											<td><strong>Satisfied Users</strong></td>
											<td><span class="label label-success" style="font-size: 12px">Sentiment</span></td>
											<td>
												<div class="progress progress-small progress-striped active">
													<div class="progress-bar progress-bar-success"
														role="progressbar" aria-valuenow="50" aria-valuemin="0"
														aria-valuemax="100" style="width: 72%;">72%</div>
												</div>
											</td>
										</tr>
										<tr>
											<td><strong>Failed</strong></td>
											<td><span class="label label-danger" style="font-size: 12px">Errors</span></td>
											<td>
												<div class="progress progress-small progress-striped active">
													<div class="progress-bar progress-bar-danger"
														role="progressbar" aria-valuenow="50" aria-valuemin="0"
														aria-valuemax="100" style="width: 72%;">32%</div>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
							</div>

						</div>
					</div>
					<!-- END PROJECTS BLOCK -->

				</div>
			</div>

			<div class="row">
			
			
			<div class="col-md-8">

					
					<div class="panel panel-default">
						<div class="panel-heading">
							<div class="panel-title-box">
								<h3>User Trends</h3>

							</div>
							<ul class="panel-controls" style="margin-top: 2px;">
								<li><a href="#" class="panel-fullscreen"><span
										class="fa fa-expand"></span></a></li>
								<li><a href="#" class="panel-refresh"><span
										class="fa fa-refresh"></span></a></li>
								<li class="dropdown">
									<!-- 									<a href="#" class="dropdown-toggle" --> <!-- 										data-toggle="dropdown"><span class="fa fa-cog"></span></a> -->

									<ul class="dropdown-menu">
										<li><a href="#" class="panel-collapse"><span
												class="fa fa-angle-down"></span> Collapse</a></li>
										<li><a href="#" class="panel-remove"><span
												class="fa fa-times"></span> Remove</a></li>
									</ul>
								</li>
							</ul>
						</div>
						<div class="panel-body padding-0">
							<div>
								<a href="#" onclick="changeViewFromNav('userExperienceAnalytics')"> <img
									src="styles/images/userex.png"  style="max-height: 100%;max-width: 100%;" />
								</a>
							</div>
						</div>
					</div>
					

				</div>
			
			
			
			<div class="col-md-4">

					
					<div class="panel panel-default">
						<div class="panel-heading">
							<div class="panel-title-box">
								<h3>User Experience Analytics</h3>

							</div>
							<ul class="panel-controls" style="margin-top: 2px;">
								<li><a href="#" class="panel-fullscreen"><span
										class="fa fa-expand"></span></a></li>
								<li><a href="#" class="panel-refresh"><span
										class="fa fa-refresh"></span></a></li>
								<li class="dropdown">
									<!-- 									<a href="#" class="dropdown-toggle" --> <!-- 										data-toggle="dropdown"><span class="fa fa-cog"></span></a> -->

									<ul class="dropdown-menu">
										<li><a href="#" class="panel-collapse"><span
												class="fa fa-angle-down"></span> Collapse</a></li>
										<li><a href="#" class="panel-remove"><span
												class="fa fa-times"></span> Remove</a></li>
									</ul>
								</li>
							</ul>
						</div>
						<div class="panel-body padding-0">
							<div>
								<a href="#" onclick="changeViewFromNav('userExperienceAnalytics')"> <img
									src="styles/images/useranalytics.png" height="275" width="450" />
								</a>
							</div>
						</div>
					</div>
					

				</div>
			
			
			<!-- 
				<div class="col-md-8">
				
				<div class="panel panel-default">
				<div class="panel-heading">
				<div class="panel-title-box">
				<h3>User Experience Analytics</h3>
				</div>
				<div class="panel-body">
				</div>
				</div>
				
				
				 -->
				
				

					<!-- 						START SALES BLOCK -->
					<!-- 						<div class="panel panel-default"> -->
					<!-- 							<div class="panel-heading"> -->
					<!-- 								<div class="panel-title-box"> -->
					<!-- 									<h3>Sales</h3> -->
					<!-- 									<span>Sales activity by period you selected</span> -->
					<!-- 								</div> -->
					<!-- 								<ul class="panel-controls panel-controls-title"> -->
					<!-- 									<li> -->
					<!-- 										<div id="reportrange" class="dtrange"> -->
					<!-- 											<span></span><b class="caret"></b> -->
					<!-- 										</div> -->
					<!-- 									</li> -->
					<!-- 									<li><a href="#" class="panel-fullscreen rounded"><span -->
					<!-- 											class="fa fa-expand"></span></a></li> -->
					<!-- 								</ul> -->

					<!-- 							</div> -->
					<!-- 							<div class="panel-body"> -->
					<!-- 								<div class="row stacked"> -->
					<!-- 									<div class="col-md-4"> -->
					<!-- 										<div class="progress-list"> -->
					<!-- 											<div class="pull-left"> -->
					<!-- 												<strong>In Queue</strong> -->
					<!-- 											</div> -->
					<!-- 											<div class="pull-right">75%</div> -->
					<!-- 											<div class="progress progress-small progress-striped active"> -->
					<!-- 												<div class="progress-bar progress-bar-primary" -->
					<!-- 													role="progressbar" aria-valuenow="50" aria-valuemin="0" -->
					<!-- 													aria-valuemax="100" style="width: 75%;">75%</div> -->
					<!-- 											</div> -->
					<!-- 										</div> -->
					<!-- 										<div class="progress-list"> -->
					<!-- 											<div class="pull-left"> -->
					<!-- 												<strong>Shipped Products</strong> -->
					<!-- 											</div> -->
					<!-- 											<div class="pull-right">450/500</div> -->
					<!-- 											<div class="progress progress-small progress-striped active"> -->
					<!-- 												<div class="progress-bar progress-bar-primary" -->
					<!-- 													role="progressbar" aria-valuenow="50" aria-valuemin="0" -->
					<!-- 													aria-valuemax="100" style="width: 90%;">90%</div> -->
					<!-- 											</div> -->
					<!-- 										</div> -->
					<!-- 										<div class="progress-list"> -->
					<!-- 											<div class="pull-left"> -->
					<!-- 												<strong class="text-danger">Returned Products</strong> -->
					<!-- 											</div> -->
					<!-- 											<div class="pull-right">25/500</div> -->
					<!-- 											<div class="progress progress-small progress-striped active"> -->
					<!-- 												<div class="progress-bar progress-bar-danger" -->
					<!-- 													role="progressbar" aria-valuenow="50" aria-valuemin="0" -->
					<!-- 													aria-valuemax="100" style="width: 5%;">5%</div> -->
					<!-- 											</div> -->
					<!-- 										</div> -->
					<!-- 										<div class="progress-list"> -->
					<!-- 											<div class="pull-left"> -->
					<!-- 												<strong class="text-warning">Progress Today</strong> -->
					<!-- 											</div> -->
					<!-- 											<div class="pull-right">75/150</div> -->
					<!-- 											<div class="progress progress-small progress-striped active"> -->
					<!-- 												<div class="progress-bar progress-bar-warning" -->
					<!-- 													role="progressbar" aria-valuenow="50" aria-valuemin="0" -->
					<!-- 													aria-valuemax="100" style="width: 50%;">50%</div> -->
					<!-- 											</div> -->
					<!-- 										</div> -->
					<!-- 										<p> -->
					<!-- 											<span class="fa fa-warning"></span> Data update in end of -->
					<!-- 											each hour. You can update it manual by pressign update button -->
					<!-- 										</p> -->
					<!-- 									</div> -->
					<!-- 									<div class="col-md-8"> -->
					<!-- 										<div id="dashboard-map-seles" -->
					<!-- 											style="width: 100%; height: 200px"></div> -->
					<!-- 									</div> -->
					<!-- 								</div> -->
					<!-- 							</div> -->
					<!-- 							</a> -->
					<!-- 						</div> -->
					<!-- 						END SALES BLOCK -->

				<!-- </div> -->
				<!-- <div class="common-modal modal fade" id="common-Modal1"
					tabindex="-1" role="dialog" aria-hidden="true">
					<div class="modal-content">
						<ul class="list-inline item-details">
							<li><a
								href="http://themifycloud.com/downloads/janux-premium-responsive-bootstrap-admin-dashboard-template/">Admin
									templates</a></li>
							<li><a href="http://themescloud.org">Bootstrap themes</a></li>
						</ul>
					</div>
				</div> -->

				<div class="col-md-4">

					<!-- 						START SALES & EVENTS BLOCK -->
					<!-- 						<div class="panel panel-default"> -->
					<!-- 							<div class="panel-heading"> -->
					<!-- 								<div class="panel-title-box"> -->
					<!-- 									<h3>Sales & Event</h3> -->
					<!-- 									<span>Event "Purchase Button"</span> -->
					<!-- 								</div> -->
					<!-- 								<ul class="panel-controls" style="margin-top: 2px;"> -->
					<!-- 									<li><a href="#" class="panel-fullscreen"><span -->
					<!-- 											class="fa fa-expand"></span></a></li> -->
					<!-- 									<li><a href="#" class="panel-refresh"><span -->
					<!-- 											class="fa fa-refresh"></span></a></li> -->
					<!-- 									<li class="dropdown"><a href="#" class="dropdown-toggle" -->
					<!-- 										data-toggle="dropdown"><span class="fa fa-cog"></span></a> -->
					<!-- 										<ul class="dropdown-menu"> -->
					<!-- 											<li><a href="#" class="panel-collapse"><span -->
					<!-- 													class="fa fa-angle-down"></span> Collapse</a></li> -->
					<!-- 											<li><a href="#" class="panel-remove"><span -->
					<!-- 													class="fa fa-times"></span> Remove</a></li> -->
					<!-- 										</ul></li> -->
					<!-- 								</ul> -->
					<!-- 							</div> -->
					<!-- 							<div class="panel-body padding-0"> -->
					<!-- 								<div class="chart-holder" id="dashboard-line-1" -->
					<!-- 									style="height: 200px;"></div> -->
					<!-- 							</div> -->
					<!-- 						</div> -->
					<!-- 						END SALES & EVENTS BLOCK -->

				</div>
			</div>

			<!-- START DASHBOARD CHART -->
			<div class="chart-holder" id="dashboard-area-1"
				style="height: 200px;"></div>
			<div class="block-full-width"></div>
			<!-- END DASHBOARD CHART -->

		</div>
		<!-- END PAGE CONTENT WRAPPER -->
	</div>
	<!-- END PAGE CONTENT -->


	<%-- <!-- MESSAGE BOX-->
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
	<!-- END MESSAGE BOX--> --%>

	<!-- START PRELOADS -->
<!-- 	<audio id="audio-alert" src="audio/alert.mp3" preload="auto"></audio> -->
<!-- 	<audio id="audio-fail" src="audio/fail.mp3" preload="auto"></audio> -->
 
 
<!-- 	<script type="text/javascript" src="js/plugins/jquery/jquery.min.js"></script> -->
<!-- 	<script type="text/javascript" src="js/plugins/jquery/jquery-ui.min.js"></script> -->
<!-- 	<script type="text/javascript" -->
<!-- 		src="js/plugins/bootstrap/bootstrap.min.js"></script> -->
 
<!-- 	<script type='text/javascript' src='js/plugins/icheck/icheck.min.js'></script> -->
<!-- 	<script type="text/javascript" -->
<!-- 		src="js/plugins/mcustomscrollbar/jquery.mCustomScrollbar.min.js"></script> -->
<!-- 	<script type="text/javascript" -->
<!-- 		src="js/plugins/scrolltotop/scrolltopcontrol.js"></script> -->

<!-- 	<script type="text/javascript" src="js/plugins/morris/raphael-min.js"></script> -->
<!-- 	<script type="text/javascript" src="js/plugins/morris/morris.min.js"></script> -->
<!-- 	<script type="text/javascript" src="js/plugins/rickshaw/d3.v3.js"></script> -->
<!-- 	<script type="text/javascript" -->
<!-- 		src="js/plugins/rickshaw/rickshaw.min.js"></script> -->
<!-- 	<script type='text/javascript' -->
<!-- 		src='js/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js'></script> -->
<!-- 	<script type='text/javascript' -->
<!-- 		src='js/plugins/jvectormap/jquery-jvectormap-world-mill-en.js'></script> -->
<!-- 	<script type='text/javascript' -->
<!-- 		src='js/plugins/bootstrap/bootstrap-datepicker.js'></script> -->
<!-- 	<script type="text/javascript" src="js/plugins/owl/owl.carousel.min.js"></script> -->

<!-- 	<script type="text/javascript" src="js/plugins/moment.min.js"></script> -->
<!-- 	<script type="text/javascript" -->
<!-- 		src="js/plugins/daterangepicker/daterangepicker.js"></script> -->
 
<!-- 	<script type="text/javascript" src="js/settings.js"></script> -->

<!-- 	<script type="text/javascript" src="js/plugins.js"></script> -->
<!-- 	<script type="text/javascript" src="js/actions.js"></script> -->

<!-- 	<script type="text/javascript" src="js/demo_dashboard.js"></script> -->
 
</body>
</html>






