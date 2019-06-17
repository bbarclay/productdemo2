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
	function goBack() {
		window.history.back();
	}
</script>
<script type="text/javascript">
	function check() {
		if (document.getElementById('remarks').value == ""
				|| document.getElementById('remarks').value == undefined
				|| document.getElementById('batchname').value == ""
				|| document.getElementById('batchname').value == undefined) {
			alert("Please Enter the fields");
			return false;
		}
		return true;
	}
</script>
<script type="text/javascript">
function speak(msg){
	var msg  = new SpeechSynthesisUtterance(msg);
window.speechSynthesis.speak(msg);
}
</script>
<script type="text/javascript">
	function maxLength(el) {
		if (!('maxLength' in el)) {
			var max = el.attributes.maxLength.value;
			el.onkeypress = function() {
				if (this.value.length >= max)
					alert("exeeds limit");
			};
		}
	}

	maxLength(document.getElementById("mytxtdes"));
</script>
<script type="text/javascript">
	function maxLength(el) {
		if (!('maxLength' in el)) {
			var max = el.attributes.maxLength.value;
			el.onkeypress = function() {
				if (this.value.length >= max)
					alert("exeeds limit");
			};
		}
	}

	maxLength(document.getElementById("mytxtdetail"));
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

<title>Accessibility Testing | New Test Case</title>

</head>
<body>

	<!-- Header and Navigation Bar -->

	<jsp:include page="../../common/logo.jsp"></jsp:include>

	<div class="marginTop65px"></div>
	<div class="container">
		<h1 class="text-center addRunHeading greyTextColor">
			Add Manual Test Suite
			
		</h1>
		<button type="button" class="btn btn-primary pull-right" onclick="goBack()">BACK</button>
		<div class="">
			<div class="col-sm-2 col-md-2"></div>
			<div class="col-sm-8 col-md-8">
				<div class="marginTop15px"></div>
					<div class="panel panel-info">
						<div class="panel-heading">
							<span class="panel-title"><strong>ADD TEST SUITE</strong></span>
						</div>
						<div class="panel-body">
							<div class="marginTop15px"></div>
							<form:form class="form-horizontal" action="addNewTestSuite" method="POST"
								id="addNewTestSuite" modelAttribute="batch"
								title="addNewTestSuite">

								<div class="form-group">
									<label for="run_name" class="col-sm-4 control-label">
										Batch Name</label>
									<div class="col-sm-8">   
										<form:input path="batchname" class="form-control txtCase"
											id="batchname" placeholder="Enter Batch Name"
											onclick="return check1();" />
									</div>
								</div>
								
								<div class="form-group">
									<label for="Batch Remarks" class="col-sm-4 control-label">Batch
										Remarks</label>
									<div class="col-sm-8">
										<form:input path="remarks" class="form-control txtCase" id="remarks"
											placeholder="Remarks" />
									</div>
								</div>
								
								<div class="form-group">
									<label for="toolName" class="col-sm-4 control-label">Select
										Tool</label>
									<div class="col-sm-8">

										<select name="toolid">
											<option value="#">SELECT TOOL</option>
											<c:forEach var="tool" items="${tools}">
												<option value="${tool.toolid }">${tool.toolname }</option>
											</c:forEach>
										</select>
									</div>
								</div>

								

								<div class="form-group">
									<label for="allocatedUser" class="col-sm-4 control-label">Allocated
										User</label>
									<div class="col-sm-8">

										<select name="allocatedUser">
											<option value="#">SELECT</option>
											<c:forEach var="allocatedUser" items="${users}">
												<option value="${allocatedUser.userid }">${allocatedUser.userName }</option>
											</c:forEach>
										</select>
									</div>
								</div>

								<div class="marginTop50px"></div>
								
								<input type="submit" class="btn btn-success btnCenter"
									onclick="return check();">
							</form:form>
						</div>
					</div>
					<font size="4" color="red"><b> <script> speak('${errorMessage}')</script>${errorMessage } </b></font> <font
						size="4" color="green"><b><script> speak('${successMessage}')</script> ${successMessage } </b></font>


					<div class="marginTop15px"></div>
				
			</div>
			<div class="col-sm-2 col-md-2"></div>
		</div>
	</div>
<div class="testSuiteMargin">
	<jsp:include page="../../common/footer.jsp"></jsp:include>
</div>
</body>
</html>