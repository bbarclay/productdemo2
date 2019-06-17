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
<script type="text/javascript">
function speak(msg){
	var msg  = new SpeechSynthesisUtterance(msg);
window.speechSynthesis.speak(msg);
}
</script>
<script>
function validateTestCase(){

	document.getElementById("testNameError").innerHTML="";
	document.getElementById("desError").innerHTML="";
	document.getElementById("detailError").innerHTML="";
	document.getElementById("toolError").innerHTML="";
	document.getElementById("levelError").innerHTML="";
	document.getElementById("catError").innerHTML="";
 	var result=true;
 	
var testcaseName=document.getElementById("testcaseName");
var mytxtdes = document.getElementById("mytxtdes");
var mytxtdetail= document.getElementById("mytxtdetail");
var toolid=document.getElementById("toolid");
var level=document.getElementById("level");
var category=document.getElementById("category");

if(testcaseName.value==""){
	document.getElementById("testNameError").innerHTML="*   Enter valid test case name";
	result=false;
}

if(mytxtdes.value==""){
	document.getElementById("desError").innerHTML="* Enter test case description";
	result=false;
}

if(mytxtdetail.value == ""){
	document.getElementById("detailError").innerHTML="* Enter test case detail description";
	result=false;
}
if(toolid.value==""){
	document.getElementById("toolError").innerHTML="* Select Tool";
	result=false;
}
if(level.value==""){
	document.getElementById("levelError").innerHTML="* Select Level";
	result=false;
}
if(category.value==""){
	document.getElementById("catError").innerHTML="* Select Category";
	result=false;
}

return result;
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
								<a class="buttonlink" href="./batchHome"><b>Plan and Allocation</b></a>
							</li>
							<li>
							    <a href="${pageContext.request.contextPath}/digitalQAService/accessibilityTesting/viewAllocatedBatch" class="buttonlink">
								<b>Accessibility Test Plan</b></a>
							</li>
							<li  class="active">
								<a href="./addManualChecklisttestCase" class="buttonlink" style="background-color:#f3f3f3"><b><button class="btn accessibilityNavMenu">Add Guideline</button></b></a>
							</li>
							
							<li class="pull-right"><a href="http://10.102.22.88:8081/AccessibilityTestingPortal/demo.html" class="buttonlink" target="_blank"><b><button class="btn btn-primary helpButton">Help</button></b></a></li>
						</ul>
					</c:if>	
				</div>
				
			</div>
	
	<div class="container">
		<div class="">
		<div class="col-sm-2 col-md-2"></div>
			<div class="col-sm-8 col-md-8">
				<br>
					<h1 class="text-center addRunHeading greyTextColor">
						Add new Guidelines
						<!-- <button type="button" class="btn btn-primary"
							style="float: right;" onclick="goBack()">BACK</button> -->
					</h1>
					<br>
					<c:if test="${not empty successMessage}">
						<div class="alert alert-success alert-dismissible" role="alert">
							<button type="button" class="close" data-dismiss="alert">
								<span aria-hidden="true">×</span><span class="sr-only">Close</span>
							</button>
							${successMessage}<script>speak('${successMessage }')</script>
						</div>
						<br>
					</c:if>
						
					<c:if test="${not empty errorMessage}">
						<div class="alert alert-danger alert-dismissible" role="alert">
							<button type="button" class="close" data-dismiss="alert">
								<span aria-hidden="true">×</span><span class="sr-only">Close</span>
							</button><strong>Error!</strong>
							${errorMessage}<script>speak('${errorMessage }')</script>
						</div>
						<br>
					</c:if>		
					<div class="marginTop8"></div>
					<div class="panel panel-info">
						<div class="panel-heading">
							<span class="panel-title"><strong>${toolName}</strong></span>
						</div>
						<div class="panel-body">
							<div class="marginTop15px"></div>
							<form:form  class="form-horizontal" action="addNewAccessibilityTestCase" method="POST"
								id="addNewAccessibilityTestCase" modelAttribute="testcase"
								title="addNewAccessibilityTestCase"
								enctype="multipart/form-data" onsubmit="return validateTestCase()">

								<div class="form-group">
									<label for="run_name" class="col-sm-5 control-label">
										Guideline</label>
									<div class="col-sm-7">
										<form:input path="testcaseName" 
											class="form-control txtCase" placeholder="Enter Guideline" />
											<font color="red">	<span id="testNameError"></span></font>
									</div>
								</div>
								
								<div class="form-group">
									<label for="testcaseDescription" class="col-sm-5 control-label">Guideline Description</label>
									<div class="col-sm-7">
										<textarea id="mytxtdes" maxlength="2000" rows="" cols=""
											autofocus="autofocus" draggable="true"
											name="testcasedescription"></textarea>
											<font color="red">	<span id="desError"></span></font>
									</div>
								</div>
								
								<div class="form-group">
									<label for="testcasedetaildescription"
										class="col-sm-5 control-label">Guideline Detail
										Description</label>
									<div class="col-sm-7">
										<textarea id="mytxtdetail" maxlength="2000" rows="" cols=""
											autofocus="autofocus" draggable="true"
											name="testcasedetaildescription"></textarea>
											<font color="red">	<span id="detailError"></span></font>
									</div>
								</div>
								
								<div class="form-group">
									<label for="toolName" class="col-sm-5 control-label">Select
										Tool</label>
									<div class="col-sm-7">

										<select name="toolid" id="toolid">
											<option value="">SELECT</option>
											<c:forEach var="tool" items="${tools}">
												<option value="${tool.toolid }">${tool.toolname }</option>
											</c:forEach>
										</select>
										<font color="red">	<span id="toolError"></span></font>
									</div>
								</div>
								
								<div class="form-group">
									<label for="levelName" class="col-sm-5 control-label">Select
										Level</label>
									<div class="col-sm-7">
										<select name="level" id="level">
											<option value="">SELECT</option>
											<option value="Level A">Level A</option>
											<option value="Level AA">Level AA</option>
											<option value="Level AAA">Level AAA</option>
										</select>
										<font color="red">	<span id="levelError"></span></font>
									</div>
								</div>
								
								<div class="form-group">
									<label for="levelName" class="col-sm-5 control-label">Category</label>
									<div class="col-sm-7">
										<select name="category" id="category">
											<option value="">SELECT</option>
											<option value="Perceivable  Appearance">Perceivable
												Appearance</option>
											<option value="Operable Appearance">Operable
												Appearance</option>
											<option value="Understandable Appearance">Understandable
												Appearance</option>
											<option value="Robust Appearance">Robust Appearance</option>
										</select>
										<font color="red">	<span id="catError"></span></font>
									</div>
									<br>
								</div>
								<div class="marginTop50px"></div>
								<input type="submit" 
									class="btn btn-success btnCenter txtCenter" />
							</form:form>
						</div>
					</div>
					


					<div class="marginTop15px"></div>
				
			</div>
			<div class="col-sm-2 col-md-2"></div>
		</div>
	</div>
	<jsp:include page="../../common/footer.jsp"></jsp:include>
</body>
</html>