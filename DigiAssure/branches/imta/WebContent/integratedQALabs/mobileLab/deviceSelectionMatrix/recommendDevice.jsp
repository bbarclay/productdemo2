
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file = "../../../DigiChatBot.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Device Recommendation</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/styles/css/bootstrap.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/styles/css/main.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/styles/css/digi.css">
<!-- <link rel="icon" href="favicon.ico" type="image/x-icon" /> -->
<%-- <link rel="stylesheet" type="text/css" id="theme" href="${pageContext.request.contextPath}/styles/css/theme-default.css"/>  --%>
<!-- <link href="https://fortawesome.github.io/Font-Awesome/assets/font-awesome/css/font-awesome.css" rel="stylesheet">  -->
<script type="text/javascript">
	// Function to start seetest URL in New Tab
	function runSeeTest() {
		window.open('https://capgemini.pcloudy.com', '_blank');
	}

	/* function sendMail() {
		window.open('mailto:gaurav.dua@capgemini.com');
	} */
</script>

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>




<script type="text/javascript">
/* function reserve(deviceid,vendorDeviceid,vendor){
	var time=document.getElementById("time"+deviceid).value;
  $
	.ajax({
		type : "GET",
		url : "${pageContext.request.contextPath}/integratedQALabs/mobileLab/deviceSelectionMatrix/reserveDevice",
		data:{"vendorDeviceid":vendorDeviceid,
			"deviceid":deviceid,
			"vendor":vendor,
			"time":time},
		contentType : "application/text; charset=utf-8",
		dataType : "text",
		success : function(data) {
			document.getElementById("message").innerHTML="Device Reservation Successful..!" //successful
			document.getElementById("messageDiv").style.visibility="visible";
			var table = document.getElementById('recommendTable');
			
			var rowLength = table.rows.length;
			for(var i=0; i<rowLength; i+=1){
			  var row = table.rows[i];
			  var cell = row.cells[7].innerHTML;
			  console.log("cell: ",cell)
			  if(cell.includes("reserve(")){
				var cell= cell.split("reserve(")[1];
				 cell=cell.split(",")[0];
				 if(cell==deviceid){
					 row.cells[6].innerHTML="End Time : "+data;
					 row.cells[7].innerHTML="<Button onclick='return release(\""+deviceid+"\",\""+vendorDeviceid+"\",\""+vendor+"\""+")' class='btn btn-primary'>Release</Button>"; 
					 row.cells[4].innerHTML="In Use"; 
				 }
			  }
			} 
		},
		error : function(jqXHR, textStatus, errorThrown) {
			alert('error: ' + textStatus + ': ' + errorThrown);
		}
	});  
}
 */

function release(deviceid,vendorDeviceid,vendor){

	$
	.ajax({
		type : "GET",
		url : "${pageContext.request.contextPath}/integratedQALabs/mobileLab/deviceSelectionMatrix/releaseDevice",
		data:{"vendorDeviceid":vendorDeviceid,
			"deviceid":deviceid,
			"vendor":vendor},
		contentType : "application/text; charset=utf-8",
		dataType : "text",
		success : function(data) {
			var table = document.getElementById('recommendTable');
			
			var rowLength = table.rows.length;
			for(var i=0; i<rowLength; i+=1){
			  var row = table.rows[i];
			  var cell = row.cells[7].innerHTML;
			  if(cell.includes("release(")){
				var cell= cell.split("release(")[1];
				 cell=cell.split(",")[0];
				 if(cell==deviceid){
					 row.cells[6].innerHTML=" <input type='number' min='1' max='3' value='1'  id='time"+deviceid+"'}>";
					 row.cells[7].innerHTML="<Button onclick='return reserve(\""+deviceid+"\",\""+vendorDeviceid+"\",\""+vendor+"\""+")' class='btn btn-primary'>Reserve</Button>"; 
					 row.cells[4].innerHTML="Available"; 
				 }
			  }
			}
			document.getElementById("message").innerHTML="Device Release Successful..!"
				document.getElementById("messageDiv").style.visibility="visible";
		
		},
		error : function(jqXHR, textStatus, errorThrown) {
			alert('error: ' + textStatus + ': ' + errorThrown);
		}
	});
}

$(document)
.ready(

		function refresher() {
			if (document.getElementById("recommendTable") != null) {

				
				$
						.get(
								'${pageContext.request.contextPath}/integratedQALabs/mobileLab/deviceSelectionMatrix/getDeviceStatus',
								
								function(result) {
							for (key in result) {
								var	availabilityTd=document.getElementById(result[key].devicecatalogid);
								var	reserveTd=document.getElementById("reserve_"+result[key].devicecatalogid);
								var	timeTd=document.getElementById("time_"+result[key].devicecatalogid);
								if( availabilityTd !=null){
								availabilityTd.innerHTML=result[key].availability;
								if(result[key].availability == "Available"){
										timeTd.innerHTML=" <input type='number' min='1' max='3' value='1'  id='time"+result[key].devicecatalogid+"'}>";
										reserveTd.innerHTML="<Button onclick='return reserve(\""+result[key].devicecatalogid+"\",\""+result[key].vendordeviceid+"\",\""+result[key].vendor+"\""+")' class='btn btn-primary'>Reserve</Button>"; 
								
							}
								else if(result[key].availability == "In Use"){
									if(! timeTd.innerHTML.includes("End Time :")){
										timeTd.innerHTML="-";
										reserveTd.innerHTML="<Button onclick='return release(\""+result[key].devicecatalogid+"\",\""+result[key].vendordeviceid+"\",\""+result[key].vendor+"\""+")' class='btn btn-primary'>Release</Button>";
									}
								} else{
									timeTd.innerHTML="-";
									reserveTd.innerHTML="-";
								}
							}
							}
									

									setTimeout(refresher, 9000);

								}, "json");
			}

		});
</script>




<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>





<script src="${pageContext.request.contextPath}/js/sorttable.js"></script>
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


<title>Device Recommendation</title>
</head>



<body>

	<div>
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
		
		
			<li class="dropdown">
				<a class="dropdown-toggle buttonlink"
					href="${pageContext.request.contextPath}/digitalQAService/accessibilityTesting/viewAllocatedBatch"
					data-toggle="dropdown"><b>Market Trends <span class="caret"></span></b>
				</a>
				<ul class="dropdown-menu">
				<c:if test="${not empty marketNames }">
				<c:forEach var="marketData" items="${marketNames }">
				<li ><a
						href="../../mobileLab/deviceSelectionMatrix/marketTrends?market=${marketData.marketid }">${marketData.marketname}</a></li>
				
				
				</c:forEach>
				</c:if>
					
				</ul>
			</li>
			<li><a class="dropdown-toggle buttonlink"
				href="${pageContext.request.contextPath}/digitalQAService/accessibilityTesting/viewAllocatedBatch"
				data-toggle="dropdown"><b>User Trends <span class="caret"></span></b>
			</a>
				<ul class="dropdown-menu">
					<li><a
							href="../../mobileLab/deviceSelectionMatrix/userTrends">Application1</a></li>


				</ul></li>
			
			
			<li class="active dropdown"><a
				class="dropdown-toggle buttonlink" data-toggle="dropdown"><b><button
							class="btn mobileLabMenu">
							Device Recommendation<span class="caret"></span>
						</button></b></a>
				<ul class="dropdown-menu">
					<li><a
						href="../../mobileLab/deviceSelectionMatrix/recommendDevice?market=GLOBAL&count=20">GLOBAL</a></li>
					<li><a
						href="../../mobileLab/deviceSelectionMatrix/recommendDevice?market=US&count=20">US</a></li>
					<li><a
						href="../../mobileLab/deviceSelectionMatrix/recommendDevice?market=UK&count=20">UK</a></li>
					<li><a
						href="../../mobileLab/deviceSelectionMatrix/recommendDevice?market=Australia&count=20">AUSTRALIA</a></li>
					<!-- <li><a
						href="../../mobileLab/deviceSelectionMatrix/recommendDevice?market=CANADA&count=20">CANADA</a></li> -->
				</ul></li>
				
						<li class="dropdown"><a class="dropdown-toggle buttonlink" href="../../mobileLab/deviceSelectionMatrix/searchNBookPage?vendor=noname&dname=noname"
				><b>Reservation </b>
			</a></li>
			<li class="dropdown"><a class="dropdown-toggle buttonlink"
			href="../../mobileLab/deviceSelectionMatrix/executionRun?toolName=IMTAFramework"><b>Execution</b>
		</a></li>

		<li class="dropdown"><a class="dropdown-toggle buttonlink"
			href="../../mobileLab/deviceSelectionMatrix/dashboardRun?toolName=IMTAFramework"><b>Dashboard</b>
		</a>
		<br>
		</li>
			

			<!-- <li><a class="buttonlink"
					href="../../mobileLab/deviceSelectionMatrix/DScloudDevices"><b><button class="btn mobileLabMenu">Device Selection</button></b></a></li> -->
		</ul>


		<div class="marginTop50px"></div>
		<div class="top-bar">
			<a href=""></a>
			<div class="font24px txtCenter">
				<label>Device Recommendation</label>
			</div>

		</div>
		<br>
		<div class="row col-md-12">
			<div class="col-sm-0"></div>
			<div class="col-sm-12">
			



					<div class="alert alert-success alert-dismissible" role="alert" style="visibility: hidden;" id="messageDiv">
						<button type="button" class="close" data-dismiss="alert">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<strong>Success!</strong><span id="message"></span>
					</div>
				


				<p id="txt"></p>
				<c:if test="${ not empty deviceList }">
					<!-- <div id="table-wrapper">
					    <div id="table-scroll">  -->
					<div class="dataTables_length" id="myTable_length">
						<label> Show <select name="myTable_length"
							class="form-control" onchange="window.location.href=this.value">
								<option value="#">--Select--</option>
								<option value="./recommendDevice?market=${market }&count=20">20</option>
								<option value="./recommendDevice?market=${market }&count=50">50</option>
								<option value="./recommendDevice?market=${market }&count=75">75</option>
								<option value="./recommendDevice?market=${market }&count=100">100</option>
						</select> entries
						</label>
					</div>
					<table align="left" class="table table-striped table-hover "
						id="recommendTable" cellpadding="0" cellspacing="0">
						<thead>
							<tr class="tableHead">


								<th id="myTab">Device_Name</th>
								<th>Device OS</th>
								<th>OS Version</th>
                           <!-- <th>Resolution</th> -->
								<th>Status</th>
								<th>Source</th>
								<!-- <th>Reservation Time</th> -->
								<th>Reserve/ Release on ${vendorname } </th>


							</tr>
							<!--  <tr><th colspan="8" class="tableHead txtCenter">Tier1</th></tr> -->
						</thead>

						<tbody>

							<c:forEach items="${deviceList}" var="deviceDetail">



								<tr>



									<td align="left"><label> <c:out
												value="${deviceDetail.devicename}" /></label></td>
									<td align="left"><c:out value="${deviceDetail.os}" /></td>
									<td align="left"><c:out value="${deviceDetail.version}" /></td>
								<%-- 	<td align="left"><c:out value="${deviceDetail.resolution}" /></td> --%>
									<td align="left" id="${ deviceDetail.devicecatalogid}"> <c:out
											value="${deviceDetail.availability}" /></td>

									<c:if test="${deviceDetail.vendor == 'Seetest'}">
										<td align="left">Private</td>
									</c:if>
									<c:if test="${deviceDetail.vendor == 'Perfecto Partner'}">
										<td align="left">Hosted</td>
									</c:if>
									<c:if test="${deviceDetail.vendor == 'Test'}">
										<td align="left">-</td>
									</c:if>
									<c:if test="${deviceDetail.vendor == 'pCloudy'}">
										<td align="left">Hosted</td>
									</c:if>







									<c:if test="${deviceDetail.availability == 'Available'}">
									<%-- 	<td align="left" id="time_${deviceDetail.devicecatalogid}"><input type="number" min="1" max="3" value="1" id="time${deviceDetail.devicecatalogid}"></td>
			<td align="left" id="reserve_${deviceDetail.devicecatalogid}"><button
												onclick="return reserve('${deviceDetail.devicecatalogid}','${deviceDetail.vendordeviceid}','${deviceDetail.vendor }') "
												class="btn btn-primary">Reserve</button></td>
 --%>
 	<%-- <td align="left" id="time_${deviceDetail.devicecatalogid}"><input type="number" min="1" max="3" value="1" id="time${deviceDetail.devicecatalogid}"></td> --%>
			<td align="left" id="reserve_${deviceDetail.devicecatalogid}"><button
											 onclick="window.location.href='../../mobileLab/deviceSelectionMatrix/searchNBookPage?vendor=${deviceDetail.vendor }&dname=${deviceDetail.devicename }'"
												class="btn btn-primary">Reserve</button></td>
 
									</c:if>
									<c:if test="${deviceDetail.availability == 'In Use'}">
								<%-- 	<td align="left" id="time_${deviceDetail.devicecatalogid}">-</td> --%>
		<td align="left"  id="reserve_${deviceDetail.devicecatalogid}"><button
												onclick="return release('${deviceDetail.devicecatalogid}','${deviceDetail.vendordeviceid}','${deviceDetail.vendor }')"
												class="btn btn-primary">Release</button></td>
									</c:if>
									<c:if
										test="${deviceDetail.availability != 'In Use' && deviceDetail.availability != 'Available'}">
										<%-- <td align="left" id="time_${deviceDetail.devicecatalogid}">-</td> --%>
										<td align="left"  id="reserve_${deviceDetail.devicecatalogid}">-</td>
									</c:if>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<!-- </div>	 
									</div>  -->

				</c:if>






			</div>
			<div class="col-sm-0"></div>
		</div>


	</div>

	<!-- <div class="marginTop50px"></div> -->
	<!-- Footer -->

	<jsp:include page="../../../common/footer.jsp"></jsp:include>
	<!--     <div ng-include="'common/footer.html'" a></div> -->




	<!-- START SCRIPTS -->
	<!-- START PLUGINS -->
	<%--  <script type="text/javascript" src="${pageContext.request.contextPath}/styles/js/plugins/jquery/jquery.min.js"></script>  --%>
	<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins/jquery/jquery-ui.min.js"></script> --%>
	<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins/bootstrap/bootstrap.min.js"></script>    --%>
	<!-- END PLUGINS -->
	<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.slimscroll.min.js"></script>
       <script type="text/javascript" src="${pageContext.request.contextPath}//styles/js/jquery.slimscroll.js"></script> --%>
	<!-- THIS PAGE PLUGINS -->
	<script type='text/javascript'
		src='${pageContext.request.contextPath}/js/plugins/icheck/icheck.min.js'></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/plugins/mcustomscrollbar/jquery.mCustomScrollbar.min.js"></script>

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/plugins/datatables/jquery.dataTables.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/plugins/tableexport/tableExport.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/plugins/tableexport/jquery.base64.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/plugins/tableexport/html2canvas.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/plugins/tableexport/jspdf/libs/sprintf.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/plugins/tableexport/jspdf/jspdf.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/plugins/tableexport/jspdf/libs/base64.js"></script>
	<!-- END PAGE PLUGINS -->

	<!-- START TEMPLATE -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/settings.js"></script>

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/plugins.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/actions.js"></script>
	<!-- END TEMPLATE -->
	<!-- END SCRIPTS -->












</body>
</html>





