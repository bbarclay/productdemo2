<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
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
function addProject(){
	//alert("in");
	$.ajax({
		data:{
		},
        url: "${pageContext.request.contextPath}/addProject" ,
        succes: function () { }
    });
}
</script>
<style type="text/css">
thead {
	background-color: #80e5ff;
}
</style>
</head>
<body>
	<jsp:include page="../common/logo.jsp"></jsp:include>
	<div class="marginTop50px"></div>
	
		<br> <br> <br> <br>
		<div class="font24px txtCenter">
			<label>Project Lists</label>
		</div>
		<br>
		<div class="row col-sm-12">
		<div class="col-sm-1"> 
		
		
		</div>
		<div class="col-sm-10"> 
		<c:if test="${not empty project}">
			<table class="table table-striped table-bordered" >
				<thead>
					<tr class="tableHead">
						<th>Project Name</th>
						<th>Project Description</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="project" items="${project}">
						<tr>
							<td align="left"><c:out value="${project.projectName}" /></td>

							<td align="left"><c:out
									value="${project.projectDescription}" /></td>
						</tr>
					</c:forEach>
				</tbody>

			</table>
		</c:if>
	</div>
	<div class="col-sm-1"> </div>
</div>
	<div class="consoleMargin">
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</div>
</body>
</html>
