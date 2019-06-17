<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./styles/css/bootstrap.css">
<link rel="stylesheet" href="./styles/css/main.css">
<link rel="stylesheet" href="./styles/css/digi.css">
<!--  <link rel="stylesheet" href="./styles/css/font-awesome.css"> -->

<link href="https://fortawesome.github.io/Font-Awesome/assets/font-awesome/css/font-awesome.css" rel="stylesheet"> 


<script src="vendor/jquery/dist/jquery.js"></script>
<script src="vendor/angular/angular.js"></script>
<script src="vendor/angular-ui-router/release/angular-ui-router.js"></script>
<script src="vendor/angular-route/angular-route.js"></script>
<script src="vendor/angular-ui-bootstrap-bower/ui-bootstrap.js"></script>
<script src="vendor/angular-ui-bootstrap-bower/ui-bootstrap-tpls.js"
	type="text/javascript"></script>
<script src="vendor/bootstrap/dist/js/bootstrap.js"></script>
<script src="js/app/app.js"></script>
<script src="js/main.js"></script>
<script type="text/javascript">
$(function () {
    $('#carousel-example-generic').carousel({
        interval:5000
    });
    
    var i;

    $('.carousel-control').on("mouseover", function () {
        var control = $(this),
            interval = 2000;

        i = setInterval(function () {
            control.trigger("click");
        }, interval);
    })
    .on("mouseout", function () {
        clearInterval(i);
    });
   
});

</script>
</head>
<body>

	<div class="landingbg">
		<!-- Header and Navigation Bar -->
		<jsp:include page="common/logo.jsp"></jsp:include>
		<jsp:include page="common/nav.jsp"></jsp:include>

		<div class="marginTop90px"></div>
		<!-- <div class="container">
			<div class="row">
				<div class="col-sm-1 marginTop15px"></div>
				<div class="col-sm-10 marginTop15px">
					<h1 class="digiAssureText" style="color: #1d7ec2;">DigiAssure: A comprehensive QA solution for all your digital needs</h1>
					<ul class="digiAssureDescText" style="list-style: none;">
						<li><b>Innovative QA platform</b></li>
						<li><b>Single window for different digital QA tools and services</b></li>
						<li><b>Achieve enhanced customer experience and speed</b></li>
					</ul>
					<h2 class="digiAssureDescText">DigiAssure is innovative QA platform
						providing single window to access and integrate different digital
						QA services and tools to achieve improved customer experience and
						speed</h2>
				</div>
				<div class="col-sm-1 marginTop15px"></div>
			</div>

			<div class="marginTop50px"></div>

		</div> -->
		<div class="marginTop15px"></div>
		<jsp:include page="./landing/landingCarousel.jsp"></jsp:include>
		<div class="container menubg">
			<div class="row">
				
				<div class="col-sm-4 col-md-4 col-lg-3 marginTop15px paddingRight0px paddingLeft0px">
					
					 <div class="panelContent">
		                    <h3 class="greyTextColor">Digital QA Dashboard</h3>
		                </div>
		                <div class="marginTop50px"></div>
		            <div class="row">
		               <a href="#" onclick="changeViewFromNav('dashboard')">
		               		<img src="styles/images/pieChart_4.png" class="pieChartLandingPage img-responsive"/>
		               </a>
		            </div>
		             <div class="marginTop15px"></div>
		            <div class="row">
		                <a href="#" onclick="changeViewFromNav('dashboard')">
		                	<img src="styles/images/barchart.png" class="pieChartLandingPage img-responsive"/>
		                </a>
		                <div class="panelContent">
		                    <!-- <h3><a href="javascript:void(0)" class="blackTextColor" onclick="changeView('integratedQALab')">Digital QA Dashboard</a></h3> -->
		                </div>
		            </div>
		        </div>
		        
		        
		        <div class="col-sm-4 col-md-4 col-lg-5 marginTop15px paddingRight0px paddingLeft0px verticalline borderLine">
					
					 <div class="panelContent">
		                    <h3 class="greyTextColor">User Experience Analytics</h3>
		                </div>
		                <div class="marginTop50px"></div>
		            <div class="row">
		               <a href="#" onclick="changeViewFromNav('userExperienceAnalytics')">
		               		<img src="styles/images/useranalytics.png" class="pieChartLandingPage img-responsive"/>
		               </a>
		            </div>
		             <div class="marginTop15px"></div>
		            <div class="row">
		                <a href="#" onclick="changeViewFromNav('sentimentAnalytics')">
		                	<img src="styles/images/sentimentAnalytics.png"" class="pieChartLandingPage img-responsive"/>
		                </a>
		                <div class="panelContent">
		                    <!-- <h3><a href="javascript:void(0)" class="blackTextColor" onclick="changeView('integratedQALab')">Digital QA Dashboard</a></h3> -->
		                </div>
		            </div>
		        </div>
		        <div class="col-sm-4 col-md-4 col-lg-4 marginTop15px paddingRight0px paddingLeft0px" >
		        
		            <div class="panelContent">
		            
		                    <h3 class="greyTextColor">Digi Smart Lab</h3>
		                    
		                </div>
		        <div class="marginTop50px"></div>    
		            
						<a href="#" onclick="changeViewFromNav('mobile')">
		                	<img src="styles/images/smartQALab.png" class="pieChartLandingPage img-responsive"/>
		                </a>
		            
			        
		        </div>
			</div>
		</div>
		<div class="blackborder"></div>
		
		<%-- <jsp:include page="./landing/panel.jsp"></jsp:include> --%>
		<jsp:include page="./common/footer.jsp"></jsp:include>
	</div>
</body>
</html>