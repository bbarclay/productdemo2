<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/styles/css/bootstrap.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/styles/css/main.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/styles/css/digi.css">
	
	
	
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
function goBack(){
	window.history.back();
}
</script>
<script type="text/javascript">
/* $('#formID').validationEngine('attach',{
    onValidationComplete: function(form, status){

        if (status == true){
        	alert("if");
            $("#formID").submit();
            return true;
        }
        else{
        	alert("else")
        }

    }
}); */
</script>
</head>
<body>

	<div>
		<!-- Header and Navigation Bar -->
		
		
		<div class="top-bar">
			<a href=""></a>
			<div class="font24px txtCenter"><label >Device Recommendation</label></div>
			
		</div>

		<jsp:include page="../../common/logo.jsp"></jsp:include>
		<div class="marginTop90px"></div>
		
		<div class="container">
		<div class="row">
			<div class="col-sm-12 col-md-12">
				<h1 class="text-center addRunHeading greyTextColor">
					Guideline Status
					 <button type="button" class="btn btn-primary pull-right" onclick="goBack()">
									BACK</button> 
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
				<c:if test="${ not empty testcases}">
				<form:form action="validateTestcases" method="post"
										modelAttribute="validatedTestcases" id="formID">  
						<input type="hidden" value="${batchid }"  name="batchid"/>
						
						<table class="table datatable table-striped table-bordered table-hover"
									id="testcaseTable">
									 <thead >
									<tr class="first tableHead">
										<th class="first col-sm-3"  >Test Case Name</th>
										<th class="col-sm-3">Test Case Description</th>
										<th class="col-sm-2" >Category</th>
										<th class="col-sm-1" >Level</th>
										<th class="col-sm-1">Status</th>
										<th class="col-sm-2">Comments</th>
									</tr>
									</thead>
									<tbody>
									<%-- <form:form action="validateTestcases" method="post"
										modelAttribute="validatedTestcases"> --%> 
										<c:forEach var="testcase" items="${testcases}">
										<%-- <input type="hidden" value="${testcase.testcaseid }" name="testcaseid" /> --%>
											<tr >
												<td class="first"> <a href="${testcase.helpURL }" target="_blank">  <input type="hidden"
													value="${testcase.testcaseName}" name="testcaseName">${testcase.testcaseName}
													</a><input type="hidden" value="${testcase.testcaseid }" name="testcaseid" />
													</td>

												<td><input type="hidden"
													value="${testcase.testcasedescription}"
													name="testcasedescription">${testcase.testcasedescription}</td>
												<td><input type="hidden" value="${testcase.category}"
													name="category">${testcase.category}</td>
												<td><input type="hidden" value="${testcase.level}"
													name="level">${testcase.level}</td>
												<td><select name="tcstatus" class="formDropDownAdd">
														<option value="${testcase.tcstatus}">${testcase.tcstatus}</option>
<!-- 													<option value="NOT_COMPLETED">NO RUN</option> -->
														<option value="PASSED">PASSED</option>
														<option value="FAILED">FAILED</option>
														<option value="NOT_COMPLETED">NO RUN</option>
														<option value="BLOCKED">BLOCKED</option>
													</select></td>
										

												<td><textarea name="comments" draggable="true"
														autofocus="autofocus" spellcheck="true"
														required="required">Comment </textarea></td>
											</tr>

									
							
										</c:forEach>
										<%-- <tr>
										<td>xxx</td><td>xxx</td><td>xxx</td><td>xxx</td><td>xxx</td>
										<td><form:hidden
													path="${testcase.testcaseid }" /> <input type="submit"
												value="Submit" name="SubmitTestcases"
												class="btn btn-success"></td>
										</tr>
										</form:form> --%>
									</tbody>
									</table>
									<input type="submit" value="Submit" name="SubmitTestcases" class="btn btn-success col-sm-1 col-sm-offset-5">
									</form:form>
									</c:if>
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
									</div>	
		

			<br>
			<br>
			<br>
		</div>
		<jsp:include page="../../common/footer.jsp"></jsp:include>
	
	
<!-- START SCRIPTS -->
        <!-- START PLUGINS -->
       <%--  <script type="text/javascript" src="${pageContext.request.contextPath}/styles/js/plugins/jquery/jquery.min.js"></script>  --%>
        <%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins/jquery/jquery-ui.min.js"></script> --%>
        <%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins/bootstrap/bootstrap.min.js"></script>    --%>     
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
     
     <script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins/validationengine/languages/jquery.validationEngine-en.js"></script>      
      <script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins/validationengine/jquery.validationEngine.js"></script>      
      
        <!-- END PAGE PLUGINS -->

        <!-- START TEMPLATE -->
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/settings.js"></script>
        
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins.js"></script>        
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/actions.js"></script>        
        <!-- END TEMPLATE -->
    <!-- END SCRIPTS --> 
         
    
</body>
</html>