<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="../../../DigiChatBot.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Market Trends</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/styles/css/bootstrap.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/styles/css/main.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/styles/css/digi.css">

<!-- <script type="text/javascript" src="http://www.google.com/jsapi"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script> -->

<script src="${pageContext.request.contextPath}/js/exporting.js"></script>
<script src="${pageContext.request.contextPath}/js/highchart_for3d.js"></script>
<script src="${pageContext.request.contextPath}/js/highcharts-3d.js"></script>
<script src="${pageContext.request.contextPath}/js/export-data.js"></script>


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
<!-- <script type="text/javascript">
       // Function to start seetest URL in New Tab
      function runSeeTest() {
    	  
		window.open('https://capgemini.pcloudy.com', '_blank');
	}      
</script> -->

<script type="text/javascript">	

function runSeeTest() {
	  
	window.open('https://capgemini.pcloudy.com', '_blank');


function validateCucumber() {
	document.getElementById("runError").innerHTML="";
	document.getElementById("binError").innerHTML="";
	document.getElementById("configError").innerHTML="";
	document.getElementById("scheduleError").innerHTML="";
 	var result=true;
var runName=document.getElementById("runName");
var binFile = document.getElementById("zippedBinFolder");
var configFile= document.getElementById("configFile");
var scheduledStatus=document.getElementsByName("scheduledStatus");

if(runName.value==""){
	document.getElementById("runError").innerHTML="*   Enter valid Run Name";
	result=false;
}

if(binFile.value==""){
	document.getElementById("binError").innerHTML="*   Upload Zip Bin file";
	result=false;
}else if(!binFile.value.match(/(.*bin\.zip)$/)){
	document.getElementById("binError").innerHTML="*   Upload bin.zip file";
	result=false;
	
}

if(configFile.value == ""){
	document.getElementById("configError").innerHTML="*   Upload configuration.json file";
	result=false;
}else if(!configFile.value.match(/(.*configuration\.json)$/)){
	document.getElementById("configError").innerHTML="*   Upload configuration.json file";
	result=false;
}

var flag=false;
var index=0;
for(index=0; index<scheduledStatus.length;index++){
	if(scheduledStatus[index].checked){
		flag=true;
		break;
	}
} 

if(!flag){

	document.getElementById("scheduleError").innerHTML="*   Select run type";
	result=false;
}else{
 	if(scheduledStatus[index].value=="ScheduledAt"){
		var scheduledtime=document.getElementById("scheduledtime");
		if(scheduledtime.value==""){
			result=false;
			document.getElementById("scheduleError").innerHTML="*   Enter schedule time";
			scheduledtime.focus();
		} 
		
	} 
}

if(result){
	$.blockUI({ 
        message: '<h2>processing ...</h2>', 
        css: { 
            border: 'none', 
            padding: '15px', 
      
            backgroundColor: '#000', 
            '-webkit-border-radius': '10px', 
            '-moz-border-radius': '10px', 
            opacity: .5, 
            color: '#fff' 
        }
    });
}

return result;

}	
</script>



</head>
<body>



	<!-- Header and Navigation Bar -->

	<jsp:include page="../../../common/logo.jsp"></jsp:include>
	<div class="marginTop65px"></div>
	<div class="row borderBottom">
		<div class="col-md-4 col-lg-4 marginTop15px">
			<label class="font24px">Mobile Lab</label>
		</div>
		<div class="col-md-3 col-lg-4"></div>
		<div class="col-md-5 col-lg-4 marginTop15px">

			<a href="../../mobileLab/mobileLab.jsp"><button
					class="btn btn-primary sideButton">Help</button></a>
			<%-- <button type="button" class="btn btn-primary pull-right"
				onclick="runSeeTest()" title="Start Testing">
				Start Testing <span class="glyphicon glyphicon-plus"></span>
			</button>
			<a href="../../mobileLab/downloadExcelUtility"><button
					type="button" class="btn btn-primary sideButton">
					Download TestPlan <img
						src="${pageContext.request.contextPath}/styles/images/download.png"
						height="20" width="20" title="Download TestPlan">
				</button> </a> --%>
		</div>

	</div>





	<ul class="nav nav-tabs marginLeft15px marginTop15px">
		<li class="dropdown"><a class="dropdown-toggle buttonlink"
			href="${pageContext.request.contextPath}/digitalQAService/accessibilityTesting/viewAllocatedBatch"
			data-toggle="dropdown"><b>Market Trends <span class="caret"></span></b>
		</a>

			<ul class="dropdown-menu">
				<c:if test="${not empty marketNames }">
					<c:forEach var="marketData" items="${marketNames }">
						<c:if test="${marketData.marketid == market }">
							<li class="active"><a
								href="../../mobileLab/deviceSelectionMatrix/marketTrends?market=${marketData.marketid }">${marketData.marketname}</a></li>
						</c:if>
						<c:if test="${marketData.marketid != market }">
							<li><a
								href="../../mobileLab/deviceSelectionMatrix/marketTrends?market=${marketData.marketid }">${marketData.marketname}</a></li>
						</c:if>
					</c:forEach>
				</c:if>

			</ul></li>
		<li><a class="dropdown-toggle buttonlink"
			href="${pageContext.request.contextPath}/digitalQAService/accessibilityTesting/viewAllocatedBatch"
			data-toggle="dropdown"><b>User Trends <span class="caret"></span></b>
		</a>
			<ul class="dropdown-menu">
				<li><a href="../../mobileLab/deviceSelectionMatrix/userTrends">Application1</a></li>


			</ul></li>


		<li class="dropdown"><a class="dropdown-toggle buttonlink"
			href="${pageContext.request.contextPath}/digitalQAService/accessibilityTesting/viewAllocatedBatch"
			data-toggle="dropdown"><b>Device Recommendation<span
					class="caret"></span></b></a>
			<ul class="dropdown-menu">
				<c:forEach var="marketData" items="${marketNames }">
					<li><a
						href="../../mobileLab/deviceSelectionMatrix/recommendDevice?market=${marketData.marketname }&count=20">${marketData.marketname}
					</a></li>
				</c:forEach>

			</ul></li>
		<li class="dropdown"><a class="dropdown-toggle buttonlink"
			href="../../mobileLab/deviceSelectionMatrix/searchNBookPage?vendor=noname&dname=noname"><b>Reservation
			</b> </a></li>


		<li class="active dropdown"><a class="dropdown-toggle buttonlink"
			href="../../mobileLab/deviceSelectionMatrix/executionNewRun?toolName=IMTAFramework"><b>Execution</b>
		</a></li>


		<li class="dropdown"><a class="dropdown-toggle buttonlink"
			href="../../mobileLab/deviceSelectionMatrix/dashboardRun?toolName=IMTAFramework"><b>Dashboard</b>
		</a>
		<br></li>





		<!-- <li class="dropdown"><a class="dropdown-toggle buttonlink"
				data-toggle="dropdown"><b>Mobile Lab Management <span class="caret"></span></b>
			</a>
			<ul class="dropdown-menu">
					<li><a
						href="../../mobileLab/deviceSelectionMatrix/showLabDetails">Lab</a></li>
				
				</ul>
					</li> -->
		<!-- <li>
				<a  class="buttonlink" href="../../mobileLab/deviceSelectionMatrix/DScloudDevices"><b><button class="btn mobileLabMenu" >Device Selection</button></b></a>
			</li>
			<li>
				<a  class="buttonlink" href="../../mobileLab/deviceSelectionMatrix/perfectoCloud"><b><button class="btn mobileLabMenu" >Perfecto Cloud</button></b></a>
			</li> -->

		<%-- <c:if test="${sessionScope.rolename == 'ADMIN'}">
		</c:if> --%>
		<%-- <li class="pull-right">

			<form name="userForm" method="post" class="pull-left"
				action="../../mobileLab/deviceSelectionMatrix/updateData"
				enctype="multipart/form-data">
				<label>Vendor: &nbsp <input type="radio" value="vendor"
					name="type" required="required"></label> &nbsp &nbsp <label>OS:
					&nbsp <input type="radio" value="os" name="type">
				</label> &nbsp &nbsp <label>Android Version &nbsp <input
					type="radio" value="andrv" name="type"></label> &nbsp &nbsp <label>iOS
					Version: &nbsp <input type="radio" value="iosv" name="type">
				</label> <input type="hidden" name="market" value=${market } /> <input
					type="file" class="btn btn-primary" id="marketData"
					name="marketData" required="required" /> <input type="submit"
					value="UPDATE" class="btn btn-primary updateButt">
			</form>
		</li>

		<li class="pull-right">
			<div class="upload">Update ${marketName } Data:</div>
		</li> --%>

	</ul>





	<%-- <ul class="nav nav-tabs" style="margin-left: 15px; ">
			
				<li class="active" class="dropdown"><a style="padding: 0px !important;" class="dropdown-toggle"
					data-toggle="dropdown"><b><button class="btn " style="    /* color: #fff; */ background-color: #fff;  height: 50px; padding: 0 5px;/* border-color: #2e6da4;*/">Market
								Trends</button></b></a>
					<ul class="dropdown-menu">
						<li class="active"><a
							href="../../mobileLab/deviceSelectionMatrix/DSGlobalPage">Global</a></li>
						<li><a
							href="../../mobileLab/deviceSelectionMatrix/DSHomePage">US</a></li>
						<li><a
							href="../../mobileLab/deviceSelectionMatrix/DSHomeUKPage">UK</a></li>

					</ul></li>
				<li><a href="DSselectDevices.jsp" style="padding: 0px !important;"><b><button class="btn " style="    /* color: #fff; */ background-color: #fff; height: 50px; padding: 0 5px;/* border-color: #2e6da4;*/">Device Recommendation</button></b></a></li>
				<li><a style="padding: 0px !important;"
					href="../../mobileLab/deviceSelectionMatrix/DScloudDevices"><b><button class="btn " style="    /* color: #fff; */  padding: 0 5px; background-color: #fff; height: 50px;/* border-color: #2e6da4;*/">Device Selection</button></b></a></li>
					
				<li style=" float: right;">
					<div style="float:left; margin: 20px 5px 0 5px;">Update Global Database: </div>
							<form name="userForm" method="post" style="float:left;"
								action="../../mobileLab/deviceSelectionMatrix/uploadFileExcelDataGlobal.obj"
								enctype="multipart/form-data" onSubmit="return GoEmpty(this);">
							
								<div>
									<input type="file" class="btn btn-primary" id="recentData"
										name="recentData"
										style='float:left; margin: 3px; width: 205px; margin: 10px 3px;'>
									<input type="submit" style="float:left; margin: 10px 20px 0px 5px;" value="UPDATE" class="btn btn-primary"
										>
								</div>
							</form>
				</li>
			</ul> --%>


	<div class="marginTop50px"></div>
	<div class="container">

		<h1 class="text-center addRunHeading greyTextColor">
			<c:if test="${not empty runName}">	Edit Run 
		</c:if>
			<c:if test="${empty runName}">
			New Run
			</c:if>
			<!-- <button type="button" class="btn btn-primary pull-right"
				onclick="goBack()">BACK</button> -->
		</h1>

	</div>
	<div class="container">
		<div class="">
			<div class="col-sm-2 col-md-2"></div>
			<div class="col-sm-8 col-md-8">
				<div class="marginTop15px"></div>
				<div class="panel panel-info">
					<div class="panel-heading">
						<span class="panel-title"><strong>${toolName}</strong></span>
					</div>
					<div class="panel-body">
						<div class="marginTop15px"></div>
						<c:if test="${toolName eq 'CGAF_Usability' }">
							<form:form class="form-horizontal" action="addNewRunCafeSeetest"
								method="POST" id="addNewRunCafeSeetest" modelAttribute="newRun"
								title="addNewRunCafeSeetest" enctype="multipart/form-data">
								<input type="hidden" name="toolName" value=${toolName }>
								<div class="form-group">
									<label for="run_name" class="col-sm-3 control-label">
										Runs Name</label>
									<div class="col-sm-8">
										<c:if test="${not empty runName}">
											<input type="text" class="form-control" value="${runName }"
												disabled="disabled" />
											<form:hidden path="runid" value="${runId }" />
											<form:hidden path="runName" value="${runName }" />
										</c:if>
										<c:if test="${empty runName}">
											<form:input path="runName" class="form-control"
												placeholder="Enter run name" />
										</c:if>
										<form:hidden path="toolid" />
									</div>
								</div>

								<div class="form-group">
									<label for="project_name" class="col-sm-3 control-label">Project
										Name</label>
									<div class="col-sm-8">
										<input type="text" name="projectName" class="form-control"
											value="${projectName}" disabled="disabled" />
									</div>
								</div>

								<div class="form-group">
									<label for="build_id" class="col-sm-3 control-label">Select
										Build</label>
									<div class="col-sm-8">
										<input type="text" name="projectName" class="form-control"
											value="SampleBuild" disabled="disabled" />
									</div>
								</div>

								<div class="form-group">
									<!-- <label for="zipped_bin_folder" class="col-sm-3 control-label">Zip
											Bin Folder </label> -->
									<label for="zipped_bin_folder" class="col-sm-3 control-label">Upload
										Test Scripts </label>
									<div class="col-sm-3">
										<input type="file" id="zippedBinFolder" name="zippedBinFolder">
									</div>
									<div class="col-sm-3">(Zip Bin Folder)</div>
								</div>

								<div class="form-group">
									<!-- <label for="classname_data" class="col-sm-3 control-label">ClassName_Data.xlsx
										</label> -->
									<label for="classname_data" class="col-sm-3 control-label">Test
										Data Excel</label>
									<div class="col-sm-3">
										<input type="file" id="dataSheet" name="dataSheet">
									</div>
									<div class="col-sm-3">(ClassName_Data.xlsx)</div>
								</div>

								<div class="form-group">
									<!-- <label for="execution_name" class="col-sm-3 control-label">Execution.xlsx
										</label> -->
									<label for="execution_name" class="col-sm-3 control-label">Test
										Devices</label>
									<div class="col-sm-3">
										<input type="file" id="execution" name="execution">
									</div>
									<div class="col-sm-3">(Execution.xlsx)</div>
								</div>

								<div class="form-group">
									<!-- <label for="master_config" class="col-sm-3 control-label">MasterConfig.xlsx
										</label> -->
									<label for="master_config" class="col-sm-3 control-label">Test
										Procedure</label>
									<div class="col-sm-3">
										<input type="file" id="masterConfig" name="masterConfig">
									</div>
									<div class="col-sm-3">(MasterConfig.xlsx)</div>
								</div>

								<div class="form-group">
									<label for="run_name" class="col-sm-3 control-label">Schedule</label>
									<div class="col-sm-8">
										<label class="radio-inline"> <input
											name="scheduledStatus" id="scheduledStatus" value="DonotRun"
											type="radio"><label for="saveForLater">Save
												For Later</label>
										</label> <label class="radio-inline "> <input
											class="pull-left" name="scheduledStatus" id="scheduledStatus"
											value="RunOnSave" type="radio"><label for="saveNrun">
												Save and Run</label>
										</label> <label class="radio-inline "> <input
											class="pull-left" name="scheduledStatus" id="scheduledStatus"
											value="ScheduledAt" type="radio"><label
											for="ScheduledAt"> Schedule At</label>
										</label>
										<div class="form-group">

											<div class="col-sm-4">
												<div class="input-group date" id="dp-2"
													data-date="2019-04-28" data-date-format="yyyy-mm-dd">
													<input type="text" class="form-control datepicker"
														name="dpscdate" /> <span class="input-group-addon add-on"><span
														class="glyphicon glyphicon-calendar"></span></span>
												</div>
											</div>
											<div class="col-sm-4">
												<div class="input-group bootstrap-timepicker">
													<input type="text" class="form-control timepicker"
														name="dpsctime" /> <span class="input-group-addon"><span
														class="glyphicon glyphicon-time"></span></span>
												</div>
											</div>
										</div>


									</div>
								</div>

								<div class="form-group">
									<label for="exit_on_failure" class="col-sm-3 control-label">Exit
										on failure </label>
									<div class="col-sm-8">
										<label class="radio-inline"> <input
											name="executeBuild" id="executeIfBuildNotStable"
											value="buildSuccess" type="radio"><label
											for="execute_if_build_stable">Execute if build is
												stable</label>
										</label> <label class="radio-inline "> <input
											class="pull-left" name="executeBuild"
											id="executeIfBuildNotStable" value="buildFail" type="radio"><label
											for="execute_if_build_not_stable">Execute even if
												build is not stable</label>
										</label>
									</div>
								</div>

								<div class="marginTop50px"></div>
								<div class="form-group">
									<div class="col-sm-3 col-sm-offset-5">
										<input type="submit" class="btn btn-success btnCenter"
											onsubmit="alert()" />
									</div>
								</div>
							</form:form>
						</c:if>

						<c:if test="${toolName eq 'CGPF_Neoload' }">
							<form:form class="form-horizontal"
								action="addNewRunCafePerformance" method="POST"
								id="addNewRunCafePerformance" modelAttribute="newRun"
								title="addNewRunCafePerformance" enctype="multipart/form-data">
								<input type="hidden" name="toolName" value=${toolName }>
								<div class="form-group">
									<label for="run_name" class="col-sm-3 control-label">
										Runs Name</label>
									<div class="col-sm-8">
										<c:if test="${not empty runName}">
											<input type="text" class="form-control" value="${runName }"
												disabled="disabled" />
											<form:hidden path="runid" value="${runId }" />
											<form:hidden path="runName" value="${runName }" />
										</c:if>
										<c:if test="${empty runName}">
											<form:input path="runName" class="form-control"
												placeholder="Enter run name" />
										</c:if>
										<form:hidden path="toolid" />
									</div>
								</div>

								<div class="form-group">
									<label for="project_name" class="col-sm-3 control-label">Project
										Name</label>
									<div class="col-sm-8">
										<input type="text" name="projectName" class="form-control"
											value="${projectName}" disabled="disabled" />
									</div>
								</div>

								<div class="form-group">
									<label for="build_id" class="col-sm-3 control-label">Select
										Build</label>
									<div class="col-sm-8">
										<input type="text" name="projectName" class="form-control"
											value="SampleBuild" disabled="disabled" />
									</div>
								</div>

								<div class="form-group">
									<!-- <label for="zipped_bin_folder" class="col-sm-3 control-label">Zip
											Bin Folder </label> -->
									<label for="zipped_bin_folder" class="col-sm-3 control-label">Upload
										Test Scripts </label>
									<div class="col-sm-3">
										<input type="file" id="zippedBinFolder" name="zippedBinFolder">
									</div>
									<div class="col-sm-3">(Zip Bin Folder)</div>
								</div>

								<div class="form-group">
									<!-- <label for="classname_data" class="col-sm-3 control-label">ClassName_Data.xlsx
										</label> -->
									<label for="classname_data" class="col-sm-3 control-label">Test
										Data Excel</label>
									<div class="col-sm-3">
										<input type="file" id="dataSheet" name="dataSheet">
									</div>
									<div class="col-sm-3">(ClassName_Data.xlsx)</div>
								</div>

								<div class="form-group">
									<!-- <label for="execution_name" class="col-sm-3 control-label">Execution.xlsx
										</label> -->
									<label for="execution_name" class="col-sm-3 control-label">Test
										Devices</label>
									<div class="col-sm-3">
										<input type="file" id="execution" name="execution">
									</div>
									<div class="col-sm-3">(Execution.xlsx)</div>
								</div>

								<div class="form-group">
									<!-- <label for="master_config" class="col-sm-3 control-label">MasterConfig.xlsx
										</label> -->
									<label for="master_config" class="col-sm-3 control-label">Test
										Procedure</label>
									<div class="col-sm-3">
										<input type="file" id="masterConfig" name="masterConfig">
									</div>
									<div class="col-sm-3">(MasterConfig.xlsx)</div>
								</div>

								<div class="form-group">
									<label for="neoload_config_folder"
										class="col-sm-3 control-label">Neoload Config zip
										folder</label>
									<div class="col-sm-3">
										<input type="file" id="configZipFolder" name="configZipFolder">
									</div>
									<div class="col-sm-3">(Config Zip Folder)</div>
								</div>

								<div class="form-group">
									<!-- <label for="master_config" class="col-sm-3 control-label">MasterConfig.xlsx
										</label> -->
									<label for="master_config" class="col-sm-3 control-label">Neoload
										Project</label>
									<div class="col-sm-3">
										<input type="file" id="nlp" name="nlp">
									</div>
									<div class="col-sm-3">(NeoTest.nlp)</div>
								</div>

								<div class="form-group">
									<label for="scenario_name" class="col-sm-3 control-label">
										Scenario Name</label>
									<div class="col-sm-8">
										<form:input path="scenarioName" class="form-control"
											placeholder="Enter Neoload scenario name" />
									</div>
								</div>

								<div class="form-group">
									<label for="run_name" class="col-sm-3 control-label">Schedule</label>
									<div class="col-sm-8">
										<label class="radio-inline"> <input
											name="scheduledStatus" id="scheduledStatus" value="DonotRun"
											type="radio"><label for="saveForLater">Save
												For Later</label>
										</label> <label class="radio-inline "> <input
											class="pull-left" name="scheduledStatus" id="scheduledStatus"
											value="RunOnSave" type="radio"><label for="saveNrun">
												Save and Run</label>
										</label> <label class="radio-inline "> <input
											class="pull-left" name="scheduledStatus" id="scheduledStatus"
											value="ScheduledAt" type="radio"><label
											for="ScheduledAt"> Schedule At</label>

										</label>
										<div class="form-group">

											<div class="col-sm-4">
												<div class="input-group date" id="dp-2"
													data-date="2019-04-28" data-date-format="yyyy-mm-dd">
													<input type="text" class="form-control datepicker"
														name="dpscdate" /> <span class="input-group-addon add-on"><span
														class="glyphicon glyphicon-calendar"></span></span>
												</div>
											</div>
											<div class="col-sm-4">
												<div class="input-group bootstrap-timepicker">
													<input type="text" class="form-control timepicker"
														name="dpsctime" /> <span class="input-group-addon"><span
														class="glyphicon glyphicon-time"></span></span>
												</div>
											</div>
										</div>
									</div>
								</div>

								<div class="form-group">
									<label for="exit_on_failure" class="col-sm-3 control-label">Exit
										on failure </label>
									<div class="col-sm-8">
										<label class="radio-inline"> <input
											name="executeBuild" id="executeIfBuildNotStable"
											value="buildSuccess" type="radio"><label
											for="execute_if_build_stable">Execute if build is
												stable</label>
										</label> <label class="radio-inline "> <input
											class="pull-left" name="executeBuild"
											id="executeIfBuildNotStable" value="buildFail" type="radio"><label
											for="execute_if_build_not_stable">Execute even if
												build is not stable</label>
										</label>
									</div>
								</div>

								<div class="marginTop50px"></div>
								<div class="form-group">
									<div class="col-sm-3 col-sm-offset-5">
										<input type="submit" class="btn btn-success btnCenter">
									</div>
								</div>
							</form:form>
						</c:if>

						<c:if test="${toolName == 'CGAF_Cucumber_Appium'}">
							<form:form class="form-horizontal" action="addNewRunCucumber"
								method="POST" id="addNewRunCucumber" modelAttribute="newRun"
								title="addNewRun" enctype="multipart/form-data">
								<input type="hidden" name="toolName" value=${toolName } />

								<div class="form-group">
									<label for="run_name" class="col-sm-3 control-label">
										Run Name<font color="red"> <b> *</b>
									</font>
									</label>
									<div class="col-sm-8">
										<c:if test="${not empty runName}">
											<input type="text" class="form-control" value="${runName }"
												disabled="disabled" />
											<form:hidden path="runid" value="${runId }" />
											<form:hidden path="runName" value="${runName }" />
										</c:if>
										<c:if test="${empty runName}">
											<form:input path="runName" class="form-control"
												placeholder="Enter run name" />
										</c:if>
										<font color="red"> <span id="runError"></span></font>

									</div>

								</div>
								<form:hidden path="toolid" />

								<div class="form-group">
									<label for="project_name" class="col-sm-3 control-label">
										Project Name</label>
									<div class="col-sm-8">
										<input type="text" name="projectName" class="form-control"
											value="${projectName}" disabled="disabled" />
									</div>
								</div>

								<div class="form-group">
									<label for="build_id" class="col-sm-3 control-label">
										Select Build</label>
									<div class="col-sm-8">
										<input type="text" name="projectName" class="form-control"
											value="SampleBuild" disabled="disabled" />
									</div>

								</div>

								<div class="form-group">
									<label for="zipped_bin_folder" class="col-sm-3 control-label">
										Zip Bin Folder <font color="red"> <b> *</b>
									</font>
									</label>
									<div class="col-sm-8">
										<input type="file" id="zippedBinFolder" name="zippedBinFolder"
											style="display: inline-block;"> <font color="red"><span
											id="binError"></span></font>
									</div>
								</div>


								<div class="form-group">
									<label for="configFile" class="col-sm-3 control-label">Configuration
										File <font color="red"> <b> *</b>
									</font>
									</label>
									<div class="col-sm-8">
										<input type="file" id="configFile" name="configFile"
											style="display: inline-block;"> <font color="red">
											<span id="configError"></span>
										</font>
									</div>

								</div>

								<div class="form-group">
									<label for="schedule" class="col-sm-3 control-label">Schedule<font
										color="red"> <b> *</b>
									</font>
									</label>
									<div class="col-sm-9">
										<label class="radio-inline"> <input
											name="scheduledStatus" id="scheduledStatus" value="DonotRun"
											type="radio"><label for="saveForLater">Save
												For Later</label>
										</label> <label class="radio-inline "> <input
											class="pull-left" name="scheduledStatus" id="scheduledStatus"
											value="RunOnSave" type="radio"><label for="saveNrun">
												Save and Run</label>
										</label> <label class="radio-inline "> <input
											class="pull-left" name="scheduledStatus" id="scheduledStatus"
											value="ScheduledAt" type="radio"><label
											for="ScheduledAt">Schedule At</label>

										</label>
										<div class="form-group">

											<div class="col-sm-4">
												<div class="input-group date" id="dp-2"
													data-date="2019-04-28" data-date-format="yyyy-mm-dd">
													<input type="text" class="form-control datepicker"
														name="dpscdate" /> <span class="input-group-addon add-on"><span
														class="glyphicon glyphicon-calendar"></span></span>
												</div>
											</div>
											<div class="col-sm-4">
												<div class="input-group bootstrap-timepicker">
													<input type="text" class="form-control timepicker"
														name="dpsctime" /> <span class="input-group-addon"><span
														class="glyphicon glyphicon-time"></span></span>
												</div>
											</div>
										</div>
										<!--</div> -->


										<!-- <input type="text" name="scheduledtime" id="scheduledtime" size="2"></label> -->

										<font color="red"> <span id="scheduleError"></span></font>
									</div>

								</div>

								<div class="form-group">
									<label for="exit_on_failure" class="col-sm-3 control-label">Exit
										on failure </label>
									<div class="col-sm-8">
										<label class="radio-inline"> <input
											name="executeBuild" id="executeIfBuildNotStable"
											value="buildSuccess" type="radio"><label
											for="execute_if_build_stable">Execute if build is
												stable</label>
										</label> <label class="radio-inline "> <input
											class="pull-left" name="executeBuild"
											id="executeIfBuildNotStable" value="buildFail" type="radio"><label
											for="execute_if_build_not_stable">Execute even if
												build is not stable</label>
										</label>
									</div>
								</div>
								<div class="marginTop50px"></div>
								<div class="form-group">
									<div class="col-sm-3 col-sm-offset-5">
										<input type="submit" id="submit"
											class="btn btn-success btnCenter">
									</div>
								</div>
							</form:form>
						</c:if>
						<c:if test="${toolName eq 'CGAF_Perfecto' }">

							<form:form class="form-horizontal" action="addNewRunCafePerfecto"
								method="POST" id="addNewRunCafeSeetest" modelAttribute="newRun"
								title="addNewRunCafeSeetest" enctype="multipart/form-data">
								<input type="hidden" name="toolName" value=${toolName }>
								<div class="form-group">
									<label for="run_name" class="col-sm-3 control-label">
										Run Name</label>
									<div class="col-sm-8">
										<c:if test="${not empty runName}">
											<input type="text" class="form-control" value="${runName }"
												disabled="disabled" />
											<form:hidden path="runid" value="${runId }" />
											<form:hidden path="runName" value="${runName }" />
										</c:if>
										<c:if test="${empty runName}">
											<form:input path="runName" class="form-control"
												placeholder="Enter run name" />
										</c:if>
										<form:hidden path="toolid" />
									</div>
								</div>

								<div class="form-group">
									<label for="project_name" class="col-sm-3 control-label">Project
										Name</label>
									<div class="col-sm-8">
										<input type="text" name="projectName" class="form-control"
											value="${projectName}" disabled="disabled" />
									</div>
								</div>

								<div class="form-group">
									<label for="build_id" class="col-sm-3 control-label">Select
										Build</label>
									<div class="col-sm-8">
										<input type="text" name="projectName" class="form-control"
											value="SampleBuild" disabled="disabled" />
									</div>
								</div>

								<div class="form-group">
									<!-- <label for="zipped_bin_folder" class="col-sm-3 control-label">Zip
											Bin Folder </label> -->
									<label for="zipped_bin_folder" class="col-sm-3 control-label">Upload
										Test Scripts </label>
									<div class="col-sm-3">
										<input type="file" id="zippedBinFolder" name="zippedBinFolder">
									</div>
									<div class="col-sm-3">(Zip Bin Folder)</div>
								</div>

								<div class="form-group">
									<!-- <label for="classname_data" class="col-sm-3 control-label">ClassName_Data.xlsx
										</label> -->
									<label for="classname_data" class="col-sm-3 control-label">Test
										Data Excel</label>
									<div class="col-sm-3">
										<input type="file" id="dataSheet" name="dataSheet">
									</div>
									<div class="col-sm-3">(ClassName_Data.xlsx)</div>
								</div>

								<div class="form-group">
									<!-- <label for="execution_name" class="col-sm-3 control-label">Execution.xlsx
										</label> -->
									<label for="execution_name" class="col-sm-3 control-label">Test
										Devices</label>
									<div class="col-sm-3">
										<input type="file" id="execution" name="execution">
									</div>
									<div class="col-sm-3">(Execution.xlsx)</div>
								</div>

								<div class="form-group">
									<!-- <label for="master_config" class="col-sm-3 control-label">MasterConfig.xlsx
										</label> -->
									<label for="master_config" class="col-sm-3 control-label">Test
										Procedure</label>
									<div class="col-sm-3">
										<input type="file" id="masterConfig" name="masterConfig">
									</div>
									<div class="col-sm-3">(MasterConfig.xlsx)</div>
								</div>

								<div class="form-group">
									<label for="schedule" class="col-sm-3 control-label">Schedule
									</label>
									<div class="col-sm-8">
										<label class="radio-inline"> <input
											name="scheduledStatus" id="scheduledStatus" value="DonotRun"
											type="radio"><label for="saveForLater">Save
												For Later</label>
										</label> <label class="radio-inline "> <input
											class="pull-left" name="scheduledStatus" id="scheduledStatus"
											value="RunOnSave" type="radio"><label for="saveNrun">
												Save and Run</label>
										</label> <label class="radio-inline "> <input
											class="pull-left" name="scheduledStatus" id="scheduledStatus"
											value="ScheduledAt" type="radio"><label
											for="ScheduledAt">Schedule At</label>
										</label>
										<div class="form-group">

											<div class="col-sm-4">
												<div class="input-group date" id="dp-2"
													data-date="2019-04-28" data-date-format="yyyy-mm-dd">
													<input type="text" class="form-control datepicker"
														name="dpscdate" /> <span class="input-group-addon add-on"><span
														class="glyphicon glyphicon-calendar"></span></span>
												</div>
											</div>
											<div class="col-sm-4">
												<div class="input-group bootstrap-timepicker">
													<input type="text" class="form-control timepicker"
														name="dpsctime" /> <span class="input-group-addon"><span
														class="glyphicon glyphicon-time"></span></span>
												</div>
											</div>
										</div>

									</div>
								</div>

								<div class="form-group">
									<label for="exit_on_failure" class="col-sm-3 control-label">Exit
										on failure </label>
									<div class="col-sm-8">
										<label class="radio-inline"> <input
											name="executeBuild" id="executeIfBuildNotStable"
											value="buildSuccess" type="radio"><label
											for="execute_if_build_stable">Execute if build is
												stable</label>
										</label> <label class="radio-inline "> <input
											class="pull-left" name="executeBuild"
											id="executeIfBuildNotStable" value="buildFail" type="radio"><label
											for="execute_if_build_not_stable">Execute even if
												build is not stable</label>
										</label>
									</div>
								</div>
								<div class="marginTop50px"></div>
								<div class="form-group">
									<div class="col-sm-3 col-sm-offset-5">
										<input type="submit" class="btn btn-success btnCenter">
									</div>
								</div>
							</form:form>
						</c:if>

						<c:if test="${toolName eq 'CGAF_LayoutTesting' }">
							<form:form class="form-horizontal"
								action="addNewRunLayoutTesting" method="POST"
								id="addNewRunLayoutTesting" modelAttribute="newRun"
								title="addNewRunLayoutTesting" enctype="multipart/form-data">
								<input type="hidden" name="toolName" value=${toolName } />
								<div class="form-group">
									<label for="run_name" class="col-sm-3 control-label">
										Run Name</label>
									<div class="col-sm-8">
										<c:if test="${not empty runName}">
											<input type="text" class="form-control" value="${runName }"
												disabled="disabled" />
											<form:hidden path="runid" value="${runId }" />
											<form:hidden path="runName" value="${runName }" />
										</c:if>
										<c:if test="${empty runName}">
											<form:input path="runName" class="form-control"
												placeholder="Enter run name" />
										</c:if>
										<form:hidden path="toolid" />
									</div>
								</div>

								<div class="form-group">
									<label for="project_name" class="col-sm-3 control-label">Project
										Name</label>
									<div class="col-sm-8">
										<input type="text" name="projectName" class="form-control"
											value="${projectName}" disabled="disabled" />
									</div>
								</div>

								<div class="form-group">
									<label for="build_id" class="col-sm-3 control-label">Select
										Build</label>
									<div class="col-sm-8">
										<input type="text" name="projectName" class="form-control"
											value="SampleBuild" disabled="disabled" />
									</div>
								</div>

								<div class="form-group">
									<!-- <label for="zipped_bin_folder" class="col-sm-3 control-label">Zip
											Bin Folder </label> -->
									<label for="zipped_bin_folder" class="col-sm-3 control-label">Upload
										Test Scripts </label>
									<div class="col-sm-3">
										<input type="file" id="Layout_zippedBinFolder"
											name="Layout_zippedBinFolder">
									</div>
									<div class="col-sm-3">(Zip Bin Folder)</div>
								</div>

								<div class="form-group">
									<!-- <label for="zipped_bin_folder" class="col-sm-3 control-label">Zip
											Bin Folder </label> -->
									<label for="zipped_Excel_folder" class="col-sm-3 control-label">Upload
										Excel </label>
									<div class="col-sm-3">
										<input type="file" id="Layout_zippedExcelFolder"
											name="Layout_zippedExcelFolder">
									</div>
									<div class="col-sm-3">(Zip Excel Folder)</div>
								</div>

								<div class="form-group">
									<!-- <label for="master_config" class="col-sm-3 control-label">MasterConfig.xlsx
										</label> -->
									<label for="master_config" class="col-sm-3 control-label">gspecs
										File </label>
									<div class="col-sm-3">
										<input type="file" id="Layout_gspecs" name="Layout_gspecs">
									</div>
									<div class="col-sm-3">(gspecsFile.Zip)</div>
								</div>

								<div class="form-group">
									<label for="run_name" class="col-sm-3 control-label">Schedule</label>
									<div class="col-sm-8">
										<label class="radio-inline"> <input
											name="scheduledStatus" id="scheduledStatus" value="DonotRun"
											type="radio"><label for="saveForLater">Save
												For Later</label>
										</label> <label class="radio-inline "> <input
											class="pull-left" name="scheduledStatus" id="scheduledStatus"
											value="RunOnSave" type="radio"><label for="saveNrun">
												Save and Run</label>
										</label> <label class="radio-inline "> <input
											class="pull-left" name="scheduledStatus" id="scheduledStatus"
											value="ScheduledAt" type="radio"><label
											for="ScheduledAt">Schedule At</label>
										</label>
										<div class="form-group">

											<div class="col-sm-4">
												<div class="input-group date" id="dp-2"
													data-date="2019-04-28" data-date-format="yyyy-mm-dd">
													<input type="text" class="form-control datepicker"
														name="dpscdate" /> <span class="input-group-addon add-on"><span
														class="glyphicon glyphicon-calendar"></span></span>
												</div>
											</div>
											<div class="col-sm-4">
												<div class="input-group bootstrap-timepicker">
													<input type="text" class="form-control timepicker"
														name="dpsctime" /> <span class="input-group-addon"><span
														class="glyphicon glyphicon-time"></span></span>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="marginTop50px"></div>
								<div class="form-group">
									<div class="col-sm-3 col-sm-offset-5">
										<input type="submit" class="btn btn-success btnCenter">
									</div>
								</div>
							</form:form>
						</c:if>
						<c:if
							test="${toolName eq 'Appium_Grid' ||toolName eq 'Automated_Accessibility' }">
							<form:form class="form-horizontal" action="dashboardRun"
								method="POST" id="addNewRunAppiumGrid" modelAttribute="newRun"
								title="addNewRunAppiumGrid" enctype="multipart/form-data">
								<input type="hidden" name="toolName" value=${toolName } />
								<div class="form-group">
									<label for="run_name" class="col-sm-3 control-label">
										Run Name</label>
									<div class="col-sm-8">
										<c:if test="${not empty runName}">
											<input type="text" class="form-control" value="${runName }"
												disabled="disabled" />
											<form:hidden path="runid" value="${runId }" />
											<form:hidden path="runName" value="${runName }" />
										</c:if>
										<c:if test="${empty runName}">
											<form:input path="runName" class="form-control"
												placeholder="Enter run name" />
										</c:if>
										<form:hidden path="toolid" />
									</div>
								</div>

								<div class="form-group">
									<label for="project_name" class="col-sm-3 control-label">Project
										Name</label>
									<div class="col-sm-8">
										<input type="text" name="projectName" class="form-control"
											value="${projectName}" disabled="disabled" />
									</div>
								</div>

								<div class="form-group">
									<label for="build_id" class="col-sm-3 control-label">Select
										Build</label>
									<div class="col-sm-8">
										<input type="text" name="projectName" class="form-control"
											value="SampleBuild" disabled="disabled" />
									</div>
								</div>

								<div class="form-group">
									<!-- <label for="zipped_bin_folder" class="col-sm-3 control-label">Zip
											Bin Folder </label> -->
									<label for="zipped_bin_folder" class="col-sm-3 control-label">Upload
										Test Scripts </label>
									<div class="col-sm-3">
										<input type="file" id="Layout_zippedBinFolder"
											name="Layout_zippedBinFolder">
									</div>
									<div class="col-sm-3">(Zip Bin Folder)</div>
								</div>

								<div class="form-group">
									<!-- <label for="zipped_bin_folder" class="col-sm-3 control-label">Zip
											Bin Folder </label> -->
									<label for="zipped_Excel_folder" class="col-sm-3 control-label">Upload
										Configuration </label>
									<div class="col-sm-3">
										<input type="file" id="config_zip" name="config_zip">
									</div>
									<div class="col-sm-3">(Zip Configuration Folder)</div>
								</div>

								<!-- <div class="form-group">
										
										<label for="master_config" class="col-sm-3 control-label">Upload TestNG file </label>
										<div class="col-sm-3">
											<input type="file" id="testNGFile" name="testNGFile">
										</div>
										<div class="col-sm-3">(testNG.xml)</div>
									</div> -->

								<div class="form-group">
									<label for="run_name" class="col-sm-3 control-label">Schedule</label>
									<div class="col-sm-8">
										<label class="radio-inline"> <input
											name="scheduledStatus" id="scheduledStatus" value="DonotRun"
											type="radio"><label for="saveForLater">Save
												For Later</label>
										</label> <label class="radio-inline "> <input
											class="pull-left" name="scheduledStatus" id="scheduledStatus"
											value="RunOnSave" type="radio"><label for="saveNrun">
												Save and Run</label>
										</label> <label class="radio-inline "> <input
											class="pull-left" name="scheduledStatus" id="scheduledStatus"
											value="ScheduledAt" type="radio"><label
											for="ScheduledAt">Schedule At</label>
										</label>
										<div class="form-group">

											<div class="col-sm-4">
												<div class="input-group date" id="dp-2"
													data-date="2019-04-28" data-date-format="yyyy-mm-dd">
													<input type="text" class="form-control datepicker"
														name="dpscdate" /> <span class="input-group-addon add-on"><span
														class="glyphicon glyphicon-calendar"></span></span>
												</div>
											</div>
											<div class="col-sm-4">
												<div class="input-group bootstrap-timepicker">
													<input type="text" class="form-control timepicker"
														name="dpsctime" /> <span class="input-group-addon"><span
														class="glyphicon glyphicon-time"></span></span>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="marginTop50px"></div>
								<div class="form-group">
									<div class="col-sm-3 col-sm-offset-5">
										<input type="submit" class="btn btn-success btnCenter">
									</div>
								</div>
							</form:form>
						</c:if>
						<c:if test="${toolName eq 'IMTAFramework' }">
							<form:form class="form-horizontal" action="${pageContext.request.contextPath}/console/addImtaRun"
								method="POST" id="addImtaRun" modelAttribute="newRun"
								enctype="multipart/form-data">
								<!-- title="addImtaRun" -->
								<input type="hidden" name="toolName" value=${toolName } />
								<div class="form-group">
									<label for="run_name" class="col-sm-3 control-label">
										Run Name</label>
									<div class="col-sm-8">
										<c:if test="${not empty runName}">
											<input type="text" class="form-control" value="${runName }"
												disabled="disabled" />
											<form:hidden path="runid" value="${runId }" />
											<form:hidden path="runName" value="${runName }" />
										</c:if>
										<c:if test="${empty runName}">
											<form:input path="runName" class="form-control"
												placeholder="Enter run name" />
										</c:if>
										<form:hidden path="toolid" />
									</div>
								</div>

								<div class="form-group">
									<label for="project_name" class="col-sm-3 control-label">Project
										Name</label>
									<div class="col-sm-8">
										<input type="text" name="projectName" class="form-control"
											value="${projectName}" disabled="disabled" />
									</div>
								</div>

								<div class="form-group">
									<label for="build_id" class="col-sm-3 control-label">Select
										Build</label>
									<div class="col-sm-8">
										<input type="text" name="projectName" class="form-control"
											value="SampleBuild" disabled="disabled" />
									</div>
								</div>

								<div class="form-group">
									<label for="IMTA_TestControllerFile"
										class="col-sm-3 control-label">Upload TestController </label>
									<div class="col-sm-3">
										<input type="file" id="IMTA_TestControllerFile"
											name="IMTA_TestControllerFile">
									</div>
									<!-- <div class="col-sm-3">(Zip TestController Folder)</div> -->
									<div class="col-sm-3">
										<a
											href="${pageContext.request.contextPath}/console/getReferenceFile?toolName=${toolName}&fileName=TestController.xlsx">Sample
											TestController File</a>
									</div>
								</div>
								<div class="form-group">
									<label for="IMTA_TestDataFile" class="col-sm-3 control-label">Upload
										TestData </label>
									<div class="col-sm-3">
										<input type="file" id="IMTA_TestDataFile"
											name="IMTA_TestDataFile">
									</div>
									<div class="col-sm-3">
										<a
											href="${pageContext.request.contextPath}/console/getReferenceFile?toolName=${toolName}&fileName=TestData.xlsx">Sample
											TestData File</a>
									</div>
								</div>

								<div class="form-group">
									<label for="config_zip" class="col-sm-3 control-label">Upload
										Configuration </label>
									<div class="col-sm-3">
										<input type="file" id="config_zip" name="config_zip">
									</div>
									<div class="col-sm-3">
										<a
											href="${pageContext.request.contextPath}/console/getReferenceFile?toolName=${toolName}&fileName=config.zip">Sample
											ConfigFiles </a>
									</div>
								</div>

								<div class="form-group">

									<label for="testNGFile" class="col-sm-3 control-label">Upload
										TestNG file </label>
									<div class="col-sm-3">
										<input type="file" id="testNGFile" name="testNGFile">
									</div>
									<div class="col-sm-3">
										<a
											href="${pageContext.request.contextPath}/console/getReferenceFile?toolName=${toolName}&fileName=testNG.xml">Sample
											TestNG file </a>
									</div>
								</div>

								<div class="form-group">
									<label for="run_name" class="col-sm-3 control-label">Schedule</label>
									<div class="col-sm-8">
										<label class="radio-inline"> <input
											name="scheduledStatus" id="scheduledStatus" value="DonotRun"
											type="radio"><label for="saveForLater">Save
												For Later</label>
										</label> <label class="radio-inline "> <input
											class="pull-left" name="scheduledStatus" id="scheduledStatus"
											value="RunOnSave" type="radio"><label for="saveNrun">
												Save and Run</label>
										</label> <label class="radio-inline "> <input
											class="pull-left" name="scheduledStatus" id="scheduledStatus"
											value="ScheduledAt" type="radio"><label
											for="ScheduledAt">Schedule At</label>
										</label>
										<div class="form-group">

											<div class="col-sm-4">
												<div class="input-group date" id="dp-2"
													data-date-format="yyyy-mm-dd" data-provide="datepicker">
													<input type="text" class="form-control datepicker"
														name="dpscdate" /> <span class="input-group-addon add-on"><span
														class="glyphicon glyphicon-calendar"></span></span>
												</div>
											</div>
											<div class="col-sm-4">
												<div class="input-group bootstrap-timepicker">
													<input type="text" class="form-control timepicker"
														name="dpsctime" /> <span class="input-group-addon"><span
														class="glyphicon glyphicon-time"></span></span>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="marginTop50px"></div>
								<div class="form-group">
									<div class="col-sm-3 col-sm-offset-5">
										<input type="submit" class="btn btn-success btnCenter">
									</div>
								</div>
							</form:form>
						</c:if>

					</div>
				</div>
				<div class="marginTop15px"></div>
				<!-- </div> -->
			</div>
			<div class="col-sm-2 col-md-2"></div>
		</div>
	</div>
	<!-- <div class="marginTop15px"></div> -->


	<div>
		<!-- Footer -->
		<jsp:include page="../../../common/footer.jsp"></jsp:include>
		<!--     <div ng-include="'common/footer.html'" a></div> -->
	</div>
</body>
</html>
