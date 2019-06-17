<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

<script src="${pageContext.request.contextPath}/js/canvasjs.min.js"></script>
<script src="${pageContext.request.contextPath}/js/exporting.js"></script>
<script src="${pageContext.request.contextPath}/js/highchart.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"
	type="text/javascript"></script>
</head>


<link rel="stylesheet" media="all"
	href="${pageContext.request.contextPath}/styles/css/reviewAppbot.css" />
<link rel="stylesheet" media="all"
	href="${pageContext.request.contextPath}/styles/css/emotion.css" />
<link rel="stylesheet" media="all"
	href="${pageContext.request.contextPath}/styles/css/reviewAppbot.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/styles/css/bootstrap.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/styles/css/main.css">

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
<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
       <script src="${pageContext.request.contextPath}/js/graph/canvasjs.min.js"></script>
<style>
.label {
	font-size: 22.5px;
	fill: #ffffff;
	text-anchor: middle;
	alignment-baseline: middle;
}

.face {
	stroke: #c8c8c8;
	stroke-width: 2;
}

.minorTicks {
	stroke-width: 2;
	stroke: white;
}

.majorTicks {
	stroke: white;
	stroke-width: 3;
}
.btn1 {
  -webkit-border-radius: 23;
  -moz-border-radius: 23;
  border-radius: 23px;
  font-family: Arial;
  color: #1f638d;
  font-size: 15px;
  background: #fff;
  padding: 7px 5px 7px 5px;
  border: solid #1f638d 1px;
  text-decoration: none;
}

.btn1:hover {
  background: #fff;
  background-image: -webkit-linear-gradient(top, #fff, #3498db);
  background-image: -moz-linear-gradient(top, #fff, #3498db);
  background-image: -ms-linear-gradient(top, #fff, #3498db);
  background-image: -o-linear-gradient(top, #fff, #3498db);
  background-image: linear-gradient(to bottom, #fff, #3498db);
  text-decoration: none;
}

.btn1:focus {
  background: #fff;
  background-image: -webkit-linear-gradient(top, #fff, #3498db);
  background-image: -moz-linear-gradient(top, #fff, #3498db);
  background-image: -ms-linear-gradient(top, #fff, #3498db);
  background-image: -o-linear-gradient(top, #fff, #3498db);
  background-image: linear-gradient(to bottom, #fff, #3498db);
  text-decoration: none;
}
</style>


</head>
<body onload="abcde()" class="newhome">
	<script type="text/javascript">
		function abcde() {
			hideOther('review');
			
			session();

		}
	</script>
	<script type="text/javascript">

	function setAppName(appName){
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
	}
	function hideOther(divRemains){
		var allDivs=['sentiment','words'];
	
		for(key in allDivs){
	
			if(allDivs[key] == divRemains){
				document.getElementById(allDivs[key]).style.display = "block";
			}else{
		document.getElementById(allDivs[key]).style.display = "none";
			}
		}
	}
	</script>
	
	<script type="text/javascript">
		function session() {
			$
					.ajax({
						type : "GET",
						url : "${pageContext.request.contextPath}/digitalQAService/userExperienceTesting/appseeAnalysis",
						contentType : "application/json; charset=utf-8",
						dataType : "json",
						success : function(data) {
							alert("In Success")

							var wordArrName = JSON.parse(JSON.stringify(data))["Durations"];

							function dataPoint(y, label, color) {
								this.y = y;
								this.label = label;
								this.color = color;
							}
							var dataPointers = [];

							for ( var key in wordArrName) {
								var data = new dataPoint(
										parseInt(wordArrName[key].Sessions),
										wordArrName[key].Bucket, "#27AE60");
								dataPointers.push(data);

							}

							var chart = new CanvasJS.Chart("chartContainer", {
								title : {
									text : "Session Duration"
								},
								data : [ {
									type : "column",
									dataPoints : dataPointers
								} ]
							});
							chart.render();
						},
						error : function(jqXHR, textStatus, errorThrown) {

						}
					});
			return false;
		};
	</script>
	

	<div>
		<jsp:include page="../../../common/logo.jsp"></jsp:include>
		<div class="marginTop15px"></div>

		<div class="container">
			<div class="">
				<div class="col-sm-2 col-md-2 marginTop50px">
					<div class="panel-body" style="border: 0px;">
						<div class="btn-group" style="width: 150px;">
							<select id="shows" onchange="return setAppName(this.value)">
						
						</select>
						</div>
						<div class="marginTop15px"></div>
						<p>
							
						</p>
						<p>
							<a href="#" title="Sentiment" id='sentimentLnk'
								onclick="return hideOther('sentiment')">Sentiment</a>
						</p>
						<p>
							<a href="#" title="Cloud Testing"
								onclick="return hideOther('words')">Words</a>
						</p>
						<p>
							
						</p>
						<p>
							
						</p>
						<p>
						
						</p>
					
					</div>
				</div>




				<div class="col-sm-10 col-md-10 verticalLine" id="sentiment" style="display: none;">
					<div class="marginTop50px">
						<div class="page-header">
							<h1>
								<span id="sentimentApp"></span> - Sentiment Analysis
							</h1>
						</div>
						<div>
							<!-- 		Sentiment Home Page Loaders		starts  -->
							<div
								class="col-sm-3 marginTop15px paddingRight0px paddingLeft0px">
								<div class="integratedQALabPanel">
									<div class="panelContent">
										<%-- 										<jsp:include page="./graph.jsp" flush="false"></jsp:include> --%>
										<!--   sentiment break down graph starts -->
										<h4 style="color:#696969;">
											Sentiment BreakDown
										</h4>
									 
									 
									 
		 
 							<div id="charContainer"
		style="width: 450px; height: 300px; float: left; overflow: disable;"></div>

									</div>
								</div>
							</div>

							<div
								class="col-sm-3 marginTop15px paddingRight0px paddingLeft0px pull-right"
								style="width: 450px; height: 450px; float: left; overflow: disable;">
								<div class="integratedQALabPanel">

									<%-- <center>
										<label><h4>
												<b>Overall Sentiment</b>
											</h4></label>
									</center> --%>
									<div>
										<h4 style="text-align: center; color:#696969;">Overall Sentiment</h4>
									</div>


  <div class="sentiment_div">
        <div class="sentiment_div_dial" data-angle="120.5489"></div>
      </div>

      
								<!-- 	<svg width="800" height="600"></svg>

									<script src="https://d3js.org/d3.v3.min.js"></script>
									<script src="http://vizjs.org/viz.v1.0.0.min.js"></script>
									<script>
										var svg = d3.select("svg");
										var g = svg.append("g").attr(
												"transform",
												"translate(200,150)");
										var domain = [ 0, 100 ];

										var gg = viz.gg().domain(domain)
												.outerRadius(150).innerRadius(
														15).value(
														0.25 * (domain[0]))
												.duration(1000);

										gg.defs(svg);
										g.call(gg);

										d3.select(self.frameElement).style(
												"height", "400px");
										setInterval(function() {
											gg.setNeedle(domain[0] + 25);
										}, 2000);
									</script>
 -->
								</div>
							</div>
						</div>
					</div>
					<!-- 		Sentiment Home Page Loaders	Ends	 -->
					<br> <br>
				</div>
				<!-- 	Popular	 Words  Page Loaders	starts	 -->
				<!-- <div id="popularWords"  > -->


				
				<div class="col-sm-10 col-md-10 verticalLine" id="words" style="display: none;">
					<div class="marginTop50px">
						<div class="page-header">
							<h1>
								<span id="wordsApp"></span>
							</h1>
						</div>
					</div>

					<div class="panel panel-default">
 						 <div class="panel-heading">
 						 	<button
						onclick="getElementById('criticalwords').style.display='none';  getElementById('popularWrd').style.display='block';"
						class="btn1 btn-primary">Popular Words</button>
					<button
						onclick="getElementById('criticalwords').style.display='block';  getElementById('popularWrd').style.display='none';"
						class="btn1 btn-primary">Critical Words</button>
 						 </div>
  							 <div id="popularWrd">
      							<table class="table table-hover specialCollapse" id="popularWords">
      								<tr class="last">
										<th class="first">WORD</th>
										<th>SENTIMENT</th>
										<th>MENTIONS</th>
										<th class="last">OVERALL REVIEWS</th>
								 
									</tr>
      							</table>
  							</div>
   							<div id="criticalwords" style="display: none;">






						<div class="select-bar"></div>
						<table class="table table-hover specialCollapse"
							id="criticalWords">

							<tr class="first">
								<th class="first">WORD</th>
								<th>SENTIMENT</th>
								<th>MENTIONS</th>
								<th class="last">OVERALL REVIEWS</th>
								 
							</tr>
						</table>

					</div>
					</div>
					
					
					<!-- <button
						onclick="getElementById('criticalwords').style.display='none';  getElementById('popularWrd').style.display='block';"
						class="btn btn-primary">Popular Words</button>
					<button
						onclick="getElementById('criticalwords').style.display='block';  getElementById('popularWrd').style.display='none';"
						class="btn btn-primary">Critical Words</button> -->
					<br>
					<br>
					<!-- <div id="popularWrd">
						<div class="select-bar"></div>
						<table class="table table-striped table-bordered"
							id="popularWords">

							<tr class="first">
								<th class="first">WORD</th>
								<th>SENTIMENT</th>
								<th>MENTIONS</th>
								<th class="last">OVERALL REVIEWS</th>
								 
							</tr>
						</table> -->
						<!-- 		Popular Word page Loaders	Ends	 -->
					</div>

					<!-- <div id="criticalwords" style="display: none;">




						<script type="text/javascript">
					function getCriticalWords() {
						$
								.ajax({
									type : "GET",
									url : "${pageContext.request.contextPath}/digitalQAService/userExperienceTesting/sentimentAnalysis/critiaclWords",
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
											if (len > 0) {
												for (var i = 0; i < len; i++) {
													$("#criticalWords")
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
				</script>


						<div class="select-bar"></div>
						<table class="table table-striped table-bordered"
							id="criticalWords">

							<tr class="first">
								<th class="first">WORD</th>
								<th>SENTIMENT</th>
								<th>MENTIONS</th>
								<th class="last">OVERALL REVIEWS</th>
								 
							</tr>
						</table>

					</div> -->


				</div>

				<div id="sentimentTimeline" class="col-sm-10 col-md-10 verticalLine" style="display: none;">
					<div class="marginTop50px">
						<div class="page-header">
							<h1>
								<span id="timelineApp"></span> - Sentiment Timeline
							</h1>
						</div>


						<!-- 		Sentiment Timeline page Loaders	Starts	 -->


						<script
							src="${pageContext.request.contextPath}/js/graph/highchart.js"></script>
						<script
							src="${pageContext.request.contextPath}/js/graph/exporting.js"></script>
						
						<div id="container"
							style="min-width: 310px; height: 400px; margin: 0 auto"></div>
						<div id="chartContainer" style="height: 400px; width: 100%;">
						</div>
					</div>
				</div>

				<!-- 		Sentiment timeline page Loaders	Ends	 -->



				<!-- 		Topics page Loaders	Starts	 -->





				<div class="col-sm-10 col-md-10 verticalLine" id="topicsDiv" style="display: none;">
					<div class="marginTop50px">
						<div class="page-header">
							<h1>
								<span id="topicsApp"></span> - Topics
							</h1>
						</div>
						<table class="table table-striped table-bordered" id="topics">

							<tr class="first">
								<th class="first">TOPIC</th>
								<th>SENTIMENT</th>
								<th>MATCHES</th>
								<th class="last">AVERAGE RATINGS</th>
								<!-- <th class="last">TREND</th> -->
							</tr>
						</table>


					</div>
				</div>


				<!-- 		Topics  page Loaders	Ends	 -->

				<!-- 		Emotion  page Loaders	starts	 -->

				<div class="col-sm-10 col-md-10 verticalLine" id="emotion" style="display: none;">



					<div class="marginTop50px">
						<div class="page-header">
							<h1>
								<span id="emotionSpan"></span> - Emotions
							</h1>
						</div>








						<div id="appbot-content">
							<div id="emotion_visualization_container">
								<div id="emotion_visualization"></div>

								<div id="emotion_happy">Pleased</div>
								<div id="emotion_sad">Displeased</div>
								<div id="emotion_sleepy">Passive</div>
								<div id="emotion_awake">Assertive</div>
							</div>
						</div>

						<script id="review-tooltip-template"
							type="text/x-handlebars-template">
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

				<!-- 		Emotion  page Loaders	Ends	 -->






				<!-- 		Review  page Loaders	Starts	 -->

				<div class="col-sm-10 col-md-10 verticalLine" id="review">
					<div class="marginTop50px">
						<div class="page-header">
							<h1 style="color:#696969;">
								<span id="reviewSpan"></span> - Rating
							</h1>
						</div>

						<p>
							<b style="color:#696969;">The Ratings tool reports your current rating for all
								ratings and reviews.</b>
						</p>
						


						<div class="container">
							<div class="row">
								<div id="chartContainer" style="height: 400px; width: 100%;"></div>
							</div>
							
													
						</div>
						
							
						
					</div>
      </div>
      
      
      <div class="col-sm-4 col-md-2">
      	<div class="marginTop90px"></div>
      </div>


	<div class="col-sm-10 col-md-10 verticalLine ">
		<div class="marginTop90px"></div>
		
	</div>
	
	<div class="col-sm-4 col-md-2">
      	<div class="marginTop90px"></div>
      </div>


	<div class="col-sm-10 col-md-10 verticalLine ">
		<div class="marginTop90px"></div>
		
	</div>
      
    </div>



				</div>

				<!-- 		Review  page Loaders	Ends	 -->

		
		<!-- Footer -->
		
		<jsp:include page="../../../common/footer.jsp"></jsp:include>
	
</body>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/graph/emotion.js"></script>
</html>