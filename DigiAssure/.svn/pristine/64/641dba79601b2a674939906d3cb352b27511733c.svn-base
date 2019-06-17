<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ include file = "../../../DigiChatBot.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Mobile Lab Management</title>

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
<!-- <script type="text/javascript">
function myFunction() {
  var input, filter, table, tr, td, i;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("deviceTable");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[0];
    if (td) {
      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
}
</script> -->


<script type="text/javascript">

function filterData(){
	
	  var filterVendor = document.getElementById("filterVendor").value;	
	  var filterStatus = document.getElementById("filterStatus").value;	
	  var filterOS = document.getElementById("filterOS").value;	
	  var deviceTable = document.getElementById("deviceTable");	
	  tr = deviceTable.getElementsByTagName("tr");
	  for (i = 1; i < tr.length; i++) {
		   tdVendor = tr[i].getElementsByTagName("td")[0];
		   tdStatus= tr[i].getElementsByTagName("td")[1];
		   tdOS= tr[i].getElementsByTagName("td")[3];
		   
		   if(tdVendor && tdStatus){
			   if((filterVendor=='All' ||tdVendor.innerHTML.includes(filterVendor )) && (filterStatus=='All' || tdStatus.innerHTML.includes(filterStatus) )  && (filterOS=='All' || tdOS.innerHTML.includes(filterOS) )){
				   tr[i].style.display = "";
			   } else {
			        tr[i].style.display = "none";
			      }
		   }
	  }

}

function clearFields(){
	 $("#devName").html("");
	  $("#status").html("");
	  $("#id").html("");
	  $("#os").html("");
	  $("#version").html("");
	  $("#model").html("");
	  $("#deviceType").html("");
	  $("#location").html("-");
	  $("#procurementDate").html("-");
	  $("#browsers").html("-");
	  $("#simNo").html("-");
	  $("#connectivity").html("-");
	  $("#belongsTo").html("-");
	  $( "#remarks").html("-");
}

function manageFields(vendor){
	if(vendor=='Seetest' || vendor=='Perfecto Partner'){
	 $("#procurementRow").hide();
	  $("#browserRow").hide();
	  $("#phoneNoRow").hide();
	  $("#connectivityRow").hide();
	  $("#belongsRow").hide();
	  $( "#remarksRow").hide();
	}else{
		 $("#procurementRow").show();
		  $("#browserRow").show();
		  $("#phoneNoRow").show();
		  $("#connectivityRow").show();
		  $("#belongsRow").show();
		  $( "#remarksRow").show();
	}
}

function showInfo(deviceCatalogid){
var devices=${devices};
for(var i in devices)
{
     var id = devices[i].devicecatalogid;
   if(id==deviceCatalogid){
	   if(  devices[i].availability == 'Available' || devices[i].availability == 'Available In Lab'){
		   $("#status").css("background-color","#2ECC71");
	   }
	   if(  devices[i].availability == 'Error' || devices[i].availability == 'Unauthorized'){
		   $("#status").css("background-color","red");
	   }
	   if(  devices[i].availability == 'In Use'){
		   $("#status").css("background-color","#F4D03F");
	   }
	   if(  devices[i].availability == 'Offline'){
		   $("#status").css("background-color","#BFC9CA");
	   }
	   $("#infoDiv").show();
	   clearFields();
	   $("#devName").html(devices[i].devicename);
	  $("#status").html(devices[i].availability);
	  $("#id").html(devices[i].imei);
	  $("#os").html(devices[i].os);
	  $("#version").html(devices[i].version);
	  $("#model").html(devices[i].model);
	  $("#deviceType").html(devices[i].devicetype);
	  $("#location").html(devices[i].location);
	  $("#procurementDate").html(devices[i].procurementdate);
	  $("#browsers").html(devices[i].browsers);
	  $("#simNo").html(devices[i].simno);
	  $("#connectivity").html(devices[i].connectivity);
	  $("#belongsTo").html(devices[i].belongsto);
	  $( "#remarks").html(devices[i].remarks);
	  manageFields(devices[i].vendor);
	 
	  break;
	  
   }
}
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




							<li class="xn-openable active"><a href="#"><span
									class="fa fa-files-o"></span> <span class="xn-text">Lab</span></a>
								<ul>
								


									<li class="active"><a
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

			<div class="col-md-10">
				<div class="marginTop50px"></div>
				<div class="top-bar">
					<a href=""></a>
					<div class="font24px">
						<label>Devices</label>
					</div>

				</div>
				<c:if test="${not empty message }">
					<div class="row">
						<div class="alert alert-success alert-dismissible" role="alert">
							<button type="button" class="close" data-dismiss="alert">
								<span aria-hidden="true">×</span><span class="sr-only">Close</span>
							</button>
							${message}

						</div>
					</div>
				</c:if>

				<c:if test="${ not empty devices }">
					<div class="col-md-9">
						<!-- 	<input type="text" onkeyup="myFunction()" id="myInput" placeholder="Search for names.."> -->

						<label>Host:</label> <select id='filterVendor' class="input-sm"
							style='display: inline-block' onchange='filterData()'>
							<option value="All" selected>All</option>
							<c:set var="continueExecuting" scope="request" value="true" />
							<c:forEach var="vendor" items="${vendors }">
							<c:if test="${vendor =='Seetest' || vendor =='Perfecto Partner' }">
							<c:if test="${continueExecuting == true }">
							<option value='Cloud'>Cloud</option>
							<c:set var="continueExecuting" scope="request" value="false" />
							</c:if>
							</c:if>
							<c:if test="${vendor !='Seetest' && vendor !='Perfecto Partner' }">
								<option value='${vendor }'>${vendor }</option>
								</c:if>
							</c:forEach>
						</select> <label>Status:</label> <select id='filterStatus' class="input-sm"
							style='display: inline-block' onchange='filterData()'>
							<option value="All" selected>All</option>

							<option value='Available'>Available</option>
							<option value='In Use'>In Use</option>
							<option value='Offline'>Offline</option>
							<option value='Error'>Error</option>
							<option value='Unauthorized'>Unauthorized</option>
						</select> <label>OS:</label> <select id='filterOS' class="input-sm"
							style='display: inline-block' onchange='filterData()'>
							<option value="All" selected>All</option>

							<option value='android'>Android</option>
							<option value='ios'>iOS</option>
						</select>
						<table class="table table-bordered table-actions table-hover "
							id="deviceTable">
							<tr>
								<!-- <th>Edit</th>
				<th>Delete</th> -->
								<th>Host</th>
								<th>Status</th>
								<th>Device Name</th>
								<!-- 	<th>Model</th> -->
								<th>OS</th>
								<th>Version</th>
								<!-- 	<th style="width: 5%">ID</th>
				<th>Device Type</th> -->
								<th>Location</th>
								

							</tr>
							<c:forEach begin="0" end="${devices.size() -1}" var="index">
								<tr
									class="${devices.get(index).getAsJsonObject().get('vendor').getAsString()}"
									onclick="return showInfo('${devices.get(index).getAsJsonObject().get('devicecatalogid').getAsString()}')">
									
									<c:if test="${devices.get(index).getAsJsonObject().get('vendor').getAsString() == 'Seetest' || devices.get(index).getAsJsonObject().get('vendor').getAsString() == 'Perfecto Partner'}">
									<td>Cloud</td>
									</c:if>
									<c:if test="${devices.get(index).getAsJsonObject().get('vendor').getAsString() != 'Seetest' && devices.get(index).getAsJsonObject().get('vendor').getAsString() != 'Perfecto Partner'}">
									<td>${devices.get(index).getAsJsonObject().get("vendor").getAsString()}</td>
									</c:if>
									<td><c:if
											test="${devices.get(index).getAsJsonObject().get('availability').getAsString() == 'Available' || devices.get(index).getAsJsonObject().get('availability').getAsString()  == 'Available In Lab'  }">
											<div class="dot-success"></div>
										</c:if> <c:if
											test="${devices.get(index).getAsJsonObject().get('availability').getAsString()  == 'Error' || devices.get(index).getAsJsonObject().get('availability').getAsString()  == 'Unauthorized' }">
											<div class="dot-danger"></div>
										</c:if> <c:if
											test="${devices.get(index).getAsJsonObject().get('availability').getAsString()  == 'In Use'  }">
											<div class="dot-active"></div>
										</c:if> <c:if
											test="${devices.get(index).getAsJsonObject().get('availability').getAsString()  == 'Offline'  }">
											<div class="dot-inactive"></div>
										</c:if>

										${devices.get(index).getAsJsonObject().get("availability").getAsString()}</td>
									<td>${devices.get(index).getAsJsonObject().get("devicename").getAsString()}</td>
									<td>${devices.get(index).getAsJsonObject().get("os").getAsString()}</td>
									<td>${devices.get(index).getAsJsonObject().get("version").getAsString()}</td>
									<td>${devices.get(index).getAsJsonObject().get("location").getAsString()}</td>
								</tr>
							</c:forEach>
						</table>

					</div>
					<div id="infoDiv" class="col-md-3" style="display: none;">
						<div class="panel panel panel-info">
							<div class="panel-heading ui-draggable-handle">
								<div class="panel-title-box">
									<h2 id="devName"></h2>

								</div>
								<!--          <ul class="panel-controls" style="margin-top: 2px;">
                                        <li><a href="#" class="panel-fullscreen"><span class="fa fa-expand"></span></a></li>
                                        <li><a href="#" class="panel-refresh"><span class="fa fa-refresh"></span></a></li>
                                        <li class="dropdown">
                                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><span class="fa fa-cog"></span></a>                                        
                                            <ul class="dropdown-menu">
                                                <li><a href="#" class="panel-collapse"><span class="fa fa-angle-down"></span> Collapse</a></li>
                                                <li><a href="#" class="panel-remove"><span class="fa fa-times"></span> Remove</a></li>
                                            </ul>                                        
                                        </li>                                        
                                    </ul> -->
							</div>

							<div class="panel-body panel-body-table">

								<div class="table-responsive">
									<table>

										<tr>
											<th>Status</th>
											<td><span id="status" class="lable"></span></td>
										</tr>
										<tr>
											<th>ID</th>
											<td><span id="id"></span></td>
										</tr>
										<tr>
											<th>OS</th>
											<td><span id="os"></span></td>
										</tr>
										<tr>
											<th>Version</th>
											<td><span id="version"></span></td>
										</tr>
										<tr>
											<th>Model</th>
											<td><span id="model"></span></td>
										</tr>
										<tr>
											<th>Device Type</th>
											<td><span id="deviceType"></span></td>
										</tr>
										<tr>
											<th>Location</th>
											<td><span id="location"></span></td>
										</tr>
										<tr id="procurementRow">
											<th>Procurement Date</th>
											<td><span id="procurementDate"></span></td>
										</tr>
										<tr id="browserRow">
											<th>Browsers</th>
											<td><span id="browsers"></span></td>
										</tr>
										<tr id="phoneNoRow">
											<th>Phone No.</th>
											<td><span id="simNo"></span></td>
										</tr>
										<tr id="connectivityRow">
											<th>Connectivity</th>
											<td><span id="connectivity"></span></td>
										</tr>
										<tr id="belongsRow">
											<th>Belongs To</th>
											<td><span id="belongsTo"></span></td>
										</tr>
										<tr id="remarksRow">
											<th>Remarks</th>
											<td><span id="remarks"></span></td>
										</tr>
									</table>
								</div>

							</div>














						</div>
					</div>
				</c:if>
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