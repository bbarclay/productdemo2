function abcde() {

	hideOther('review');
	madeAjaxCall(function(appId) {
		drawGrapgs(appId);
	});

}

function drawGrapgs(appId){
	genGraph(appId);
	getPopularWords(appId);
	sentimentTimeline(appId);
	getCriticalWords(appId);
	topics(appId);
	getEmotions(appId); 
	reviews(appId);
}
function callDraw(appNameId){

	drawGrapgs(appNameId.split("_")[0])	;
}

function setAppName(appNameId){

	appName=appNameId.split("_")[1];
	var sentimentObj = document.getElementById("sentimentApp");
	var wordsObj = document.getElementById("wordsApp");
	var timelineObj = document.getElementById("timelineApp");
	var topicsObj = document.getElementById("topicsApp");
	var emotion = document.getElementById("emotionSpan");
	var review = document.getElementById("reviewSpan");

	sentimentObj.innerHTML=appName;
	wordsApp.innerHTML=appName;
	timelineObj.innerHTML=appName;
	topicsObj.innerHTML=appName;
	emotion.innerHTML=appName;
	review.innerHTML=appName;

	//drawGrapgs(appNameId.split("_")[0]);
}
function hideOther(divRemains){
	var allDivs=['sentiment','words','sentimentTimeline','topicsDiv','emotion','review'];

	for(key in allDivs){

		if(allDivs[key] == divRemains){
			document.getElementById(allDivs[key]).style.display = "block";
		}else{
			document.getElementById(allDivs[key]).style.display = "none";
		}
	}
	var id=divRemains+"Nav";
	var navMenus = ['sentimentNav','wordsNav','sentimentTimelineNav','topicsDivNav','emotionNav','reviewNav'];
	
	
	for(key in navMenus){
		var element = document.getElementById(navMenus[key]);
		
		if (element.classList.contains("active")) 
			element.classList.remove("active");
		if(navMenus[key] == id){
			var element = document.getElementById(id);
			element.classList.add("active");
		}
	}
}

function madeAjaxCall(callback) {
	$
	.ajax({
		type : "GET",
		url : "http://localhost:8080/digi/digitalQAService/userExperienceTesting/sentimentAnalysis",
	//	url : "${pageContext.request.contextPath}/digitalQAService/userExperienceTesting/sentimentAnalysis",
		contentType : "application/json; charset=utf-8",
		dataType : "json",
		success : function(data) {
			var appId="";
			var name = [];
			var id=[];
			var arrName = JSON.parse(JSON.stringify(data))["results"];
			for (var i = 0; i < arrName.length; i++) {
				if(i==0){
					appId=arrName[i]["id"];
				}
				name.push(arrName[i]["name"]);
				id.push(arrName[i]["id"]);
			}
			if (data) {
				var len = name.length;
				if (len > 0) {
					for (var i = 0; i < len; i++) {
						if(i==0){
							setAppName(id[i]+"_"+name[i]);

						}
						$("#shows")
						.append(
								"<option value="+id[i]+"_"+name[i]+">"
								+ name[i]
								+ "</option > ");

					}
				}
				callback(appId);
			}
		},
		error : function(jqXHR, textStatus, errorThrown) {
			alert('error: ' + textStatus + ': ' + errorThrown);
		}
	});
};

function genGraph(appId) {
	
	$.ajax({
		type : "GET",
		url : "http://localhost:8080/digi/digitalQAService/userExperienceTesting/sentimentAnalysis/sentimentBreakdown?appId="+appId,
	//	url : "${pageContext.request.contextPath}/digitalQAService/userExperienceTesting/sentimentAnalysis/sentimentBreakdown?appId="+appId,
		contentType : "application/json; charset=utf-8",
		dataType : "json",
		success : function(data) {

			negative = (data.results.negative);
			positive = (data.results.positive);
			neutral = (data.results.neutral);
			total= negative+positive+neutral;

			var chart = new CanvasJS.Chart("charContainer", {
				title: {
					text: " "
				},
				data: [{
					type: "column",
					dataPoints: [
					             { y: Number(Math.round(((positive/total)*100))), label: "Positive%" , color:"#9ACD32"},
					             { y: Math.round(((neutral/total)*100)), label: "Neutral%", color:"#FFD700" },
					             { y: Number(Math.round(((negative/total)*100))), label: "Negative%", color:"#FF0000"}
					             ]
				}]
			});
			chart.render();



		},
		error : function(jqXHR, textStatus, errorThrown) {
			alert('error: ' + textStatus + ': ' + errorThrown);
		}
	});
	//ajax call ends

}

function getPopularWords(appId) {
	$
	.ajax({
		type : "GET",
		url : "http://localhost:8080/digi/digitalQAService/userExperienceTesting/sentimentAnalysis/popularWords?appId="+appId,
		//url : "${pageContext.request.contextPath}/digitalQAService/userExperienceTesting/sentimentAnalysis/popularWords?appId="+appId,
		contentType : "application/json; charset=utf-8",
		dataType : "json",
		success : function(data) {

			var word = [];
			var counter = [];
			var positive = [];
			var negative = [];
			var neutral = [];
			var totalPercentage = [];
			var percentagePositive = [];
			var percentageNegative = [];
			var percentageNeutral = [];
			var wordArrName = JSON.parse(JSON
					.stringify(data))["results"];

			for (var i = 0; i < wordArrName.length; i++) {
				word.push(wordArrName[i]["word"]);
				counter
				.push(wordArrName[i]["counter"]);
				positive
				.push(wordArrName[i]["positive"]);
				negative
				.push(wordArrName[i]["negative"]);
				neutral
				.push(wordArrName[i]["neutral"]);
				totalPercentage[i] = (parseInt(wordArrName[i]["positive"])
						+ parseInt(wordArrName[i]["negative"]) + parseInt(wordArrName[i]["neutral"]));
				//alert(Number(Math.round((wordArrName[i]["positive"]/totalPercentage[i])*100)));
				percentagePositive
				.push(Number(Math
						.round((wordArrName[i]["positive"] / totalPercentage[i]) * 100)));
				percentageNegative
				.push(Number(Math
						.round((wordArrName[i]["negative"] / totalPercentage[i]) * 100)));
				percentageNeutral
				.push(Number(Math
						.round((wordArrName[i]["neutral"] / totalPercentage[i]) * 100)));
			}
			if (data) {
				var len = word.length;
				$("#popularWords").find("tr:gt(0)").remove();
				if (len > 0) {
					for (var i = 0; i < len; i++) {
						$("#popularWords")
						.append(
								"<tr class='last'> <td>"
								+ word[i]
								+ "</td> <td><div class='progress' data-toggle='tooltip' title='Positive: "
								+ percentagePositive[i]
								+ "%\nNeutral: "
								+ percentageNeutral[i]
								+ "%\nNegative: "
								+ percentageNegative[i]
								+ "%'><div class='progress-bar progress-bar-success' role='progressbar' style='width:"
								+ percentagePositive[i]
								+ "%'></div><div class='progress-bar progress-bar-warning' role='progressbar' style='width:"
								+ percentageNeutral[i]
								+ "%'></div><div class='progress-bar progress-bar-danger' role='progressbar' style='width:"
								+ percentageNegative[i]
								+ "%'></div></td> <td>"
								+ counter[i]
								+ "</td> <td>"
								+ negative[i]
								+ "</td> </tr>");
					}
				}
			}
		},
		error : function(jqXHR, textStatus,
				errorThrown) {
			alert('error: ' + textStatus + ': '
					+ errorThrown);
		}
	});
	return false;
};

function getCriticalWords(appId) {
	$
	.ajax({
		type : "GET",
		url : "http://localhost:8080/digi/digitalQAService/userExperienceTesting/sentimentAnalysis/critiaclWords?appId="+appId,
//		url : "${pageContext.request.contextPath}/digitalQAService/userExperienceTesting/sentimentAnalysis/critiaclWords?appId="+appId,
		contentType : "application/json; charset=utf-8",
		dataType : "json",
		success : function(data) {
			var word = [];
			var counter = [];
			var positive = [];
			var negative = [];
			var neutral = [];
			var totalPercentage = [];
			var percentagePositive = [];
			var percentageNegative = [];
			var percentageNeutral = [];
			var wordArrName = JSON.parse(JSON
					.stringify(data))["results"];
			for (var i = 0; i < wordArrName.length; i++) {
				word.push(wordArrName[i]["word"]);
				counter.push(wordArrName[i]["counter"]);
				positive.push(wordArrName[i]["positive"]);
				negative.push(wordArrName[i]["negative"]);
				neutral.push(wordArrName[i]["neutral"]);
				totalPercentage[i] = (parseInt(wordArrName[i]["positive"])
						+ parseInt(wordArrName[i]["negative"]) + parseInt(wordArrName[i]["neutral"]));
				//alert(Number(Math.round((wordArrName[i]["positive"]/totalPercentage[i])*100)));
				percentagePositive
				.push(Number(Math
						.round((wordArrName[i]["positive"] / totalPercentage[i]) * 100)));
				percentageNegative
				.push(Number(Math
						.round((wordArrName[i]["negative"] / totalPercentage[i]) * 100)));
				percentageNeutral
				.push(Number(Math
						.round((wordArrName[i]["neutral"] / totalPercentage[i]) * 100)));
			}
			if (data) {
				var len = word.length;
				$("#criticalWords").find("tr:gt(0)").remove();
				if (len > 0) {
					for (var i = 0; i < len; i++) {
						$("#criticalWords")
						.append(
								"<tr class='last'> <td> <a href='#' onclick='popup(\""+word[i]+"_"+appId+"\")' >"
								+ word[i]
								+ "</a></td> <td><div class='progress' data-toggle='tooltip' title='Positive: "
								+ percentagePositive[i]
								+ "%\nNeutral: "
								+ percentageNeutral[i]
								+ "%\nNegative: "
								+ percentageNegative[i]
								+ "%'><div class='progress-bar progress-bar-success' role='progressbar' style='width:"
								+ percentagePositive[i]
								+ "%'></div><div class='progress-bar progress-bar-warning' role='progressbar' style='width:"
								+ percentageNeutral[i]
								+ "%'></div><div class='progress-bar progress-bar-danger' role='progressbar' style='width:"
								+ percentageNegative[i]
								+ "%'></div></td> <td>"
								+ counter[i]
								+ "</td> <td>"
								+ negative[i]
								+ "</td>  </tr>");
					}
				}
			}
		},
		error : function(jqXHR, textStatus,
				errorThrown) {
			alert('error: ' + textStatus + ': '
					+ errorThrown);
		}
	});
	return false;
};

function popupDialog(dialog){
	$( function() {
		$( "#dialog" ).dialog();
	} );;
}

function sentimentTimeline(appId) {
	$
	.ajax({
		type : "GET",
		url : "http://localhost:8080/digi/digitalQAService/userExperienceTesting/sentimentAnalysis/sentimentTimeline?appId="+appId,
		//url : "${pageContext.request.contextPath}/digitalQAService/userExperienceTesting/sentimentAnalysis/sentimentTimeline?appId="+appId,
		contentType : "application/json; charset=utf-8",
		dataType : "json",
		success : function(data) {
			var date = [];
			var pos = [];
			var neg = [];
			var neu = [];

			var sentimentTimeline = JSON.parse(JSON
					.stringify(data))["results"];
			sentimentTimeline.sort(function(a,b) { 
				return new Date(a.published_at).getTime() - new Date(b.published_at).getTime() 
			});
			for (var i = 0; i < sentimentTimeline.length; i++) {
				date.push(sentimentTimeline[i]["published_at"]);
				pos.push(parseInt(sentimentTimeline[i]["positive"]));
				neg.push(parseInt(sentimentTimeline[i]["negative"]));
				neu.push(parseInt(sentimentTimeline[i]["neutral"]));
			}

			Highcharts
			.chart(
					'container',
					{
						chart : {
							type : 'column'
						},

						xAxis : {
							type : 'datetime',
							tickInterval : 3,
							labels:{
								rotation : -90
							},
							categories : date

						},
						yAxis : {
							min : 0,
							title : {
								text : ''
							},
							stackLabels : {
								enabled : false,
								style : {
									fontWeight : 'bold',
									color : (Highcharts.theme && Highcharts.theme.textColor)
									|| 'gray'
								}
							}
						},
						legend : {
							align : 'right',
							x : -30,
							verticalAlign : 'top',
							y : 25,
							floating : true,
							backgroundColor : (Highcharts.theme && Highcharts.theme.background2)
							|| 'white',
							borderColor : '#CCC',
							borderWidth : 1,
							shadow : false
						},
						tooltip : {
							headerFormat : '<b>{point.x}</b><br/>',
							pointFormat : '{series.name}: {point.y}<br/>Total: {point.stackTotal}'
						},
						plotOptions : {
							column : {
								stacking : 'normal',
								dataLabels : {
									enabled : false,
									color : (Highcharts.theme && Highcharts.theme.dataLabelsColor)
									|| 'white'
								}
							}
						},
						series : [
						          {
						        	  name : 'Positive',
						        	  color : "#9ACD32",
						        	  data : pos
						          },
						          {
						        	  name : 'Neutral',
						        	  color : "#FFD700",
						        	  data : neu
						          },
						          {
						        	  name : 'Negative',
						        	  color : "#FF0000",
						        	  data : neg
						          } ]
					});

		},
		error : function(jqXHR, textStatus,
				errorThrown) {
			alert('error: ' + textStatus + ': '
					+ errorThrown);
		}
	});
	return false;
};



function reviews(appId) {
	
	$.ajax({
		type : "GET",
		url : "http://localhost:8080/digi/digitalQAService/userExperienceTesting/sentimentAnalysis/reviews?appId="+appId,
		//url : "${pageContext.request.contextPath}/digitalQAService/userExperienceTesting/sentimentAnalysis/reviews?appId="+appId,
		contentType : "application/json; charset=utf-8",
		dataType : "json",
		success : function(data) {
			
			var array=data["all_time"];
			var count = array["count"];
			var average=array["average"];
			var breakdown = array["breakdown"];
			$("#myCountvalue").empty();
			$("#myAveragevalue").empty();
			$("#rating5").empty();
			$("#rating4").empty();
			$("#rating3").empty();
			$("#rating2").empty();
			$("#rating1").empty();

			$("#myCountvalue").append(count);
			$("#myAveragevalue").append(average);
			$("#rating5").append(breakdown["5"]);
			$("#rating4").append(breakdown["4"]);
			$("#rating3").append(breakdown["3"]);
			$("#rating2").append(breakdown["2"]);
			$("#rating1").append(breakdown["1"]);


		},
		error : function(jqXHR, textStatus,
				errorThrown) {
			alert('Error While Fecthing Ratings : ' + textStatus + ': '
					+ errorThrown);
		}
	});
	return false;
};



function topics(appId) {
	$.ajax({
		type : "GET",
		url : "http://localhost:8080/digi/digitalQAService/userExperienceTesting/sentimentAnalysis/topics?appId="+appId,
		//url : "${pageContext.request.contextPath}/digitalQAService/userExperienceTesting/sentimentAnalysis/topics?appId="+appId,
		contentType : "application/json; charset=utf-8",
		dataType : "json",
		success : function(data) {
			var topic = [];
			var matches = [];
			var positive = [];
			var negative = [];
			var totalPercentage = [];
			var percentagePositive = [];
			var percentageNegative = [];
			var ave_rating =[];
			var wordArrName = JSON.parse(JSON
					.stringify(data))["results"];
			for (var i = 0; i < wordArrName.length; i++) {
				topic.push(wordArrName[i]["topic_name"]);
				matches.push(wordArrName[i]["matches"]);
				positive.push(wordArrName[i]["positive"]);
				negative.push(wordArrName[i]["negative"]);
				ave_rating.push(wordArrName[i]["ave_rating"]);
				totalPercentage[i] = (parseInt(wordArrName[i]["positive"])
						+ parseInt(wordArrName[i]["negative"]));
				percentagePositive
				.push(Number(Math
						.round((wordArrName[i]["positive"] / totalPercentage[i]) * 100)));
				percentageNegative
				.push(Number(Math
						.round((wordArrName[i]["negative"] / totalPercentage[i]) * 100)));
			}
			if (data) {
				var len = topic.length;
				$("#topics").find("tr:gt(0)").remove();
				if (len > 0) {
					for (var i = 0; i < len; i++) {
						$("#topics")
						.append(
								"<tr class='last'> <td>"
								+ topic[i]
								+ "</td> <td>  <div class='progress' data-toggle='tooltip' title='Positive: "
								+ percentagePositive[i]+"\n Negative: "+percentageNegative[i]+"'><div class='progress-bar progress-bar-success' role='progressbar' style='width:"
								+ percentagePositive[i]
								+ "%'></div>  <div class='progress-bar progress-bar-danger' role='progressbar' style='width:"
								+ percentageNegative[i]
								+ "%'></div>   </td><td>"
								+ matches[i]
								+ "</td> <td>"
								+ ave_rating[i]
								+ " %</td>   </tr>");
					}
				}
			}
		},
		error : function(jqXHR, textStatus,
				errorThrown) {
			alert('Error While Fecthing Topics : ' + textStatus + ': '
					+ errorThrown);
		}
	});
	return false;
};