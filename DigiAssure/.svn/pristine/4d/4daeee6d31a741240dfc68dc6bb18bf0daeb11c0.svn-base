<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ include file = "../../DigiChatBot.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Environment Setup</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/css/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/css/digi.css">

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

	function changeSelectOption(option,id){
		if(id == '1')
			id="selectTool1";
		else 
			id="selectTool2"
		if(option == 'codeCoverage'){
			var opt= document.getElementById(id);
			for(var i = opt.options.length - 1 ; i >= 0 ; i--)
		    {
		        opt.remove(i);
		    } 
			var selectId=document.getElementById(id);
			
			var newOption = document.createElement("option");
			newOption.text = 'lint';
			newOption.value = 'lint';
			selectId.appendChild(newOption);
			var newOption = document.createElement("option");
			newOption.text = 'Sonar Cube';
			newOption.value = 'Sonar Cube';
			selectId.appendChild(newOption);
			var newOption = document.createElement("option");
			newOption.text = 'Emma';
			newOption.value = 'Emma';
			selectId.appendChild(newOption);
			var newOption = document.createElement("option");
			newOption.text = 'Slather';
			newOption.value = 'Slather';
			selectId.appendChild(newOption);
		}
		else if(option == 'unitTest'){
			var opt= document.getElementById(id);
			for(var i = opt.options.length - 1 ; i >= 0 ; i--)
		    {
		        opt.remove(i);
		    }
			var selectId=document.getElementById(id);
			
			var newOption = document.createElement("option");
			newOption.text = 'Junit';
			newOption.value = 'Junit';
			selectId.appendChild(newOption);
			var newOption = document.createElement("option");
			newOption.text = 'testNG';
			newOption.value = 'testNG';
			selectId.appendChild(newOption);
		}
		
	}
</script>
<script type="text/javascript">
$('document').ready(function(){
$('#menu-toggle').click( function(){
    $(this).find('span').toggleClass('glyphicon glyphicon-collapse-down').toggleClass('glyphicon glyphicon-collapse-up');
});
$('#menu-toggle1').click( function(){
    $(this).find('span').toggleClass('glyphicon glyphicon-collapse-down').toggleClass('glyphicon glyphicon-collapse-up');
});
$('#menu-toggle2').click( function(){
    $(this).find('span').toggleClass('glyphicon glyphicon-collapse-down').toggleClass('glyphicon glyphicon-collapse-up');
});
});
</script>

</head>
<body onload="changeAccordion('environmentSetup','dashboardAndMonitoring')">


	<div>
		<!-- Header and Navigation Bar -->

		<jsp:include page="../../common/logo.jsp"></jsp:include>
		
		<div class="marginTop65px"></div>
		
		<div class="container">
			<div class="row">
				<div class="col-sm-12 col-md-12">
					<!-- <div class="marginTop50px"> -->
						<div class="page-header">
							<div class="marginTop50px"></div>
							<h1 class="greyTextColor txtCenter">
								Environment SetUp
							</h1>
						</div>
			 </div>	
			 <form class="form-horizontal" action="">
		
		                            <!-- START ACCORDION -->        
                            <div class="panel-group accordion accordion-dc">
          <!--   ************************************************** SOURCE CODE MANAGEMENT ************************************************************** -->
                                <div class="panel panel-info">
                                    <div class="panel-heading">
                                        <h4 class="panel-title panelTitle"> <a id="menu-toggle"
												data-toggle="collapse" href="#codemanagement"
												class="headingfont-size heading-margin textHover">
											<span class="glyphicon glyphicon-collapse-down"></span> SOURCE CODE MANAGEMENT</a>
										</h4>
                                    </div>                                
                                    <div class="panel-body" id="codemanagement">
                                       	<div class="col-xs-12 col-md-12">
										<div class="form-group">
											<br><br>
											<div class="row ">
												<div class="col-md-12">
													
													<div class="col-md-2">
														<label class="labelTxt marginTop8px">Repository URL :</label>
													</div>
													<div class="col-md-5">
														<input type="text" class="form-control" id="repositoryURL"/>
														<!-- <span class="glyphicon glyphicon-question-sign primaryGlyph marginTop8px"></span> -->
													</div>
													<div class="col-md-1">
														<span class="glyphicon glyphicon-question-sign primaryGlyph marginTop8px marginLeft40px"></span>
													</div>
												</div>
											</div>
											<br>
											<div class="row ">
												<div class="col-md-12">
													<div class="col-md-2">
														<label class="labelTxt marginTop8px">Repository Depth :</label>
													</div>
													<div class="col-md-6">
														<select id="repositoryDepth">
															<option value="infinity">Infinity</option>
															<option value="Enpty">Enpty</option>
															<option value="files">files</option>
															<option value="immediate">immediate</option>
															<option value="as-it-is">as-it-is</option>
														</select>
														<span class="glyphicon glyphicon-question-sign primaryGlyph marginTop8px marginLeft50px"></span>
													</div>
													
												</div>
											</div>
											<br>
											<div class="row ">
												<div class="col-md-12">
													<div class="col-md-2">
														<label class="labelTxt marginTop8px">Ignore Externals :</label>
													</div>
													<div class="col-md-6">
														<input type="checkbox" id="ignoreExternals" value="ignoreExternals"/>
														<span class="glyphicon glyphicon-question-sign primaryGlyph marginTop8px"></span>
													</div>
													
												</div>
											</div>
											<br>
											<div class="row ">
												<div class="col-md-12">
													
													<div class="col-md-2">
														<label class="labelTxt marginTop8px">Check-out Strategy :</label>
													</div>
													<div class="col-md-6">
														<select id="checkStrategy" class="labelText">
															<option value="onlySvnUpdate">Use 'SVN update as much as possible'</option>
															<option value="checkFreshCopy">Always check out a fresh copy</option>
															<option value="emulateCleanCheckout">Emulate clean checkout by first deleting unersioned/ignored files, then 'svn update'</option>
															<option value="svnUpdateWithRevert">Use 'SVN update as much as possible', but 'svn-revert' before update</option>
														</select>
														<span class="glyphicon glyphicon-question-sign primaryGlyph marginTop8px marginLeft50px"></span>
													</div>
												</div>
											</div>
											<br>
											<div class="row ">
												<div class="col-md-12">
													
													<div class="col-md-2">
														<label class="labelTxt marginTop8px">Repository Browser :</label>
													</div>
													<div class="col-md-6">
														<select id="repositoryBrowser" class="labelText">
															<option value="auto">(Auto)</option>
															<option value="assemble">Assemble</option>
															<option value="collabnet">CollabNet</option>
															<option value="fisheye">FishEye</option>
															<option value="svnweb">SVN::Web</option>
															<option value="sventon1">Sventon 1.x</option>
															<option value="sventon2">Sventon 2.x</option>
															<option value="viewsvn">ViewSVN</option>
															<option value="websvn">WebSVN</option>
														</select>
														<span class="glyphicon glyphicon-question-sign primaryGlyph marginTop8px marginLeft50px"></span>
													</div>
													
												</div>
											</div>
										</div>
										</div>
                                    </div>                                
                                </div>
        <!--   ************************************************** BUILD & DEPLOY ************************************************************** -->
                                <div class="panel panel-info">
                                    <div class="panel-heading">
                                        <h4 class="panel-title panelTitle"> <a id="menu-toggle1"
											data-toggle="collapse" href="#buildanddeploy"
											class="headingfont-size heading-margin textHover">
											<span class="glyphicon glyphicon-collapse-down"></span> BUILD &amp; DEPLOY</a>
										</h4>
                                    </div>                                
                                    <div class="panel-body" id="buildanddeploy">
                                       <div class="col-xs-12 col-md-12">
									   <div class="form-group">
											<br><br>
											<div class="row ">
												<div class="col-md-12">
													<div class="col-md-6">
													
														<div class=" col-md-4">
														 <label class="labelText marginTop8px">Quality Gate 1:</label>
														</div>
														<div class="col-md-4">
															<select id="selectTest1" onchange="return changeSelectOption(this.value,1)">
																<option value="">--select--</option>
																<option value="codeCoverage">Code Coverage</option>
																<option value="unitTest">Unit Test</option>
															</select>
														</div>
														<div class="col-md-4">
															<select id="selectTool1">
																
															</select>
														</div>
														
													</div>
													<div class="form-group col-md-6">
														<div class="col-md-2">
														 <label class="criteria">Criteria:</label>
														</div>
														<div class="col-md-9">
															<input type="text" class="form-control" id="criteria">
														</div>
														<div class="col-md-1"></div>
													</div>
													
												</div>
											</div>
								
											<div class="row ">
												<div class="col-md-12">
													<div class="col-md-6">
													
														<div class=" col-md-4">
														 <label class="labelText marginTop8px">Quality Gate 2:</label>
														</div>
														<div class="col-md-4">
															<select id="selectTest2" onchange="return changeSelectOption(this.value,2)">
																<option value="">--select--</option>
																<option value="codeCoverage">Code Coverage</option>
																<option value="unitTest">Unit Test</option>
															</select>
														</div>
														<div class="col-md-4">
															<select id="selectTool2">
																
															</select>
														</div>
														
													</div>
													<div class="form-group col-md-6">
														<div class="col-md-2">
														 <label class="criteria">Criteria:</label>
														</div>
														<div class="col-md-9">
															<input type="text" class="form-control" id="criteria">
														</div>
														<div class="col-md-1"></div>
													</div>
													
												</div>
											</div>
										</div>
                                    </div>                                
                                </div>
                                </div>
           <!--   ************************************************** TESTING ************************************************************** -->
                                <div class="panel panel-warning">
                                    <div class="panel-heading">
                                       <h4 class="panel-title panelTitle"><a id="menu-toggle2"
												data-toggle="collapse" href="#testing"
												class="headingfont-size heading-margin textHover">
											<span class="glyphicon glyphicon-collapse-down"></span> TESTING</a>
									   </h4>
                                    </div>                                
                                    <div class="panel-body" id="testing">
                                        <div class="col-xs-12 col-md-12">
										<div class="form-group">
											<br><br>
											<div class="row ">
												<div class="col-md-12">
													<div class="col-md-6">
													
														<div class=" col-md-4">
														 <label class="labelText marginTop8px">Quality Gate 1:</label>
														</div>
														<div class="col-md-8">
															<select id="selectTest3">
																<option value="">--select--</option>
																<option value="bdd_automation1">BDD Automation</option>
																<option value="functional_automation1">Functional Automation </option>
																<option value="service_automation1">Services Automation</option>
																<option value="ui_Automation1">UI Automation</option>
																<option value="cross_automation1">Cross Browser Automation</option>
																<option value="permance_testing1">Performance Testing</option>
																<option value="security_testing1">Security Testing</option>
																<option value="functional_testing1">Functional Testing</option>
																<option value="sentiment_analysis1">Sentiment Analysis</option>
																<option value="accessibility_testing1">Accessibility Testing</option>
															</select>
														</div>
														
														
													</div>
													<div class="form-group col-md-6">
														<div class="col-md-2">
														 <label class="criteria">Criteria:</label>
														</div>
														<div class="col-md-9">
															<input type="text" class="form-control" id="criteria">
														</div>
														<div class="col-md-1"></div>
													</div>
												</div>
											</div>
								
											<div class="row ">
												<div class="col-md-12">
													<div class="col-md-6">
														<div class=" col-md-4">
															 <label class="labelText marginTop8px">Quality Gate 2:</label>
														</div>
														<div class="col-md-8">
															<select id="selectTest4">
																<option>--select--</option>
																<option value="bdd_automation2">BDD Automation</option>
																<option value="functional_automation2">Functional Automation </option>
																<option value="service_automation2">Services Automation</option>
																<option value="ui_Automation2">UI Automation</option>
																<option value="cross_automation2">Cross Browser Automation</option>
																<option value="permance_testing2">Performance Testing</option>
																<option value="security_testing2">Security Testing</option>
																<option value="functional_testing2">Functional Testing</option>
																<option value="sentiment_analysis2">Sentiment Analysis</option>
																<option value="accessibility_testing2">Accessibility Testing</option>
															</select>
														</div>
														</div>
														<div class="form-group col-md-6">
															<div class="col-md-2">
															 <label class="criteria">Criteria:</label>
															</div>
															<div class="col-md-9">
																<input type="text" class="form-control" id="criteria">
															</div>
															<div class="col-md-1"></div>
														</div>
													</div>
												</div>
											</div>
										</div>
                                    </div>                                
                                </div>
                            </div>
                             <!-- END ACCORDION -->
                            <div class="row marginTop50px">
			  					<div class="col-md-2 col-md-offset-5">
									<input type="submit" class="form-control btn btn-primary" value="Save Configuration" id="submit" />
								</div>
							</div>
					</form>	
			</div>
		</div>

		</div>
		<!-- Footer -->
		<div class="configurationMargin">
			<jsp:include page="../../common/footer.jsp"></jsp:include>
		</div>
</body>
</html>