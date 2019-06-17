<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/css/main.css">

<script src="${pageContext.request.contextPath}/vendor/jquery/dist/jquery.js"></script>
<script src="${pageContext.request.contextPath}/vendor/angular/angular.js"></script>
<script
	src="${pageContext.request.contextPath}/vendor/angular-ui-router/release/angular-ui-router.js"></script>
<script src="${pageContext.request.contextPath}/vendor/angular-route/angular-route.js"></script>
<script src="${pageContext.request.contextPath}/vendor/angular-ui-bootstrap-bower/ui-bootstrap.js"></script>
<script
	src="${pageContext.request.contextPath}/vendor/angular-ui-bootstrap-bower/ui-bootstrap-tpls.js"
	type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/vendor/bootstrap/dist/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/js/app/app.js"></script>
<script src="${pageContext.request.contextPath}/js/main.js"></script>

<script type="text/javascript">
	// Function to start seetest URL in New Tab
	function runSeeTest() {
		window.open('http://igteblrwfmobt:9191', '_blank');
	}

	//function calling DigiAssure Controller method for Downloading Excel Template
	function downloadExcelTemplate() {
		//window.location.href = 'downloadExcelUtility';
		alert("Click Ok to Download Template");
		$.ajax({
			type : 'GET',
			url : "downloadExcelUtility",
		});
		alert("Download Success");
	}

	function sendMail() {
		window.open('mailto:gaurav.dua@capgemini.com');
	}
	</script>
</head>
<body>

<div>
		<!-- Header and Navigation Bar -->
	
		 <jsp:include page="../../common/logo.jsp"></jsp:include>
		 <div class="marginTop50px"></div>
		 <div class="container">
			<div class="row" style="border-bottom: 1px solid lightgrey;">
			<div class="col-md-4 col-lg-4">
			<label style="font-size: 24px;">Accessibility Testing</label>
			
			</div>
			<div class="col-md-7 col-lg-4"></div>
			<div class="col-md-1 col-lg-4" >
			<a href="http://10.102.22.88:8081/AccessibilityTestingPortal/demo.html"><button class="btn btn-primary" style="margin-top: 3px;">Help</button></a>	
			<%-- <a href="../../mobileLab/mobileLab.jsp"><button style="float: right; margin: 0 5px;"
					class="btn btn-primary "
					>Help</button></a>
				<button type="button" style=" float: right;"
					class="btn btn-primary" onclick="runSeeTest()"
					title="Start Testing">
					Start Testing <span class="glyphicon glyphicon-plus"></span>
				</button>
				<a href="../../mobileLab/downloadExcelUtility" ><button style="float: right; margin:0 5px;"
					type="button" class="btn btn-primary">
					Download TestPlan <img
						src="${pageContext.request.contextPath}/styles/images/download.png"
						height="20" width="20"
						title="Download TestPlan">
				</button> 
				</a>  --%>
			</div>
			     
		</div>
		</div>
		<c:if test="${sessionScope.rolename == 'ADMIN'}"> 
			<ul class="nav nav-tabs" >
				<li class="active">
				    <a href="${pageContext.request.contextPath}/digitalQAService/accessibilityTesting/viewAllocatedBatch">
					<b><button class="btn" style="background-color: gray;color:#fff;">Accessibility Test Plan</button></b></a>
				</li>
				 
				<li>
					<a href="./addManualChecklisttestCase">
					<b><button class="btn" style="background-color: gray;color:#fff;">Add Test Case</button></b></a>
				</li>
				<li>
					<a href="./batchHome"><b><button
								class="btn" style="background-color: gray;color:#fff;">Allocation</button></b></a></li>
							
			</ul> 
		</c:if>		
			
			<div class="container">
			<div class="row">
				<div class="col-sm-12 col-md-12">
					<div class="marginTop50px">
						<div class="page-header">

							<h3 class="text-center" style="color: #1d7ec2">
								Test Set For Execution 
							
							</h3>
							<c:if test="${not empty successMessage }">
							<br> <b><font color="green" size="4">
									${successMessage}</font></b> <br> 
							</c:if>
							<c:if test="${not empty errorMessage }">		
							<br> <b><font
								color="green" size="4"> ${errorMessage} </font></b> <br>
							</c:if>
							<div class="select-bar"></div>
							<c:if test="${ not empty batches}">

								<table class="table table-striped table-bordered table-hover" id="runsTable">
									<tr class="first" style="background-color:#AFE7FA;">
										<th class="first">Batch Name</th>
										<th>Remarks</th>
										<th>Tool Name</th>
										<th>Execution Status</th>
										<th>Execution Percentage</th>
										<th>Creator</th>
										<th>Execute</th>
										<th class="last">Results</th>
									</tr>
									<c:forEach var="batch" items="${batches}">
										<tr class="last">
										
											<td class="first">${batch.batchname}</td>
											<td>${batch.remarks}</td>
											<td>${batch.toolname}</td>
											<td>${batch.executionstatus}</td>
											<td>${batch.executionpercentage}</td>
											<td>${batch.username}</td>
											<td class="last"><a
												href='./viewTestcases?batchid=${batch.batchid }'><img  src="${pageContext.request.contextPath}/styles/images/execute1.png" height="30" width="30" title="Execute TestCases"></a></td>
											<td class="last"><a
												href='./viewExecutionResults?batchid=${batch.batchid }'><img  src="${pageContext.request.contextPath}/styles/images/results.png" height="30" width="80" title="View Execution Results"></a></td>
										</tr>
									</c:forEach>
								</table>
							</c:if>
							<c:if test="${ empty batches}">
								<div class="alert alert-danger alert-dismissible" role="alert">
									<button type="button" class="close" data-dismiss="alert">
										<span aria-hidden="true">×</span><span class="sr-only">Close</span>
									</button>
									No Batches Scheduled to you...
								</div>

							</c:if>

							<b> <font color="red" size="5">${errorMessage}</font></b>


							<div class="marginTop15px"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div style="margin-top: 265px;"></div>
		<jsp:include page="../../common/footer.jsp"></jsp:include>
</div>   
</body>
</html>