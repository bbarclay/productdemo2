<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container" >
    <div class="navbar-fixed-top bgWhite logoBottomBorder">
        <div class="pull-left">
        	<a href="#" >
        		<img   class="digiassureLogo" onclick="goToLandingPage()"src="${pageContext.request.contextPath}/styles/images/digiAssureLogo.png" />
        	</a>
        </div>

        <div class="pull-right">
			 <img class="capgeminiLogo" src="${pageContext.request.contextPath}/styles/images/capgemini.png" >    
		</div>
		 <div class="pull-right logout">
			 <a href="${pageContext.request.contextPath}/logout"><button class="btn" >Logout</button></a>
		</div>
 		<div class="dropdown pull-right user">
   			<h4 class="greyTextColor">${sessionScope.userName }</h4>
 		</div>  

    </div>
</div>
 