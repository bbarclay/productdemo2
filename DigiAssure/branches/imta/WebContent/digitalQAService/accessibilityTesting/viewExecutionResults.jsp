<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="../../styles/css/bootstrap.css">
<link rel="stylesheet" href="../../styles/css/main.css">
<link rel="stylesheet" href="../../styles/css/digi.css">
<script type="text/javascript">
function goBack(){
	window.history.back();
}
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

</head>
<body>

	<div>
		<!-- Header and Navigation Bar -->

		<jsp:include page="../../common/logo.jsp"></jsp:include>
		<div class="marginTop15px"></div>
		<div class="container">
			<div class="row">
				<div class="col-sm-12 col-md-12">
					<div class="marginTop65px">
						<div class="page-header">

							<h1 class="text-center addRunHeading greyTextColor">
								<b> Execution Report </b>
						<button
									type="button" class="btn btn-primary pull-right" onclick="goBack()">
									BACK</button> 	</h1>
							<br> <b><font color="green" size="4">
									${successMessage}</font></b> <br> <br> <b><font
								color="green" size="4"> ${errorMessage} </font></b> <br>
							<div class="select-bar"></div>
							<c:if test="${ not empty results}">

								<table class="table table-striped table-bordered"
									id="testcaseTable">
									<tr class="first">
										<th class="first">Batch Name</th>
										<th>Test Case Name</th>
										<th>Execution Status</th>
										<th>Comments</th>
										<th>Executed By</th>
										<th class="last">ALM</th>
									</tr>
									<form:form action="validateTestcases" method="post"
										modelAttribute="validatedTestcases">
										<c:forEach var="testcase" items="${results}">
											<input type="hidden" value="${testcase.batchid }"
												name="batchid">
											<input type="hidden" value="${testcase.testcaseid }"
												name="testcaseid">
											<tr class="last">
												<td class="first">${testcase.batchname}</td>
												<td>${testcase.testcasename}</td>
												<td><input type="hidden" value="${testcase.tcstatus}"
													name="tcstatus">${testcase.tcstatus}</td>
												<td><input type="hidden" value="${testcase.comments}"
													name="comments">${testcase.comments }</td>

												<td><input type="hidden" value="${testcase.username}"
													name="username">${testcase.username }</td>
													<td>HP ALM</td>
											</tr>
										</c:forEach>
									</form:form>
									<tr></tr>
								</table>
							</c:if>
							<c:if test="${ empty results}">
								<div class="alert alert-danger alert-dismissible" role="alert">
									<button type="button" class="close" data-dismiss="alert">
										<span aria-hidden="true">×</span><span class="sr-only">Close</span>
									</button>
									No Test cases | Execution Not started ...
								</div>
							</c:if>
							<b> <font color="red" size="5">${errorMessage}</font></b>
							<div class="marginTop15px"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="../../common/footer.jsp"></jsp:include>
	</div>
</body>
</html>