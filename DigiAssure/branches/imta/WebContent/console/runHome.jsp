<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../DigiChatBot.jsp"%>

<!DOCTYPE html>
<html>
<head>
<title>Runs</title>
<link rel="stylesheet" href="../styles/css/bootstrap.css">
<link rel="stylesheet" href="../styles/css/main.css">
<link rel="stylesheet" href="../styles/css/digi.css">
<link
	href="https://fortawesome.github.io/Font-Awesome/assets/font-awesome/css/font-awesome.css"
	rel="stylesheet">
<!-- here -->
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
<script type="text/javascript">
	function speak(msg) {
		var msg = new SpeechSynthesisUtterance(msg);
		window.speechSynthesis.speak(msg);
	}

	function commandExecute() {
		var a = getContextPath();
		if ('webkitSpeechRecognition' in window) {
			var speechRecognizer = new webkitSpeechRecognition();
			speechRecognizer.continuous = true;
			speechRecognizer.interimResults = true;
			speechRecognizer.lang = 'en-IN';
			speechRecognizer.start();

			var finalTranscripts = '';

			speechRecognizer.onresult = function(event) {
				var interimTranscripts = '';
				for (var i = event.resultIndex; i < event.results.length; i++) {
					var transcript = event.results[i][0].transcript;
					transcript.replace("\n", "<br>");
					if (event.results[i].isFinal) {
						finalTranscripts += transcript;
					} else {
						interimTranscripts += transcript;
					}
				}
				$("#speakResult").empty();
				$("#speakResult").append(interimTranscripts);
				var basicRun = '${runNames}';
				var runs = basicRun.split("[")[1];
				var runs1 = runs.split("]")[0];
				var runs2 = runs.split("]")[0].toLowerCase();
				var runs = runs2.split(", ");
				var finalRuns = runs1.split(", ");

				if (interimTranscripts.toLowerCase().includes("trigger")) {
					var index = runs.indexOf(interimTranscripts.toLowerCase()
							.split("trigger")[1].trim());
					if (index > -1) {
						window.location.href = a
								+ '/console/triggerRun?runName='
								+ finalRuns[index].trim()
								+ '&toolName=${toolName}';
					}
				} else if (interimTranscripts.toLowerCase().includes("delete")) {
					var index = runs.indexOf(interimTranscripts.toLowerCase()
							.split("delete")[1].trim());
					if (index > -1) {

						var fullRun = document.getElementById("runsTable").rows[index + 1].cells[0].innerHTML;

						var runid = fullRun.split("runs=")[1].split("\">")[0];

						window.location.href = a + '/console/deleteRun?runid='
								+ runid + '&toolName=${toolName}';
					}
				} else if (interimTranscripts.toLowerCase()
						.includes("download")) {
					var index = runs.indexOf(interimTranscripts.toLowerCase()
							.split("download")[1].trim().split("report")[0]
							.trim());
					if (index > -1) {

						var runHome = document.getElementById("runsTable").rows[index + 1].cells[3].innerHTML;

						window.location.href = a
								+ '/console/getReport?runHome=' + runHome;
					}
				}
			};
			speechRecognizer.onerror = function(event) {
			};
		} else {
			alert('Your browser is not supported. If google chrome, please upgrade!');
		}
	}

	$(document).ready(function() {
		refresher();
	});

	function refresher() {
		if (document.getElementById("runsTable") != null) {

			var data = {
				'runNames' : '${runNames}'
			};
			$
					.get(
							'../console/jenkinsrunStatus',
							data,
							function(result) {
								var rowCount = document
										.getElementById("runsTable").rows.length;
								for (key in result) {

									for (var index = 1; index<rowCount && rowCount>0; index++) {
										var fullRun = document
												.getElementById("runsTable").rows[index].cells[0].innerHTML;
										var run = fullRun.split("\">")[1];
										run = run.split("</a>")[0];
										if (run == key) {

											var runHome = document
													.getElementById("runsTable").rows[index].cells[3].innerHTML;
											var runid = fullRun.split("runId=")[1];
											runid = runid.split("&")[0];
											document
													.getElementById("runsTable").rows[index].cells[1].innerHTML = result[key];

											var insideText = "<a href=\"./triggerRun?runName="
													+ key
													+ "&toolName=${toolName}\"><button type=\"button\"class=\"btn btn-success\"><span class=\"glyphicon glyphicon-play\"></span></button></a>";
											document
													.getElementById("runsTable").rows[index].cells[4].innerHTML = insideText;

											insideText = "<a href=\"./getReport?runHome="
													+ runHome
													+ "\"><button type=\"button\"class=\"btn btn-primary\"><span class=\"glyphicon glyphicon-download-alt\"></span></button></a>";
											document
													.getElementById("runsTable").rows[index].cells[5].innerHTML = insideText;

											insideText = "<a href=\"./deleteRun?runid="
													+ runid
													+ "&toolName=${toolName}\"><button type=\"button\"class=\"btn btn-danger\"><span class=\"glyphicon glyphicon-trash\"></span></button></a>";
											document
													.getElementById("runsTable").rows[index].cells[6].innerHTML = insideText;

											break;
										}
									}

								}

								setTimeout(refresher, 5000);

							}, "json");
		}

	}
</script>

</head>
<body>


	<!-- Header and Navigation Bar -->

	<jsp:include page="../common/logo.jsp"></jsp:include>
	<div class="marginTop15px"></div>

	<div class="container">
		<div class="row">
			<div class="col-sm-12 col-md-12">
				<div class="marginTop65px"></div>

				<h1 class="greyTextColor">

					<a onclick="return viewInfo('${toolName}')"><button
							class="btn btn-primary " id="help">Help</button></a> ${toolName} ::
					Runs <a href='./newRun?toolName=${toolName}'><button
							type="button" class="btn btn-primary" id="addRun"
							title="Add New Run">
							Add new run <span class="glyphicon glyphicon-plus"></span>
						</button> </a> <a href="getFramework?toolName=${toolName}"><button
							type="button" class="btn btn-primary pull-right"
							title="Download framework">
							Download<span class="glyphicon glyphicon-download-alt"></span>
						</button> </a> <a href="#">
						<button type="button" onclick="commandExecute();"
							class="btn btn-primary pull-right" id="speak">
							<i class="fa fa-microphone" aria-hidden="true"></i>
						</button>
					</a> <span id="speakResult"></span>
				</h1>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-sm-8 col-sm-offset-2">
				<div class="marginTop15px"></div>
				<c:if test="${not empty successRun}">
					<div class="alert alert-success alert-dismissible" role="alert">
						<button type="button" class="close" data-dismiss="alert">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<strong>Success</strong> ${successRun}
						<script>
							speak('${successRun }')
						</script>
					</div>
					<br>
				</c:if>

				<c:if test="${not empty triggerMessage}">
					<div class="alert alert-success alert-dismissible" role="alert">
						<button type="button" class="close" data-dismiss="alert">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<strong>Success!</strong> ${triggerMessage}
						<script>
							speak('${triggerMessage }')
						</script>
					</div>
					<br>
				</c:if>

				<c:if test="${not empty deleteMessage}">
					<div class="alert alert-success alert-dismissible" role="alert">
						<button type="button" class="close" data-dismiss="alert">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<strong>Success!</strong> ${deleteMessage}
						<script>
							speak('${deleteMessage }')
						</script>
					</div>
					<br>
				</c:if>

				<c:if test="${ empty runs}">
					<div class="alert alert-info alert-dismissible" role="alert">
						<button type="button" class="close" data-dismiss="alert">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<strong>Info!</strong> No Runs Scheduled ...
					</div>
					<br>
				</c:if>

				<c:if test="${not empty errorMessage}">
					<div class="alert alert-danger alert-dismissible" role="alert">
						<button type="button" class="close" data-dismiss="alert">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<strong>Error!</strong> ${errorMessage}
						<script>
							speak('${errorMessage}')
						</script>
					</div>
					<br>
				</c:if>
			</div>
		</div>
	</div>


	<div class="container">
		<div class="row">
			<div class="col-sm-12 col-md-12">
				<div class="marginTop50px">

					<c:if test="${ not empty runs}">

						<table class="table table-striped table-bordered" id="runsTable">
							<tr class="first">
								<th class="first">Run Name</th>
								<th>Status</th>
								<th>Build Name</th>
								<th>Run Home</th>
								<th>Trigger</th>
								<th>Report</th>
								<th class="last">Delete</th>
							</tr>
							<c:forEach var="run" items="${runs}">

								<tr class="last">
									<td class="first"><a
										href="./editRun?runId=${run.runid}&toolName=${toolName}&runName=${run.runName}">${run.runName}</a></td>
									<td>${run.scheduledStatus}</td>
									<td>${run.buildName}</td>
									<td>${run.runHome}</td>

									<%-- <c:if
												test="${run.scheduledStatus == 'Pending' || run.scheduledStatus == 'DonotRun' || run.scheduledStatus == 'FAILURE' || run.scheduledStatus == 'SUCCESS'}"> --%>
									<td><a
										href="./triggerRun?runName=${run.runName }&toolName=${toolName}"><button
												type="button" class="btn btn-success">
												<span class="glyphicon glyphicon-play"></span>
											</button></a></td>
									<%-- </c:if>
											<c:if
												test="${run.scheduledStatus == 'FAILURE' || run.scheduledStatus == 'SUCCESS' || run.scheduledStatus =='Jenkins Offline'}"> --%>
									<td><a href="./getReport?runHome=${run.runHome}"><button
												type="button" class="btn btn-primary">
												<span class="glyphicon glyphicon-download-alt"></span>
											</button></a></td>
									<%-- 											</c:if> --%>
									<%-- 											<c:if --%>
									<%-- 												test="${run.scheduledStatus == 'Pending' || run.scheduledStatus== 'FAILURE' || run.scheduledStatus =='Jenkins Offline'}"> --%>
									<td><a
										href='./deleteRun?runid=${run.runid}&toolName=${toolName}'><button
												type="button" class="btn btn-danger">
												<span class="glyphicon glyphicon-trash"></span>
											</button></a></td>
									<%-- 											</c:if> --%>
								</tr>
							</c:forEach>
						</table>
					</c:if>
					<div class="marginTop15px"></div>
				</div>
			</div>
		</div>
	</div>
	<div class="consoleMargin">
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</div>
</body>
</html>