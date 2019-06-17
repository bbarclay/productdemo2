<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit User</title>
<link rel="stylesheet" href="../../styles/css/bootstrap.css">
<link rel="stylesheet" href="../../styles/css/main.css">
<link rel="stylesheet" href="../../styles/css/digi.css">

<script>
	function formValidation() {

		if (document.getElementById("firstName").value == ""
				|| document.getElementById("lastName").value == ""
				|| document.getElementById("password").value == ""
				|| document.getElementById("email").value == ""
				|| document.getElementById("project").value == "#"
				|| (document.getElementById("admin").checked == false && document
						.getElementById("user").checked == false)

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

		document.getElementById("editUser").reset();
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
<body >
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
								<li class="xn-openable active"><a href="#"><span
										class="fa fa-pencil"></span> <span class="xn-text">Users</span></a>
									<ul>
										<li><a
											href="../../mobileLab/deviceSelectionMatrix/viewUser"><span
												class="fa fa-tasks"></span>View User</a></li>
										<li class="active"><a
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


			<div class="container">
			

				<h1 id="viewUserHeading"
					class="text-center addRunHeading greyTextColor">Edit User</h1>
<%-- 					Hello <b><%= request.getParameter("userName") %></b>!
 --%>					
				<div class="col-sm-2 col-md-2"></div>
				<div class="col-sm-10 col-md-10">
					<div class="marginTop15px"></div>
					<div class="panel panel-info">
						<div class="panel-heading" id="viewUserHeading2">
							<span class="panel-title"><strong>Edit User</strong></span>
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
						
							<form:form class="form-horizontal" id="editUser" action="editUser"
								modelAttribute="user" method="POST">
								<div class="form-group">
									<label class="col-sm-4 control-label">Username* :</label>
									<div class="col-sm-8">
									<% String userName=request.getParameter("userName"); %>
									
										<input class="form-control txtCase" 
											id="userName" name="userName" placeholder="Username" value="<%=userName%>" readonly></input>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label">First Name* :</label>
									<div class="col-sm-8">
									<% String firstName=request.getParameter("firstName"); %>
										<form:input class="form-control txtCase" path="firstName" value="<%=firstName%>"
											id="firstName" placeholder="First Name"></form:input>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label">Last Name* :</label>
									<div class="col-sm-8">
										<form:input class="form-control txtCase" path="lastName"
											id="lastName" placeholder="Last Name"></form:input>
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-sm-4 control-label">Password* :</label>
									<div class="col-sm-8">
										<form:password class="form-control txtCase" path="userPassword"
											id="password" placeholder="Password"></form:password>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label">Email* :</label>
									<div class="col-sm-8">
										<form:input class="form-control txtCase" path="email"
											id="email" placeholder="Email"></form:input>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label">Phone Number :</label>
									<div class="col-sm-8">
										<form:input class="form-control txtCase" path="phoneNumber"
											id="phoneNumber" placeholder="Phone Number"></form:input>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label">Project* :</label> <select
										name="project" id="project">
										<option value="#">SELECT TOOL</option>
										<c:forEach items="${projects}" var="projects">
											<option value="${projects.projectName }">${projects.projectName}</option>
										</c:forEach>
									</select>
								</div>

								<div class="form-group">
									<label class="col-sm-4 control-label radio-inline">User
										Type* :</label>
									<div class="col-sm-8">
										<form:radiobutton id="admin" path="rolename" value="admin" />
										Admin
										<form:radiobutton id="user" path="rolename" value="user" />
										User
									</div>
								</div>
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