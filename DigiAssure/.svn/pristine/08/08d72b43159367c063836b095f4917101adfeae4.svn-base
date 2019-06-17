<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>All Requests</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/styles/css/bootstrap.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/styles/css/main.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/styles/css/digi.css">
<link href="https://fortawesome.github.io/Font-Awesome/assets/font-awesome/css/font-awesome.css" rel="stylesheet">
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
function validate(){
	//Validate Version
	var version=document.getElementById("version");
	var versionPat= /^\d+(\.\d+){0,4}$/;
	var versionResult=versionPat.test(version.value);
	if(!versionResult){
		document.getElementById("versionError").innerHTML="Invalid Version..!";
	}
	
	//Validate Phone number
	var phone=document.getElementById("simno");
	 var phoneNumberPattern = /^\d{10}$/;
	 var phoneResult=phoneNumberPattern.test(phone.value);
	  if(!phoneResult){
			document.getElementById("simnoError").innerHTML="Invalid Phone Number..!";
		}
		
	 
	 //Validate procurementdate
	 	var procurementDate=document.getElementById("procurementdate");
	 var datePattern =/^([0-9]{4})-([0-9]{2})-([0-9]{2})$/;
	 var dateResult=datePattern.test(procurementdate.value);
	 if(!dateResult){
			document.getElementById("procurementdateError").innerHTML="Invalid format..!";
		}
	 if(dateResult && phoneResult && versionResult){
		 return true;
	 }
	return false;
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
								


									<li ><a
										href="../../mobileLab/deviceSelectionMatrix/showLabDetails"><span
											class="fa fa-image"></span>Inventory</a></li>




									<c:if test="${sessionScope.rolename == 'ADMIN'}">
										<li class="active"><a
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
			<div class="col-md-9">
				<div class="marginTop50px"></div>
				<div class="top-bar">
					<a href=""></a>
					<div class="font24px">
						<c:if test="${not empty device.devicecatalogid }">
							<label>Edit Device</label>
						</c:if>
						<c:if test="${empty device.devicecatalogid }">
							<label>Add Device</label>
						</c:if>
					</div>

				</div>

				<c:if test="${ not empty message }">
					<div>${message }</div>
				</c:if>

				<form:form class="form-horizontal" action="addDevice" method="POST"
					id="addDevice" modelAttribute="device" title="addDevice" onsubmit="return validate();" >

					<div class="form-group">
						<label for="devicename" class="col-sm-3 control-label">
							Device Name <font color="red">*</font></label>
						<div class="col-sm-8">

							<form:input path="devicename" class="form-control"
								placeholder="Enter Device Name" required="required"/>
							<c:if test="${not empty device.devicecatalogid }">
								<form:hidden path="devicecatalogid"
									value="${device.devicecatalogid  }" />
							</c:if>
						</div>
					</div>

					<div class="form-group">
						<label for="model" class="col-sm-3 control-label">Model <font color="red">*</font></label>
						<div class="col-sm-8">
							<form:input path="model" class="form-control"
								placeholder="Enter Model"  required="required" />
						</div>
					</div>
					<div class="form-group">
						<label for="manufacturer" class="col-sm-3 control-label">Manufacturer <font color="red">*</font></label>
						<div class="col-sm-8">
							<form:input path="manufacturer" class="form-control"
								placeholder="Enter manufacturer"  required="required"/>
						</div>
					</div>

				<%-- 	<div class="form-group">
						<label for="procurementdate" class="col-sm-3 control-label">Date
							of Procurement</label>
						<div class="col-sm-8">
							<form:input path="procurementdate" class="form-control"
								placeholder="Enter Date of Procurement" />
						</div>
					</div> --%>
					
					
						 <div class="form-group">
                                        <label class="col-sm-3 control-label">Date
							of Procurement <font color="red">*</font><br> (yyyy-mm-dd)</label>
                                        <div class="col-sm-8">                                  
						
						<div class="input-group date" id="dp-2"
							data-date-format="yyyy-mm-dd">
							<form:input type="text" class="form-control datepicker" path="procurementdate"  required="required"/> <span
								class="input-group-addon add-on"><span
								class="glyphicon glyphicon-calendar"></span></span>
						</div>
						
						
						</div>
						<span id="procurementdateError" style="color: red;"></span>
						</div>
					
					
					


					<div class="form-group">
						<label for="procurementdate" class="col-sm-3 control-label">Device
							Type <font color="red">*</font></label>
						<div class="col-sm-8">
							<form:select style="-webkit-appearance:menulist" path="devicetype" class="form-control"  required="required">
								<form:option value="TABLET">TABLET	</form:option>
								<form:option value="PHONE">PHONE</form:option>
							</form:select>
						</div>
					</div>


					<div class="form-group">
						<label for="imei" class="col-sm-3 control-label">IMEI <font color="red">*</font></label>
						<div class="col-sm-8">
							<form:input path="imei" class="form-control"
								placeholder="Enter IMEI number"  required="required"/>
						</div>
					</div>

					<div class="form-group">
						<label for="os" class="col-sm-3 control-label">OS <font color="red">*</font></label>
						<div class="col-sm-8">
							<form:select style="-webkit-appearance:menulist" path="os" class="form-control"  required="required">
								<form:option value="Android">Android	</form:option>
								<form:option value="iOS">iOS</form:option>
								<form:option value="Windows">Windows	</form:option>
								<form:option value="Blackberry">Blackberry</form:option>
							</form:select>
						</div>
					</div>

					<div class="form-group">
						<label for="version" class="col-sm-3 control-label">Version <font color="red">*</font></label>
						<div class="col-sm-8">
							<form:input path="version" class="form-control"  required="required"
								placeholder="Enter OS version" />
						</div>
						<span id="versionError"  style="color: red;" ></span>
					</div>
					<div class="form-group">
						<label for="browsers" class="col-sm-3 control-label">Browsers
							Available <font color="red">*</font></label>
						<div class="col-sm-8">
							<form:checkbox path="browsers" value="Chrome" checked="checked" />
							Chrome
							<form:checkbox path="browsers" value="Safari" />
							Safari
							<form:checkbox path="browsers" value="IE" />
							IE
						</div>
					</div>
					<div class="form-group">
						<label for="location" class="col-sm-3 control-label">Location <font color="red">*</font></label>
						<div class="col-sm-8">
							<form:input path="location" class="form-control"
								placeholder="Enter Device Location" />
						</div>
					</div>
					<div class="form-group">
						<label for="connectivity" class="col-sm-3 control-label">Connected
							Via</label>
						<div class="col-sm-8">
							<form:select style="-webkit-appearance:menulist" path="connectivity" class="form-control">
								<form:option value="Wifi">Wifi	</form:option>
								<form:option value="GSM">GSM</form:option>
							</form:select>

						</div>
					</div>
					<div class="form-group">
						<label for="simno" class="col-sm-3 control-label">Phone Number</label>
						<div class="col-sm-8">
							<form:input path="simno" class="form-control"
								placeholder="Enter Phone Number" />

						</div>
						<span id="simnoError" style="color: red;"></span>
					</div>
					<div class="form-group">
						<label for="belongsto" class="col-sm-3 control-label">Tagged
							To</label>
						<div class="col-sm-8">

							<form:select style="-webkit-appearance:menulist" path="belongsto" class="form-control">
								<form:option value="0">None	</form:option>
								<c:forEach items="${projects }" var="project">
									<form:option value="${project.projectid }">${project.projectName }	</form:option>
								</c:forEach>
							</form:select>
						</div>
					</div>

					<div class="form-group">
						<label for="remarks" class="col-sm-3 control-label">Remarks</label>
						<div class="col-sm-8">
							<form:input path="remarks" class="form-control" />
						</div>
					</div>
					<div class="marginTop50px"></div>
					<div class="form-group">
						<div class="col-sm-3 col-sm-offset-5">
							<input type="submit" class="btn btn-success btnCenter" />
						</div>
					</div>
				</form:form>
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