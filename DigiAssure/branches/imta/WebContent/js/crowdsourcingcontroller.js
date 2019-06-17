var app = angular.module('myApp', [ 'ngRoute' ]);

var url = "10.102.22.245";
//var url = "10.51.25.10";


app.config(function($routeProvider) {
	$routeProvider.when('/', {
		templateUrl : "crowdSourcing/form.jsp",
		controller : "MyController"
	}).when('/survey', {
		templateUrl : "survey.jsp",
		controller : "surveyController"
	}).when('/overall', {
		templateUrl : "crowdSourcing/overall.jsp",
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

//OverallController
app.service('transferData', function(){
	console.log('transferData');
	 var transferData = this;
	 transferData = {};
	
});

//OverallController
app.service('taskData', function(){
	console.log('taskData');
	 var taskData = this;
	 taskData = {};
	
});
//OverallController
app.service('questionData', function(){
	console.log('questionData');
	 var questionData = this;
	 questionData = {};
	
});
//OverallController
app.service('answerData', function(){
	console.log('answerData');
	 var answerData = this;
	 answerData = {};
	
});

//surveyid
app.service('myService', function(){
	console.log('myService');
	 var myService = this;
	 myService = {};
	
});


// Application Main Controller
app.controller("MainController", function($scope, $location, $route) {
	$location.url('/');
	$scope.reloadRoute = function() {
		   $route.reload();
	}
})


//OverallController
app.controller('OverallController', function($scope,$http,$location,transferData,taskData,myService) {
	$scope.mySurveyid = myService.mySurveyid;
	
	
	var surveyid=$scope.mySurveyid;
	var abandant = transferData.response.data[0].abandant;
	var participant =transferData.response.data[0].participant;
	var non_participants =transferData.response.data[0].non_participants;
		
	$scope.dashboardFlag = true;
	$scope.navFlag = false;
	$scope.questionFlag = false;
	
	$scope.changeNav = function(data){
		
		if(data===1){
			$scope.dashboardFlag = true;
			$scope.taskFlag = false;
			$scope.questionFlag = false;
			
		}else if(data===2){
			$scope.dashboardFlag = false;
			$scope.taskFlag = true;
			$scope.showtask=true;
			$scope.questionFlag = false;
			$scope.taskalert=false;
			$scope.task='Task in';
			task($http,$scope,$location,surveyid);
			

		}else if(data===3){
			$scope.dashboardFlag = false;
			$scope.taskFlag = false;
			$scope.showtask=false;
			$scope.questionFlag = true;
			$scope.questionflag=true;
			$scope.questionalert=false;
		    $scope.backbtn=false;
		    $scope.overbck=true;
			question($http,$scope,$location,surveyid);
		}
		
	};
	$scope.taskResponse = '';

	function task($http,$scope,$location,surveyid){
		var response = $http.get('http://'+url+'/feedback.com/getTaskss/'+surveyid).then(
				function(response) {
				if(response.data[0].result.length==0 && response.data[0].task.length==0){
					$scope.taskalert=true;
					$scope.taskmessage="No tasks are assigned to this Survey";
				}
				else
				{
					$scope.showtask=true;
					taskData.response=response.data[0];
					drawpage(taskData.response);
				}
					 $location.url("/overall");
					
				}, function(errResponse) {
					console.error('Error while getting Survey details'+errResponse.data);
				});
		
	}
	
	function drawpage(response){
		$scope.taskresult=[];
		$scope.task=[];
		var frame=document.getElementById("content");
		var htmlString="";
		var taskList="";
		var i=0;
		
		for(var j=0;j<response.task.length;j++){
			i++;
			htmlString+="<div class='col-sm-12'><div ><b>"+i+" . "+response.task[j].taskname+"</b></div> <div class='col-sm-5' style='margin-top: 75px;'>";
			htmlString+="<h6><b style='color: #6ec5a1;'>&#9632 </b> Positive: <span id='myText_"+response.task[j].taskid+"'></span></h6>";
			htmlString+="<h6><b style='color: #4dbded;'>&#9632 </b> Negative: <span id='myText1_"+response.task[j].taskid+"'></span></h6>";
			htmlString+="<h6><b style='color: #767676;'>&#9632 </b> Neutral: <span id='myText2_"+response.task[j].taskid+"'></span></h6>";
			htmlString+="</div>";
			htmlString+="<div class='col-sm-4'>";
			htmlString+="<div id='container_"+response.task[j].taskid+"' ></div>";
			htmlString+="</div>";
			htmlString+="<div class='col-sm-2'></div></div>";
			
		}

		frame.innerHTML=htmlString;
			$('#taskList').append(taskList);
			drawgragh(response);
		};
		
	function drawpage(response){
			$scope.taskresult=[];
			$scope.task=[];
			var frame=document.getElementById("content");
			var htmlString="";
			var taskList="";
			var i=0;
			
			for(var j=0;j<response.task.length;j++){
				i++;
				htmlString+="<div class='col-sm-12'><div ><b>"+i+" . "+response.task[j].taskname+"</b></div> <div class='col-sm-5' style='margin-top: 75px;'>";
				htmlString+="<h6><b style='color: #6ec5a1;'>&#9632 </b> Positive: <span id='myText_"+response.task[j].taskid+"'></span></h6>";
				htmlString+="<h6><b style='color: #4dbded;'>&#9632 </b> Negative: <span id='myText1_"+response.task[j].taskid+"'></span></h6>";
				htmlString+="<h6><b style='color: #767676;'>&#9632 </b> Neutral: <span id='myText2_"+response.task[j].taskid+"'></span></h6>";
				htmlString+="</div>";
				htmlString+="<div class='col-sm-4'>";
				htmlString+="<div id='container_"+response.task[j].taskid+"' ></div>";
				htmlString+="</div>";
				htmlString+="<div class='col-sm-2'></div></div>";
				
			}

			frame.innerHTML=htmlString;
				$('#taskList').append(taskList);
				drawgragh(response);
				
				
			};
		
		function drawgragh(response){
				for(var i=0;i<response.task.length;i++){
					var posCount=0;
					var negCount=0;
					var neuCount=0;
				
				for(var j=0;j<response.result.length;j++)
				{
					if(response.result[j].actionid==response.task[i].taskid)
					{
						if (response.result[j].positive == 'Y')
						{
								posCount++;
						}
						else  if (response.result[j].negative == 'Y')
						{
								negCount++;
						}
						else  if (response.result[j].neutral == 'Y')
						{
								neuCount++;
						}
				 
					}
				
				}
				document.getElementById("myText_"+response.task[i].taskid).innerHTML = posCount;
				document.getElementById("myText1_"+response.task[i].taskid).innerHTML = negCount;
				document.getElementById("myText2_"+response.task[i].taskid).innerHTML = neuCount;

				Highcharts.setOptions({
					 colors: ['#6ec5a1', '#4dbded', '#767676']
									});
			        Highcharts.chart('container_'+response.task[i].taskid, {
			            chart: {
			            	  margin: [0, 0, 0, 0],
			                  spacingTop: 0,
			                  spacingBottom: 0,
			                  spacingLeft: 0,
			                  spacingRight: 0,
			                plotBackgroundColor: null,
			                plotBorderWidth: null,
			                plotShadow: false,
			                type: 'pie'
			            },
			            title: {
			                text: ''
			            },
			            tooltip: {
			                pointFormat: '{series.name}<b>({point.percentage:.1f}%)</b>'
			            },
			            exporting: {
			                enabled: false
			       },
			            plotOptions: {
			                pie: {
			                	
			                    allowPointSelect: true,
			                    cursor: 'pointer',
			                    dataLabels: {
			                        enabled: false
			                    },
			                    showInLegend: false
			                }
			            },
			            series: [{
			                name: 'users',
			                colorByPoint: true,
			                data:[{
			                
			                        name: 'Positive',
			                        y: posCount
			                    },
			                    {
			                    name:'Negative'	,
			                    	y: negCount
			                    	
			                    },
			                    {
			                    	name:'Neutral' ,
			                    	y: neuCount	
			                    }
			                	
			                	
			                ]            	
			               
			            }]
			        });
			}  
			}
		
				$scope.questionResponse='';
	   function question($http,$scope,$location,surveyid,questionData){
		   var response = $http.get('http://'+url+'/feedback.com/getQuestionss/'+surveyid).then(
				function(response) {
					if(response.data[0].result.length==0 && response.data[0].question.length==0 ){
						$scope.questionflag=false;
						$scope.questionalert=true;
						$scope.questionmessage="No questions are assigned to this Survey";
																								 }
					else
					{
					$scope.questionResponse = response.data[0];
					drawquestion($scope.questionResponse);
					}
					$location.url("/overall");
					
				}, function(errResponse) {
					console.error('Error while getting Survey details'+errResponse.data);
				});
		
		
	}
	   				$scope.answers='';
					$scope.serial=[];
					$scope.quescount=[];
					$scope.percentcount={};
					$scope.percent=[];
					var result = [];
	  function drawquestion(response){
		result = response;
		 $scope.arr=[];
		 
			angular.forEach(response.question, function(questionData){
				
				$scope.answers = questionData.answers.split(',');
				 var percentage=[];
				 var ansarray=[];
				 var answercount=[];
					 for(var i = 0; i < $scope.answers.length; i++){
						 $scope.answers[i] = $scope.answers[i].replace(/^\s*/, "").replace(/\s*$/, "");
						 ansarray.push($scope.answers[i]);
						 var ansCount=0;
						 var total=0;
						
					 angular.forEach(response.result, function(resultData){
						
						 if (resultData.actionid == questionData.questionid ){
								total++;
								if(resultData.answer1 == $scope.answers[i]) {
								   ansCount++;
							}
								  else if(resultData.answer2 == $scope.answers[i]) {
										
										ansCount++;
										
									}
									else if(resultData.answer3 == $scope.answers[i]) {
										ansCount++;
										
									}
									else if(resultData.answer4 == $scope.answers[i]) {
										ansCount++;
										
									}
							
							}
						
					 })
					 //alert("===ansCount==="+ansCount);
					 answercount.push(ansCount);
						if(ansCount===0){
							percentage.push(0);	
						}
						else{
							
							percentage.push(((ansCount/total)*100).toFixed(1));
						}
						
					       }
					 questionData.percentage = percentage;
					 questionData.ansarray=ansarray;
					 questionData.answercount=answercount;
					 $scope.arr.push(questionData);
					 $scope.result=response.result;
					 
						
		})
			
			
	}
	
	
	$scope.showComments=function(result,ques){
		$scope.questionflag=false;
		$scope.backbtn=true;
		$scope.comentsflag=true;
		$scope.overbck=false;
		$scope.questionalert=false;
		$scope.result = result;
		var htmlString="<h3 class='addRunHeading greyTextColor marginTop15px' id='headding'>Comments</h3><br><br>";
		resultresponse=$scope.questionResponse;
		var flag=false;
		 for(var i = 0; i < resultresponse.result.length; i++){
			 
			 if (resultresponse.result[i].actionid == ques ){
				 
				 if(resultresponse.result[i].answer1 == result||resultresponse.result[i].answer2 == result||resultresponse.result[i].answer3 == result||resultresponse.result[i].answer4 == result) {
					 
					 if(resultresponse.result[i].comments != null && resultresponse.result[i].comments != ""){
						 flag=true;
						 htmlString+="<div class='panel panel-info'> <div class='panel-heading' style='height:38px;'>";
							htmlString+="<div class='row col-sm-12'><div class='col-sm-2'>";
							htmlString+=resultresponse.result[i].useremail+" </div><div class='col-sm-3 pull-right'> "+resultresponse.result[i].creationtime+"</div></div></div><div class='panel-body'>";
							
							htmlString+=resultresponse.result[i].comments+"<br><br></div></div>";
						    console.log(resultresponse.result[i].useremail);
					 }
					 
				 }
				 
			 }
			 
		 }
		
		 if(!flag){
				htmlString+="<center><b>No Comments found!!!</b></center>";
			}
			comments.innerHTML=htmlString;
		
	}
	
	
	$scope.back=function(){
		$scope.backbtn=false;
		$scope.questionflag=true;
		$scope.comentsflag=false;
		$scope.overbck=true;

	}
	
	$scope.goBack = function() {
		window.history.back();
		};
	
		$scope.name= function() {
				
				Highcharts.setOptions({
					 colors: ['#6ec5a1', '#4dbded', '#767676']
					});
			        Highcharts.chart('container', {
			            chart: {
			                plotBackgroundColor: null,
			                plotBorderWidth: null,
			                plotShadow: false,
			                type: 'pie'
			            },
			            title: {
			                text: ''
			            },
			            tooltip: {
			                pointFormat: '{series.name}<b>({point.percentage:.1f}%)</b>'
			            },
			            exporting: {
			                enabled: false
			       },
			            
			            plotOptions: {
			                pie: {
			                    allowPointSelect: true,
			                    cursor: 'pointer',
			                 
			                    dataLabels: {
			                        enabled: false
			                    },
			                    showInLegend: true
			                }
			            },
			            series: [{
			                name: 'users',
			                colorByPoint: true,
			                data:[{
			                
			                        name: 'Non participants',
			                        y: non_participants
			                    },
			                    {
			                    name:'Participants'	,
			                    	y: participant
			                    	
			                    },
			                    {
			                    	name:'Abundant'	,
			                    	y: abandant
			                    }
			                	
			                	
			                ]            	
			               
			            }]
			        });
			    
			              }
		   
	
	   $scope.tempDAta = transferData.response;
	  // $scope.taskData1=taskData.response;
});


// Mycontroller - Creates Survey 
app.controller('MyController', function($scope, $http, surveyDetails,
		$location, $compile,$route,transferData,myService) {
	$scope.addSurveyFlag = false;
	$scope.surveyname = '';
	$scope.workingtitle = '';
	$scope.userid = '';
	$scope.projectid = '';
	$scope.setp1Flag = false;
	$scope.setp2Flag = false;
	$scope.setp3Flag = false;
	$scope.setp4Flag = false;
	$scope.showTask = false;
	$scope.showques = false;
	$scope.inserttask = true;
	$scope.insertquestion = true;
	$scope.save2 = true;
	$scope.show = 0;
	$scope.showForm = function(){
		$scope.show = 1;
		$scope.surveyname = '';
	};
	$scope.surveyArr = [];
	$scope.getSurveyDetails = function(projectid){
		getSurveyDetails(projectid)
	}
	
	function getSurveyDetails(projectid){
		var response = $http.get('http://'+url+'/feedback.com/getSurveys/'+projectid).then(
				function(response) {
					if(response){
						for(var i=0;i<response.data.length;i++)
							$scope.surveyArr.push(response.data[i]);
							$scope.length = response.data.length;
				}
				}, function(errResponse) {
					console.error('Error while getting Survey details'+errResponse.data);
				});
	}
	$scope.editFlag = 0;
	$scope.editValueIndex = '';
	$scope.toggle = function(surveyid, index){
		$scope.editValueIndex = index;
	}
	
	$scope.deleteSurvey = function(surveyid){
		deleteSurvey(surveyid);
	}
	 function deleteSurvey(surveyid){
			$
			.ajax({
				type : "GET",
				url : "http://"+url+"/feedback.com/deleteSurvey/"+surveyid,
				contentType : "application/json; charset=utf-8",
				dataType : "json",
				success : function(data) {
					if(data){
						$('#'+surveyid).remove();
					}
					angular.forEach($scope.surveyArr, function(value, key){
						console.log(value.surveyid +"   "+ data.surveyid);
					     if(value.surveyid == data.surveyid){
					    	 $scope.surveyArr.splice(key,1);
					     }
					});
					$scope.deleteMessage= "survey deleted successfully";
				},
				error : function(jqXHR, textStatus, errorThrown) {
					alert('error: ' + textStatus + ': ' + errorThrown);
				}
			});
			return false;
		} 
	 
	 $scope.getReport = function(surveyid){
	 		var surveyname=[];
	 		
	 		var response = $http.get('http://'+url+'/feedback.com/getResults/'+surveyid).then(
	 				function(response) {
	 					$scope.mySurveyid = myService.mySurveyid;
	 				    myService.mySurveyid = surveyid;
	 					 transferData.response= response;
	 					 $location.url("/overall");
	 					
	 				}, function(errResponse) {
	 					console.error('Error while getting Survey details'+errResponse.data);
	 				});
	 	}
	
	
	$scope.editSurvey = function(surveyid){
		
		var survey = {
				"surveyid" : surveyid
		}
		var response = $http.post('http://'+url+'/feedback.com/getSurvey',survey).then(
				function(response) {
					surveyDetails.setDetails(response.data);
					$scope.userTestDetail = {
							surveyName: response.data.surveyname,
							introduction: response.data.introductiontext
						}
					$scope.participantDetail = {
							thankyoutext: response.data.thankyoutext,
							targetemails:response.data.targetemails
					}
					getAllTasks($http,response.data.surveyid);
					getAllQuestions($http,response.data.surveyid);
					$scope.addSurveyFlag = true;
					$scope.usrSurverValue=1;
					$scope.setp1Flag = true;
					$scope.setp2Flag = false;
					$scope.setp3Flag = false;
					$scope.setp4Flag = false;
				}, function(errResponse) {
					console.error('Error while getting Survey details for editing purpose : '+errResponse.data);
				});
	}
	
	$scope.goBack = function() {
		window.location.href = '../../digitalQAService/crowdSourcing';
		};
	
	
	$scope.userTestDetail = {
			surveyName: '',
			introduction: "Welcome to DigiAssure User Feedback Survey, Thank you for participation. The activity should not take more than 10-15 minutes to complete. Yourresponse will help us to enhance our product to better serve users like you."
	}
	$scope.participantDetail = {
			thankyoutext: "Thank you for your valuable time to participate in survey! Your feedback is very valuable. ",
			targetemails:''
	}
	$scope.submit = function(name, userid, projectid) {
		$scope.surveyname = name;
		$scope.userTestDetail.surveyName = name;
		$scope.userid = userid;
		$scope.projectid = projectid;
		$scope.setp1Flag = true;
		$scope.userTestDetail.introduction = "Welcome to DigiAssure User Feedback Survey, Thank you for participation. The activity should not take more than 10-15 minutes to complete. Yourresponse will help us to enhance our product to better serve users like you." 
		$scope.participantDetail.thankyoutext = "Thank you for your valuable time to participate in survey! Your feedback is very valuable. ",
		$scope.participantDetail.targetemails = '';
		$scope.taskArr = [];
		$scope.questionArr = [];
		$scope.addSurveyFlag = true;
		var formData = {
			"surveyname" : name,
			"userid" : userid,
			"projectid":projectid
		};
		feedback(formData, $http, surveyDetails)
		
	};
	
	function feedback(user, $http, surveyDetails) {
		
		var response = $http.post('http://'+url+'/feedback.com/createSurvey', user).then(
				function(response) {
					
					surveyDetails.setDetails(response.data);
					$scope.addSurveyFlag = true;
				}, function(errResponse) {
					console.error('Error while creating Survey');
				});
	}
	$scope.usrSurverValue=1;
	$scope.step1 = function(){
		$scope.usrSurverValue=1;
		$scope.setp1Flag = true;
		$scope.setp2Flag = false;
		$scope.setp3Flag = false;
		$scope.setp4Flag = false;
	}
	$scope.step2 = function(){
		$scope.usrSurverValue=2;
		$scope.setp1Flag = false;
		$scope.setp2Flag = true;
		$scope.setp3Flag = false;
		$scope.setp4Flag = false;
		$scope.inserttask = true;
		$scope.insertquestion = true;
	}
	$scope.step3 = function(){
		$scope.usrSurverValue=3;
		$scope.setp1Flag = false;
		$scope.setp2Flag = false;
		$scope.setp3Flag = true;
		$scope.setp4Flag = false;
	}
	$scope.step4 = function(){
		$scope.usrSurverValue=4;
		$scope.setp1Flag = false;
		$scope.setp2Flag = false;
		$scope.setp3Flag = false;
		$scope.setp4Flag = true;
	}
	
	$scope.cancel = function(){
		$scope.showTask = false;
		$scope.showques = false;
		$scope.showQuesFlag = false;
		$scope.inserttask = true;
		$scope.insertquestion = true;
		$scope.save2 = true;
	}
	
	$scope.userTestDetail1 = function(data){
		if(data){
			$scope.userTestDetail.surveyName = data.surveyName;
			$scope.userTestDetail.introduction = data.introduction;
		}
		$scope.usrSurverValue=2;
		$scope.setp1Flag = false;
		$scope.setp2Flag = true;
		$scope.setp3Flag = false;
		$scope.setp4Flag = false;
	}
	
	$scope.showTaskdiv = function(){
		$scope.showTask = true;
		$scope.showques = false;
		$scope.inserttask = false;
		$scope.insertquestion = true;
		$scope.save2 = false;
	}
	$scope.showquesdiv = function(){
		$scope.showques = true;
		$scope.showTask = false;
		$scope.inserttask = true;
		$scope.insertquestion = false;
		$scope.save2 = false;
	}
	$scope.showQues = function(){
		$scope.showQuesFlag = true;
		$scope.showTask = false;
		$scope.save2 = false;
	}
	
	$scope.taskQuesDetail = function(){
		$scope.usrSurverValue=3;
		$scope.setp1Flag = false;
		$scope.setp2Flag = false;
		$scope.setp3Flag = true;
		$scope.setp4Flag = false;
	}
	$scope.taskDetail = {
			taskname: '',
			senario: '',
			starturl: ''
	}
	
	$scope.taskSubmit = function(taskData){
		$scope.surveyDtls = surveyDetails.getDetails();
		$scope.surveyid = $scope.surveyDtls.surveyid;
		if(taskData){
			$scope.taskDetail.taskname = taskData.taskname;
			$scope.taskDetail.senario = taskData.senario;
			$scope.taskDetail.starturl = taskData.starturl;
			var task = {
					"taskname" : taskData.taskname,
					"senario" : taskData.senario,
					"starturl" : taskData.starturl,
					"surveyid" : $scope.surveyid
				};
			taskSubmit(task,$http,$scope.surveyid)
		}
		$scope.showTask = false;
		$scope.inserttask = true;
		$scope.save2 = true;
	}
	$scope.taskArr = [];
	function taskSubmit(task,$http,surveyid){
		var response = $http
		.post('http://'+url+'/feedback.com/taskSubmit', task).then(
				function(response) {
					if(response.data.length>0){
						$scope.taskArr = [];
						for(var i=0;i<response.data.length;i++)
							$scope.taskArr.push(response.data[i]);
					}
				}, function(errResponse) {
					console.error('Error while creating Task');
				});
	}
	
	$scope.option = function(value){
		if(value == "Radio"){
			$scope.showQuesFlag = true;
		}
		else if(value == "CheckBox"){
			$scope.showQuesFlag = true;
		}
		
	}
	
	$scope.quesDetail = {
			type: '',
			questionname: '',
			answers: ''
	} 
	$scope.questionSubmit = function(questionData){
		$scope.surveyDtls = surveyDetails.getDetails();
		$scope.surveyid = $scope.surveyDtls.surveyid;
		if(questionData){
			$scope.quesDetail.type = questionData.type;
			$scope.quesDetail.questionname = questionData.questionname;
			$scope.quesDetail.answers = questionData.answers;
			var question = {
				"questionname":questionData.questionname,
				"type":questionData.type,
				"answers":questionData.answers,
				"surveyid":$scope.surveyid
			};
			questionSubmit($http,question,$scope.surveyid)
		}
		$scope.showques = false;
		$scope.insertquestion = true;
		$scope.save2 = true;
	}
	$scope.questionArr = [];
	function questionSubmit($http,question,surveyid){
		var response = $http
		.post('http://'+url+'/feedback.com/submitQuestion', question).then(
				function(response) {
					if(response.data.length>0){
						$scope.questionArr = [];
						for(var i=0;i<response.data.length;i++)
							$scope.questionArr.push(response.data[i]);
					}
					else{
						$scope.questionArr.push(response.data);
					}
				},   
				function(errResponse) {
					console.error('Error while creating Question'
							+ errResponse);
				});
	}
	
	$scope.inviteParticipants = function(data){
		if(data){
			$scope.participantDetail.thankyoutext = data.thankyoutext;
			$scope.participantDetail.targetemails = data.targetemails;
		}
		$scope.usrSurverValue=4;
		$scope.setp1Flag = false;
		$scope.setp2Flag = false;
		$scope.setp3Flag = false;
		$scope.setp4Flag = true;
	}
	
	$scope.surveySubmit = function(){
		//alert(' $scope.introduction ' + $scope.introduction);
		$scope.surveyDtls = surveyDetails.getDetails();
		$scope.surveyid = $scope.surveyDtls.surveyid;
		$scope.surveyname = $scope.surveyDtls.surveyname;
		
		var survey = {
				"surveyid" : $scope.surveyid,
				"surveyname" : $scope.surveyname,
				"introductiontext" : $scope.userTestDetail.introduction,
				"thankyoutext" : $scope.participantDetail.thankyoutext,
				"completionurl" : $scope.completionurl,
				"targetemails" : $scope.participantDetail.targetemails
			};
		surveySubmit(survey, $http,$location)
	}
	
	function surveySubmit(survey, $http,$location) {
		var response = $http.post('http://'+url+'/feedback.com/updateSurveyDetails', survey).then(
				function(response) {
					console.log('response.data *** ', response.data);
					console.log('response.data.id *** ', response.data.surveyid);
					if(response){
						var c=0;
						angular.forEach($scope.surveyArr, function(value, key){
						     if(value.surveyid == response.data.surveyid){
						    	 c++;
						     }
						});
						if(c == 0)
							$scope.surveyArr.push(response.data);
						$scope.successMsg ="SurveyAdded successfully";
					}
					$scope.addSurveyFlag = false;
					$scope.show = 0;
					
				}, function(errResponse) {
					console.error('Error while creating Survey');
				});
	}
	
	function getAllTasks($http,surveyid){
		var response = $http
		.post('http://'+url+'/feedback.com/getTasks/'+surveyid).then(
				function(response) {
					console.log("response in gettask "+response.data.length);
					$scope.taskArr = [];
					if(response.data.length > 0){
						for(var i=0;i<response.data.length;i++){
							$scope.taskArr.push(response.data[i]);
						}
					}
				}, function(errResponse) {
					console.error('Error while getting Task');
				});
	}
	function getAllQuestions($http,surveyid){
		var response = $http
		.post('http://'+url+'/feedback.com/getQuestions/'+surveyid).then(
				function(response) {
					$scope.questionArr = [];
					if(response.data.length > 0){
						$scope.questionArr = [];
						for(var i=0;i<response.data.length;i++)
							$scope.questionArr.push(response.data[i]);
					}
				}, function(errResponse) {
					console.error('Error while getting question');
				});
	}
	
	$scope.deleteTask = function(taskid){
		var response = $http
		.post('http://'+url+'/feedback.com/deleteTask/'+taskid).then(
				function(response) {
					if(response){
						$('#taskDetail'+taskid).remove();
					}
				}, function(errResponse) {
					console.error('Error while deleting task');
				});
	}
	$scope.deleteQuestion = function(questionid){
		var response = $http
		.post('http://'+url+'/feedback.com/deleteQuestion/'+questionid).then(
				function(response) {
					if(response){
						$('#quesDetail'+questionid).remove();
					}
				}, function(errResponse) {
					console.error('Error while deleting question');
				});
	}
	
	$scope.editTask = function(taskid){
		var task = {
			"taskid" : taskid
		}
		var response = $http.post('http://'+url+'/feedback.com/getTask',task).then(
				function(response) {
					$scope.taskData = {
						taskname: response.data.taskname,
						senario: response.data.senario,
						starturl: response.data.starturl,
						taskid:response.data.taskid
					}
					$scope.addSurveyFlag = true;
					$scope.usrSurverValue=2;
					$scope.setp1Flag = false;
					$scope.setp2Flag = true;
					$scope.setp3Flag = false;
					$scope.setp4Flag = false;
					$scope.showTaskData = true;
				}, function(errResponse) {
					console.error('Error while getting task details for editing purpose : '+errResponse.data);
				});
	}
	$scope.updateTask = function(taskData){
		$scope.inserttask = false;
		$scope.save2 = false;
		$scope.insertquestion= false;
		if(taskData){
			
			var task = {
				"taskname" : taskData.taskname,
				"senario" : taskData.senario,
				"starturl" : taskData.starturl,
				"taskid" : taskData.taskid
			};
			var response = $http
			.post('http://'+url+'/feedback.com/updateTask', task).then(
					function(response) {
						if(response){
							var newTask =  [];
							angular.forEach($scope.taskArr, function(taskObj) {
						        if(taskObj.taskid != task.taskid) {
						        	newTask.push(taskObj)
						        }
						    });
							$scope.taskArr = newTask;
							console.log("task length after: "+$scope.taskArr.length+"   "+newTask.length);
						    if($scope.taskArr.length == 0) {
						        $scope.isEmpty = true;
						    };
							$scope.taskArr.push(response.data);
							$scope.showTaskData = false;
							$scope.inserttask = true;
							$scope.save2 = true;
						}
					}, function(errResponse) {
						console.error('Error while creating Task');
					});
		}
		
	}
	
	$scope.editCancel = function(){
		$scope.showTaskData = false;
		$scope.showquesData = false;
	}
	
	$scope.editQuestion = function(questionid){
		var question = {
			"questionid" : questionid
		}
		var response = $http.post('http://'+url+'/feedback.com/getQuestion',question).then(
				function(response) {
					$scope.questionData = {
						questionname: response.data.questionname,
						answers: response.data.answers,
						questionid:response.data.questionid
					}
					$scope.addSurveyFlag = true;
					$scope.usrSurverValue=2;
					$scope.setp1Flag = false;
					$scope.setp2Flag = true;
					$scope.setp3Flag = false;
					$scope.setp4Flag = false;
					$scope.showquesData = true;
					
				}, function(errResponse) {
					console.error('Error while getting question details for editing purpose : '+errResponse.data);
				});
	}
	$scope.updateQuestion = function(questionData){
		$scope.inserttask = false;
		$scope.save2 = false;
		$scope.insertquestion= false;
		if(questionData){
			
			var question = {
					"questionname" : questionData.questionname,
					"answers" : questionData.answers,
					"questionid" : questionData.questionid
				};
			var response = $http
			.post('http://'+url+'/feedback.com/updateQuestion', question).then(
					function(response) {
						if(response){
							var newQues =  [];
							angular.forEach($scope.questionArr, function(quesObj) {
						        if(quesObj.questionid != question.questionid) {
						        	newQues.push(quesObj)
						        }
						    });
							$scope.questionArr = newQues;
						    if($scope.questionArr.length == 0) {
						        $scope.isEmpty = true;
						    };
							$scope.questionArr.push(response.data);
							$scope.showquesData = false;
							$scope.inserttask = true;
							$scope.insertquestion= true;
							$scope.save2 = true;
						}
					}, function(errResponse) {
						console.error('Error while creating Task');
					});
		}
		
	}
})



