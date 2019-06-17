<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

</head>
<body>
<div>
	<!-- Header and Navigation Bar -->
	<jsp:include page="../common/logo.jsp"></jsp:include>
	<jsp:include page="../common/nav.jsp"></jsp:include>
 
	<div class="marginTop90px"></div>
	<div class="container">
		<div class="row">
			<div class="col-sm-1 marginTop15px"></div>
			<div class="col-sm-10 marginTop15px">
				<h1 class="text-center" style="color: #1d7ec2">DigiAssure - A
					Complete Digital Quality Assurance Solution</h1>
				<h2 class="text-center">DigiAssure is innovative QA platform
					providing single window to access and integrate different digital
					QA services and tools to achieve improved customer experience and
					speed</h2>
			</div>
			<div class="col-sm-1 marginTop15px"></div>
		</div>

		<div class="marginTop50px"></div>

	</div>
	<jsp:include page="../landing/landingCarousel.jsp"></jsp:include>
	<jsp:include page="../landing/panel.jsp"></jsp:include>
<!-- 	<div ng-include="'landing/landingCarousel.html'"></div> -->
<!-- 	<div ng-include="'landing/panel.html'"></div> -->
	<!-- Footer -->
	<div ng-include="'common/footer.jsp'"></div>
</div>
</body>
</html>