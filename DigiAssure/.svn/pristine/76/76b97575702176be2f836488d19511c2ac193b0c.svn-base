<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Report</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/styles/css/bootstrap.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/styles/css/main.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/styles/css/digi.css">
<link
	href="https://fortawesome.github.io/Font-Awesome/assets/font-awesome/css/font-awesome.css"
	rel="stylesheet">
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
<script src="${pageContext.request.contextPath}/js/highchart.js"></script>
<script src="${pageContext.request.contextPath}/js/exporting.js"></script>
<script type="text/javascript">

var deviceData= ${deviceDashboard};
var userData=${userDashboard};
function refreshDeviceData(){
	var startEle=document.getElementsByName("startDate");
	var start=startEle[0].value;
	var endEle=document.getElementsByName("endDate");
	var end=endEle[0].value;
		$
	.ajax({
		type : "GET",
		url : "${pageContext.request.contextPath}/integratedQALabs/mobileLab/deviceSelectionMatrix/deviceUsageTimeSpan",
		data : {
			"start" : start,
			"end" : end,
		},
		contentType : "application/json; charset=utf-8",
		dataType : "json",
		success : function(data) {
			deviceData=data;
			drawDeviceGraph();
		},
		error : function(jqXHR, textStatus, errorThrown) {
			alert('error: ' + textStatus + ': ' + errorThrown);
		}
	});
};

function refreshUserData(){
	var startEle=document.getElementsByName("startUserDate");
	var start=startEle[0].value;
	var endEle=document.getElementsByName("endUserDate");
	var end=endEle[0].value;
		$
	.ajax({
		type : "GET",
		url : "${pageContext.request.contextPath}/integratedQALabs/mobileLab/deviceSelectionMatrix/userUsageTimeSpan",
		data : {
			"start" : start,
			"end" : end,
		},
		contentType : "application/json; charset=utf-8",
		dataType : "json",
		success : function(data) {
			userData=data;
			drawUserGraph();
		},
		error : function(jqXHR, textStatus, errorThrown) {
			alert('error: ' + textStatus + ': ' + errorThrown);
		}
	});
};

function refreshDeviceUsage(time){
	

	$
	.ajax({
		type : "GET",
		url : "${pageContext.request.contextPath}/integratedQALabs/mobileLab/deviceSelectionMatrix/deviceUsage",
		data : {
			"time" : time
		},
		contentType : "application/json; charset=utf-8",
		dataType : "json",
		success : function(data) {
			deviceData=data;
			drawDeviceGraph();
		},
		error : function(jqXHR, textStatus, errorThrown) {
			alert('error: ' + textStatus + ': ' + errorThrown);
		}
	});
};
function refreshUserUsage(time){
	

	$
	.ajax({
		type : "GET",
		url : "${pageContext.request.contextPath}/integratedQALabs/mobileLab/deviceSelectionMatrix/userUsage",
		data : {
			"time" : time
		},
		contentType : "application/json; charset=utf-8",
		dataType : "json",
		success : function(data) {
			userData=data;
			drawUserGraph();
		},
		error : function(jqXHR, textStatus, errorThrown) {
			alert('error: ' + textStatus + ': ' + errorThrown);
		}
	});
};

function setEndDate(startDate){
	//alert(startDate);
	$("#endDate").datepicker({
		//startDate : '1d',
		//endDate : '+7d',
		startDate:startDate,
		endDate: '0d',
		format : 'yyyy-mm-dd'
	});
}
function setUserEndDate(startDate){
	//alert(startDate);
	$("#endUserDate").datepicker({
		//startDate : '1d',
		//endDate : '+7d',
		startDate:startDate,
		endDate: '0d',
		format : 'yyyy-mm-dd'
	});
}
window.onload = function () { 
	$("#startDate").datepicker({
		//startDate : '1d',
		//endDate : '+7d',
		endDate: '0d',
		format : 'yyyy-mm-dd'
	});
	$("#startUserDate").datepicker({
		//startDate : '1d',
		//endDate : '+7d',
		endDate: '0d',
		format : 'yyyy-mm-dd'
	});
	
	
	/*$("#endDate").datepicker({
		//startDate : '1d',
		//endDate : '+7d',
		minDate: $("#startDate").datepicker("getDate"),
		format : 'yyyy-mm-dd'
	}); */
	
	
/* 	  
	$("#startDate").datepicker({ 
	    dateFormat: 'yyyy-mm-dd',
	    changeMonth: true,
	  //  minDate: new Date(),
	    endDate: '0d',
	  	}); */


	
	drawUserGraph();
	drawDeviceGraph();

}


function drawDeviceGraph(){
Highcharts.chart('deviceGraph', {
    chart: {
    	 backgroundColor:'rgba(255, 255, 255, 0.0)',
        plotBackgroundColor: 'rgba(255, 255, 255, 0.0)',
        plotBorderWidth: null,
        plotShadow: false,
        type: 'pie'
    },
    exporting: { enabled: false },
    tooltip: {
        pointFormat: '{name}: <b>{point.y} hours</b>'
    },
    plotOptions: {
        pie: {
            allowPointSelect: true,
            cursor: 'pointer',
            dataLabels: {
                enabled: false,
          
            },
            showInLegend: true,
            
        }
        },
    series: [{
       
        colorByPoint: true,
        data:deviceData
    
    }]
});
}

function drawUserGraph(){
Highcharts.chart('userGraph', {
    chart: {
    	 backgroundColor:'rgba(255, 255, 255, 0.0)',
         plotBackgroundColor: 'rgba(255, 255, 255, 0.0)',
        plotBorderWidth: null,
        plotShadow: false,
        type: 'pie'
    },
    exporting: { enabled: false },
    tooltip: {
        pointFormat: '{name}: <b>{point.y} hours</b>'
    },
   
    plotOptions: {
        pie: {
            allowPointSelect: true,
            cursor: 'pointer',
            dataLabels: {
                enabled: false,
          
            },
            showInLegend: true,
            
        }
        },
    series: [{
       
        colorByPoint: true,
        data:userData
    
    }]
});
}

</script>
</head>
<body>
	<jsp:include page="../../../common/logo.jsp"></jsp:include>

	<!-- PAGE CONTENT WRAPPER -->
	<div class="page-content-wrap">

		<!-- START WIDGETS -->
		<div class="row">


			<div class="page-sidebar" style="height: 100%;">
				<div id="mCSB_1"
					class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside"
					tabindex="0">
					<div id="mCSB_1_container" class="mCSB_container"
						style="top: 0px; left: 0px;" dir="ltr">
									<!-- START X-NAVIGATION -->
						<ul class="x-navigation">




							<li class="xn-openable"><a href="#"><span
									class="fa fa-files-o"></span> <span class="xn-text">Lab</span></a>
								<ul>
								


									<li ><a
										href="../../mobileLab/deviceSelectionMatrix/showLabDetails"><span
											class="fa fa-image"></span>Inventory</a></li>




									<c:if test="${sessionScope.rolename == 'ADMIN'}">
										<li><a
											href="../../mobileLab/deviceSelectionMatrix/addDeviceDeatils"><span
												class="fa fa-user"></span>Add Device</a></li>

										<li><a
											href="../../mobileLab/deviceSelectionMatrix/bulkDeviceDetails"><span
												class="fa fa-users"></span>Excel Import</a></li>

									</c:if>
									<li><a
										href="../../mobileLab/deviceSelectionMatrix/availabilityDetails"><span
											class="fa fa-comments"></span> Availability</a></li>

								</ul></li>

							<li class="xn-openable"><a href="#"><span
									class="fa fa-file-text-o"></span> <span class="xn-text">Bookings</span></a>
								<ul>
									<li><a
										href="../../mobileLab/deviceSelectionMatrix/searchNBookPage">Search
											& Book</a></li>
									<c:if test="${sessionScope.rolename == 'ADMIN'}">
										<li><a
											href="../../mobileLab/deviceSelectionMatrix/adminShowDeviceRequests">Approve/Reject</a></li>
									</c:if>
									<c:if test="${sessionScope.rolename != 'ADMIN'}">
									<li><a
										href="../../mobileLab/deviceSelectionMatrix/requestedBookings">requested
											Bookings</a></li>
											</c:if>
									<li><a
										href="../../mobileLab/deviceSelectionMatrix/allRequests">All
											Requests</a></li>

								</ul></li>


							<li class="xn-openable"><a href="#"><span
									class="fa fa-cogs"></span> <span class="xn-text">Dashboard</span></a>
								<ul>

									<li><a
										href="../../mobileLab/deviceSelectionMatrix/dashboard"><span
											class="fa fa-random"></span> Dashboard View</a></li>
								</ul></li>
							<c:if test="${sessionScope.rolename == 'ADMIN'}">
								<li class="xn-openable"><a href="#"><span
										class="fa fa-pencil"></span> <span class="xn-text">Users</span></a>
									<ul>
										<li><a
											href="../../mobileLab/deviceSelectionMatrix/viewUser"><span
												class="fa fa-tasks"></span>View User</a></li>
										<li><a
											href="../../mobileLab/deviceSelectionMatrix/beforeAddUser"><span
												class="fa fa-user"></span>Add User</a></li>
									</ul></li>
								<li class="xn-openable"><a href="#"><span
										class="fa fa-pencil"></span> <span class="xn-text">Projects</span></a>
									<ul>
										<li><a
											href="../../mobileLab/deviceSelectionMatrix/viewProjects"><span
												class="fa fa-tasks"></span>View Projects</a></li>
										<li><a
											href="../../mobileLab/deviceSelectionMatrix/beforeAddProject"><span
												class="fa fa-user"></span>Add Project</a></li>
									</ul></li>

							</c:if>
							<li class="xn-openable active"><a href="#"><span
									class="fa fa-table"></span> <span class="xn-text">Reports</span></a>
								<ul>
									<li class="active"><a href="../../mobileLab/deviceSelectionMatrix/report"><span
											class="fa fa-align-justify"></span>Usage report</a></li>

								</ul></li>

						</ul>
						<!-- END X-NAVIGATION -->
					</div>



					<div id="mCSB_1_scrollbar_vertical"
						class="mCSB_scrollTools mCSB_1_scrollbar mCS-light mCSB_scrollTools_vertical"
						style="display: block;">
						<div class="mCSB_draggerContainer">
							<div id="mCSB_1_dragger_vertical" class="mCSB_dragger"
								style="position: absolute; min-height: 30px; display: block; height: 113px; max-height: 286px; top: 0px;"
								oncontextmenu="return false;">
								<div class="mCSB_dragger_bar" style="line-height: 30px;"></div>
							</div>
							<div class="mCSB_draggerRail"></div>
						</div>
					</div>
				</div>
			</div>



			<div class="col-md-9">
				<div class="marginTop50px"></div>
				<div class="top-bar">
					<a href=""></a>
					<div class="font24px">
						<label>Usage Report</label>
					</div>

				</div>

				<div class="col-md-5 col-lg-6">
					<h3 class="labelForGraph">Overall Device Usage</h3>
<div class="col-md-5 col-lg-5">


<label>Time Period: </label>
					<select id="timeSelector"  class="form-control"
						onchange="return refreshDeviceUsage(this.value)">
						
						<option value="week">Current Week</option>
						<option value="month">Current Month</option>
						<option value="allTime">All Time</option>
					</select>
			
					</div>
					
<div class="col-md-2 col-lg-3">
	<label>Start Date:</label>
					<div class='input-group date' id='startDate'>
					
						<input type='text' class="form-control" name="startDate" onChange="return setEndDate(this.value)" /> <span
							class="input-group-addon"> <span
							class="glyphicon glyphicon-calendar"></span>
						</span>
					</div>
					</div>
					<div class="col-md-2 col-lg-3">
					<label>End Date:</label>
					<div class='input-group date' id='endDate'>
						<input type='text' class="form-control" name="endDate" /> <span
							class="input-group-addon"> <span
							class="glyphicon glyphicon-calendar"></span>
						</span>
					</div>
				</div>	
								<div class="col-md-1 col-lg-1">
								<br>
				<button aria-label="Refresh" class="btn btn-default btn-rounded" id="previous" >
        <span aria-hidden="true" class="glyphicon glyphicon-refresh" onclick="return refreshDeviceData()" ></span>
      </button>

</div>
				<div class="marginTop50px"></div>
					<div id="deviceGraph" class="graphDiv"></div>

	



				</div>

				<div class="col-md-5 col-lg-6">
					<h3 class="labelForGraph">Overall device usage by User</h3>

<div class="col-md-5 col-lg-5">
<label>Time Period: </label>
					<select id="timeUserSelector"  class="form-control"
						onchange="return refreshUserUsage(this.value)">
						
						<option value="week">Current Week</option>
						<option value="month">Current Month</option>
						<option value="allTime">All Time</option>
					</select>
					</div>
					<div class="col-md-2 col-lg-3">
						<label>Start Date:</label>
					<div class='input-group date' id='startUserDate'>
						<input type='text' class="form-control" name="startUserDate" onChange="return setUserEndDate(this.value)" /> <span
							class="input-group-addon"> <span
							class="glyphicon glyphicon-calendar"></span>
						</span>
					</div>
					</div>
					<div class="col-md-2 col-lg-3">
						<label>End Date:</label>
					<div class='input-group date' id='endUserDate'>
						<input type='text' class="form-control" name="endUserDate" /> <span
							class="input-group-addon"> <span
							class="glyphicon glyphicon-calendar"></span>
						</span>
					</div>
				</div>	
				<div class="col-md-1 col-lg-1">
				<br>
				<button aria-label="Refresh" class="btn btn-default btn-rounded" id="previous" >
        <span aria-hidden="true" class="glyphicon glyphicon-refresh" onclick="return refreshUserData()" ></span>
      </button>

</div>	
				<div class="marginTop50px"></div>

					<div id="userGraph" class="graphDiv"></div>



				</div>



				<%--          
                           <c:if test="${ not empty allRequests }">
					<c:if test="${sessionScope.rolename == 'ADMIN'}">
						
								<table align="left" class="table table-striped table-hover "
									cellpadding="0" cellspacing="0">
									<thead>
										<tr>
											<th>Device Name</th>
											<th>Device OS</th>
											<th>OS Version</th>
											<th>Resolution</th>
											<th>Source</th>
											<th>Created By</th>
											<th>Reservation start time</th>
											<th>Reservation end time</th>
											<th>Approval status</th>
										</tr>

									</thead>

									<tbody>
										<c:forEach items="${allRequests}" var="allRequests">
											<tr>
												<td>${allRequests.devicename}</td>
												<td>${allRequests.os}</td>
												<td>${allRequests.version}</td>
												<td>${allRequests.resolution}</td>
												<td>${allRequests.vendor}</td>
												<td>${allRequests.createdby}</td>
												<td>${allRequests.starttime}</td>
												<td>${allRequests.endtime}</td>
												<td>${allRequests.approvalStatus}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							
					</c:if>
					<c:if test="${sessionScope.rolename == 'USER'}">
						
								<table align="left" class="table table-striped table-hover "
									cellpadding="0" cellspacing="0">
									<thead>
										<tr>
											<th>Device Name</th>
											<th>Device OS</th>
											<th>OS Version</th>
											<th>Resolution</th>
											<th>Source</th>
											<th>Reservation start time</th>
											<th>Reservation end time</th>
											<th>Approval status</th>
										</tr>

									</thead>

									<tbody>
										<c:forEach items="${allRequests}" var="allRequests">
											<tr>
												<td>${allRequests.devicename}</td>
												<td>${allRequests.os}</td>
												<td>${allRequests.version}</td>
												<td>${allRequests.resolution}</td>
												<td>${allRequests.vendor}</td>
												<td>${allRequests.starttime}</td>
												<td>${allRequests.endtime}</td>
												<td>${allRequests.approvalStatus}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							
					</c:if>
					
				</c:if> --%>

			</div>

		</div>


		<!-- Footer -->

		<jsp:include page="../../../common/footer.jsp"></jsp:include>
	</div>
	</div>
	</div>
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