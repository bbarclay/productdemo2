<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Availability</title>

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
<script type="text/javascript">

function filterData(){
	  var filterVendor = document.getElementById("filterVendor").value;	
	  var deviceTable = document.getElementById("deviceTable");	
	  tr = deviceTable.getElementsByTagName("tr");
	  for (i = 1; i < tr.length; i++) {
		  tdVendor = tr[i].getElementsByTagName("th")[0];
		  if(tdVendor){
			  if((filterVendor=='All' ||tdVendor.innerHTML.includes(filterVendor ))){
				  
				  tr[i].style.display = "";
			   } else {
			        tr[i].style.display = "none";
			      }
		  }
	  }
}


$(document).ready(function() {
$('span').click(function(event) {
    event.stopPropagation();
});
});
function showReservationSummary(){
	$("#reservationSummary").show();
	$("#reservationDetails").hide();
	$('#timeTable').empty()
}
	function showRegistrationDetails(date, deviceId) {
		
		$("#reservationSummary").hide();
		$("#reservationDetails").show();
		$("#selectedDate").html(date);

		var time = 12;
		var format = "AM";
		var htmlContent = "";
		var stop=true;
		do {
			htmlContent += "<tr>";
			htmlContent += "<th width='5%'>" + time + " " + format + "</th>";
			var status=getStatus(deviceId,date,time,format);
			htmlContent+="<td class='availability"+status+"'>"+status+"</td>";
			htmlContent += "</tr>";
			if (time == 12 && (format == "AM" ||format == "PM" ) ) {
				time=1;
			}else if(time == 11 && format=="AM"){
				time=12;
				format="PM";
			}else if (time == 11 && format == "PM" ) {
				stop=false;
			}else{
				time=Number(time)+ Number(1);
			}
		} while (stop);

		$('#timeTable').append(htmlContent);
		return false;
	}
	function getStatus(deviceId,date,time,format){
	var convertedDate=	ConvertTimeformat("24",time+":00 "+format);
	var status="Available";
		var reservations=${allReservationData};
		for(var i in reservations){
			if(deviceId== reservations[i].devicecatalogid){
		var	startTimestamp=reservations[i].starttime;
		var	endTimestamp=reservations[i].endtime;
		
		var startDate=startTimestamp.split(" ")[0];
		var startTime=startTimestamp.split(" ")[1];
		
		var endDate=endTimestamp.split(" ")[0];
		var endTime=endTimestamp.split(" ")[1];
		
		 var d1 = new Date(date+" "+convertedDate+":00.0");
		 var   d2 = new Date(startTimestamp);
		 var   d3=new Date(date+" "+convertedDate+":00.0");
		 var   d4 = new Date(endTimestamp);
		    d3.setHours(d3.getHours() + 1);
		    console.log("d1:"+d1);
			console.log("d2:"+d2);
		console.log("d3:"+d3);
		if(d1<=d2 &&  d3>d2){
			console.log("time:"+time+" format: "+format);
		
		status="Busy";
		
		}else if(d2<=d1 && d4>=d1){
			status="Busy";
		}
		}
		}
		return status;
	}
	function ConvertTimeformat(format, time) {
	  //  var time = $("#starttime").val();
	    var hours = Number(time.match(/^(\d+)/)[1]);
	    var minutes = Number(time.match(/:(\d+)/)[1]);
	    var AMPM = time.match(/\s(.*)$/)[1];
	    if (AMPM == "PM" && hours < 12) hours = hours + 12;
	    if (AMPM == "AM" && hours == 12) hours = hours - 12;
	    var sHours = hours.toString();
	    var sMinutes = minutes.toString();
	    if (hours < 10) sHours = "0" + sHours;
	    if (minutes < 10) sMinutes = "0" + sMinutes;
	    return sHours + ":" + sMinutes;
	}
	function tConvert(time) {
		// Check correct time format and split into components
		time = time.toString().match(
				/^([01]\d|2[0-3])(:)([0-5]\d)(:[0-5]\d)?$/)
				|| [ time ];

		if (time.length > 1) { // If time format correct
			time = time.slice(1); // Remove full string match value
			time[5] = +time[0] < 12 ? 'AM' : 'PM'; // Set AM/PM
			time[0] = +time[0] % 12 || 12; // Adjust hours
		}
		return time.join(''); // return adjusted time or original string
	}
	function bookDevice(deviceId, startDate) {
		$
				.ajax({
					type : "GET",
					url : "${pageContext.request.contextPath}/integratedQALabs/mobileLab/deviceSelectionMatrix/bookDevice",
					data : {
						"deviceid" : deviceId,
						"startDate" : startDate
					},
					contentType : "application/text; charset=utf-8",
					dataType : "text",
					success : function(data) {
						alert(data);
						var row = document.getElementById(deviceId + "_"
								+ startDate);
						row.innerHTML = "<button type='button' class='btn btn-warning' disabled='disabled'>In Progress</button>";
						/* 
						
						var table=document.getElementById('reservationTable');
						
						var rowLength = table.rows.length;
						for(var i=0; i<rowLength; i+=1){
							  var row = table.rows[i];
							  var cell = row.cells[2].innerHTML;
									  if(cell.includes("bookDevice(")){
											var cell= cell.split("','")[1];
											 cell=cell.split("')")[0];
											 if(cell==startDate){
												 row.cells[2].innerHTML="Requested";
											 }
							  
						}
						} */
					},
					error : function(jqXHR, textStatus, errorThrown) {
						alert('error: ' + textStatus + ': ' + errorThrown);
					}
				});
	}
	

	function nextData(pointer) {

		var currentDate;
		if (pointer == "next") {
			currentDate = document
					.querySelector('table tr:first-child th:last-child').innerHTML;
		} else {
			currentDate = document
					.querySelector('table tr:first-child th:nth-child(2)').innerHTML;
		}

		window.location.href = "${pageContext.request.contextPath}/integratedQALabs/mobileLab/deviceSelectionMatrix/nextAvailability?currentDate="
				+ currentDate + "&pointer=" + pointer;

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
						<ul class="x-navigation ">




							<li class="xn-openable active"><a href="#"><span
									class="fa fa-files-o"></span> <span class="xn-text">Lab</span></a>
								<ul>
								


									<li><a
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
									<li  class="active"><a
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
							<li class="xn-openable"><a href="#"><span
									class="fa fa-table"></span> <span class="xn-text">Reports</span></a>
								<ul>
									<li><a href="../../mobileLab/deviceSelectionMatrix/report"><span
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

			<!-- 
	<div class="col-md-1" style="width: fit-content;">
			
			
			<div class="marginTop50px"></div>
				<div class="top-bar">
					<a href=""></a>
					 <button aria-label="Previous" class="btn btn-default btn-rounded" id="previous" onclick="return nextData('previous')">
        <span aria-hidden="true">&laquo;</span>
      </button>
					

				</div>
			
			</div> -->
			<div class="col-md-9" id="reservationSummary">
				<div class="marginTop50px"></div>
				<div class="top-bar">
					<a href=""></a>
					<div class="font24px">
						<label>Device Availability</label>
					</div>

				</div>
				<div>
				<label>Host:</label>
				 <select id='filterVendor' class="input-sm"
							style='display: inline-block' onchange='filterData()'>
							<option value="All" selected>All</option>
							<c:set var="cloudTest" scope="request" value="true" />
							<c:set var="labTest" scope="request" value="true" />
							<c:forEach var="device" items="${devices }" >
							<c:if test="${device.vendor =='Seetest' || device.vendor =='Perfecto Partner' }">
							<c:if test="${cloudTest == true }">
							<option value='Cloud'>Cloud</option>
							<c:set var="cloudTest" scope="request" value="false" />
							</c:if>
							</c:if>
							<c:if test="${device.vendor =='Lab' }">
							
							<c:if test="${labTest == true }">
								<option value='${device.vendor }'>${device.vendor }</option>
								<c:set var="labTest" scope="request" value="false" />
								</c:if>
								</c:if>
							</c:forEach>
						</select>
						<br>
				</div>

				<div class="table-responsive">
					<table class="table table-bordered " id="deviceTable">
						<thead>
							<tr>
							<th>Host</th>
								<th>Device Name</th>
								<c:forEach items="${dates }" var="date">

									<th>${date }</th>
								</c:forEach>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${devices }" var="device">
								<tr>
								<c:if test="${device.vendor == 'Seetest' || device.vendor == 'Perfecto Partner' }">
								<th>Cloud</th>
								</c:if>
								<c:if test="${device.vendor != 'Seetest' && device.vendor != 'Perfecto Partner'  }">
								<th>${device.vendor }</th>
								</c:if>
									<th>${device.devicename }</th>
									<c:forEach var="date" items="${dates }">

										<c:set var="continueExecuting" scope="request" value="true" />
										<c:if test="${allReservationData.size() gt 0 }">
										<c:forEach begin="0" end="${allReservationData.size() -1}"
											var="index">
											<%-- <c:forEach var="reservation" items="${allReservationData }"> --%>

											<c:if test="${continueExecuting == true}">
												<c:if
													test="${allReservationData.get(index).getAsJsonObject().get('devicecatalogid').getAsString() == device.devicecatalogid }">

													<c:if
														test="${fn:containsIgnoreCase(allReservationData.get(index).getAsJsonObject().get('starttime').getAsString(), date)}">
														<%-- <c:if test="${reservation.approvalStatus == 'Available' }">
<td id="${reservation.devicecatalogid}_${reservation.starttime }"><button onClick="return bookDevice('${reservation.devicecatalogid}','${reservation.starttime }')" class="btn btn-success active">Book</button></td>
</c:if> --%>
														<c:if
															test="${allReservationData.get(index).getAsJsonObject().get('approvalStatus').getAsString() == 'Requested' || allReservationData.get(index).getAsJsonObject().get('approvalStatus').getAsString() == 'Approved' }">
															<td align="center">
															<a
												href="../../mobileLab/deviceSelectionMatrix/searchSlots?devicecatalogid=${device.devicecatalogid}&date=+${date }" title="Book"><button
														class="btn btn-warning active" >Filling</button></a>
														
														<span class="glyphicon glyphicon-info-sign" title="view schedule" onclick="return showRegistrationDetails('${date}','${device.devicecatalogid  }')"></span>
														</c:if>

												

														<c:set var="continueExecuting" scope="request"
															value="false" />
													</c:if>
												</c:if>
											</c:if>
										</c:forEach>
										</c:if>
										<c:if test="${continueExecuting == true}">
											<td id="${device.devicecatalogid}_${date }"><a
												href="../../mobileLab/deviceSelectionMatrix/searchSlots?devicecatalogid=${device.devicecatalogid}&date=+${date }" title="Book"><button
														class="btn btn-success active">Available</button></a></td>
										</c:if>
										
									</c:forEach>
								</tr>
							</c:forEach>
						</tbody>
					</table>

				</div>

			</div>

			<div   id="reservationDetails" class="noDisplay col-md-9">
<div class="marginTop50px"></div>
				<div class="top-bar">
					<a href=""></a>
					<div class="font24px">
						<label id="selectedDate"></label>
					<button  aria-label="Back" class="btn btn-primary pull-right" onClick="showReservationSummary()"> <span aria-hidden="true" class="glyphicon glyphicon-arrow-left"></span></button>
					</div>
	
				</div>
				<div class="marginTop50px"></div>
				
				<table id="timeTable" class="table table-bordered  table-actions">

				</table>

				<!--  <div class="content-frame-body padding-bottom-0">
                        
                        <div class="row">
                            <div class="col-md-12">
                                <div id="alert_holder"></div>
                                <div class="calendar">                                
                                    <div id="calendar"></div>                            
                                </div>
                            </div>
                        </div>
                        
                    </div>     -->

			</div>


			<!-- <div class="col-md-1" style="width: fit-content;">
			
			
			<div class="marginTop50px"></div>
				<div class="top-bar">
					
					<button aria-label="Next" class="btn btn-default btn-rounded" onclick="return nextData('next')">
        <span aria-hidden="true">&raquo;</span>
      </button>

				</div>
			
			</div> -->

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
		src="${pageContext.request.contextPath}/js/plugins/moment.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/plugins/fullcalendar/fullcalendar.min.js"></script>
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