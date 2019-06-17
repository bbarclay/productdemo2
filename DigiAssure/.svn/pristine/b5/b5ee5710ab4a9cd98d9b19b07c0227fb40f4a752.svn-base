<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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


<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
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

	<div>
		<!-- Header and Navigation Bar -->

		<jsp:include page="../../common/logo.jsp"></jsp:include>
		<div class="marginTop65px"></div>
		<%-- 
		<div class="row">
		<div class="col-md-12 col-lg-12 marginTop15px">
			<c:if test="${sessionScope.rolename == 'ADMIN'}">
				<ul class="nav nav-tabs marginLeft15px">
						
							<li>
							    <a href="${pageContext.request.contextPath}/digitalQAService/accessibilityTesting/viewAllocatedBatch" class="buttonlink">
								<b>Accessibility Test Plan</b></a>
							</li>
							
							<li >
								<a class="buttonlink" href="./batchHome" style="background-color:#f3f3f3"><b>Plan and Allocation</button></b></a>
							</li>
							
							<li class="active"><a href="./testSuiteCreator?batchid=" style="background-color:#f3f3f3 class="buttonlink"><b><button class="btn accessibilityNavMenu">WCAG Guideline</button></b></a></li>
							
								<!-- <a href="./addManualChecklisttestCase" class="buttonlink"><b>Add Guideline</b></a> -->
						
							
							<li class="pull-right"><a href="http://10.102.22.88:8081/AccessibilityTestingPortal/demo.html" class="buttonlink" target="_blank"><b><button class="btn btn-primary helpButton">Help</button></b></a></li>
						</ul>
			</c:if>

		</div>
	</div>
 --%>
		
		
	<div class="container">
		<div class="row">
			<div class="col-sm-12 col-md-12">
				<h1 class="text-center addRunHeading greyTextColor">
					WCAG CheckPoints
					
					 <a href="./addManualChecklisttestCase" class="btn btn-primary pull-right marginLeft15px"><b>Add Guideline</b></a>
					 <%-- <button type="button" class="btn btn-primary pull-right marginLeft15px" onclick="goBack()">BACK</button> 
					 <div class="btn-group pull-right ">
                                        <button class="btn btn-danger dropdown-toggle" data-toggle="dropdown"><i class="fa fa-bars"></i> Export Data</button>
                                        <ul class="dropdown-menu">
                                            <li><a href="#" onClick ="$('#customers2').tableExport({type:'json',escape:'false'});"><img src='${pageContext.request.contextPath}/styles/images/json.png' width="24"/> JSON</a></li>
                                            <li><a href="#" onClick ="$('#customers2').tableExport({type:'json',escape:'false',ignoreColumn:'[2,3]'});"><img src='${pageContext.request.contextPath}/img/icons/json.png' width="24"/> JSON (ignoreColumn)</a></li>
                                            <li><a href="#" onClick ="$('#customers2').tableExport({type:'json',escape:'true'});"><img src='${pageContext.request.contextPath}/styles/images/json.png' width="24"/> JSON (with Escape)</a></li>
                                            <li class="divider"></li>
                                            <li><a href="#" onClick ="$('#customers2').tableExport({type:'xml',escape:'false'});"><img src='${pageContext.request.contextPath}/styles/images/xml.png' width="24"/> XML</a></li>
                                            <li><a href="#" onClick ="$('#customers2').tableExport({type:'sql'});"><img src='${pageContext.request.contextPath}/styles/images/sql.png' width="24"/> SQL</a></li>
                                            <li class="divider"></li>
                                            <li><a href="#" onClick ="$('#customers2').tableExport({type:'csv',escape:'false'});"><img src='${pageContext.request.contextPath}/styles/images/csv.png' width="24"/> CSV</a></li>
                                            <li><a href="#" onClick ="$('#customers2').tableExport({type:'txt',escape:'false'});"><img src='${pageContext.request.contextPath}/styles/images/txt.png' width="24"/> TXT</a></li>
                                            <li class="divider"></li>
                                            <li><a href="#" onClick ="$('#customers2').tableExport({type:'excel',escape:'false'});"><img src='${pageContext.request.contextPath}/styles/images/xls.png' width="24"/> XLS</a></li>
                                            <li><a href="#" onClick ="$('#customers2').tableExport({type:'doc',escape:'false'});"><img src='${pageContext.request.contextPath}/styles/images/word.png' width="24"/> Word</a></li>
                                            <li><a href="#" onClick ="$('#customers2').tableExport({type:'powerpoint',escape:'false'});"><img src='${pageContext.request.contextPath}/styles/images/ppt.png' width="24"/> PowerPoint</a></li>
                                            <li class="divider"></li>
                                            <li><a href="#" onClick ="$('#customers2').tableExport({type:'png',escape:'false'});"><img src='${pageContext.request.contextPath}/styles/images/png.png' width="24"/> PNG</a></li>
                                            <li><a href="#" onClick ="$('#customers2').tableExport({type:'pdf',escape:'false'});"><img src='${pageContext.request.contextPath}/styles/images/pdf.png' width="24"/> PDF</a></li>
                                        </ul>
                                    </div>  --%>
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
					<div class="alert alert-danger alert-dismissible" role="alert">
						<button type="button" class="close" data-dismiss="alert">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button><strong>Error!</strong>
						${errorMessage}<script>speak('${errorMessage }')</script>
					</div>
					<br>
				</c:if>
			</div>
		</div>
	</div>
	
	<div class="container">
			<div class="row">
				<div class="col-sm-12 col-md-12">
				<c:if test="${ not empty newtestcases}">
				<form:form action="addTestcasestoBatch" method="post"
										modelAttribute="selectedTestcases"> 
						<input type="hidden" value="${batchid }"  name="batchid"/>
						<table class="table datatable table-striped table-bordered table-hover"
									id="testcaseTable">
									 <thead >
									<tr class="first tableHead">
										<th >Test Case Name</th>
										<th >Test Case Description</th>
										<th >Category</th>
										<th >Level</th>
										<th >Selection</th>
									</tr>
									</thead>
									<tbody>
									 
										
									
										<c:forEach var="testcase" items="${newtestcases}">
										
											<tr>
												<td class="first"><input type="hidden"
													value="${testcase.testcaseName}" name="testcaseName">${testcase.testcaseName}</td>

												<td><input type="hidden"
													value="${testcase.testcasedescription}"
													name="testcasedescription">${testcase.testcasedescription}</td>
												<td><input type="hidden" value="${testcase.category}"
													name="category">${testcase.category}</td>
												<td><input type="hidden" value="${testcase.level}"
													name="level">${testcase.level}</td>
												<td><input type="checkbox" value="${testcase.testcaseid}" name="testcaseid"></td>

											</tr>
							
										</c:forEach>
										<!--  <tr><td colspan="5" class="text-center">
										<input type="submit" value="Submit" name="SubmitTestcases" class="btn btn-success"></td></tr>   -->
									</tbody>
									</table>
									<input type="submit" value="Submit" name="SubmitTestcases" class="btn btn-success col-sm-1 col-sm-offset-5">
									</form:form>
									</c:if>
									<c:if test="${ empty newtestcases}">
								<div class="alert alert-danger alert-dismissible" role="alert">
									<button type="button" class="close" data-dismiss="alert">
										<span aria-hidden="true">×</span><span class="sr-only">Close</span>
									</button>
									No Test cases ...
								</div>
							</c:if>
							<b> <font color="red" size="5"> <script>speak('${errorMessage}')</script>${errorMessage}</font></b>
							<div class="marginTop15px"></div>
									</div>
									</div>
									</div>
		<div class="marginTop90px"></div> 
	
<%-- 	<div class="container">
			<div class="row">
				<div class="col-sm-12 col-md-12">
							<div class="select-bar"></div>
							<c:if test="${ not empty newtestcases}">

								<table class="table datatable table-striped table-bordered table-hover"
									id="testcaseTable">
									 <thead >
									<tr class="first tableHead">
										<th >Test Case Name</th>
										<th>Test Case Description</th>
										<th>Category</th>
										<th>Level</th>
										<th >Selection</th>
									</tr>
									</thead>
									<tbody>
									
									<form:form action="addTestcasestoBatch" method="post"
										modelAttribute="selectedTestcases">
										<input type="hidden" value="${batchid }"  name="batchid"/>
										<c:forEach var="testcase" items="${newtestcases}">
										
											<tr >
												<td class="first"><input type="hidden"
													value="${testcase.testcaseName}" name="testcaseName">${testcase.testcaseName}</td>

												<td><input type="hidden"
													value="${testcase.testcasedescription}"
													name="testcasedescription">${testcase.testcasedescription}</td>
												<td><input type="hidden" value="${testcase.category}"
													name="category">${testcase.category }</td>
												<td><input type="hidden" value="${testcase.level}"
													name="level">${testcase.level }</td>
												<td><input type="checkbox" value="${testcase.testcaseid}" name="testcaseid"></td>

											</tr>
											
										</c:forEach>
										<!-- <tr><td colspan="5" class="text-center">
										<input type="submit" value="Submit" name="SubmitTestcases" class="btn btn-success"></td></tr> -->
									</form:form>
									<tr></tr>
									</tbody>
								</table>
							</c:if>
							<br><br><br><br>
							<c:if test="${ empty testcases}">
								<div class="alert alert-danger alert-dismissible" role="alert">
									<button type="button" class="close" data-dismiss="alert">
										<span aria-hidden="true">×</span><span class="sr-only">Close</span>
									</button>
									No Test cases ...
								</div>
							</c:if>
							<b> <font color="red" size="5"> <script>speak('${errorMessage}')</script>${errorMessage}</font></b>
							<div class="marginTop15px"></div>
					</div>
				</div>
			</div> --%>
		</div>
		<jsp:include page="../../common/footer.jsp"></jsp:include>
		<!-- START SCRIPTS -->
        <!-- START PLUGINS -->
<%--          <script type="text/javascript" src="${pageContext.request.contextPath}/styles/js/plugins/jquery/jquery.min.js"></script> 
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins/jquery/jquery-ui.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins/bootstrap/bootstrap.min.js"></script>     --%>
        <!-- END PLUGINS -->                
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.slimscroll.min.js"></script>
       <script type="text/javascript" src="${pageContext.request.contextPath}//styles/js/jquery.slimscroll.js"></script> --%>
		 <!-- THIS PAGE PLUGINS -->
        <script type='text/javascript' src='${pageContext.request.contextPath}/js/plugins/icheck/icheck.min.js'></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins/mcustomscrollbar/jquery.mCustomScrollbar.min.js"></script>
        
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins/datatables/jquery.dataTables.min.js"></script>    
         <script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins/tableexport/tableExport.js"></script>
              <script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins/tableexport/jquery.base64.js"></script>
              <script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins/tableexport/html2canvas.js"></script>
              <script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins/tableexport/jspdf/libs/sprintf.js"></script>
              <script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins/tableexport/jspdf/jspdf.js"></script>
              <script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins/tableexport/jspdf/libs/base64.js"></script>      
        <!-- END PAGE PLUGINS -->

        <!-- START TEMPLATE -->
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/settings.js"></script>
        
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins.js"></script>        
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/actions.js"></script>        
        <!-- END TEMPLATE -->
    <!-- END SCRIPTS --> 
</body>
</html>