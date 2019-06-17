var app = angular.module('myApp', [ 'ngRoute' ]);

var url = "10.51.25.10";

app.config(function($routeProvider) {
	$routeProvider.when('/', {
		templateUrl : "form.jsp",
		controller : "MyController"
	}).when('/survey', {
		templateUrl : "survey.jsp",
		controller : "surveyController"
	}).when('/overall', {
		templateUrl : "overall.jsp",
		controller : "OverallController"
	})
})

app.factory("surveyDetails", function() {
	var details = {}
	return {
		setDetails : function(data) {
			details = data;
		},
		getDetails : function() {
			return details;
		}
	}
})

app.factory("reportDetails", function() {
	var details = {}
	return {
		setDetails : function(data) {
			details = data;
		},
		getDetails : function() {
			return details;
		}
	}
})

// Application Main Controller
app.controller("MainController", function($scope, $location, $route) {
	$location.url('/');
	$scope.reloadRoute = function() {
		   $route.reload();
	}
})


// Mycontroller - Creates Survey 
app.controller('MyController', function($scope, $http, surveyDetails,
		$location, $compile,reportDetails,$route) {
	$scope.submit = function() {
		
		var formData = {
			"surveyname" : $scope.surveyname,
			"workingtitle" : $scope.workingtitle,
			"userid" : $scope.userid,
			"projectid":$scope.projectid
		};
		feedback(formData, $http, surveyDetails, $location)
	};
	
	
    	$scope.show = 0;
    	$scope.showForm = function(){
    		$scope.show = 1;
    	};
    	
    	$scope.getSurveyDetails = function(projectid){
    		getSurveyDetails(projectid)
    	}
    	
    	function getSurveyDetails(projectid){
    		$('#successMsg').empty();
    		var response = $http.get('http://'+url+'/feedback.com/getSurveys/'+projectid).then(
    				function(response) {
    					
    					var str="";
					 for(var i=0;i<response.data.length;i++){
						
						str+="<li id='"+response.data[i]["surveyid"]+"'>";
						
						str+="<div class='projectTitle' id='projectTitle'><b>"+response.data[i]["surveyname"]+"</b><a href='' ng-click='isSubscribed ? toggleDiv("+response.data[i]["surveyid"]+") : showsurvey("+response.data[i]["surveyid"]+")' id='change"+response.data[i]["surveyid"]+"'><span class='glyphicon glyphicon-certificate pull-right'></span></a></div>";
						str+="<div  class='projectBody'><div id='surveyDetails"+response.data[i]["surveyid"]+"'><b>Total User :</b>"+response.data[i]["totalusers"]+"<br><b>Created On :</b>"+response.data[i]["creationtime"]+"</div><div id='editsurvey"+response.data[i]["surveyid"]+"'></div></div>";
						//str+="<div class='projectfooter'><a href='' data-ng-click='getReport("+response.data[i]["surveyid"]+")'>VIEW REPORT</a></div>";
						str+="<div class='projectfooter'><a href='../../digitalQAService/crowdSourcing/overall?surveyid="+response.data[i]["surveyid"]+" '>VIEW REPORT</a></div>";
						
						str+="</li>";
						
					}
					 var element = angular.element(document.querySelector('#existingProject'));
					    var generated = element.append(str);
					    $compile(generated.contents())($scope);
    				}, function(errResponse) {
    					console.error('Error while getting Survey details'+errResponse.data);
    				});
    	}
    	
    	$scope.isSubscribed = true;
    	
    	$scope.toggleDiv = function(surveyid){
    		
    		$('#surveyDetails'+surveyid).hide();
    		var str="<a href='#' onclick='return deleteSurvey("+surveyid+")'>Delete</a><br><br>";
    		str+="<a href='#' ng-click='editSurvey("+surveyid+")'>Edit</a><br><br>";
    		$('#editsurvey'+surveyid).show();
    		var element = angular.element(document.querySelector('#editsurvey'+surveyid));
		    var generated = element.html(str);
		    $compile(generated.contents())($scope);
		    $scope.isSubscribed = false;
    	}
    	
    	$scope.showsurvey = function(surveyid){
    		$('#editsurvey'+surveyid).hide();
			$('#surveyDetails'+surveyid).show();
			$scope.isSubscribed = true;
    	}
    	
    	/*$scope.deleteSurvey = function(surveyid){
    		return $http.delete('http://'+url+'/feedback.com/deleteSurvey/'+surveyid).then(
    				function(response) {
    					//$scope.surveyArr.splice(index, 1);
    					console.log("ater deletion"+response);
   				}, function(errResponse) {
    					console.error('Error while deleting Survey');
    				});
    	}*/
    	
    	$scope.editSurvey = function(surveyid){
    		var response = $http.get('http://'+url+'/feedback.com/getSurvey/'+surveyid).then(
    				function(response) {
    					
    					//alert("id "+response.data.surveyid);
    					surveyDetails.setDetails(response.data);
    					$location.url("/survey");
    				}, function(errResponse) {
    					console.error('Error while getting Survey details for editing purpose : '+errResponse.data);
    				});
			return false;
    	}
    	
    	$scope.getReport = function(surveyid){
    		var response = $http.post('http://'+url+'/feedback.com/getUsers/'+surveyid).then(
    				function(response) {
    					
    					for(var i=0;i<response.data.length;i++){
    						//alert(response.data[i]["surveyname"]+response.data[i]["totalusers"]);
    					}
    					reportDetails.setDetails(response.data);
    					$location.url("/overall");
    				}, function(errResponse) {
    					console.error('Error while getting Survey details'+errResponse.data);
    				});
    	}
    	
});

function feedback(user, $http, surveyDetails, $location) {
	
	var response = $http.post('http://'+url+'/feedback.com/createSurvey', user).then(
			function(response) {
				
				surveyDetails.setDetails(response.data);
				$location.url('/survey');
				
			}, function(errResponse) {
				console.error('Error while creating Survey');
			});
}

// Task Controller 
app.controller('taskController', function($scope, $http, surveyDetails) {
	$scope.surveyDtls = surveyDetails.getDetails();
	$scope.surveyid = $scope.surveyDtls.surveyid;
	
		$scope.taskSubmit = function(){
			if($scope.taskname == null || $scope.taskname == ""){
				alert("Enter taskName");
			}
			else if($scope.senario == null || $scope.senario == "" ){
				alert("Enter task scenario");
			}
			else{
				$("#task").show();
				$("#question").show();
				$("#taskdiv").hide();
				$('#save2').show();
				var task = {
						"taskname" : $scope.taskname,
						"senario" : $scope.senario,
						"starturl" : $scope.starturl,
						"successurl" : $scope.successurl,
						"surveyid" : $scope.surveyid
					};
					taskSubmit(task, $http,$scope.surveyid )
			}
		};
	
	$scope.start = function(){
		callAllTasks($scope.surveyid,$http);
		callAllQuestions($scope.surveyid,$http);
	}
});

function taskSubmit(task, $http, surveyid) {
	var response = $http
			.post('http://'+url+'/feedback.com/taskSubmit', task).then(
					function(response) {
						
						if(response){
						callAllTasks(surveyid,$http);
						}
						/*$("#taskdiv").hide();
						var str = "<div class='panel panel-info' style='padding:5px;'>";
						str += "<b>Task Name :</b> "
								+ response.data.taskname;
						str += "<br><b>Task Scenario :</b> "
								+ response.data.senario;
						str += "<button class='btn btn-info pull-right'  style='margin-left:5px;margin-right:5px;'>Display Task</button><button class='btn btn-info pull-right' style='margin-left:5px;'>Delete</button><button class='btn btn-info pull-right' style='margin-left:5px;'>Edit</button>";
						str += "</div>";

						$("#display_tasks").append(str);*/
					}, function(errResponse) {
						console.error('Error while creating Task');
					});
}

function callAllTasks(surveyid,$http){
	var response = $http
	.post('http://'+url+'/feedback.com/getTasks/'+surveyid).then(
			function(response) {
				var taskid =[];
				var taskname =[];
				var scenario =[];
				
				$("#taskdiv").hide();
				
				for (var i = 0; i < response.data.length; i++) {
					
					taskid.push(response.data[i]["taskid"]);
					taskname.push(response.data[i]["taskname"]);
					scenario.push(response.data[i]["senario"]);
				}
				
				var str="";
				if(response.data){
					var len = taskid.length;
					if (len > 0) {
						for (var i = 0; i < len; i++) {
							str += "<div class='panel panel-info' style='padding:5px;'>";
							str += "<b>Task Name :</b> "
									+ taskname[i];
							str += "<br><b>Task Scenario :</b> "
									+ scenario[i];
							str += "<button class='btn btn-info pull-right'  style='margin-left:5px;margin-right:5px;'>Display Task</button><button class='btn btn-info pull-right' style='margin-left:5px;'>Delete</button><button class='btn btn-info pull-right' style='margin-left:5px;'>Edit</button>";
							str += "</div>";
						}
					}	
				}
				$("#display_tasks").html(str); 
			}, function(errResponse) {
				console.error('Error while getting Task'+errResponse);
			});
	
}

//Survey Update function
app.controller('surveyController', function($scope, $http, surveyDetails,$location) {
	$scope.surveyDtls = surveyDetails.getDetails();
	$scope.surveyid = $scope.surveyDtls.surveyid;
	$scope.surveyname = $scope.surveyDtls.surveyname;
	$scope.workingtitle=$scope.surveyDtls.workingtitle;
	if($scope.surveyDtls.introductiontext!='' && $scope.surveyDtls.introductiontext!=null){
		$scope.introduction = $scope.surveyDtls.introductiontext
	}else{
		$scope.introduction = "Welcome to DigiAssure User Feedback Survey, Thank you for participation. The activity should not take more than 10-15 minutes to complete. Yourresponse will help us to enhance our product to better serve users like you.";
	}
	if($scope.surveyDtls.thankyoutext!='' && $scope.surveyDtls.thankyoutext!=null){
		$scope.thankyoutext = $scope.surveyDtls.thankyoutext
	}else{
		$scope.thankyoutext = "Welcome to DigiAssure User Feedback Survey, Thank you for participation. The activity should not take more than 10-15 minutes to complete. Yourresponse will help us to enhance our product to better serve users like you.";
	}
	//$scope.introduction = "Welcome to DigiAssure User Feedback Survey, Thank you for participation. The activity should not take more than 10-15 minutes to complete. Yourresponse will help us to enhance our product to better serve users like you.";
	//$scope.thankyoutext = "Thank you for your valuable time to participate in survey! Your feedback is very valuable. ";
	$scope.targetemails=$scope.surveyDtls.targetemails;
	if($scope.surveyDtls.completionurl!='' && $scope.surveyDtls.completionurl!=null){
	$scope.completionurl = $scope.surveyDtls.completionurl;
	}
	else{
		$scope.completionurl = '';
	}
	$scope.surveySubmit = function() {
		var survey = {
			"surveyid" : $scope.surveyid,
			"surveyname" : $scope.surveyname,
			"workingtitle" : $scope.workingtitle,
			"introductiontext" : $scope.introduction,
			"totalusers" : $scope.totalusers,
			"thankyoutext" : $scope.thankyoutext,
			"completionurl" : $scope.completionurl,
			"targetemails" : $scope.targetemails
		};
		surveySubmit(survey, $http,$location)
	};
});

function surveySubmit(survey, $http,$location) {
	var response = $http.post('http://'+url+'/feedback.com/updateSurveyDetails', survey).then(
			function(response) {
				
				if(response){
					$('#successMsg').append("Survey Created successfully !");
					$location.url('/');
					//window.location.href="http://localhost:8080/digi/digitalQAService/crowdSourcing/index.jsp";
				}
			}, function(errResponse) {
				console.error('Error while creating Survey');
			});
}

//Question Controller

app.controller('questionController',
		function($scope, $http, surveyDetails) {
			$scope.surveyDtls = surveyDetails.getDetails();
			$scope.surveyid = $scope.surveyDtls.surveyid;
			$scope.answers = "Very Satisfied, Satisfied, Ok, Not satisified";
			//alert($scope.answers);
		
			$scope.questionSubmit = function() {
				if($scope.questionname == null || $scope.questionname == ""){
					alert("Enter Question");
				}
				else if($scope.answers == null || $scope.answers == ""){
					alert("Enter Answers");
				}
				else{
					$("#task").show();
					$("#question").show();
					$("#questionForm")[0].reset();
					$("#quesdiv").hide();
					$('#save2').show();
					var question = {
							"surveyid" : $scope.surveyid,
							"questionname" : $scope.questionname,
							"answers" : $scope.answers,
							"type" : $scope.type
						};
						questionSubmit(question, $http,$scope.surveyid)
				}
			};
	});

function questionSubmit(question, $http,surveyid) {
	var response = $http
			.post('http://'+url+'/feedback.com/submitQuestion', question)
			.then(
					function(response) {
						
						if(response){
							callAllQuestions(surveyid,$http);
							}
					},
					function(errResponse) {
						console.error('Error while creating Question'
								+ errResponse);
					});
}

function callAllQuestions(surveyid,$http){
	var response = $http
	.post('http://'+url+'/feedback.com/getQuestions/'+surveyid).then(
			function(response) {
				
				var questionid =[];
				var questionname =[];
				var answer =[];
				var type=[];
				
				$("#quesdiv").hide();
				
				for (var i = 0; i < response.data.length; i++) {
					
					questionid.push(response.data[i]["questionid"]);
					questionname.push(response.data[i]["questionname"]);
					answer.push(response.data[i]["answers"]);
					type.push(response.data[i]["type"]);
				}
				
				var str="";
				if(response.data){
					var len = questionid.length;
					if (len > 0) {
						for (var i = 0; i < len; i++) {
							str += "<div class='panel panel-info' style='padding:5px;'>";
							str += "<b>Question Name :</b> "
									+ questionname[i];
									+ "<b style='padding-left:410px;'>Type :</b>"
									+type[i];
							str += "<br><b>Answers :</b> "
									+ answer[i];
							str += "<button class='btn btn-info pull-right'  style='margin-left:5px;margin-right:5px;'>Display Question</button><button class='btn btn-info pull-right' style='margin-left:5px;'>Delete</button><button class='btn btn-info pull-right' style='margin-left:5px;'>Edit</button>";
							str += "</div>";
						}
					}	
				}
				$("#display_ques").html(str); 
				
			}, function(errResponse) {
				console.error('Error while getting Question'+errResponse);
			});
	
}