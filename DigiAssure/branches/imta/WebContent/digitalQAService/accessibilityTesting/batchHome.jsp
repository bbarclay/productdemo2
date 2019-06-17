
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
function goBack(){
	window.history.back();
}
</script>
<link rel="stylesheet" href="../../styles/css/bootstrap.css">
<link rel="stylesheet" href="../../styles/css/main.css">
<link rel="stylesheet" href="../../styles/css/digi.css">

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
function speak(msg){
	var msg  = new SpeechSynthesisUtterance(msg);
window.speechSynthesis.speak(msg);
}
</script>
</head>
<body>
	 
		<!-- Header and Navigation Bar -->
		<jsp:include page="../../common/logo.jsp"></jsp:include>
		<div class="marginTop65px"></div>
		
		
		
		
			<div class="row">
				<div class="col-md-12 col-lg-12 marginTop15px">
					<c:if test="${sessionScope.rolename == 'ADMIN'}"> 
						<ul class="nav nav-tabs marginLeft15px">
						
							<li>
							    <a href="${pageContext.request.contextPath}/digitalQAService/accessibilityTesting/viewAllocatedBatch" class="buttonlink">
								<b>Execution DashBoard</b></a>
							</li>
							
							<li class="active">
								<a class="buttonlink" href="./batchHome" style="background-color:#f3f3f3"><b><button class="btn accessibilityNavMenu">Plan and Allocation</button></b></a>
							</li>
							<!-- <li >
							
							<a href="testSuiteCreator?batchid=" class="buttonlink"><b>WCAG Guideline</b></a>
							
								<a href="./addManualChecklisttestCase" class="buttonlink"><b>Add Guideline</b></a>
							</li>
							 -->
							<li class="pull-right"><a href="http://10.102.22.88:8081/AccessibilityTestingPortal/demo.html" class="buttonlink" target="_blank"><b><button class="btn btn-primary helpButton">Help</button></b></a></li>
						</ul>
					</c:if>	
				</div>
			</div>
 
		
	<div class="container">
		<div class="row">
			<div class="col-sm-12 col-md-12">
				<h1 class="text-center addRunHeading greyTextColor">
					Allocation Dashboard <a href='./addTestSuite?toolName=AccessibilityTesting'>
					<button type="button" class="btn btn-primary addRunButton" title="Add New Test Suite">
						Add New Test Suite <span class="glyphicon glyphicon-plus"></span>
					</button></a>
				</h1>
			</div>
		</div>
	</div>
	
	<div class="container">
		<div class="row">
			<div class="col-sm-8 col-sm-offset-2">
				<c:if test="${not empty successMessage}">
					<div class="alert alert-success alert-dismissible" role="alert">
						<button type="button" class="close" data-dismiss="alert">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button><strong>Success!</strong>
						${successMessage}<script>speak('${successMessage }')</script>
					</div>
					<br>
				</c:if>
				
				<c:if test="${not empty errorMessage}">
					<div class="alert alert-success alert-dismissible" role="alert">
						<button type="button" class="close" data-dismiss="alert">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button><strong>Error!</strong>
						${errorMessage}<script>speak('${errorMessage }')</script>
					</div>
					<br>
				</c:if>
				
				<c:if test="${ empty batches}">
					<div class="alert alert-info alert-dismissible" role="alert">
						<button type="button" class="close" data-dismiss="alert">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button><strong>Info!</strong>
									No Batches Scheduled ...
					</div>
					<br>
				</c:if>
			</div>
		</div>
	</div>
		
	<div class="container">
		<div class="row">
			<div class="col-sm-12 col-md-12">
					<div class="select-bar"></div>
							<c:if test="${ not empty batches}">

								<table class="table table-striped table-bordered table-hover"
									id="runsTable">
									<tr class="first tableHead">
										<th class="first">Batch Name</th>
										<th>Remarks</th>
										<th>Tool Name</th>
										<th>Allocated User</th>
										<th>Progress</th>
										<th>Status</th>
										<th class="last">Select Guideline</th>
											<th class="last">Report</th>
									</tr>
									<c:forEach var="batch" items="${batches}">
										<tr class="last">
											<td class="first">${batch.batchname}</td>
											<td>${batch.remarks}</td>
											<td>${batch.toolname}</td>
											<td>${batch.username}</td>
											<td>${batch.executionpercentage}</td>
											<td>${batch.executionstatus}</td>
											<td class="last"><a
												href='./testSuiteCreator?batchid=${batch.batchid }'> <img
													src="${pageContext.request.contextPath}/styles/images/selecttestcases.png"
													height="30" width="30" title="Select Guideline"></a></td>
													
													
													 <td class="last"><a
									href='./viewExecutionResults?batchid=${batch.batchid }'><img
										src="${pageContext.request.contextPath}/styles/images/results.png"
										height="30" width="80" title="View Execution Results"></a></td>

										</tr>
									</c:forEach>
								</table>
								<br>
								<br>
							</c:if>
							<div class="marginTop15px"></div>
					</div>
				</div>
			</div>
		<jsp:include page="../../common/footer.jsp"></jsp:include>

</body>
</html>


