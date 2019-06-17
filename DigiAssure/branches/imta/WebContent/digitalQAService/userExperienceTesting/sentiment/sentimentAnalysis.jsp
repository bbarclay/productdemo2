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
	function sendMail() {
		window.open('mailto:gaurav.dua@capgemini.com');
	}
	function show() {
		document.getElementById("myApp").style.visibility = "visible";
	}
</script>



<script type="text/javascript">
function madeAjaxCall(){
$.ajax({
type: "GET",
url: "${pageContext.request.contextPath}/digitalQAService/userExperienceTesting/sentimentAnalysis",
contentType:"application/json; charset=utf-8",
dataType:"json",
success: function(data){ 
	var name=[];
	var arrName=JSON.parse(JSON.stringify(data))["results"];
	for(var i=0; i<arrName.length;i++){
		 name.push(arrName[i]["name"]);
	}
        if(data){
            var len = name.length;
            if(len > 0){
                for(var i=0;i<len;i++){    
                    $("#show").append("<option value='"+name[i]+"'>"+name[i]+"</option>");
                }
            }
        }
    },
    error: function(jqXHR, textStatus, errorThrown){
        alert('error: ' + textStatus + ': ' + errorThrown);
    }
});
return false;
};
</script>
</head>
<body onload="madeAjaxCall()">

	<div>
		<jsp:include page="../../../common/logo.jsp"></jsp:include>
		<div class="marginTop15px"></div>
		<!-- <div class="container" style="background-color: #fa565a;"> -->
		<div class="container">
			<div class="">
				<div class="col-sm-4 col-md-2 marginTop50px">
					<jsp:include page="../../../accordion/accordion.jsp"></jsp:include>
				</div>
				<div class="col-sm-8 col-md-10 verticalLine">
					<div class="marginTop50px">
						<div class="page-header">
							<h1>Sentiment Analysis</h1>
						</div>
						<input type="radio" onclick='return show()'> Appbot <br>
						<br> <input type="radio" disabled="disabled"> App
						Lause <br> <br> <input type="radio" disabled="disabled">
						Apache UIMA<br>



						 
							<select id="show">
								<option value=''>--Select--</option>
							</select>
			 
					 



							<h1>
								<label>My Apps</label>
							</h1>

							<a href="./detailReport?appName=McDonalds"><label><img
									src="${pageContext.request.contextPath}/styles/images/mcdonalds.png"
									height="45" width="45">McDonads</label></a><br> <a
								href="./detailReport?appName=rexel"><label><img
									src="${pageContext.request.contextPath}/styles/images/rexel.jpg"
									height="40" width="45">Rexel</label></a><br> <a
								href="./detailReport?appName=chubb"><label><img
									src="${pageContext.request.contextPath}/styles/images/chubb.png"
									height="45" width="45">CHUBB Insurance</label></a><br> <a
								href="./detailReport?appName=gefleet"><label><img
									src="${pageContext.request.contextPath}/styles/images/ge.jpg"
									height="45" width="45">General Electric</label></a><br> <br>
							<br> <br> <br>
							<h4>
								<a href="https://appbot.co" target="_blank"> <label>Sentiment
										New App</label></a>
							</h4>

						</div>

						<div class="marginTop15px" id="drop"></div>
					</div>
				</div>
			</div>
		</div>
		<!-- Footer -->
		<jsp:include page="../../../common/footer.jsp"></jsp:include>
	</div>
</body>
</html>