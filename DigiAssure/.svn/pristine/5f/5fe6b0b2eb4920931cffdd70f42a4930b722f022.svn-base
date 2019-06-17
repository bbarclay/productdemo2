<!DOCTYPE html>
<html data-ng-app="myApp">
<head>
<title>Form Validation</title>
<!-- <script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script> -->
<script src="${pageContext.request.contextPath}/vendor/jquery/dist/jquery.js"></script>
<script src="${pageContext.request.contextPath}/vendor/angular/angular.js"></script>
<!-- <script src="${pageContext.request.contextPath}/vendor/angular/angular.min.js"></script> -->
<script src="${pageContext.request.contextPath}/vendor/angular-ui-router/release/angular-ui-router.js"></script>
<script src="${pageContext.request.contextPath}/vendor/angular-route/angular-route.js"></script>
<script src="${pageContext.request.contextPath}/vendor/angular-ui-bootstrap-bower/ui-bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/vendor/angular-ui-bootstrap-bower/ui-bootstrap-tpls.js"
	type="text/javascript"></script>
</head>
<script src="${pageContext.request.contextPath}/js/crowdsourcingcontroller.js" type="text/javascript"></script>

<body>

<jsp:include page="../../common/logo.jsp"></jsp:include>
		<div class="marginTop65px"></div>
	<div data-ng-controller="MainController">
		<div data-ng-view></div>
	</div>
</body>

<script type="text/javascript">
	
	function call(){
		$('#newSurveyForm').hide();
		var projectid=${projectid};
		//getProject(projectid);
	}
	</script>
	
	 <script type="text/javascript">
/* 			
	 	function getProject(projectid){
			$
			.ajax({
				type : "GET",
				url : "http://localhost:8080/feedback.com/getSurveys/"+projectid,
				contentType : "application/json; charset=utf-8",
				dataType : "json",
				success : function(data) {

					var str="";
					 for(var i=0;i<data.length;i++){
						
						str+="<li id='"+data[i]["surveyid"]+"'>";
						
						str+="<div class='projectTitle' id='projectTitle'><b>"+data[i]["surveyname"]+"</b><a href='javascript:toggleDiv("+data[i]["surveyid"]+")' id='change"+data[i]["surveyid"]+"'><span class='glyphicon glyphicon-certificate pull-right'></span></a></div>";
						str+="<div  class='projectBody'><div id='surveyDetails"+data[i]["surveyid"]+"'><b>Total User :</b>"+data[i]["totalusers"]+"<br><b>Created On :</b>"+data[i]["creationtime"]+"</div><div id='editsurvey"+data[i]["surveyid"]+"'></div></div>";
						str+="<div class='projectfooter'><a href='../../digitalQAService/crowdSourcing/overall?surveyid="+data[i]["surveyid"]+" '>VIEW REPORT</a></div>"; 
						
						str+="</li>";
						
					}
					$('#existingProject').append(str); 
				},
				error : function(jqXHR, textStatus, errorThrown) {
					alert('error: ' + textStatus + ': ' + errorThrown);
				}
			});
		}
		
		 function toggleDiv(val){
			
		$('#surveyDetails'+val).hide();
		var str="<a href='#' onclick='return deleteSurvey("+val+")'>Delete</a><br><br>";
		str+="<a href='#' onclick='return editSurvey("+val+")'>Edit</a><br><br>";
		$('#editsurvey'+val).show();
		$('#editsurvey'+val).html(str);
		
		var id = "change"+val;
		document.getElementById(id).href = "javascript:showsurvey("+val+")";
		}
		
		function showsurvey(val){
			$('#editsurvey'+val).hide();
			$('#surveyDetails'+val).show();
			var id = "change"+val;
			document.getElementById(id).href = "javascript:toggleDiv("+val+")";
		} 
		
		  function deleteSurvey(surveyid){
			  console.log("deleted "+surveyid);
			$
			.ajax({
				type : "GET",
				url : "http://localhost:8080/feedback.com/deleteSurvey/"+surveyid,
				contentType : "application/json; charset=utf-8",
				dataType : "json",
				success : function(data) {
					if(data){
						$('#'+surveyid).remove();
					}
				},
				error : function(jqXHR, textStatus, errorThrown) {
					alert('error: ' + textStatus + ': ' + errorThrown);
				}
			});
			return false;
		}  
		 
		function editSurvey(surveyid){
			$
			.ajax({
				type : "GET",
				url : "http://localhost:8080/feedback.com/getSurvey/"+surveyid,
				contentType : "application/json; charset=utf-8",
				dataType : "json",
				success : function(data) {
					//var info = "{surveyname:"+data.surveyname+",introtext:"+data.introductiontext+",thankyoutext:"+data.thankyoutext+",targetmails:"+data.targetemails+"}";
					var a = getContextPath();
					window.location.href=a+"/digitalQAService/crowdSourcing/survey.jsp?name="+data.surveyname+"&intro="+data.introductiontext+"&thankstext="+data.thankyoutext+"&targetmails="+data.targetemails;
				},
				error : function(jqXHR, textStatus, errorThrown) {
					alert('error: ' + textStatus + ': ' + errorThrown);
				}
			});
			return false;
		}
		 */
		function deleteSurvey(surveyid){
			$
			.ajax({
				type : "GET",
				url : "http://10.102.22.245/feedback.com/deleteSurvey/"+surveyid,
				contentType : "application/json; charset=utf-8",
				dataType : "json",
				success : function(data) {
					if(data){
						$('#'+surveyid).remove();
					}
				},
				error : function(jqXHR, textStatus, errorThrown) {
					alert('error: ' + textStatus + ': ' + errorThrown);
				}
			});
			return false;
		}  
	</script>
</html>


