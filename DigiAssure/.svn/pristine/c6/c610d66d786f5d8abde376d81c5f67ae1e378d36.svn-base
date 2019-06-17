<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Project</title>
<link rel="stylesheet" href="../../styles/css/bootstrap.css">
<link rel="stylesheet" href="../../styles/css/main.css">
<link rel="stylesheet" href="../../styles/css/digi.css">


<script>
	function formValidation() {

		if (document.getElementById("projectName").value == ""
				|| document.getElementById("projectDescription").value == ""
				 	|| document.getElementById("startDate").value == "" 
				|| document.getElementById("endDate").value == ""
					|| document.getElementById("account").value == "#"

		) {
			document.getElementById("validationError").innerHTML = "Fill * marked fields";
			return false;
		}

		document.getElementById("ErrorMessage").style.visibility = 'visible';
		return true;
	}
</script>
<script>
	function reset() {

		document.getElementById("addProject").reset();
	}
</script>
<script type="text/javascript">
	function speak(msg) {
		var msg = new SpeechSynthesisUtterance(msg);
		window.speechSynthesis.speak(msg);
	}
</script>
<script
	src="${pageContext.request.contextPath}/vendor/jquery/dist/jquery.js"></script>
<script
	src="${pageContext.request.contextPath}/vendor/angular-ui-bootstrap-bower/ui-bootstrap.js"></script>
<script
	src="${pageContext.request.contextPath}/vendor/angular-ui-bootstrap-bower/ui-bootstrap-tpls.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/vendor/bootstrap/dist/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/js/app/app.js"></script>
<script src="${pageContext.request.contextPath}/js/main.js"></script>

</head>
<body>
<jsp:include page="../../../common/logo.jsp"></jsp:include>

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




							<li class="xn-openable "><a href="#"><span
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
								<li class="xn-openable active"><a href="#"><span
										class="fa fa-pencil"></span> <span class="xn-text">Projects</span></a>
									<ul>
										<li><a
											href="../../mobileLab/deviceSelectionMatrix/viewProjects"><span
												class="fa fa-tasks"></span>View Projects</a></li>
										<li class="active"><a
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


			<div class="container">
			

				<h1 id="viewUserHeading"
					class="text-center addRunHeading greyTextColor">Edit Project</h1>
<%-- 					Hello <b><%= request.getParameter("userName") %></b>!
 --%>					
				<div class="col-sm-2 col-md-2"></div>
				<div class="col-sm-10 col-md-10">
					<div class="marginTop15px"></div>
					<div class="panel panel-info">
						<div class="panel-heading" id="viewUserHeading2">
							<span class="panel-title"><strong>Edit Project</strong></span>
						</div>
						<div class="panel-body">
						<div class="row">
			<div class="col-sm-8 col-sm-offset-2">

			
				<c:if test="${not empty messageEdit}">
					<div class="alert alert-success alert-dismissible" role="alert">
						<button type="button" class="close" data-dismiss="alert">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<strong>Success!</strong> ${messageEdit}
						<script>
							speak('${messageEdit }')
						</script>
					</div>
					<br>
				</c:if>
			

			
			</div>
		</div>
						
							<form:form class="form-horizontal" id="editProject" action="editProject"
								modelAttribute="project" method="POST">
								<div class="form-group">
									<label class="col-sm-4 control-label">Project Name* :</label>
									<div class="col-sm-8">
										
										<input class="form-control txtCase" name="projectName"
											id="projectName" value="${project.projectName}"  placeholder="Project Name" readonly></input>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label">Project
										Description* :</label>
									<div class="col-sm-8">
										<form:input class="form-control txtCase"
											path="projectDescription" id="projectDescription"
											placeholder="Project Description"></form:input>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label">Start Date* :</label>
									<div class="input-group date col-sm-4" id="dp-2"
										data-date-format="yyyy-mm-dd">
										<input type="text" class="form-control datepicker" placeholder="Start Date"
											name="startDate" id="startDate"/> <span class="input-group-addon add-on"><span
											class="glyphicon glyphicon-calendar"></span></span>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label">End Date* :</label>
									<div class="input-group date col-sm-4" id="dp-2"
										data-date-format="yyyy-mm-dd">
										<input type="text" class="form-control datepicker" placeholder="End Date"
											name="endDate" id="endDate" /> <span class="input-group-addon add-on"><span
											class="glyphicon glyphicon-calendar"></span></span>
									</div>
								</div>
								<input type="hidden" value="1" name="account">
									<%-- <div class="form-group">
									<label class="col-sm-4 control-label">Account* :</label> <select
										name="account" id="account">
										<option value="#">Select Account</option>
										<c:forEach items="${accounts}" var="account">
											<option value="${account.accountName}">${account.accountName}</option>
										</c:forEach>
									</select>
								</div> --%>
							<center>
									<input type="submit" class="btn btn-success   txtCenter"
										onclick="return formValidation()"> &nbsp; &nbsp;
									&nbsp; &nbsp; <input type="button" class="btn btn-primary "
										value="Reset" onclick="reset()">
								</center>
								<label class="pull-right"> <font size=2 " color="red"><span
										id="validationError"></span></font>
								</label>

							</form:form>
						</div>
					</div>

				</div>
				<div class="col-sm-2 col-md-2"></div>
			</div>

		</div>
		<jsp:include page="../../../common/footer.jsp"></jsp:include>
	</div>
	</div>
	</div>


</body>
</html>