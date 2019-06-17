<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="../styles/css/bootstrap.css">
<link rel="stylesheet" href="../styles/css/main.css">
<link rel="stylesheet" href="../styles/css/digi.css">
<script type="text/javascript">
function goBack(){
	window.history.back();
}
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
<script src="../js/main.js"></script>
<script type="text/javascript" src="http://malsup.github.io/jquery.blockUI.js"></script>
<title>Console | New Run</title>


<link rel="stylesheet"
	href="../bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css">
<script
	src="../bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
  
    
 <link href="https://fortawesome.github.io/Font-Awesome/assets/font-awesome/css/font-awesome.css" rel="stylesheet">   
<script type="text/javascript">	
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

<script type="text/javascript">
	$(function() {
		$('#selectedDate').datetimepicker({
			language : 'pt-BR',
			format : "mm-dd-yyyy hh:ii",
			minDate : new Date(),
			minuteStep : 1,
			startDate : new Date()
		});
	});
</script>


</head>
<body>

	<!-- Header and Navigation Bar -->

	<jsp:include page="../common/logo.jsp"></jsp:include>

	<div class="marginTop50px"></div>
	<div class="container" >
		<h1 class="text-center addRunHeading greyTextColor">
			Edit Run <button type="button" class="btn btn-primary pull-right"  onclick="goBack()">BACK</button> 
		</h1>
	</div>
	<div class="container" >
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
								<form:form  class="form-horizontal" action="editRunCafeSeetest" method="POST" id="editRunCafeSeetest"
									modelAttribute="editRun" title="editRunCafeSeetest"
									enctype="multipart/form-data">
									<input type="hidden" name="toolName"
										value=${toolName }>
									<div class="form-group">
										<label for="run_name" class="col-sm-3 control-label">
											Runs Name</label>
										<div class="col-sm-8">
										<form:input path="runName" class="form-control"
												value="${editRun.runName }" disabled='true' />
											<%-- <input type="text" class="form-control" value="${editRun.runName }" disabled="disabled" /> --%>
											<form:hidden path="runid" value="${editRun.runid }"/>
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
											<label for="zipped_bin_folder" class="col-sm-3 control-label">Upload Test Scripts </label>
										<div class="col-sm-3">
											<input type="file" id="zippedBinFolder"
												name="zippedBinFolder">
										</div>
										<div class="col-sm-3">(Zip Bin Folder)</div>
									</div>
									
									<div class="form-group">
										<!-- <label for="classname_data" class="col-sm-3 control-label">ClassName_Data.xlsx
										</label> -->
										<label for="classname_data" class="col-sm-3 control-label">Test Data Excel</label>
										<div class="col-sm-3">
											<input type="file" id="dataSheet" name="dataSheet">
										</div>
										<div class="col-sm-3">(ClassName_Data.xlsx)</div> 
									</div>
								
									<div class="form-group">
										<!-- <label for="execution_name" class="col-sm-3 control-label">Execution.xlsx
										</label> -->
										<label for="execution_name" class="col-sm-3 control-label">Test Devices</label>
										<div class="col-sm-3">
											<input type="file" id="execution" name="execution">
										</div>
										<div class="col-sm-3">(Execution.xlsx)</div>
									</div>
								
									<div class="form-group">
										<!-- <label for="master_config" class="col-sm-3 control-label">MasterConfig.xlsx
										</label> -->
										<label for="master_config" class="col-sm-3 control-label">Test Procedure</label>
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
									</label>
									<label class="radio-inline "> <input class="pull-left"
										name="scheduledStatus" id="scheduledStatus" value="RunOnSave"
										type="radio"><label for="saveNrun"> Save and
											Run</label>
									</label>
									<label class="radio-inline "> 
										<input class="pull-left" name="scheduledStatus" id="scheduledStatus" value="ScheduledAt"
											type="radio"><label for="ScheduledAt"> Delay By</label>
									
										<div class="input-append">
											<form:input path="scheduledtime" class="my-date-picker" name="selectedDate"
												id="selectedDate" type="text" /><span class="add-on">
												<i data-date-icon="icon-calendar"></i>
												</span>
										<span id="timeError"></span>
										</div>
									</label>
										     
										</div>
									</div>
						
									<div class="form-group">
										<label for="exit_on_failure" class="col-sm-3 control-label">Exit on failure </label>
										<div class="col-sm-8">
											<label class="radio-inline"> <input
												name="executeBuild" id="executeIfBuildNotStable" value="buildSuccess"
												type="radio"><label for="execute_if_build_stable">Execute if build is stable</label>
											</label>
											<label class="radio-inline "> <input class="pull-left"
												name="executeBuild" id="executeIfBuildNotStable" value="buildFail"
												type="radio"><label for="execute_if_build_not_stable">Execute even if build is not stable</label>
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
								
							<%-- 	<c:if test="${toolName == 'CGAF_Cucumber_Appium'}">
								<form:form  class="form-horizontal" action="addNewRunCucumber" method="POST" id="addNewRunCucumber" onsubmit="return validateCucumber()"
									modelAttribute="newRun" title="addNewRun"
									enctype="multipart/form-data">
									<input type="hidden" name="toolName"
										value=${toolName} />
									
										<div class="form-group">
										<label for="run_name" class="col-sm-3 control-label">
											Run Name<font color="red"> <b> *</b> </font></label>
										<div class="col-sm-8">
											<form:input path="runName" class="form-control" id="runName"
												placeholder="Enter run name" />
												<font color="red">	<span id="runError"></span></font>
											
										</div>
										
									</div>
									<form:hidden path="toolid" />
								
									<div class="form-group">
										<label for="project_name" class="col-sm-3 control-label"> Project
											Name</label>
										<div class="col-sm-8">
											<input type="text" name="projectName" class="form-control"
												value="${projectName}" disabled="disabled" />
										</div>
									</div>
									
									<div class="form-group">
										<label for="build_id" class="col-sm-3 control-label"> Select
											Build</label>
										<div class="col-sm-8">
											<input type="text" name="projectName" class="form-control"
												value="SampleBuild" disabled="disabled" />
										</div>
										
									</div>
									
									<div class="form-group">
										<label for="zipped_bin_folder" class="col-sm-3 control-label">
										Zip
											Bin Folder <font color="red"> <b> *</b> </font></label>
										<div class="col-sm-8">
											<input type="file" id="zippedBinFolder"
												name="zippedBinFolder" style="display: inline-block;">
												<font color="red"><span id="binError"></span></font>
										</div>
									</div>
									
									
										<div class="form-group">
										<label for="configFile" class="col-sm-3 control-label">Configuration File <font color="red"> <b> *</b> </font>
										</label>
										<div class="col-sm-8" >
											<input type="file" id="configFile" name="configFile" style="display: inline-block;">
											<font color="red">	<span id="configError"></span></font>
										</div>
										
									</div>
						
									<div class="form-group">
										<label for="schedule" class="col-sm-3 control-label">Schedule<font color="red"> <b> *</b> </font> </label>
										<div class="col-sm-9">
												<label class="radio-inline"> <input
										name="scheduledStatus" id="scheduledStatus" value="DonotRun"
										type="radio"><label for="saveForLater">Save
											For Later</label>
									</label>
									<label class="radio-inline "> <input class="pull-left"
										name="scheduledStatus" id="scheduledStatus" value="RunOnSave"
										type="radio"><label for="saveNrun"> Save and
											Run</label>
									</label>
									<label class="radio-inline "> <input class="pull-left"
										name="scheduledStatus" id="scheduledStatus" value="ScheduledAt"
										type="radio"><label for="ScheduledAt"> Delay By</label>
										<div class="input-append">
											<form:input path="scheduledtime" class="my-date-picker" name="selectedDate"
												id="selectedDate" type="text" /><span class="add-on">
												<i data-date-icon="icon-calendar"></i>
												</span>
										<span id="timeError"></span>
										</div>
									</label>
									<!-- <input type="text" name="scheduledtime" id="scheduledtime" size="2"></label> -->
					
									<font color="red">	<span id="scheduleError"></span></font>	
										</div>
										
									</div>
								
									<div class="form-group">
										<label for="exit_on_failure" class="col-sm-3 control-label">Exit on failure </label>
										<div class="col-sm-8">
											<label class="radio-inline"> <input
												name="executeBuild" id="executeIfBuildNotStable" value="buildSuccess"
												type="radio"><label for="execute_if_build_stable">Execute if build is stable</label>
											</label>
											<label class="radio-inline "> <input class="pull-left"
												name="executeBuild" id="executeIfBuildNotStable" value="buildFail"
												type="radio"><label for="execute_if_build_not_stable">Execute even if build is not stable</label>
											</label>
										</div>
									</div>
									<div class="marginTop50px"></div>
									<div class="form-group">
										<div class="col-sm-3 col-sm-offset-5">
										<input type="submit" id="submit" class="btn btn-success btnCenter" >
										</div>
									</div>
									</form:form>
								</c:if>
								<c:if test="${toolName eq 'CGAF_Perfecto' }">
								
								<form:form class="form-horizontal" action="addNewRunCafePerfecto" method="POST" id="addNewRunCafeSeetest"
									modelAttribute="newRun" title="addNewRunCafeSeetest"
									enctype="multipart/form-data">
									<input type="hidden" name="toolName"
										value=${toolName }>
									<div class="form-group">
										<label for="run_name" class="col-sm-3 control-label">
											Run Name</label>
										<div class="col-sm-8">
											<form:input path="runName" class="form-control"
												placeholder="Enter run name" />
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
											<label for="zipped_bin_folder" class="col-sm-3 control-label">Upload Test Scripts </label>
										<div class="col-sm-3">
											<input type="file" id="zippedBinFolder"
												name="zippedBinFolder">
										</div>
										<div class="col-sm-3">(Zip Bin Folder)</div>
									</div>
									
									<div class="form-group">
										<!-- <label for="classname_data" class="col-sm-3 control-label">ClassName_Data.xlsx
										</label> -->
										<label for="classname_data" class="col-sm-3 control-label">Test Data Excel</label>
										<div class="col-sm-3">
											<input type="file" id="dataSheet" name="dataSheet">
										</div>
										<div class="col-sm-3">(ClassName_Data.xlsx)</div> 
									</div>
								
									<div class="form-group">
										<!-- <label for="execution_name" class="col-sm-3 control-label">Execution.xlsx
										</label> -->
										<label for="execution_name" class="col-sm-3 control-label">Test Devices</label>
										<div class="col-sm-3">
											<input type="file" id="execution" name="execution">
										</div>
										<div class="col-sm-3">(Execution.xlsx)</div>
									</div>
									
									<div class="form-group">
										<!-- <label for="master_config" class="col-sm-3 control-label">MasterConfig.xlsx
										</label> -->
										<label for="master_config" class="col-sm-3 control-label">Test Procedure</label>
										<div class="col-sm-3">
											<input type="file" id="masterConfig" name="masterConfig">
										</div>
										<div class="col-sm-3">(MasterConfig.xlsx)</div>
									</div>
									
									<div class="form-group">
										<label for="schedule" class="col-sm-3 control-label">Schedule </label>
										<div class="col-sm-8">
									    	<label class="radio-inline"> <input
												name="scheduledStatus" id="scheduledStatus" value="DonotRun"
												type="radio"><label for="saveForLater">Save
												For Later</label>
											</label>
										<label class="radio-inline "> <input class="pull-left"
												name="scheduledStatus" id="scheduledStatus" value="RunOnSave"
												type="radio"><label for="saveNrun"> Save and Run</label>
										</label>
										<label class="radio-inline "> <input class="pull-left"
												name="scheduledStatus" id="scheduledStatus" value="ScheduledAt"
												type="radio"><label for="ScheduledAt"> Delay By</label>
												<div class="input-append">
											<form:input path="scheduledtime" class="my-date-picker" name="selectedDate"
												id="selectedDate" type="text" /><span class="add-on">
												<i data-date-icon="icon-calendar"></i>
												</span>
										<span id="timeError"></span>
										</div>
										</label>
										</div>
									</div>
								
									<div class="form-group">
										<label for="exit_on_failure" class="col-sm-3 control-label">Exit on failure </label>
										<div class="col-sm-8">
											<label class="radio-inline"> <input
												name="executeBuild" id="executeIfBuildNotStable" value="buildSuccess"
												type="radio"><label for="execute_if_build_stable">Execute if build is stable</label>
											</label>
											<label class="radio-inline "> <input class="pull-left"
												name="executeBuild" id="executeIfBuildNotStable" value="buildFail"
												type="radio"><label for="execute_if_build_not_stable">Execute even if build is not stable</label>
											</label>
										</div>
									</div>
									<div class="marginTop50px"></div>
									<div class="form-group">
										<div class="col-sm-3 col-sm-offset-5">
										<input type="submit" class="btn btn-success btnCenter" >
										</div>
									</div>
								</form:form>
								</c:if>
								
									<c:if test="${toolName eq 'CGAF_LayoutTesting' }">
								<form:form  class="form-horizontal" action="addNewRunLayoutTesting" method="POST"
									id="addNewRunLayoutTesting" modelAttribute="newRun"
									title="addNewRunLayoutTesting" enctype="multipart/form-data">
									<input type="hidden" name="toolName" value=${toolName } />
									<div class="form-group">
										<label for="run_name" class="col-sm-3 control-label">
											Run Name</label>
										<div class="col-sm-8">
											<form:input path="runName" class="form-control"
												placeholder="Enter run name" />
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
										<label for="zipped_Excel_folder"
											class="col-sm-3 control-label">Upload Excel </label>
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
									</label>
									<label class="radio-inline "> <input class="pull-left"
										name="scheduledStatus" id="scheduledStatus" value="RunOnSave"
										type="radio"><label for="saveNrun"> Save and
											Run</label>
									</label>
										 	<label class="radio-inline "> <input class="pull-left"
										name="scheduledStatus" id="scheduledStatus" value="ScheduledAt"
										type="radio"><label for="ScheduledAt"> Delay By</label>
									
									<div class="input-append">
											<form:input path="scheduledtime" class="my-date-picker" name="selectedDate"
												id="selectedDate" type="text" /><span class="add-on">
												<i data-date-icon="icon-calendar"></i>
												</span>
										<span id="timeError"></span>
										</div>
										</div>
									</div>
									<div class="marginTop50px"></div>
									<div class="form-group">
										<div class="col-sm-3 col-sm-offset-5">
										<input type="submit" class="btn btn-success btnCenter" >
										</div>
									</div>
								</form:form>
							</c:if>
								 --%>
							</div>
						</div>
						<div class="marginTop15px"></div>
					<!-- </div> -->
				</div>
				<div class="col-sm-2 col-md-2"></div>
			</div>
		</div>
		<div class="newrunMargin">
	<jsp:include page="../common/footer.jsp"></jsp:include>
	</div>
</body>
</html>