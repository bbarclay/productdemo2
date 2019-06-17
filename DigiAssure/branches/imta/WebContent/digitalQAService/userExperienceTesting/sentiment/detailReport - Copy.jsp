<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/graph/graph.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/graph/TimeUtils.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/graph/XmlUtils.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/graph/XmlControl.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/graph/json2.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/graph/ErrorUtils.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/graph/JsonUtils.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/graph/StackUtils.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/graph/LogUtils.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/graph/StringUtils.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/graph/MiscUtils.js"></script>

<script
						src="${pageContext.request.contextPath}/js/graph/highchart.js"></script>
					<script
						src="${pageContext.request.contextPath}/js/graph/exporting.js"></script>



<%-- <link rel="stylesheet" media="all"
	href="${pageContext.request.contextPath}/styles/css/reviewAppbot.css" /> --%>
<link rel="stylesheet" media="all"
	href="${pageContext.request.contextPath}/styles/css/emotion.css" />
<%-- <link rel="stylesheet" media="all"
	href="${pageContext.request.contextPath}/styles/css/reviewAppbot.css" /> --%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/styles/css/bootstrap.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/styles/css/main.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/styles/css/digi.css">
<script type="text/javascript">window.NREUM||(NREUM={});NREUM.info={"beacon":"bam.nr-data.net","errorBeacon":"bam.nr-data.net","licenseKey":"5eb8b64e01","applicationID":"4256830","transactionName":"J1YMEkAJWg5UQBdVXQtNCwlcSV8MVVdA","queueTime":0,"applicationTime":99,"agent":""}</script>
<script type="text/javascript">window.NREUM||(NREUM={}),__nr_require=function(e,t,n){function r(n){if(!t[n]){var o=t[n]={exports:{}};e[n][0].call(o.exports,function(t){var o=e[n][1][t];return r(o||t)},o,o.exports)}return t[n].exports}if("function"==typeof __nr_require)return __nr_require;for(var o=0;o<n.length;o++)r(n[o]);return r}({1:[function(e,t,n){function r(){}function o(e,t,n){return function(){return i(e,[(new Date).getTime()].concat(u(arguments)),t?null:this,n),t?void 0:this}}var i=e("handle"),a=e(2),u=e(3),c=e("ee").get("tracer"),f=NREUM;"undefined"==typeof window.newrelic&&(newrelic=f);var s=["setPageViewName","setCustomAttribute","setErrorHandler","finished","addToTrace","inlineHit"],l="api-",p=l+"ixn-";a(s,function(e,t){f[t]=o(l+t,!0,"api")}),f.addPageAction=o(l+"addPageAction",!0),f.setCurrentRouteName=o(l+"routeName",!0),t.exports=newrelic,f.interaction=function(){return(new r).get()};var d=r.prototype={createTracer:function(e,t){var n={},r=this,o="function"==typeof t;return i(p+"tracer",[Date.now(),e,n],r),function(){if(c.emit((o?"":"no-")+"fn-start",[Date.now(),r,o],n),o)try{return t.apply(this,arguments)}finally{c.emit("fn-end",[Date.now()],n)}}}};a("setName,setAttribute,save,ignore,onEnd,getContext,end,get".split(","),function(e,t){d[t]=o(p+t)}),newrelic.noticeError=function(e){"string"==typeof e&&(e=new Error(e)),i("err",[e,(new Date).getTime()])}},{}],2:[function(e,t,n){function r(e,t){var n=[],r="",i=0;for(r in e)o.call(e,r)&&(n[i]=t(r,e[r]),i+=1);return n}var o=Object.prototype.hasOwnProperty;t.exports=r},{}],3:[function(e,t,n){function r(e,t,n){t||(t=0),"undefined"==typeof n&&(n=e?e.length:0);for(var r=-1,o=n-t||0,i=Array(o<0?0:o);++r<o;)i[r]=e[t+r];return i}t.exports=r},{}],ee:[function(e,t,n){function r(){}function o(e){function t(e){return e&&e instanceof r?e:e?c(e,u,i):i()}function n(n,r,o){if(!p.aborted){e&&e(n,r,o);for(var i=t(o),a=v(n),u=a.length,c=0;c<u;c++)a[c].apply(i,r);var f=s[w[n]];return f&&f.push([y,n,r,i]),i}}function d(e,t){b[e]=v(e).concat(t)}function v(e){return b[e]||[]}function g(e){return l[e]=l[e]||o(n)}function m(e,t){f(e,function(e,n){t=t||"feature",w[n]=t,t in s||(s[t]=[])})}var b={},w={},y={on:d,emit:n,get:g,listeners:v,context:t,buffer:m,abort:a,aborted:!1};return y}function i(){return new r}function a(){(s.api||s.feature)&&(p.aborted=!0,s=p.backlog={})}var u="nr@context",c=e("gos"),f=e(2),s={},l={},p=t.exports=o();p.backlog=s},{}],gos:[function(e,t,n){function r(e,t,n){if(o.call(e,t))return e[t];var r=n();if(Object.defineProperty&&Object.keys)try{return Object.defineProperty(e,t,{value:r,writable:!0,enumerable:!1}),r}catch(i){}return e[t]=r,r}var o=Object.prototype.hasOwnProperty;t.exports=r},{}],handle:[function(e,t,n){function r(e,t,n,r){o.buffer([e],r),o.emit(e,t,n)}var o=e("ee").get("handle");t.exports=r,r.ee=o},{}],id:[function(e,t,n){function r(e){var t=typeof e;return!e||"object"!==t&&"function"!==t?-1:e===window?0:a(e,i,function(){return o++})}var o=1,i="nr@id",a=e("gos");t.exports=r},{}],loader:[function(e,t,n){function r(){if(!h++){var e=y.info=NREUM.info,t=l.getElementsByTagName("script")[0];if(setTimeout(f.abort,3e4),!(e&&e.licenseKey&&e.applicationID&&t))return f.abort();c(b,function(t,n){e[t]||(e[t]=n)}),u("mark",["onload",a()],null,"api");var n=l.createElement("script");n.src="https://"+e.agent,t.parentNode.insertBefore(n,t)}}function o(){"complete"===l.readyState&&i()}function i(){u("mark",["domContent",a()],null,"api")}function a(){return(new Date).getTime()}var u=e("handle"),c=e(2),f=e("ee"),s=window,l=s.document,p="addEventListener",d="attachEvent",v=s.XMLHttpRequest,g=v&&v.prototype;NREUM.o={ST:setTimeout,CT:clearTimeout,XHR:v,REQ:s.Request,EV:s.Event,PR:s.Promise,MO:s.MutationObserver},e(1);var m=""+location,b={beacon:"bam.nr-data.net",errorBeacon:"bam.nr-data.net",agent:"js-agent.newrelic.com/nr-998.min.js"},w=v&&g&&g[p]&&!/CriOS/.test(navigator.userAgent),y=t.exports={offset:a(),origin:m,features:{},xhrWrappable:w};l[p]?(l[p]("DOMContentLoaded",i,!1),s[p]("load",r,!1)):(l[d]("onreadystatechange",o),s[d]("onload",r)),u("mark",["firstbyte",a()],null,"api");var h=0},{}]},{},["loader"]);</script>
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
<%-- <script src="${pageContext.request.contextPath}/js/detailReport.js"></script> --%>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/js/graph/canvasjs.min.js"></script>
<%-- <script src="${pageContext.request.contextPath}/js/csspopup.js"></script> --%>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/graph/emotion.js"></script>

</head>
<script type="text/javascript">
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
	if($("#userReviews").css('display') != 'none'){
	$("#userReviews").hide();
	$("#words").show();
	}
}

function setAppName(appNameId){

	appName=appNameId.split("_")[1];
	var sentimentObj = document.getElementById("sentimentApp");
	var wordsObj = document.getElementById("wordsApp");
	var timelineObj = document.getElementById("timelineApp");
	var topicsObj = document.getElementById("topicsApp");
	var emotion = document.getElementById("emotionSpan");
	var review = document.getElementById("reviewSpan");
	var userReviewSpan = document.getElementById("userReviewSpan");
	

	sentimentObj.innerHTML=appName;
	wordsApp.innerHTML=appName;
	timelineObj.innerHTML=appName;
	topicsObj.innerHTML=appName;
	emotion.innerHTML=appName;
	review.innerHTML=appName;
	userReviewSpan.innerHTML=appName;

}
function hideOther(divRemains){
	var allDivs=['sentiment','words','sentimentTimeline','topicsDiv','emotion','review','userReviews'];

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
		url : "${pageContext.request.contextPath}/digitalQAService/userExperienceTesting/sentimentAnalysis",
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
		url : "${pageContext.request.contextPath}/digitalQAService/userExperienceTesting/sentimentAnalysis/sentimentBreakdown?appId="+appId,
		contentType : "application/json; charset=utf-8",
		dataType : "json",
		success : function(data) {

			negative = (data.results.negative);
			positive = (data.results.positive);
			neutral = (data.results.neutral);
			total= negative+positive+neutral;

			
			function passingOverallSentiment(total,positive){
				var value = ((positive/total)*100);
				return value;
			}
			
			
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
		url : "${pageContext.request.contextPath}/digitalQAService/userExperienceTesting/sentimentAnalysis/popularWords?appId="+appId,
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
								+ "%'></div></td> <td  align='center'>"
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
function getCriticalReviews(word,appId){
	$
	.ajax({
		type : "GET",
		
		url : "${pageContext.request.contextPath}/digitalQAService/userExperienceTesting/sentiment/getCriticalReviews?appId="+appId+"&word="+word,
		contentType : "application/json; charset=utf-8",
		dataType : "json",
		success : function(reviews) {

			var form="";
			for (var i = 0; i < reviews.length; i++) {
			
				form+="<div class='panel panel-info'> <div class='panel-heading' style='height:38px;'>";
				form+="<div class='row col-sm-12'><div class='col-sm-1'>";
				form+=reviews[i]["published_at"];
				form+="</div><div class='col-sm-10 txtCenter'>";
				form+=reviews[i]["author"];
				form+="</div><div class='col-sm-1 pull-right'>";
				form+="Rating:";
				form+=reviews[i]["rating"];
				form+="</div></div></div><div class='panel-body'><b>";
				var defectName=reviews[i]["subject"];
				form+=defectName.toLowerCase().replace(word.toLowerCase() ,"<mark>"+word+"</mark>");
				form+="</b><br>";
				var body=reviews[i]["body"];
				form+=body.toLowerCase().replace(word.toLowerCase() ,"<mark>"+word+"</mark>");
				defectName=defectName.replace(new RegExp("'", 'g'), " ");
				defectName=defectName.replace(new RegExp("\"", 'g'), " ");
				
				var defectdescription=reviews[i]["body"];
				defectdescription=	defectdescription.replace(new RegExp("'", 'g'), " ");
				defectdescription=defectdescription.replace(new RegExp("\"", 'g'), " ");
				form+="<br>";
				form+="<Button name='logDefect' class='btn btn-primary pull-right marginLeft15px' onClick='logDefect(\""+defectName+"\" ,\" "+defectdescription+"\" , \" "+appId+" \")'>Log Defect</Button> &nbsp &nbsp";
				form+="<Button name='suggest' class='btn btn-primary pull-right' onClick='suggest(\""+defectName+"\" ,\" "+defectdescription+"\" , \" "+appId+" \")'> Suggest</Button>";
				form+="</div></div>";	
			}
			hideDiv("userReviews","words");
			$("#userReviewsSpace").empty(); 
			$("#userReviewsSpace").append(form);
		}
	,
	error : function(jqXHR, textStatus,
			errorThrown) {
		alert('error: ' + textStatus + ': '
				+ errorThrown);
	}
});
return false;
}

function logDefect(defectname,defectdescription,buildid){
	$
	.ajax({
		type : "GET",
		
		url : "${pageContext.request.contextPath}/digitalQAService/userExperienceTesting/sentiment/logDefect?defectname="+defectname+"&defectdescription="+defectdescription+"&buildid="+buildid,
		contentType : "application/json; charset=utf-8",
		dataType : "text",
		success : function(result) {
			$("#success").empty();
			$("#success").append(result);
			$("#info").show();
			$("#info").fadeOut(2000);
		},
		error : function(jqXHR, textStatus,
				errorThrown) {
			alert('error: ' + textStatus + ': '
					+ errorThrown);
		}
	});
	return false;
}
function suggest(suggestion,suggestiondetail,buildid){
	$
	.ajax({
		type : "GET",
		
		url : "${pageContext.request.contextPath}/digitalQAService/userExperienceTesting/sentiment/suggest?suggestion="+suggestion+"&suggestiondetail="+suggestiondetail+"&buildid="+buildid,
		contentType : "application/json; charset=utf-8",
		dataType : "text",
		success : function(result) {
			$("#success").empty();
			$("#success").append(result);
			$("#info").show();
			$("#info").fadeOut(2000);
		},
		error : function(jqXHR, textStatus,
				errorThrown) {
			alert('error: ' + textStatus + ': '
					+ errorThrown);
		}
	});
	return false;
}

function getCriticalWords(appId) {
	$
	.ajax({
		type : "GET",
		
		url : "${pageContext.request.contextPath}/digitalQAService/userExperienceTesting/sentimentAnalysis/critiaclWords?appId="+appId,
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
								"<tr class='last'> <td> <a href='#' onclick='getCriticalReviews(\""+word[i]+"\" , \""+appId+"\")' >"
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

function hideDiv(show,hide){
	$("#"+hide).hide();
	$("#"+show).show();
	
}


function popupDialog(dialog){
	$( function() {
		$( "#dialog" ).dialog();
	} );;
}

function sentimentTimeline(appId) {
	$
	.ajax({
		type : "GET",
		
		url : "${pageContext.request.contextPath}/digitalQAService/userExperienceTesting/sentimentAnalysis/sentimentTimeline?appId="+appId,
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

		url : "${pageContext.request.contextPath}/digitalQAService/userExperienceTesting/sentimentAnalysis/reviews?appId="+appId,
		contentType : "application/json; charset=utf-8",
		dataType : "json",
		success : function(data) {
		//var rates={"0":"0%","0.5":"10%","1":"20%","1.5":"30%"}	;
		
			var array=data["all_time"];
			var count = array["count"];
			var average=array["average"];
			var breakdown = array["breakdown"];
			var stars=(average*100)/5;
			$("#myCountvalue").empty();
			$("#myAveragevalue").empty();
			$("#rating5").empty();
			$("#rating4").empty();
			$("#rating3").empty();
			$("#rating2").empty();
			$("#rating1").empty();

			$("#myCountvalue").append(count);
			$("#myAveragevalue").append(average);
			$("#review-rating-avg-stars-bar").css("width",stars+"%");
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
		
		url : "${pageContext.request.contextPath}/digitalQAService/userExperienceTesting/sentimentAnalysis/topics?appId="+appId,
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
</script>
<body onload="abcde()" class="newhome">


	
		<jsp:include page="../../../common/logo.jsp"></jsp:include>
		<div class="marginTop65px"></div>

		<div class="container">
			<div class="row">
				<div class="marginTop15px"></div>
				<ul class="nav nav-tabs marginLeft15px">
					<li><select class="detailReposrtSelect" id="shows" style="margin-right: 5px; background-color: #fff;"
						onchange="setAppName(this.value); callDraw(this.value);">

					</select></li>
					<li id="reviewNav"><a href="#" title="Reviews"
						onclick="return hideOther('review')" class="buttonlink"><b><button
									class="btn mobileLabMenu">Rating</button></b></a></li>
					<li id="sentimentNav"><a class="buttonlink" href="#"
						title="Sentiment" id='sentimentLnk'
						onclick="return hideOther('sentiment')"><b><button
									class="btn mobileLabMenu">Sentiment</button></b></a></li>
					<li id="wordsNav"><a href="#" title="Cloud Testing"
						onclick="return hideOther('words')" class="buttonlink"> <b><button
									class="btn mobileLabMenu">Words</button></b></a></li>
					<li id="topicsDivNav"><a href="#" title="Topics"
						onclick="return hideOther('topicsDiv')" class="buttonlink"> <b><button
									class="btn mobileLabMenu">Topics</button></b></a></li>
					<li id="emotionNav"><a href="#" title="Emotion"
						onclick="return hideOther('emotion')" class="buttonlink"> <b><button
									class="btn mobileLabMenu">Emotion</button></b></a></li>
					<li id="sentimentTimelineNav"><a href="#"
						title="Sentiment Timeline"
						onclick="return hideOther('sentimentTimeline')" class="buttonlink">
							<b><button class="btn mobileLabMenu">Sentiment
									Timeline</button></b>
					</a></li>
				</ul>
			</div>
		</div>
		
		
		
			<div class="row marginLeftRight" >
				<div class="col-sm-12 col-md-12 nodisplay" id="userReviews" style="display: none;">
	
		
		<div class="greyTextColor">
						<h3>
							<span id="userReviewSpan"></span> - Reviews
						</h3>
					</div>
		<div class="marginTop8px"></div>
		<div id="info" class="alert alert-success alert-dismissible" role="alert" style="display: none;">
		
					<strong>Success!</strong> <span id="success"></span>
		</div>		
		

						
		<div id="userReviewsSpace">


			

</div>		
		
</div>
</div>

			<!-- ******************************** REVIEW ********************************* -->
			<div class="row marginLeftRight">
				<div class="col-sm-12 col-md-12 nodisplay" id="review">
					<div class="greyTextColor">
						<h3 class="marginLeft15px">
							<span id="reviewSpan"></span> - Rating
						</h3>
					</div>
					<p class="rating marginTop15px marginLeft15px">
						<b>The Ratings tool reports your current rating
							for all ratings and reviews.</b>
					</p>
					<div class="marginTop50px"></div>
					<div class="col-md-3 col-lg-3 greyborder marginLeft15px">
						<div id="review-list">
							<div class="review-stats">
								<div class="review-count">
									<span class="review-stat-label">All Time</span> <span
										class="review-stat-label-mega" id="review-stat-label-mega">
										<label id="myCountvalue"></label>
									</span>
								</div>

							</div>
						</div>
					</div>
					<div class="col-md-4 col-lg-4 greyborder">
						<div id="review-list">
							<div class="review-stats" id="review-stats">
								<div class="review-rating-avg">
									<div class="review-stat-label">Avg Rating</div>
									<div>
										<div class="review-rating-avg-stars-container">
											<span  id="review-rating-avg-stars-bar" class="review-rating-avg-stars-bar"></span>
										</div>
										<div class="review-stat-value" id="myAveragevalue"></div>
									</div>
								</div>

							</div>
						</div>
					</div>
					<div class="col-md-4 col-lg-4 greyborders">
						<div id="review-list">
							<div class="review-stats">
								<div class="review-rating-breakdown">
									<table class="rating-breakdown-table">
										<tbody>
											<tr class='rating-breakdown-row'>
												<td class='rating-breakdown-rating-label'><i
													class='icon-star'></i><span>5</span></td>
												<td class='rating-breakdown-bar'><span
													class='breakdown-bar-fill rating-breakdown-bar-overlay rating5'></span></td>
												<td class='breakdown-count'><span id="rating5"></span>
												</td>
											</tr>
											<tr>
												<td class="padding2px"></td>
												<td class="padding2px"></td>
												<td class="padding2px"></td>
											</tr>
											<tr class='rating-breakdown-row'>
												<td class='rating-breakdown-rating-label'><i
													class='icon-star'></i><span>4</span></td>
												<td class='rating-breakdown-bar'><span
													class='breakdown-bar-fill rating-breakdown-bar-overlay rating4'></span></td>
												<td class='breakdown-count'><span id="rating4"></span>
												</td>
											</tr>
											<tr>
												<td class="padding2px"></td>
												<td class="padding2px"></td>
												<td class="padding2px"></td>
											</tr>
											<tr class='rating-breakdown-row'>
												<td class='rating-breakdown-rating-label'><i
													class='icon-star'></i><span>3</span></td>
												<td class='rating-breakdown-bar'><span
													class='breakdown-bar-fill rating-breakdown-bar-overlay rating3'></span></td>
												<td class='breakdown-count'><span id="rating3"></span>
												</td>
											</tr>
											<tr>
												<td class="padding2px"></td>
												<td class="padding2px"></td>
												<td class="padding2px"></td>
											</tr>
											<tr class='rating-breakdown-row'>
												<td class='rating-breakdown-rating-label'><i
													class='icon-star'></i><span>2</span></td>
												<td class='rating-breakdown-bar'><span
													class='breakdown-bar-fill rating-breakdown-bar-overlay rating2'></span></td>
												<td class='breakdown-count'><span id="rating2"></span>
												</td>
											</tr>
											<tr>
												<td class="padding2px"></td>
												<td class="padding2px"></td>
												<td class="padding2px"></td>
											</tr>
											<tr class='rating-breakdown-row'>
												<td class='rating-breakdown-rating-label'><i
													class='icon-star'></i><span>1</span></td>
												<td class='rating-breakdown-bar'><span
													class='breakdown-bar-fill rating-breakdown-bar-overlay rating1'></span></td>
												<td class='breakdown-count'><span id="rating1"></span>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
				
			<!-- ******************************** SENTIMENT ********************************* -->
			
			<div class="row marginLeftRight">
				<div class="col-sm-12 col-md-12 nodisplay" id="sentiment">
					<div class="greyTextColor">
						<h3 class="txtCenter">
							<span id="sentimentApp"></span> - Sentiment Analysis
						</h3>
					</div>
					
					<div class="col-sm-1 col-md-1"></div>
					<div class="col-sm-5 col-md-5 marginTop15px paddingRight0px paddingLeft0px">
						<div class="integratedQALabPanel">
							<div class="panelContent">
								<%--<jsp:include page="./graph.jsp" flush="false"></jsp:include> --%>
								<!--   sentiment break down graph starts -->
								<h4 class="labelForGraph">Sentiment BreakDown</h4>
									<div id="charContainer"></div>
							</div>
						</div>
					</div>
					<div class="col-sm-1 col-md-1 graphMargin"></div>
					<div class="col-sm-5 col-md-5 paddingRight0px paddingLeft0px  overall_sentiment_div">
						<div class="integratedQALabPanel">
							<div>
								<h4 class="labelForGraph">Overall Sentiment</h4>
							</div>
							<div class="sentiment_div">
								<div class="sentiment_div_dial" data-angle="120.5489" ></div>
							</div>
						</div>
					</div>
				</div>
			
			</div>
			
			<!-- ******************************** WORDS ********************************* -->

<div class="row marginLeftRight">
				<div class="col-sm-12 col-md-12 nodisplay" id="words">
					
					<div class="greyTextColor txtCenter">
						<h3 class="txtCenter marginTop15px">
							<span id="wordsApp"></span> - Words
						</h3>
					</div>
					<div class="marginTop15px"></div>

					<div class="col-sm-2 col-md-2"></div>
					<div class="col-sm-8 col-md-8">

					<div class="panel panel-default">
						<div class="panel-heading">
							<button
								onclick="getElementById('criticalwords').style.display='none';  getElementById('popularWrd').style.display='block';"
								class="btn1 btn-primary">Popular Words</button>
							<button
								onclick="getElementById('criticalwords').style.display='block';  getElementById('popularWrd').style.display='none';"
								class="btn1 btn-primary marginLeft15px">Critical Words</button>
						</div>
						<div class="panel-body">
						<div id="popularWrd" class="tabMargin">
							
							<table class="table table-hover table-bordered specialCollapse "
								id="popularWords">
								<tr class="last">
									<th class="first col-sm-2" >WORD</th>
									<th class="col-sm-6">SENTIMENT</th>
									<th class="col-sm-2">MENTIONS</th>
									<th class="col-sm-2">OVERALL REVIEWS</th>

								</tr>
							</table>
						</div>

						<div id="criticalwords" class="nodisplay tabMargin">
							<div class="marginTop15px"></div>
							<div class="select-bar"></div>
								<table class="table table-hover table-bordered specialCollapse"
									id="criticalWords">
									<tr class="last">
										<th class="first col-sm-2" >WORD</th>
										<th class="col-sm-6">SENTIMENT</th>
										<th class="col-sm-2">MENTIONS</th>
										<th class="col-sm-2">OVERALL REVIEWS</th>

									</tr>
								</table>
							</div>
							</div>
						</div>

					</div>
					<div class="col-sm-2 col-md-2"></div>

				</div>


		<!-- ******************************** SENTIMENT TIMELINE ********************************* -->	
		<div class="row marginLeftRight">
			<div id="sentimentTimeline" class="col-sm-12 col-md-12 nodisplay">
				<div class="greyTextColor">
					<h3 class="txtCenter marginTop15px">
						<span id="timelineApp"></span> - Sentiment Timeline
					</h3>
				</div>
				<div class="marginTop15px"></div>
				<div id="container" class="sentiment_timeline_div marginLeft15px"></div>
				<!-- <div id="chartContainer"></div> -->
			</div>
		</div>

		<!-- ******************************** TOPICS  ********************************* -->	
		<div class="row marginLeftRight">
			<div class="col-sm-12 col-md-12 nodisplay" id="topicsDiv">
				<div class="greyTextColor txtCenter">
					<h3 class="txtCenter marginTop15px">
						<span id="topicsApp"></span> - Topics
					</h3>
				</div>
				<div class="marginTop15px"></div>

				<div class="col-sm-2 col-md-2"></div>
				<div class="col-sm-8 col-md-8">
				<div class="panel panel-default">
					<table class="table table-hover specialCollapse" id="topics">
						<tr class="first">
							<th class="first col-sm-3 col-md-3">TOPIC</th>
							<th class="col-sm-5 col-md-5">SENTIMENT</th>
							<th  class="col-sm-2 col-md-2">MATCHES</th>
							<th class="last col-sm-2 col-md-2">AVERAGE RATINGS</th>
							<!-- <th class="last">TREND</th> -->
						</tr>
					</table>
				</div>

				</div>
				<div class="col-sm-2 col-md-2"></div>
			</div>
			<div class="col-sm-1 col-md-1"></div>
		</div>
			
		<!-- ******************************** EMOTIONS  ********************************* -->
			
		<div class="row marginLeftRight">
			<div class="col-sm-12 col-md-12 nodisplay" id="emotion">
				<div class="greyTextColor">
					<h3 class="txtCenter marginTop15px">
						<span id="emotionSpan"></span> - Emotions
					</h3>
				</div>
				<!-- <div class="col-sm-2 col-md-2"></div> -->
				<div class="col-sm-8 col-md-12">
					<div id="appbot-content">
						<div id="emotion_visualization_container">
							<div id="emotion_visualization"></div>
	
							<div id="emotion_happy">Pleased</div>
							<div id="emotion_sad">Displeased</div>
							<div id="emotion_sleepy">Passive</div>
							<div id="emotion_awake">Assertive</div>
						</div>
					</div>
				
				</div>
				
				<!-- <div class="col-sm-2 col-md-2"></div> -->
				<script id="review-tooltip-template" type="text/x-handlebars-template">
					<div class="entry">
   						<div class="review">
      						<div>{{published_at}}</div>
      						<div>
						        <span class="rating">{{stars}}</span>
        							by {{author}}
							        {{#if version}}
          							for version {{version}}
       								 {{/if}}

        							{{#if country}}
          							in {{country}}
        							{{/if}}
     						 </div>


      						<div class="subject">
       							{{subject}}
     						</div>

      					<div class="body">
       						{{body}}
      					</div>

						<div class="rating">
        					Rating :{{rating}}
      					</div>

    				</div>
				</div>
			</script>
			</div>		
		</div>
			
			
				


	</div>
	<!-- Footer -->
	<div class="detailtreportMargin">
	<jsp:include page="../../../common/footer.jsp"></jsp:include>
</div>
</body>

</html>