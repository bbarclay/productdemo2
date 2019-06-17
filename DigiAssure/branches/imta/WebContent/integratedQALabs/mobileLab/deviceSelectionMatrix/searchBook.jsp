<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search & Book</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/styles/css/bootstrap.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/styles/css/main.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/styles/css/digi.css">
<link
	href="https://fortawesome.github.io/Font-Awesome/assets/font-awesome/css/font-awesome.css"
	rel="stylesheet">

<%-- 
<script
	src="${pageContext.request.contextPath}/vendor/datetimepicker-master/jquery.datetimepicker.js"></script> --%>
<link
	href="${pageContext.request.contextPath}/vendor/jquery-ui-1.12.1.custom/jquery-ui.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/vendor/jquery/dist/jquery.js"></script>
<script
	src="${pageContext.request.contextPath}/vendor/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
<%-- 	<script
	src="${pageContext.request.contextPath}/vendor/bootstrap-datepicker-master/js/bootstrap-datepicker.js"
	type="text/javascript"></script> --%>
<script
	src="${pageContext.request.contextPath}/vendor/angular/angular.js"></script>
<script
	src="${pageContext.request.contextPath}/vendor/angular-ui-router/release/angular-ui-router.js"></script>
<script
	src="${pageContext.request.contextPath}/vendor/angular-route/angular-route.js"></script>



<style type="text/css">

.form-groupp{

 margin-left: 20%;
}

</style>
<script
	src="${pageContext.request.contextPath}/vendor/bootstrap/dist/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/js/app/app.js"></script>
<script src="${pageContext.request.contextPath}/js/main.js"></script>
<script type="text/javascript">
	//mdTemp = new Date();
	//maxiDate = new Date(mdTemp.setDate(mdTemp.getDate() + 7));
	function speak(msg) {
		var msg = new SpeechSynthesisUtterance(msg);
		window.speechSynthesis.speak(msg);
	}

	$(document).ready(function() {
		var todayDate = new Date().getDate();
		$("#startTime").datetimepicker({
			format : 'HH:mm'
		});
		$("#endTime").datetimepicker({
			format : 'HH:mm'
		});
		$("#startDate").datepicker({
			startDate : '1d',
			endDate : '+30d',
			format : 'yyyy-mm-dd'
		});
		$("#endDate").datepicker({
			startDate : '1d',
			endDate : '+30d',
			format : 'yyyy-mm-dd'
		});
	});
</script>
<script type="text/javascript">
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

						var table = document.getElementById('reservationTable');

						var rowLength = table.rows.length;
						for (var i = 0; i < rowLength; i += 1) {
							var row = table.rows[i];
							var cell = row.cells[2].innerHTML;
							if (cell.includes("bookDevice(")) {
								var cell = cell.split("','")[1];
								cell = cell.split("')")[0];
								if (cell == startDate) {
									row.cells[2].innerHTML = "<button type='button' class='btn btn-warning' disabled='disabled'>In Progress</button>";
								}

							}
						}
					},
					error : function(jqXHR, textStatus, errorThrown) {
						alert('error: ' + textStatus + ': ' + errorThrown);
					}
				});
	}
	 function runSeeTest() {
   	  
			window.open('https://capgemini.pcloudy.com', '_blank');
		}
	function populateDevices(vendor) {
		var devices = ${devices};
		console.log(devices);
		$('#deviceDetail').children('option:not(:first)').remove();
		for (var i = 0; i < devices.length; i++) {
			if (devices[i].vendor == vendor) {

				var options = $("#deviceDetail");
				options.append($("<option />").val(devices[i].devicecatalogid)
						.text(devices[i].devicename));

			}
			/*  for (var key in obj){
			     var attrName = key;
			     var attrValue = obj[key];
			 } */
		}

	}
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
		<li class="dropdown"><a class="dropdown-toggle buttonlink"
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
		<li class="active dropdown"><a class="dropdown-toggle buttonlink"
			href="../../mobileLab/deviceSelectionMatrix/searchNBookPage?vendor=noname&dname=noname"><b>Reservation
			</b> </a></li>


		<li class="dropdown"><a class="dropdown-toggle buttonlink"
			href="../../mobileLab/deviceSelectionMatrix/executionRun?toolName=IMTAFramework"><b>Execution</b>
		</a></li>


		<li class="dropdown"><a class="dropdown-toggle buttonlink"
			href="../../mobileLab/deviceSelectionMatrix/dashboardRun?toolName=IMTAFramework"><b>Dashboard</b>
		</a>
		<br></li>

	
					<div class="col-md-6 col-sm-6 col-xs-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">
								<strong>Search & Book</strong>
							</h3>


						</div>
						<div class="panel-body">

							<div class="form-group form-horizontal">
								<label class="col-sm-3 control-label">Host</label>
								<div class="col-sm-9">
									<c:if test="${empty vendor }">

										<select name="device" class="form-control" style="-webkit-appearance:menulist"
											onchange="return populateDevices(this.value)">
											<option>--SELECT--</option>            <!--  changed -->
											<c:forEach var="vendor" items="${vendors }">
											
													<c:if test="${vendor =='Seetest' }">
							<option value=${vendor }>Cloud</option>
							</c:if>
							<c:if test="${vendor !='Seetest' }">
								<option value='${vendor }'>${vendor }</option>
								</c:if>
											</c:forEach>

										</select>

									</c:if>

									<c:if test="${not empty vendor }">

										<select name="device" class="form-control" style="-webkit-appearance:menulist"
											onchange="return populateDevices(this.value)">
											<option>${devicename}</option>             <!--  changed -->
											<c:forEach var="v" items="${vendors }">
												<c:if test="${v == vendor }">
													
														<c:if test="${v =='Seetest' }">
							<option value=${v } selected=selected>Cloud</option>
							</c:if>
							<c:if test="${v !='Seetest' }">
								<option value='${v }'selected=selected>${v }</option>
								</c:if>
													
													
													
													
												</c:if>
												<c:if test="${v != vendor }">
														<c:if test="${v =='Seetest' }">
							<option value=${v }>Cloud</option>
							</c:if>
							<c:if test="${v !='Seetest' }">
								<option value='${v }'>${v }</option>
								</c:if>
												</c:if>
											</c:forEach>

										</select>

									</c:if>




								</div>
							</div>
							<br> <br>
							<div class="form-group">


								<form action="searchNBook" class="form-horizontal">
									<div class="form-group">
										<label class="col-sm-3 control-label">Device</label>
										<div class="col-sm-9">
											<c:if test="${empty deviceid }">
												<select name="device" class="form-control" id="deviceDetail" style="-webkit-appearance:menulist">
													<option>--SELECT--</option>


												</select>
											</c:if>
											<c:if test="${not empty deviceid }">
												<select name="device" class="form-control" id="deviceDetail" style="-webkit-appearance:menulist">

													<option>--SELECT--</option>
													<c:forEach begin="0" end="${devices.size() -1}" var="index">
														<c:if
															test="${devices.get(index).getAsJsonObject().get('vendor').getAsString() == vendor }">
															<c:if
																test="${devices.get(index).getAsJsonObject().get('devicecatalogid').getAsString() ==  deviceid}">
																<option value="${deviceid}" selected=selected>${devices.get(index).getAsJsonObject().get('devicename').getAsString() }</option>
															</c:if>

															<c:if
																test="${devices.get(index).getAsJsonObject().get('devicecatalogid').getAsString() !=  deviceid}">
																<option
																	value="${devices.get(index).getAsJsonObject().get('devicecatalogid').getAsString()}">${devices.get(index).getAsJsonObject().get('devicename').getAsString() }</option>
															</c:if>
														</c:if>


													</c:forEach>
												</select>
											</c:if>
										</div>
									</div>

									<div class="form-group">
										<div class="col-sm-3">
										<label class=" control-label" style="float: right;">Start Date  <br>(yyyy-mm-dd)</label>
											
										</div>
										<div class="col-sm-3">

											<!-- <input type="text" class="form-control" name="startDate"
												id="startDate" /> -->
											<c:if test="${empty date }">

												<div class='input-group date' id='startDate'>
													<input type='text' class="form-control" name="startDate" />
													<span class="input-group-addon"> <span
														class="glyphicon glyphicon-calendar"></span>
													</span>
												</div>


											</c:if>
											<c:if test="${not empty date }">

												<div class='input-group date' id='startDate'>
													<input type='text' class="form-control" name="startDate"
														value="${date }" /> <span class="input-group-addon">
														<span class="glyphicon glyphicon-calendar"></span>
													</span>
												</div>


											</c:if>


										</div>
									
										<label class="col-sm-3 control-label">Start Time</label>
										<div class="col-sm-3">
											<!-- <input type="text" id="endDate" class="form-control"
												name="endDate"> -->

											<div class='input-group date' id='startTime'>
												<input type='text' class="form-control" name="startTime" />
												<span class="input-group-addon"> <span
													class="glyphicon glyphicon-calendar"></span>
												</span>
											</div>


												
										</div>
									</div>
									
												
									<div class="form-group">
										<div class="col-sm-3">
										<label class=" control-label" style="float: right;">End Date  <br>(yyyy-mm-dd)</label>
											
										</div>
										<div class="col-sm-3">

											<!-- <input type="text" class="form-control" name="startDate"
												id="startDate" /> -->

												<div class='input-group date' id='endDate'>
													<input type='text' class="form-control" name="endDate" />
													<span class="input-group-addon"> <span
														class="glyphicon glyphicon-calendar"></span>
													</span>
												</div>


											
											


										</div>
									
										<label class="col-sm-3 control-label">End Time</label>
										<div class="col-sm-3">
											<!-- <input type="text" id="endDate" class="form-control"
												name="endDate"> -->

											<div class='input-group date' id='endTime'>
												<input type="text" type='text' class="form-control"   name="endTime" id="endTime"/>
											 <span
								class="input-group-addon add-on"><span
								class="glyphicon glyphicon-calendar"></span></span>
											</div>


												
										</div>
									</div>
									
									
									
									


									<div class="container">
										<div class="row">
											<div class='col-sm-6'>
												<!--   <input type="text" id="datetimepicker1"> -->
											</div>

										</div>
									</div>


									<div class="marginTop50px"></div>

									<div class="form-groupp">
									
											<button type="button" 
					                         class="btn btn-success " onclick="runSeeTest()"
					                         title="Manual Execution" >Manual Execution
				                             </button>
											<input type="submit" value="Book"
												class="btn btn-success"
												onsubmit="return validate()">
											<button type="button" 
					                         class="btn btn-success" onclick=""
					                         title="Auomation Execution">Automation Execution
				                             </button>
										
									</div>

								</form>
							</div>
						</div>
					</div>
				</div>
				
				<div class="col-md-6 col-sm-6 col-xs-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">
								<strong>Notes</strong>
							</h3>


						</div>
						<div class="panel-body">
						
						<ul>
						<li>Maximum booking hours for cloud devices is 3 hours</li>
						<li>Only one booking per device is allowed per day</li>
						
						</ul>
						</div>
						</div>
						</div>
						
						
				
				
				
				
				<c:if test="${ not empty reservationSuccess }">
					<div class="alert alert-success alert-dismissible" role="alert">
						<button type="button" class="close" data-dismiss="alert">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<strong>Success:</strong> ${reservationSuccess}
						<script>
							speak('${reservationSuccess }')
						</script>
					</div>
				</c:if>
				<c:if test="${ not empty reservationFailure }">
					<div class="alert alert-danger alert-dismissible" role="alert">
						<button type="button" class="close" data-dismiss="alert">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<strong>Failure:</strong> ${reservationFailure}
						<script>
							speak('${reservationFailure }')
						</script>
					</div>
				</c:if>


				<%-- 			<c:if test="${ not empty reservations }">
					<table class="table table-striped table-hover "
						id="reservationTable">
						<thead>
							<tr>
								<th>Device Name</th>
								<th>Date</th>
								<th>Book</th>

							</tr>
						</thead>
						<tbody>
							<c:forEach items="${reservations }" var="reservation">
								<c:if
									test="${reservation.approvalStatus != 'Declined' && reservation.approvalStatus != 'Cancelled' }">
									<tr>
										<td>${reservation.devicename }</td>
										<td>${reservation.starttime }</td>
										<c:if test="${reservation.approvalStatus == 'Available'}">
											<td><button
													onClick="return bookDevice('${reservation.devicecatalogid}','${reservation.starttime }')"
													class="btn btn-success active">Book</button></td>
										</c:if>
										<c:if test="${reservation.approvalStatus == 'Approved' }">
											<td>

												<button type="button" class="btn btn-danger"
													disabled="disabled">Unavailable</button>
											</td>
										</c:if>
										<c:if test="${reservation.approvalStatus == 'Requested' }">
											<td>

												<button type="button" class="btn btn-warning"
													disabled="disabled">In Progress</button>
											</td>
										</c:if>
									</tr>
								</c:if>
							</c:forEach>
						</tbody>
					</table>
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
	
	<div>
		<!-- Footer -->
		<jsp:include page="../../../common/footer.jsp"></jsp:include>
		<!--     <div ng-include="'common/footer.html'" a></div> -->
	</div>
</body>
</html>