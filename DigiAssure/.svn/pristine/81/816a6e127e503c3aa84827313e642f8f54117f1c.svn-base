<!DOCTYPE html>
<html data-ng-app="myApp">
<head>
<title>Form Validation</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/css/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/theme-default.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>
<script src="${pageContext.request.contextPath}/vendor/jquery/dist/jquery.js"></script>
<script src="${pageContext.request.contextPath}/vendor/angular/angular.js"></script>
<script src="${pageContext.request.contextPath}/vendor/angular/angular.min.js"></script>
<script src="${pageContext.request.contextPath}/vendor/angular-ui-router/release/angular-ui-router.js"></script>
<script src="${pageContext.request.contextPath}/vendor/angular-route/angular-route.js"></script>
<script src="${pageContext.request.contextPath}/vendor/angular-ui-bootstrap-bower/ui-bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/vendor/angular-ui-bootstrap-bower/ui-bootstrap-tpls.js"
	type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/vendor/bootstrap/dist/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/js/crowdsourcingcontroller.js" type="text/javascript"></script>

<style>
	.projectContainer{
		width:20%;
		height:200px;
		position:absolute;
		background-color: #ddd;
		border-radius:10px;
	}
	
	.projectTitle{
		width:100%;
		height:35%;
		background-color: #ddd;
		border-top-left-radius:10px;
		border-top-right-radius:10px;
		border-bottom: 1px solid #d5d5d5;
		padding:15px;
		font-size: 15px;
	}
	.projectBody{
		width:100%;
		height:50%;
		background-color: white;
		border-bottom: 1px solid #d5d5d5;
		padding-top: 20px;
	}
	.projectfooter{
		width:100%;
		height:15%;
		background-color: #ddd;
		border-bottom-left-radius:10px;
		border-bottom-right-radius:10px;
		padding-top: 10px;
	}
	
	ul.projectTiles li{
	    float: left;
	    width: 170px;
	    height: 230px;
	    border: 1px solid #e3e3e3;
	    border-radius: 10px;
	    box-sizing: border-box;
	    text-align: center;
	    position: relative;
	    margin-right: 10px;
	
	    margin-bottom: 10px;
	     list-style-type:none;
	}
	
	.newProject{
		width:100%;
		height:85%;
		background-color: white;
		border-bottom: 1px solid #d5d5d5;
		padding-top: 50px;
		padding-left: 15px;
	}

.stepwizard-step p {
	margin-top: 10px;
}

.stepwizard-row {
	display: table-row;
}

.stepwizard {
	display: table;
	width: 100%;
	position: relative;
}

.stepwizard-step button[disabled] {
	opacity: 1 !important;
	filter: alpha(opacity = 100) !important;
}

.stepwizard-row:before {
	top: 14px;
	bottom: 0;
	position: absolute;
	content: " ";
	width: 100%;
	height: 1px;
	background-color: #ccc;
	z-order: 0;
}

.stepwizard-step {
	display: table-cell;
	text-align: center;
	position: relative;
}

.btn-circle {
	width: 30px;
	height: 30px;
	text-align: center;
	padding: 6px 0;
	font-size: 12px;
	line-height: 1.428571429;
	border-radius: 15px;
}
</style>
</head>


<body>

	<div data-ng-controller="MyController" data-ng-init="getSurveyDetails(${projectid})"> 
		
		<div class="container" data-ng-if="!addSurveyFlag">
		<div class="row col-sm-12">
			<div class="col-sm-1"></div>
			<div class="col-sm-10">
				<div class="marginTop50px"></div>
				
				<div id="newSurveyForm" data-ng-show="show == 1">
				<!-- <div id="newSurveyForm"> -->
				<form name="frm" class="form-horizontal" >
					<div class="form-group">
						<label class="control-label col-sm-4">User Survey Name </label> 
						<div class="col-sm-4">
							<input type="text" required="required" class="form-control" 
							name="surveyName" data-ng-model="surveyname" />
							<span data-ng-init="userid = ${userid}"></span> <span
									data-ng-init="projectid = ${projectid}"></span>
						</div>
						
					</div>
					<input type="submit" class="btn btn-primary col-sm-2 col-sm-offset-4" value="Create User Survey" data-ng-click="submit(surveyname, userid, projectid)"/>
				</form>
				</div>
				
				<div class="marginTop50px"></div>
				
				<h2>Users Survey Detail</h2>
				
				<span>{{deleteMessage}}</span><br>
				<span>{{successMsg}}</span><br>
				<div>
					<br/>
					<ul class="projectTiles">
					<li ><div class='newProject'><button class='btn btn-default' data-ng-click='showForm()'><span class='glyphicon glyphicon-plus'></span></button><h3>create New Survey</h3></div><div class='projectfooter'></div></li>
					</ul>
					<ul class="projectTiles" data-ng-repeat="survey in surveyArr">
					
					<li id="{{survey.surveyid}}">
						<!-- <div class='projectTitle' id='projectTitle'><b>{{survey.surveyname}}</b><a href="" data-ng-click="isSubscribed ? toggleDiv(survey.surveyid) : showsurvey(survey.surveyid)" id='change{{survey.surveyid}}'><span class='glyphicon glyphicon-certificate pull-right'></span></a></div> -->
						<div class='projectTitle' id='projectTitle'><b>{{survey.surveyname}}</b>
							<a href="" data-ng-click="toggle(survey.surveyid, $index)" id='change{{survey.surveyid}}'>
								<span class='glyphicon glyphicon-certificate pull-right'></span>
							</a>
						</div>
						<div  class='projectBody'>
							<div id='surveyDetails{{survey.surveyid}}' data-ng-if="editValueIndex !== $index || editValueIndex===''">
								<b>Total User :</b>{{survey.totalusers}}<br>
								<b>Created On :</b>{{survey.creationtime}}
							</div>
							
							<div id='editsurvey{{survey.surveyid}}' data-ng-if="(editValueIndex===$index)">
								<!-- <a href='#' data-ng-click='deleteSurvey(survey.surveyid)'>Delete</a><br><br>
								<a href='#' data-ng-click='editSurvey(survey.surveyid)'>Edit</a><br><br> -->
								<input type="submit" class="btn" value="Delete" data-ng-click="deleteSurvey(survey.surveyid)"/><br><br>
								<input type="submit" class="btn" value="Edit" data-ng-click="editSurvey(survey.surveyid)"/><br>
							</div>
						</div>
						<div class='projectfooter'><a href="" data-ng-click="getReport(survey.surveyid)">VIEW REPORT</a></div>
					</li>
					</ul>
				</div>	
			</div>
			<div class="col-sm-1"></div>
		</div>
	</div>
	
	
	<div data-ng-if="addSurveyFlag">
		<div class="container">
		<div class="row col-sm-12">
			<div class="col-sm-2"></div>
			<div class="col-sm-8">
				<div class="marginTop50px"></div>
				<button class="btn btn-primary accessibilityNavMenu  pull-right" style="margin-right: -115px;margin-top: -30px;" data-ng-click="goBack()">Back</button>
				<div class="stepwizard">
					<div class="stepwizard-row setup-panel">
						<div class="stepwizard-step">
							<a href="" type="button" data-ng-click="step1(1)"
							 	data-ng-class="(usrSurverValue==1) ? 'btn btn-primary btn-circle' : 'btn btn-default btn-circle'"
								id="step1">1</a>
							<p>User Survey Details</p>
						</div>
						<div class="stepwizard-step">
							<a href='' type="button" data-ng-click="step2(2)"
							data-ng-class="(usrSurverValue==2) ? 'btn btn-primary btn-circle' : 'btn btn-default btn-circle'"
								 id="step2">2</a>
							<p>Task & Questions</p>
						</div>
						<div class="stepwizard-step">
							<a href="" type="button" data-ng-click="step3(3)"
								data-ng-class="(usrSurverValue==3) ? 'btn btn-primary btn-circle' : 'btn btn-default btn-circle'" 
								id="step3">3</a>
							<p>Invite Participants</p>
						</div>
						<div class="stepwizard-step">
							<a href="" type="button" data-ng-click="step4(4)"
								data-ng-class="(usrSurverValue==4) ? 'btn btn-primary btn-circle' : 'btn btn-default btn-circle'" 
								id="step4">4</a>
							<p>Launch</p>
						</div>
					</div>
				</div>
				<div class="marginTop50px"></div>



				<div >
					<form role="form" name="form" id="form">

						<div data-ng-show="setp1Flag" class="row setup-content" id="step-1">
							<div class="col-xs-12">
								<div class="col-md-12">
									<h3>Step 1:User Test Details</h3>
									<hr style="border-color: #337ab7;">
									<div class="form-group">
										<label class="control-label"> Survey title</label> <input
											type="text" required="required" class="form-control"
											 data-ng-model="userTestDetail.surveyName"  />
									</div>
									<div class="form-group">
										<label class="control-label">Participant introduction
											text</label>
										<textarea class="form-control" cols="40" rows="6"
											name="introText" data-ng-model="userTestDetail.introduction" ></textarea>
									</div>

									<!-- Save and navigate to area 2 -->
									<button class="btn btn-primary btn-sm pull-right"
										type="button" data-ng-click="userTestDetail1(userTestDetail)">Save & Continue</button>
								</div>
							</div>
						</div>

						<div data-ng-show="setp2Flag" class="row setup-content" id="step-2">
							<div class="col-xs-12">
								<div class="col-md-12">
									<h3>Step 2: Tasks & Questions</h3>
									<hr style="border-color: #337ab7;">
									<div data-ng-repeat="task in taskArr">
										<div class='panel panel-info' style='padding:5px;' id='taskDetail{{task.taskid}}'>
											<b>Task Name : </b> {{task.taskname}}
											<br><b>Task Scenario : </b>{{task.senario}}
											<button class='btn btn-info pull-right'  style='margin-left:5px;margin-right:5px;'>Display Task</button>
											<button class='btn btn-info pull-right' style='margin-left:5px;' data-ng-click="deleteTask(task.taskid)">Delete</button>
											<button class='btn btn-info pull-right' style='margin-left:5px;' data-ng-click="editTask(task.taskid)">Edit</button>
										</div>
									</div>
									<!-- <div data-ng-repeat="question in questionArr.questionArr track by (ques.questionid + $index)"> -->
									<div data-ng-repeat="question in questionArr">
										<div class='panel panel-info' style='padding:5px;' id='quesDetail{{question.questionid}}'>
											<b>Question Name : </b> {{question.questionname}}
											<br><b data-ng-if="{{question.answers}}">Answers : </b>{{question.answers}}
											<button class='btn btn-info pull-right'  style='margin-left:5px;margin-right:5px;'>Display Question</button>
											<button class='btn btn-info pull-right' style='margin-left:5px;' data-ng-click="deleteQuestion(question.questionid)">Delete</button>
											<button class='btn btn-info pull-right' style='margin-left:5px;' data-ng-click="editQuestion(question.questionid)">Edit</button>
										</div>
									</div>
									<div id="taskdiv" data-ng-show="showTask">
										<div data-ng-init="start()">
											<h4>Create Task</h4>
											<form name="toolForm" role="toolForm" id="toolForm">
												<div class="form-group">
													<label class="control-label">Task name</label> <input
														type="text" class="form-control" name="taskName"
														data-ng-model="task.taskname"/>
												</div>
												<div class="form-group">
													<label class="control-label">Task Scenario</label>
													<textarea class="form-control" cols="40" rows="8"
														name="taskSenario" data-ng-model="task.senario" placeholder="For example: [scenario1,scenario2...]"></textarea>
												</div>
												<div class="form-group">
													<label class="control-label">Start URL/Application</label> <input
														type="text" class="form-control" name="startURL"
														data-ng-model="task.starturl"/>
												</div>

												<div class="pull-right">
												<button class="btn btn-primary nextBtn btn-sm" type="button" data-ng-click="taskQuesDetail()">Save & Continue</button>
													<button class="btn btn-primary btn-sm cancelBtn" type="button" data-ng-click="cancel()">Cancel</button>
													<input class="btn btn-primary btn-sm" type="submit" id="create_task_btn"
														value="Add New Task" data-ng-click="taskSubmit(task)"
														form="toolForm">
												</div>
												<div class="marginTop50px"></div>
											</form>
										</div>
									</div>
									<div id="editTaskdiv" data-ng-show="showTaskData">
											<form name="taskForm" role="taskForm" id="taskForm">
												<div class="form-group">
													<label class="control-label">Task name</label> <input
														type="text" class="form-control" name="taskName"
														data-ng-model="taskData.taskname"/>
												</div>
												<div class="form-group">
													<label class="control-label">Task Scenario</label>
													<textarea class="form-control" cols="40" rows="8"
														name="taskSenario" data-ng-model="taskData.senario"></textarea>
												</div>
												<div class="form-group">
													<label class="control-label">Start URL/Application</label> <input
														type="text" class="form-control" name="startURL"
														data-ng-model="taskData.starturl"/>
												</div>
												<div class="form-group">
													<input type="hidden" class="form-control" name="taskid"
														data-ng-model="taskData.taskid"/>
												</div>
												<div class="pull-right">
												<button class="btn btn-primary btn-sm cancelBtn" type="button" data-ng-click="editCancel()">Cancel</button>
													<input class="btn btn-primary btn-sm" type="submit" id="create_task_btn"
														value="Edit Task" data-ng-click="updateTask(taskData)"
														form="taskForm">
												</div>
												<div class="marginTop50px"></div>
											</form>
									</div>

									<!-- Creating Task Ends-->
									<!-- start creating questions -->
									<div>
											<div id="quesdiv" data-ng-show="showques">
												<h4>Create Question</h4>
												<form name="questionForm" id="questionForm"
													role="questionForm">
												<div class="form-group">
													<label class="control-label">Question type</label> <select
														name="questionType" data-ng-model="question.type" required="required" data-ng-change="">
														<option value="Radio">Multiple choice-1
															answer(Radio Button)</option>
														<option value="CheckBox">Multiple Check Box
															question ? (Check Box)</option>
														<!-- <option value="radio">Single choice text Answer</option> -->
													</select> <input type="button" class="btn btn-primary btn-sm"
														type="button" value="Continue" id="display_question_form" data-ng-click="showQues()">
												</div>
												<div id="quesForm" data-ng-show="showQuesFlag">
													<div class="form-group">
														<label class="control-label">Multiple choice
															question</label>
														<textarea class="form-control" cols="40" rows="6"
														  data-ng-model="question.questionname" name="questionname"></textarea>
													</div>
													<div class="form-group">
														<label class="control-label">Multiple choice
															answers (Enter options in comma separated)</label>
														<textarea class="form-control" cols="40" rows="6" 
															  data-ng-model="question.answers" name="answers" >
															  </textarea>
													</div>

													<div class="marginTop50px"></div>
												</div>

												<div class="pull-right">
													<button class="btn btn-primary nextBtn btn-sm"
															type="button" data-ng-click="taskQuesDetail()">Save & Continue</button>
													<button class="btn btn-primary btn-sm cancelBtn" type="button" data-ng-click="cancel()">Cancel</button>
													<input class="btn btn-primary btn-sm" type="submit"
														id="create_ques_btn" data-ng-click="questionSubmit(question)"
														value="Add New Question" >
												</div>
												<div class="marginTop50px"></div>
												</form>
											</div>
										</div>
											<div id="editQuesdiv" data-ng-show="showquesData">
												<form name="questionForm" id="questionForm"
													role="questionForm">
													<div class="form-group">
														<label class="control-label">Multiple choice
															question</label>
														<textarea class="form-control" cols="40" rows="6"
														  data-ng-model="questionData.questionname" name="questionname"></textarea>
													</div>
													<div class="form-group">
														<label class="control-label">Multiple choice
															answers (Enter options in comma separated)</label>
														<textarea class="form-control" cols="40" rows="6" 
															  data-ng-model="questionData.answers" name="answers" >
															  </textarea>
													</div>
													<div class="form-group">
													<input type="hidden" class="form-control" name="questionid"
														data-ng-model="questionData.questionid"/>
												</div>
													<div class="marginTop50px"></div>

												<div class="pull-right">
													<button class="btn btn-primary btn-sm cancelBtn" type="button" data-ng-click="editCancel()">Cancel</button>
													<input class="btn btn-primary btn-sm" type="submit"
														id="create_ques_btn" data-ng-click="updateQuestion(questionData)"
														value="Edit Question" >
												</div>
												<div class="marginTop50px"></div>
												</form>
											</div>
									<!-- End of creating questions -->	
									<a ng-href="" data-ng-click="showTaskdiv()" id="task" data-ng-show="inserttask" style="font-size: 14px;">Insert Task</a>&nbsp;&nbsp;<a ng-href="" data-ng-click="showquesdiv()" data-ng-show="insertquestion" id="question" style="font-size: 14px;">Insert
										Question</a>
									<button class="btn btn-primary nextBtn btn-sm pull-right" data-ng-show="save2"
										type="button" id="save2" data-ng-click="taskQuesDetail(task,question)">Save & Continue</button>
									<div class="marginTop50px"></div>
								</div>
							</div>
						</div>
						
						<div data-ng-show="setp3Flag" class="row setup-content" id="step-3">
							<div class="col-xs-12">
								<div class="col-md-12">
									<h3>Step 3: Invite Participants</h3>
									<hr style="border-color: #337ab7;">
									<div class="form-group">
										<label class="control-label">
											Enter Participant Email ID (Enter options in comma separated)</label>
										 <textarea class="form-control" name="linkForTest" rows="15"
											id="linkForTest" data-ng-model="participantDetail.targetemails" data-ng-bind="targetemails"></textarea> 
										<!-- <input type="text" class="form-control" name="targetemails"
														data-ng-model="targetemails" data-ng-bind="targetemails"/> -->
									</div>
									<div class="form-group">
										<label class="control-label">Participant thank you
											text:</label>
										<textarea class="form-control" cols="40" rows="6" name="thankyoutext"
											  data-ng-model="participantDetail.thankyoutext" data-ng-bind="thankyoutext"></textarea>
									</div>

									<button class="btn btn-primary nextBtn btn-sm pull-right"
										type="button" data-ng-click="inviteParticipants(participantDetail)">Save & Continue</button>
								</div>
							</div>
						</div>
						<div data-ng-show="setp4Flag" class="row setup-content" id="step-4">
							<div class="col-xs-12">
								<div class="col-md-12">
									<h3>Step 4: Launch</h3>
									<hr style="border-color: #337ab7;">

									<b>Launch user test</b>
									<ul>
										<li>Once your user test is launched, you will no longer
											have access to edit it.</li>
										<li>We recommend you preview or pilot your user test
											before launching.</li>
									</ul>

									<input class="btn btn-primary nextBtn btn-sm pull-right"
										type="submit" value="Confirm and Launch"
										data-ng-click="surveySubmit()" form="form">
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>

			<div class="col-sm-2">
				<%-- <div class="marginTop50px"></div>
				<a class="buttonlink" href="${pageContext.request.contextPath}/digitalQAService/crowdSourcing"><b><button class="btn btn-primary accessibilityNavMenu btn-sm">Home</button></b></a>
 --%>			</div>
		</div>
	</div>
	
	</div>
	</div>
	
</body>

</html>


