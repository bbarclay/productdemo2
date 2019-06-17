<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="../../../DigiChatBot.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Market Trends</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/styles/css/bootstrap.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/styles/css/main.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/styles/css/digi.css">

<!-- <script type="text/javascript" src="http://www.google.com/jsapi"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script> -->

<script src="${pageContext.request.contextPath}/js/exporting.js"></script>
<script src="${pageContext.request.contextPath}/js/highchart_for3d.js"></script>
<script src="${pageContext.request.contextPath}/js/highcharts-3d.js"></script>
<script src="${pageContext.request.contextPath}/js/export-data.js"></script>


<script language="Javascript">
	var data = ${marketVendorData};
	var osData = ${marketOsData};
	var androidDistribution = ${androidDistribution};
	var iOSDistribution = ${iOSDistribution};
	//oem dist
	window.onload = function() {
		Highcharts.chart('container', {
			chart : {
				plotBackgroundColor : null,
				plotBorderWidth : null,
				plotShadow : false,
				type : 'pie',
				options3d : {
					enabled : true,
					alpha : 45,
					beta : 0
				}
			},
			title : {
				text : 'Vendor Market Share'
			},
			tooltip : {
				pointFormat : '{name}: <b>{point.percentage:.1f}%</b>'
			},
			plotOptions : {
				pie : {
					allowPointSelect : true,
					cursor : 'pointer',
					depth : 35,
					dataLabels : {
						enabled : true,
						format : '{point.name}'
					},
					showInLegend : true,

				}
			},

			series : [ {

				colorByPoint : true,
				data : data
			} ]
		});

		//android dist
		Highcharts.chart('androidDistribution', {
			chart : {
				plotBackgroundColor : null,
				plotBorderWidth : null,
				plotShadow : false,
				type : 'pie',
				options3d : {
					enabled : true,
					alpha : 45,
					beta : 0
				}
			},
			title : {
				text : 'Android Market Share'
			},
			tooltip : {
				pointFormat : '{name}: <b>{point.percentage:.1f}%</b>'
			},
			plotOptions : {
				pie : {
					allowPointSelect : true,
					cursor : 'pointer',
					depth : 35,
					dataLabels : {
						enabled : true,
						format : '{point.name}'
					},
					showInLegend : true,

				}
			},

			series : [ {

				colorByPoint : true,
				data : androidDistribution
			} ]
		});
		//os dist details
		Highcharts.chart('container3', {
			chart : {
				plotBackgroundColor : null,
				plotBorderWidth : null,
				plotShadow : false,
				type : 'pie',
				options3d : {
					enabled : true,
					alpha : 45,
					beta : 0
				}
			},
			title : {
				text : 'OS Data'
			},
			tooltip : {
				pointFormat : '{name}: <b>{point.percentage:.1f}%</b>'
			},
			plotOptions : {
				pie : {
					allowPointSelect : true,
					cursor : 'pointer',
					depth : 35,
					dataLabels : {
						enabled : true,
						format : '{point.name}'
					},
					showInLegend : true,

				}
			},

			series : [ {

				colorByPoint : true,
				data : osData
			} ]
		});

		//ios dist
		Highcharts.chart('container4', {
			chart : {
				plotBackgroundColor : null,
				plotBorderWidth : null,
				plotShadow : false,
				type : 'pie',
				options3d : {
					enabled : true,
					alpha : 45,
					beta : 0
				}
			},
			title : {
				text : 'iOS version Market Share'
			},
			tooltip : {
				pointFormat : '{name}: <b>{point.percentage:.1f}%</b>'
			},
			plotOptions : {
				pie : {
					allowPointSelect : true,
					cursor : 'pointer',
					depth : 35,
					dataLabels : {
						enabled : true,
						format : '{point.name}'
					},
					showInLegend : true
				}
			},
			series : [ {

				colorByPoint : true,
				data : iOSDistribution
			} ]
		});
	};
</script>




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
	// Function to start seetest URL in New Tab
	function runSeeTest() {

		window.open('https://capgemini.pcloudy.com', '_blank');
	}

	/* function sendMail() {
	       window.open('mailto:gaurav.dua@capgemini.com');
	} */
</script>


</head>
<body>



	<!-- Header and Navigation Bar -->

	<jsp:include page="../../../common/logo.jsp"></jsp:include>
	<div class="marginTop65px"></div>
	<div class="row borderBottom">
		<div class="col-md-4 col-lg-4 marginTop15px">
			<label class="font24px">Mobile Lab</label>
		</div>
		<div class="col-md-3 col-lg-4"></div>
		<div class="col-md-5 col-lg-4 marginTop15px">

			<a href="../../mobileLab/mobileLab.jsp"><button
					class="btn btn-primary sideButton">Help</button></a>
			<%-- <button type="button" class="btn btn-primary pull-right"
				onclick="runSeeTest()" title="Start Testing">
				Start Testing <span class="glyphicon glyphicon-plus"></span>
			</button>
			<a href="../../mobileLab/downloadExcelUtility"><button
					type="button" class="btn btn-primary sideButton">
					Download TestPlan <img
						src="${pageContext.request.contextPath}/styles/images/download.png"
						height="20" width="20" title="Download TestPlan">
				</button> </a> --%>
		</div>

	</div>





	<ul class="nav nav-tabs marginLeft15px marginTop15px">
		<li class="active dropdown"><a class="dropdown-toggle buttonlink"
			href="${pageContext.request.contextPath}/digitalQAService/accessibilityTesting/viewAllocatedBatch"
			data-toggle="dropdown"><b>Market Trends <span class="caret"></span></b>
		</a>

			<ul class="dropdown-menu">
				<c:if test="${not empty marketNames }">
					<c:forEach var="marketData" items="${marketNames }">
						<c:if test="${marketData.marketid == market }">
							<li class="active"><a
								href="../../mobileLab/deviceSelectionMatrix/marketTrends?market=${marketData.marketid }">${marketData.marketname}</a></li>
						</c:if>
						<c:if test="${marketData.marketid != market }">
							<li><a
								href="../../mobileLab/deviceSelectionMatrix/marketTrends?market=${marketData.marketid }">${marketData.marketname}</a></li>
						</c:if>
					</c:forEach>
				</c:if>

			</ul></li>
		<li><a class="dropdown-toggle buttonlink"
			href="${pageContext.request.contextPath}/digitalQAService/accessibilityTesting/viewAllocatedBatch"
			data-toggle="dropdown"><b>User Trends <span class="caret"></span></b>
		</a>
			<ul class="dropdown-menu">
				<li><a href="../../mobileLab/deviceSelectionMatrix/userTrends">Application1</a></li>
			</ul></li>


		<li class="dropdown"><a class="dropdown-toggle buttonlink"
			href="${pageContext.request.contextPath}/digitalQAService/accessibilityTesting/viewAllocatedBatch"
			data-toggle="dropdown"><b>Device Recommendation<span
					class="caret"></span></b></a>
			<ul class="dropdown-menu">
				<c:forEach var="marketData" items="${marketNames }">
					<li><a
						href="../../mobileLab/deviceSelectionMatrix/recommendDevice?market=${marketData.marketname }&count=20">${marketData.marketname}
					</a></li>
				</c:forEach>

			</ul></li>
		<li class="dropdown"><a class="dropdown-toggle buttonlink"
			href="../../mobileLab/deviceSelectionMatrix/searchNBookPage?vendor=noname&dname=noname"><b>Reservation
			</b> </a></li>
		<li class="dropdown"><a class="dropdown-toggle buttonlink"
			href="../../mobileLab/deviceSelectionMatrix/executionRun?toolName=IMTAFramework"><b>Execution</b>
		</a></li>

		<li class="dropdown"><a class="dropdown-toggle buttonlink"
			href="../../mobileLab/deviceSelectionMatrix/dashboardRun?toolName=IMTAFramework"><b>Dashboard</b>
		</a>
		<br>
		</li>
		<!-- <li class="dropdown"><a class="dropdown-toggle buttonlink"
				data-toggle="dropdown"><b>Mobile Lab Management <span class="caret"></span></b>
			</a>
			<ul class="dropdown-menu">
					<li><a
						href="../../mobileLab/deviceSelectionMatrix/showLabDetails">Lab</a></li>
				
				</ul>
					</li> -->
		<!-- <li>
				<a  class="buttonlink" href="../../mobileLab/deviceSelectionMatrix/DScloudDevices"><b><button class="btn mobileLabMenu" >Device Selection</button></b></a>
			</li>
			<li>
				<a  class="buttonlink" href="../../mobileLab/deviceSelectionMatrix/perfectoCloud"><b><button class="btn mobileLabMenu" >Perfecto Cloud</button></b></a>
			</li> -->

		<c:if test="${sessionScope.rolename == 'ADMIN'}">
			<li class="pull-right">

				<form name="userForm" method="post" class="pull-left"
					action="../../mobileLab/deviceSelectionMatrix/updateData"
					enctype="multipart/form-data">
					<label>Vendor: &nbsp <input type="radio" value="vendor"
						name="type" required="required"></label> &nbsp &nbsp <label>OS:
						&nbsp <input type="radio" value="os" name="type">
					</label> &nbsp &nbsp <label>Android Version &nbsp <input
						type="radio" value="andrv" name="type"></label> &nbsp &nbsp <label>iOS
						Version: &nbsp <input type="radio" value="iosv" name="type">
					</label> <input type="hidden" name="market" value=${market } /> <input
						type="file" class="btn btn-primary" id="marketData"
						name="marketData" required="required" /> <input type="submit"
						value="UPDATE" class="btn btn-primary updateButt">
				</form>
			</li>

			<li class="pull-right">
				<div class="upload">Update ${marketName } Data:</div>
			</li>
		</c:if>

	</ul>





	<%-- <ul class="nav nav-tabs" style="margin-left: 15px; ">
			
				<li class="active" class="dropdown"><a style="padding: 0px !important;" class="dropdown-toggle"
					data-toggle="dropdown"><b><button class="btn " style="    /* color: #fff; */ background-color: #fff;  height: 50px; padding: 0 5px;/* border-color: #2e6da4;*/">Market
								Trends</button></b></a>
					<ul class="dropdown-menu">
						<li class="active"><a
							href="../../mobileLab/deviceSelectionMatrix/DSGlobalPage">Global</a></li>
						<li><a
							href="../../mobileLab/deviceSelectionMatrix/DSHomePage">US</a></li>
						<li><a
							href="../../mobileLab/deviceSelectionMatrix/DSHomeUKPage">UK</a></li>

					</ul></li>
				<li><a href="DSselectDevices.jsp" style="padding: 0px !important;"><b><button class="btn " style="    /* color: #fff; */ background-color: #fff; height: 50px; padding: 0 5px;/* border-color: #2e6da4;*/">Device Recommendation</button></b></a></li>
				<li><a style="padding: 0px !important;"
					href="../../mobileLab/deviceSelectionMatrix/DScloudDevices"><b><button class="btn " style="    /* color: #fff; */  padding: 0 5px; background-color: #fff; height: 50px;/* border-color: #2e6da4;*/">Device Selection</button></b></a></li>
					
				<li style=" float: right;">
					<div style="float:left; margin: 20px 5px 0 5px;">Update Global Database: </div>
							<form name="userForm" method="post" style="float:left;"
								action="../../mobileLab/deviceSelectionMatrix/uploadFileExcelDataGlobal.obj"
								enctype="multipart/form-data" onSubmit="return GoEmpty(this);">
							
								<div>
									<input type="file" class="btn btn-primary" id="recentData"
										name="recentData"
										style='float:left; margin: 3px; width: 205px; margin: 10px 3px;'>
									<input type="submit" style="float:left; margin: 10px 20px 0px 5px;" value="UPDATE" class="btn btn-primary"
										>
								</div>
							</form>
				</li>
			</ul> --%>


	<div class="container">
		<ul class="nav nav-new marginLeft15px marginTop15px">
			<li class="active dropdown"><a
				class="dropdown-toggle buttonlink"
				href="${pageContext.request.contextPath}/digitalQAService/accessibilityTesting/viewAllocatedBatch"
				data-toggle="dropdown"><b>${timeperiod } <span class="caret"></span></b>
			</a>
				<ul class="dropdown-menu">
					<c:if test="${not empty marketNames }">
						<c:forEach var="marketData" items="${marketNames }">
							<c:if test="${marketData.marketid == market }">
								<%--  <li class="dropdown-submenu" ><a href="#">Monthly</a>
					 	 <ul class="dropdown-menu">
					 	   <c:if test="${not empty monthsdata }">
				           <c:forEach var="monthNames" items="${monthsdata}"  >
				            
				              <li  ><a href="../../mobileLab/deviceSelectionMatrix/duration?market=${marketData.marketid}&duration=${monthNames.id}">${monthNames.monthname}</a>
				           
				           </c:forEach>
				           </c:if>
				        </ul>
					</li> --%>

								<li class="dropdown-submenu"><a href="#">Quaterly</a>
									<ul class="dropdown-menu">


										<li><a
											href="../../mobileLab/deviceSelectionMatrix/duration?market=${marketData.marketid}&duration=q1">Quater
												1</a>
										<li><a
											href="../../mobileLab/deviceSelectionMatrix/duration?market=${marketData.marketid}&duration=q2">Quater
												2</a>
										<li><a
											href="../../mobileLab/deviceSelectionMatrix/duration?market=${marketData.marketid}&duration=q3">Quater
												3</a>
									</ul></li>
								<li class="dropdown-submenu"><a href="#">Half-Yearly</a>
									<ul class="dropdown-menu">


										<li><a
											href="../../mobileLab/deviceSelectionMatrix/duration?market=${marketData.marketid}&duration=s1">SemiYear
												1</a>
										<li><a
											href="../../mobileLab/deviceSelectionMatrix/duration?market=${marketData.marketid}&duration=s2">SemiYear
												2</a>
									</ul></li>
								<li class="dropdown-submenu"><a
									href="../../mobileLab/deviceSelectionMatrix/marketTrends?market=${marketData.marketid}">Yearly</a></li>
								<%--  <ul class="dropdown-menu">
					 	  
				            
				              <li  ><a href="../../mobileLab/deviceSelectionMatrix/marketTrends?market=${marketData.marketid}" >Current Year</a>
				              <li  ><a href="#" >Previous Year</a>
				              <li  ><a href="#" >Last to last year</a>
				          
				        </ul> --%>
							</c:if>
						</c:forEach>
					</c:if>
				</ul></li>
		</ul>
		<div class="row">
			<div class="marginTop15px"></div>
			<div class="col-md-6 col-lg-6 graphPartition">
				<h3 class="labelForGraph">OEM Distribution Details</h3>
				<c:if test="${not empty marketVendorData}">

					<div id="container" class="graphDiv"></div>

				</c:if>
				<!-- <div id="chart" class="chart" style="float: left;"></div> -->

				<c:if test="${empty marketVendorData}">
					<center>
						<b><font color="red" size="2"> No Records found...</font></b>
					</center>
				</c:if>
			</div>
			<!--  change-->

			<div class="marginTop15px"></div>
			<div class="col-md-6 col-lg-6 ">
				<!-- <div class="marginTop15px"></div> -->
				<h3 class="labelForGraph">OS Distribution Details</h3>
				<c:if test="${not empty marketOsData}">
					<div id="container3" class="graphDiv"></div>
				</c:if>

				<c:if test="${empty marketOsData}">
					<center>
						<b><font color="red" size="2"> No Records found...</font></b>
					</center>
				</c:if>
			</div>

			<!--change  -->
		</div>
		<div class="row">
			<div class="col-md-12 col-lg-12">
				<div class="marginTop15px"></div>
				<div class="horizontalLine"></div>
			</div>
		</div>

		<div class="row">
			<!-- changed -->

			<div class="col-md-6 col-lg-6 graphPartition">
				<h3 class="labelForGraph">Android OS distribution by version</h3>

				<c:if test="${not empty androidDistribution}">

					<div id="androidDistribution" class="graphDiv"></div>

				</c:if>
				<c:if test="${empty androidDistribution}">
					<center>
						<b><font color="red" size="2"> No Records found...</font></b>
					</center>
				</c:if>
			</div>

			<!--  changed -->
			<div class="col-md-6 col-lg-6">
				<div class="marginTop15px"></div>
				<h3 class="labelForGraph">iOS distribution by version</h3>
				<c:if test="${not empty iOSDistribution}">
					<div id="container4" class="graphDiv"></div>
				</c:if>
				<c:if test="${empty iOSDistribution}">
					<center>
						<b><font color="red" size="2"> No Records found...</font></b>
					</center>
				</c:if>
			</div>
			<div class="marginTop15px"></div>
		</div>
		<div class="row">
			<div class="col-md-12 col-lg-12">
				<div class="marginTop15px"></div>
			</div>
		</div>
	</div>





	<!-- <div class="marginTop15px"></div> -->


	<div>
		<!-- Footer -->
		<jsp:include page="../../../common/footer.jsp"></jsp:include>
		<!--     <div ng-include="'common/footer.html'" a></div> -->
	</div>
</body>
</html>
