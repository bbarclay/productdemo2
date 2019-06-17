<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html data-ng-app="myApp">
<head>
<title>Report</title>
<link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.9/themes/base/jquery-ui.css" type="text/css" media="all" /> 
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.5.min.js" type="text/javascript"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.9/jquery-ui.min.js" type="text/javascript"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/css/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/theme-default.css">
<link rel="stylesheet" type="text/css" 	href="${pageContext.request.contextPath}/css/screen.css">

<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>
<script src="${pageContext.request.contextPath}/vendor/jquery/dist/jquery.js"></script>
<script src="${pageContext.request.contextPath}/vendor/angular/angular.js"></script>
<script src="${pageContext.request.contextPath}/vendor/angular/angular.min.js"></script>
<script src="${pageContext.request.contextPath}/vendor/angular-ui-router/release/angular-ui-router.js"></script>
<script src="${pageContext.request.contextPath}/vendor/angular-route/angular-route.js"></script>
<script src="${pageContext.request.contextPath}/vendor/angular-ui-bootstrap-bower/ui-bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/vendor/angular-ui-bootstrap-bower/ui-bootstrap-tpls.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/vendor/bootstrap/dist/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/js/crowdsourcingcontroller.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/highchart.js"></script>
<script src="${pageContext.request.contextPath}/js/exporting.js"></script>
<style>
h3 {
    word-wrap: break-word;
    font-size: 1.4em;
    color: #999;
    border-bottom: 1px #4dbdeb solid;
    width: 99%;
    margin-bottom: .5em;
    padding-bottom: 0.2em;
} 
table.chartBar .total 
{
 padding-left: 3%;
  padding-right: 0%;
  text-align:center;
  width: -1px;
 }
 table.chartBar .response {
    width: 45%;
    }
    #recent{
    height: 10px;
    padding: 0;
    font-size: 10px;
    color: black;
    padding-left: 0px;
    text-align: center;
    background: #6ec5a1;;
    }
   .resd {
    float: right;
    padding-right: 137px;
    margin-top: -2px;
    font-size: 10px;
    margin-right: auto;
}
 

</style>

</head>
<body>

<div data-ng-controller="OverallController">
		<div class="row">
			<div class="col-md-12 col-lg-12 marginTop15px">
				<ul class="nav nav-tabs marginLeft15px">
					<li class="active"><a data-ng-click="changeNav(1)"
						style="background-color: #f3f3f3" data-toggle="tab" id="step1"><b><button
									class="btn accessibilityNavMenu">Dashboard</button></b></a></li>
					<li><a data-ng-click="changeNav(2)" data-toggle="tab"
						id="step2"><b><button class="btn accessibilityNavMenu">Task
								</button></b></a></li>
					<li><a data-ng-click="changeNav(3)" data-toggle="tab"
						id="step3"><b><button class="btn accessibilityNavMenu">Questions
								</button></b></a></li>
				</ul>
			</div>
		</div>

	<div class="tab-content">
		<div class="container">
            
			<div id="overall" class="tab-pane active" data-ng-if="dashboardFlag" data-ng-init="name()">
				<div class="row col-sm-12">
					<div class="col-sm-2"></div>
						<div class="col-sm-8">
							<div class="marginTop50px"></div>
							 	<button class="btn btn-primary accessibilityNavMenu  pull-right" style="margin-right: -115px;margin-top: -30px;" data-ng-click="goBack()">Back</button>
						<div data-ng-repeat="values in tempDAta.data">
								<h3 class="addRunHeading greyTextColor marginTop15px">Dashboard-{{values.surveyname}}</h3>
							<div class="col-sm-3" style="margin-top: 75px; padding-left: 50px">
								<div id="myProgress" style="background: #f5f5f5 url('${pageContext.request.contextPath}/img/bg.png');">
										<p>
											<b style="color: black;">&#9632 </b>Total Users:{{values.total}}
										</p>
										<br>
										<p>
											<b style="color: #4dbded;">&#9632 </b> Participants:{{values.participant}}
										</p>
										<br>
										<p>
											<b style="color: #ed8b1b;">&#9632 </b>Non-Participants:{{values.non_participants}}
										</p>
										<br>
										<p>
											<b style="color: #767676;">&#9632 </b> Abundant:
											{{values.abandant}}
										</p>
								</div>
							</div>
							</div>
							<div class="col-sm-6">
								<div id="container" style="min-width: 310px; height: 400px; max-width: 600px; margin: 0 auto"></div>
							</div>
						</div>
						<div class="col-sm-2"></div>
					</div>
			</div>
				
			<div id="task" class="tab-pane active" data-ng-if="taskFlag">
           		<div class="container">
                	<div class="row col-sm-12">
                    	<div class="col-sm-2"></div>
    						<div class="col-sm-8">
    							<div class="marginTop50px"></div>
     								<button class="btn btn-primary accessibilityNavMenu  pull-right" style="margin-right: -115px;margin-top: -30px;" data-ng-click="goBack()">Back</button>
    		<div data-ng-show="showtask">
   				 <h3 class="addRunHeading greyTextColor marginTop15px">Tasks</h3>
    			<div class="here" style="background-color: #fff;color:#000;font-size: 10px;" id="taskList"></div>
    				<div id="content" class="marginLeft15px"></div>
    		</div>
    		<div data-ng-show="taskalert">
     			<div class="alert alert-info alert-dismissible" role="alert">
					<button type="button" class="close" data-dismiss="alert">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
						<strong>Info!</strong> {{taskmessage}}
				</div>
			</div>
    					</div>
  					 </div>
   			 	</div>
			<div class="col-sm-2"></div>
    
  		 </div>
				
		<div id="question" class="tab-pane active" data-ng-if="questionFlag">
			<div class="row col-sm-12">
				<div class="col-sm-1"></div>
					<div class="col-sm-10">
						<div class="marginTop50px"></div>
							<button class="btn btn-primary accessibilityNavMenu  pull-right" style="margin-right: -115px;margin-top: -30px;" data-ng-click="goBack()" data-ng-show="overbck">Back</button>
					<div  data-ng-show="questionflag">
						<h3 class="addRunHeading greyTextColor marginTop15px" id="headding">Questions</h3>
							<br>
							<br>
						<div data-ng-repeat="arrr in arr">
							<h3> {{$index+1}}. {{arrr.questionname}} </h3>
              					<table class='chartBar' cellspacing='0' cellpadding='0' border='0' style="width: 70%;">
              					<tbody class="col"><tr class="col"><th class='col-sm-3 answer'><span >Answer</span></th>
              					<th class='response col-sm-6' style='padding-left: 20px;'><span >Response(%)</span></th><th class='total col-sm-3' style='padding-left: 80px;'><span >Response count</span></th></tr>
              					<tr><td class=' col-sm-3 answer'><a href='#' >
              						<div>
              						<div data-ng-repeat="result in arrr.ansarray">
              						<div><a href="#/overall" data-ng-click='showComments(result,arrr.questionid)'>{{result}}</a></div>
              						</div>
              						</div>
              					</a></td>
              					<td class='col-sm-6 response' style='padding-left: 30px;'>
	              					<div data-ng-repeat="percents in arrr.percentage track by $index">
	              						<div id='recent' style='width: {{percents}}%;float: left;' ></div><!-- <span style="font-size: 10px">{{percents}}%</span> -->
	              				 <span data-ng-show="percents <=88.4" style='display: inline;font-size: 10px;color: black;float: left;margin-top:-2px;'>{{percents}}%</span>
	              				 <span data-ng-show="percents >=88.4" style='display: inline;font-size: 10px;color: black;float: right;;margin-top:-2px;'>{{percents}}%</span>
	              				 <br>
	              					
	                                </div>
              					</td>
              					<td class='col-sm-3 total'style='padding-left: 81px;'>
              					<div data-ng-repeat="anscount in arrr.answercount track by $index">{{anscount}}</div>
              					</td>
              					</tr>
              					</tbody>
              					</table>
              					<br>
					</div>
				</div>
                	<div data-ng-show="questionalert">
                    	<h3 class="addRunHeading greyTextColor marginTop15px" id="headding">Questions</h3>
                       <div class="alert alert-info alert-dismissible" role="alert">
						<button type="button" class="close" data-dismiss="alert">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<strong>Info!</strong> {{questionmessage}}
					</div>
                       </div>
							<div class="marginTop50px"></div>
								<div class="question marginTop15px marginLeft15px" id="questions"></div>
									<button class="btn btn-primary accessibilityNavMenu  pull-right" data-ng-click="back()" data-ng-show="backbtn">Back</button>
										<div class="question marginTop15px marginLeft15px" id="comments" data-ng-show="comentsflag">
										</div>
						</div>
					<div class="col-sm-1"></div>
				</div>
			</div> 
		</div>
	</div>
</div>
</body>
</html>
