<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/js/canvasjs.min.js"></script>
<script src="${pageContext.request.contextPath}/js/exporting.js"></script>
<script src="${pageContext.request.contextPath}/js/highchart.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"
	type="text/javascript">
</script>


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
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js">
</script>


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
<body onload="abcde()">
	<script type="text/javascript">
		function abcde() {
			os();
			screens();
		}
	</script>

<script type="text/javascript">
function screens()
{
$.ajax({
	type : "GET",
	url : "${pageContext.request.contextPath}/digitalQAService/userExperienceTesting/appseeConnectivity",
	contentType : "application/json; charset=utf-8",
	dataType : "json",
	success : function(data) {
	
		
		var wordArrName = JSON.parse(JSON.stringify(data))["Connectivity"];
		
		
		var dataPointers = [];
		function dataPoint(name, y,z) {
			this.name = name;
			this.y = y;
			this.z=z;
		}

		for (var i = 0; i < wordArrName.length; i++) {

			var data = new dataPoint(
					wordArrName[i].Connectivity,
					(parseInt(wordArrName[i].UnresponsiveOccurrences)),(parseInt(wordArrName[i].Occurrences)));
			dataPointers.push(data);

		} 
		
		
	   Highcharts.chart('containerScreen', {
		            chart: {
		                plotBackgroundColor: null,
		                plotBorderWidth: null,
		                plotShadow: false,
		                type: 'pie'
		            },
		            title: {
		                text: '<b>Connectivity</b>'
		            },
		            tooltip : {
						pointFormat : ' <b>({point.percentage:.1f}%)</b>'
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
		            series : [ {
						name : '',
						colorByPoint : true,
						data : dataPointers
					} ]
		            
		           
		        }); 
		 

	},
	error : function(jqXHR, textStatus,
			errorThrown) {
		alert('Error While getting screen gestures ' );
	}
});
return false;
};
</script>



	<script type="text/javascript">
		function os() {
			$
					.ajax({
						type : "GET",
						url : "${pageContext.request.contextPath}/digitalQAService/userExperienceTesting/appseeOS",
						contentType : "application/json; charset=utf-8",
						dataType : "json",
						success : function(data) {

							var wordArrName = JSON.parse(JSON.stringify(data))["OS"];

							var dataPointers = [];
							function dataPoint(name, y) {
								this.name = name;
								this.y = y;
							}
							for (var i = 0; i < wordArrName.length; i++) {

								var data = new dataPoint(
										wordArrName[i].OSVersion,
										(parseInt(wordArrName[i].Sessions)));
								dataPointers.push(data);

							}
							Highcharts
									.chart(
											'containerOS',
											{
												chart : {
													plotBackgroundColor : null,
													plotBorderWidth : null,
													plotShadow : false,
													type : 'pie'
												},
												title : {
													text : ' <b>OS </b>'
												},
												tooltip : {
													pointFormat : '{series.name}: <b>({point.percentage:.1f}%)</b>'
												},
												plotOptions : {
													pie : {
														allowPointSelect : true,
														cursor : 'pointer',
														dataLabels : {
															enabled : false
														},
														showInLegend : true
													}
												},
												series : [ {
													name : 'ios',
													colorByPoint : true,
													data : dataPointers
												} ]
											});

						},
						error : function(jqXHR, textStatus, errorThrown) {

						}
					});
			return false;
		};
	</script>



<script type="text/javascript">

function connection()
{
$.ajax({
	type : "GET",
	url : "${pageContext.request.contextPath}/digitalQAService/userExperienceTesting/appseeConnectivity",
	contentType : "application/json; charset=utf-8",
	dataType : "json",
	success : function(data) {
	
		
		var wordArrName = JSON.parse(JSON.stringify(data))["Connectivity"];
		
		
		var dataPointers = [];
		function dataPoint(name, y,z) {
			this.name = name;
			this.y = y;
			this.z=z;
		}

		for (var i = 0; i < wordArrName.length; i++) {

			var data = new dataPoint(
					wordArrName[i].Gesture,
					(parseInt(wordArrName[i].UnresponsiveOccurrences)),(parseInt(wordArrName[i].Occurrences)));
			dataPointers.push(data);

		} 
		
		
	   Highcharts.chart('containerC', {
		            chart: {
		                plotBackgroundColor: null,
		                plotBorderWidth: null,
		                plotShadow: false,
		                type: 'pie'
		            },
		            title: {
		                text: '<b>Connections</b>'
		            },
		            tooltip : {
						pointFormat : ' <b>({point.percentage:.1f}%)</b>'
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
		            series : [ {
						name : '',
						colorByPoint : true,
						data : dataPointers
					} ]
		            
		           
		        }); 
		 

	},
	error : function(jqXHR, textStatus,
			errorThrown) {
		alert('Error While getting screen gestures ' );
	}
});
return false;
};
</script>


	<div>
		<jsp:include page="../../../common/logo.jsp"></jsp:include>

		<div class="col-sm-2 col-md-2 marginTop50px">
			<div class="panel-body" style="border: 0px;">

				<div class="marginTop15px"></div>
				<h1>DemoApp</h1>
				<br><br>
				<p>
					<a href="landing.jsp">Analytics</a>
				</p>
				<p>
					<a href="session.jsp" >Session</a>
				</p>
				<p>
					<a href="javascript:window.location.reload(true)" >Device</a>
				</p>
				
			</div>
		</div>

		<div class="col-sm-10 col-md-10 verticalLine" id="sentiment">
			<div class="marginTop50px">
				<div class="page-header">
					<h1 style="color: #696969;">Graphs</h1>
				</div>

				<div class="row">
					<div class="col-sm-4">
						<div id="containerOS" class="col-sm-4"
							style="min-width: 400px; height: 400px; margin: 0 auto"></div>
					</div>
					<div class="col-sm-8">
						<div id="containerScreen" class="col-sm-8"
							style="min-width: 400px; height: 400px; margin: 0 auto"></div>
					</div>
				</div>
			</div>
		</div>
		
	</div>

</body>
</html>