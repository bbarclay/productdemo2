<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file = "../../../DigiChatBot.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>User Experience Analytics</title>
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
<script type="text/javascript">
function showDetails(){
	
	document.getElementById("containerCrash").style.display="none";
	document.getElementById("containerUsage").style.display="none";
	document.getElementById("userActions").style.display="none";
	document.getElementById("topUser").style.display="none";
	
	
	document.getElementById("crashDetails").style.display="block";

}

/* function showRuns(){

	$
	.ajax({
		type : "GET",
		url : "${pageContext.request.contextPath}/digitalQAService/userExperienceTesting/reserveDevice?deviceId="+deviceId,
		contentType : "application/text; charset=utf-8",
		dataType : "text",
		success : function(data) {
			alert(data);
			var table = document.getElementById('allDevices');

			var rowLength = table.rows.length;

			for(var i=0; i<rowLength; i+=1){
			  var row = table.rows[i];

			  //your code goes here, looping over every row.
			  //cells are accessed as easy

			  var cellLength = row.cells.length;
			  for(var y=0; y<cellLength; y+=1){
			    var cell = row.cells[y];

			    //do something with every cell here
			  }
			}	
				
			
		},
		error : function(jqXHR, textStatus, errorThrown) {
			alert('error: ' + textStatus + ': ' + errorThrown);
		}
	});
	return false;	
}; */
</script>



<%-- 
<link rel="stylesheet" media="all"
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
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/js/graph/canvasjs.min.js"></script>

</head>
<body onload="abcde()" class="newhome">


	<script type="text/javascript">
		function abcde() {
			hideOther('analytics');
	madeAjaxCall(function(appId) {
		drawGrapgs(appId);
    });
	
		}
		
		function drawGrapgs(appId){
			
			usage(appId);
			event(appId);
			topuser(appId);
			session(appId);
			screens(appId);
			crash(appId);
			os(appId);
			connectivity(appId);
			version(appId);
			 appVersion(appId);
			 appDevice(appId)
			
		}
	function callDraw(appNameId){
		drawGrapgs(appNameId.split("_")[0])	;
		
	}

	function setAppName(appNameId){
		
		appName=appNameId.split("_")[1];
		
		
		var analytics = document.getElementById("analyticsApp");
		var screen = document.getElementById("screenApp");
		var device = document.getElementById("deviceApp");
		
		
		
		analytics.innerHTML=appName;
		screen.innerHTML=appName;
		device.innerHTML=appName;
		//drawGrapgs(appNameId.split("_")[0]);
	}
	function hideOther(divRemains){
		var allDivs=['analytics','screen','device'];
		for(key in allDivs){
	
			if(allDivs[key] == divRemains){
				document.getElementById(allDivs[key]).style.display = "block";
			}else{
		document.getElementById(allDivs[key]).style.display = "none";
			}
		}
	}
	
		function madeAjaxCall(callback) {
			$
					.ajax({
						type : "GET",
						url : "${pageContext.request.contextPath}/digitalQAService/userExperienceTesting/analyticsApps",
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
	</script>

<script type="text/javascript">
function showpieGraph(){
	
	//$("#crashDetails").hide();
	document.getElementById("crashDetails").style.display="none";
	document.getElementById("graphDetails").style.display="block";
}

function resrveDevice(deviceId){
	$
	.ajax({
		type : "GET",
		url : "${pageContext.request.contextPath}/digitalQAService/userExperienceTesting/reserveDevice?deviceId="+deviceId,
		contentType : "application/text; charset=utf-8",
		dataType : "text",
		success : function(data) {
			alert(data);
				
			
			
			var table = document.getElementById('allDevices');

			var rowLength = table.rows.length;

			for(var i=0; i<rowLength; i+=1){
			  var row = table.rows[i];
			  var cell = row.cells[4].innerHTML;
			  if(cell.includes("resrveDevice")){
				var cell= cell.split("resrveDevice(")[1];
				 cell=cell.split(")")[0];
				 if(cell==deviceId){
					 row.cells[4].innerHTML="-"; 
					 row.cells[3].innerHTML="In Use"; 
				 }
			  }
			
			  
			/*   var cellLength = row.cells.length;
			  for(var y=0; y<cellLength; y+=1){
			    var cell = row.cells[y];

			    
			  } */
			}
			
		},
		error : function(jqXHR, textStatus, errorThrown) {
			alert('error: ' + textStatus + ': ' + errorThrown);
		}
	});
	return false;
};
function getDeviceDetails(os,version){
	$
	.ajax({
		type : "GET",
		url : "${pageContext.request.contextPath}/digitalQAService/userExperienceTesting/getAllDevices?os="+os+"&version="+version,
		contentType : "application/json; charset=utf-8",
		dataType : "json",
		success : function(data) {
			document.getElementById("graphDetails").style.display="none";	
			document.getElementById("deviceList").style.display="block";	
			var newRowContent="";
			$("#allDevices tbody").empty();
			for (var i = 0; i < data.length; i++) {
				if(data[i]["displayStatus"]=="Available" ){
				newRowContent+="<tr><td>";
				/* newRowContent+="<input type='radio' id='deviceSelected' name='deviceSelected' value='"+data[i]["id"]+"_"+data[i]["deviceName"] +"' ></td><td>"; */
				newRowContent+=data[i]["deviceName"]+"</td><td>";
				newRowContent+=data[i]["deviceOs"]+"</td><td>";
				newRowContent+=data[i]["osVersion"]+"</td><td>";
				newRowContent+=data[i]["displayStatus"]+"</td><td>";
				//if(data[i]["displayStatus"]=="Available"){
				newRowContent+="<button class='btn btn-primary' onclick='resrveDevice("+data[i]["id"]+")'>Reserve</button></a></td>";
				/* }else{
					newRowContent+="-</td>";
				} */
				}
				newRowContent+="</tr>";
				
				
				
			}
			$("#allDevices tbody").append(newRowContent); 
		},
		error : function(jqXHR, textStatus, errorThrown) {
			alert('error: ' + textStatus + ': ' + errorThrown);
		}
	});
	return false;
};
	
</script>
<script type="text/javascript">
		
		function version() {
			$
					.ajax({
						type : "GET",
						url : "${pageContext.request.contextPath}/digitalQAService/userExperienceTesting/inRoadsVersion",
						
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
							Highcharts.setOptions({
								 colors: ['#ED561B', '#5499C7', '#A569BD']
								});
							Highcharts
									.chart(
											'containerVersion',
											{
												chart : {
													plotBackgroundColor : null,
													plotBorderWidth : null,
													plotShadow : false,
													type : 'pie'
												},
												title : {
													text : '<h3 class="greyTextColor">OS</h3>'
												},
												tooltip : {
													pointFormat : '{series.name}<b>({point.percentage:.1f}%)</b>'
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
													name : 'Android',
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
		
		function appVersion() {
			$
					.ajax({
						type : "GET",
						url : "${pageContext.request.contextPath}/digitalQAService/userExperienceTesting/inRoadsAppVersion",
						
						contentType : "application/json; charset=utf-8",
						dataType : "json",
						success : function(data) {

							var wordArrName = JSON.parse(JSON.stringify(data))["Version"];

							var dataPointers = [];
							function dataPoint(name, y) {
								this.name = name;
								this.y = y;
							}
							for (var i = 0; i < wordArrName.length; i++) {

								var data = new dataPoint(
										wordArrName[i].AppVersion,
										(parseInt(wordArrName[i].Sessions)));
								dataPointers.push(data);

							}
							Highcharts.setOptions({
								 colors: ['#DDDF00', '#5499C7', '#A569BD']
								});
							Highcharts
									.chart(
											'containerAppVersion',
											{
												chart : {
													plotBackgroundColor : null,
													plotBorderWidth : null,
													plotShadow : false,
													type : 'pie'
												},
												title : {
													text : '<h3 class="greyTextColor">App Version</h3>'
												},
												tooltip : {
													pointFormat : '{series.name}<b>({point.percentage:.1f}%)</b>'
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
													name : '3.0',
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
		
		function appDevice() {
			$
					.ajax({
						type : "GET",
						url : "${pageContext.request.contextPath}/digitalQAService/userExperienceTesting/inRoadsAppDevice",
						
						contentType : "application/json; charset=utf-8",
						dataType : "json",
						success : function(data) {

							var wordArrName = JSON.parse(JSON.stringify(data))["Device"];

							var dataPointers = [];
							function dataPoint(name, y) {
								this.name = name;
								this.y = y;
							}
							for (var i = 0; i < wordArrName.length; i++) {

								var data = new dataPoint(
										wordArrName[i].AppDevice,
										(parseInt(wordArrName[i].Sessions)));
								dataPointers.push(data);

							}
							Highcharts.setOptions({
								 colors: ['#27AE60', '#5499C7', '#A569BD']
								});
							Highcharts
									.chart(
											'containerAppDevice',
											{
												chart : {
													plotBackgroundColor : null,
													plotBorderWidth : null,
													plotShadow : false,
													type : 'pie'
												},
												title : {
													text : '<h3 class="greyTextColor">By Device</h3>'
												},
												tooltip : {
													pointFormat : '{series.name}<b>({point.percentage:.1f}%)</b>'
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
													name : 'Samsung S6',
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
	  function session() {
          $
                       .ajax({
                              type : "GET",
				url : "${pageContext.request.contextPath}/digitalQAService/userExperienceTesting/appseeAnalysis",
                              contentType : "application/json; charset=utf-8",
                              dataType : "json",
                              success : function(data) {

                                     var wordArrName = JSON.parse(JSON.stringify(data))["Durations"];
                                     var sess=[]; var secs=[];
                                     for ( var key in wordArrName) {
                                     	 sess.push(parseInt(wordArrName[key].Sessions));
                                     	 secs.push(wordArrName[key].Bucket);
                                           } 
                                   
                                     Highcharts.chart('containerSession', {
                                         chart: {
                                             type: 'column'
                                         },
                                         title: {
                                             text: 'Sessions'
                                         },
                                         
                                         xAxis: {
                                             categories: secs,
                                             crosshair: true
                                         },
                                         yAxis: {
                                             min: 0,
                                             
                                         },
                                         tooltip: {
                                             headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
                                             pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                                                 '<td style="padding:0"><b>{point.y} </b></td></tr>',
                                             footerFormat: '</table>',
                                             shared: true,
                                             useHTML: true
                                         },
                                         plotOptions: {
                                             column: {
                                                 pointPadding: 0.2,
                                                 borderWidth: 0
                                             }
                                         },
                                         series: [{
                                             name: 'Sessions',
                                             data: sess

                                         } 

                                         ]

                                  });
                                     
                              },
                              error : function(jqXHR, textStatus, errorThrown) {

                              }
                       });
          return false;
   };
	</script>


	<script type="text/javascript">
function screens()
{
$.ajax({
	type : "GET",
	url : "${pageContext.request.contextPath}/digitalQAService/userExperienceTesting/appseeScreen",
	contentType : "application/json; charset=utf-8",
	dataType : "json",
	success : function(data) {
	
		
		var wordArrName = JSON.parse(JSON.stringify(data))["ScreenGestures"];
		
		
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
		
		Highcharts.setOptions({
			 colors: ['#27AE60', '#5499C7', '#A569BD']
			});
	   Highcharts.chart('containerScreen', {
		            chart: {
		                plotBackgroundColor: null,
		                plotBorderWidth: null,
		                plotShadow: false,
		                type: 'pie'
		            },
		            title: {
		                text: '<h3 class="greyTextColor">Screen Gestures</h3>'
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
	function crash() {
        $
                     .ajax({
                            type : "GET",
                            url : "${pageContext.request.contextPath}/digitalQAService/userExperienceTesting/appseeCrash",
                            contentType : "application/json; charset=utf-8",
                            dataType : "json",
                            success : function(data) {

                           	 var wordArrName = JSON.parse(JSON.stringify(data))["DailyStats"];
                           	 var date=[];
                                var a=[]; var sess=[];
                                for ( var key in wordArrName) {
                                       var d=wordArrName[key].Date;
                                       var e;
                                       d = d.split("-");
                                       e = d[1] + " " + d[2] + "," + d[0];
                                       if (d[1] == '01') {
                                              a = e.replace("01", "Jan");
                                       } else if (d[1] == '02') {
                                              a = e.replace("02", "Feb");
                                       } else if (d[1] == '03') {
                                              a = e.replace("03", "Mar");
                                       } else if (d[1] == '04') {
                                              a = e.replace("04", "Apr");
                                       } else if (d[1] == "05") {
                                              a = e.replace("05", "May");
                                       } else if (d[1] == '06') {
                                              a = e.replace("06", "Jun");
                                       } else if (d[1] == '07') {
                                              a = e.replace("07", "July");
                                       } else if (d[1] == '08') {
                                              a = e.replace("08", "Aug");
                                       } else if (d[1] == '09') {
                                              a = e.replace("09", "Sep");
                                       } else if (d[1] == '10') {
                                              a = e.replace("10", "Oct");
                                       } else if (d[1] == '11') {
                                              a = e.replace("11", "Nov");
                                       } else if (d[1] == '12') {
                                              a = e.replace("12", "Dec");
                                       }
                                       
                                       date.push(a);
                                       sess.push(parseInt(wordArrName[key].TotalCrashedSessions));
                                }

                                   Highcharts.chart('containerCrash', {
                                       title: {
                                           text: 'Crash',
                                           x: -20 //center
                                       },
                                      
                                       xAxis: {
                                           categories:date
                                       },
                                       yAxis: {
                                          
                                           plotLines: [{
                                               value: 0,
                                               width: 1,
                                               color: '#808080'
                                           }]
                                       },
                                       tooltip: {
                                           valueSuffix: ''
                                       },
                                       legend: {
                                           layout: 'vertical',
                                           align: 'right',
                                           verticalAlign: 'middle',
                                           borderWidth: 0
                                       },
                                       series: [{
                                           name: 'CrashedSessions',
                                           data: sess
                                       }]
                                   });

                            },
                            error : function(jqXHR, textStatus, errorThrown) {

                            }
                     });
        return false;
 };
       </script>

	<script type="text/javascript">
function connectivity()
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
		
		Highcharts.setOptions({
			 colors: ['#27AE60', '#5499C7', '#A569BD']
			});
	   Highcharts.chart('containerConnectivity', {
		            chart: {
		                plotBackgroundColor: null,
		                plotBorderWidth: null,
		                plotShadow: false,
		                type: 'pie'
		            },
		            title: {
		                text: '<h3 class="greyTextColor">Connectivity</h3>'
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
						url : "${pageContext.request.contextPath}/digitalQAService/userExperienceTesting/analytics/appseeOS1?appId="+appId,
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
							Highcharts.setOptions({
								 colors: ['#27AE60', '#5499C7', '#A569BD']
								});
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
													text : '<h3 class="greyTextColor">OS</h3>'
												},
												tooltip : {
													pointFormat : '{series.name}<b>({point.percentage:.1f}%)</b>'
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
		function event() {
			
			$.ajax({
						type : "GET",
						url : "${pageContext.request.contextPath}/digitalQAService/userExperienceTesting/appseeEvent",
						contentType : "application/json; charset=utf-8",
						dataType : "json",
						success : function(data) {

							var wordArrName = JSON.parse(JSON.stringify(data))["Events"];
							
							
							for (var i = 0; i < wordArrName.length; i++) {

								var eventName = wordArrName[i].EventName;
								var occurances =  wordArrName[i].Occurrences;
								var percent = wordArrName[i].percent;
								var id="box"+(i+1);
								
								document.getElementById(id).innerHTML = "<p style='font-size:15px;padding-top:10px;text-align: center;font-weight: bold;'>"+eventName+"</p>"+
								"<p style='font-size:15px;text-align: center;font-weight: bold;color:#000;'>"+percent+"%"+"</p>"+
								"<p style='font-size:15px;text-align: center;color:#000;'>"+"("+occurances+" events)"+"</p>";
							}

						},
						error : function(jqXHR, textStatus, errorThrown) {

						}
					});
			return false;
		};
</script>

	<script type="text/javascript">
		function topuser() {
			$
					.ajax({
						type : "GET",
						url : "${pageContext.request.contextPath}/digitalQAService/userExperienceTesting/appseeTU",
						contentType : "application/json; charset=utf-8",
						dataType : "json",
						success : function(data) {
							

							var wordArrName = JSON.parse(JSON.stringify(data))["ScreenGestures"];
							for (var i = 0; i < wordArrName.length; i++) {

								var Gesture = wordArrName[i].Gesture;
								var occurences =  wordArrName[i].Occurrences;
								var percent =  wordArrName[i].percent;
								var id="boxx"+(i+1);
								
								document.getElementById(id).innerHTML = "<p style='font-size:15px;padding-top:10px;text-align: center;font-weight: bold;'>"+Gesture+"</p>"+
								"<p style='font-size:15px;text-align: center;font-weight: bold;color:#000;'>"+percent+"%"+"</p>"+
								"<p style='font-size:15px;text-align: center;color:#000;'>"+"("+occurences+" actions)"+"</p>";
							}

						
						
						},
						error : function(jqXHR, textStatus, errorThrown) {

						}
					});
			return false;
		};
	</script>

	<script type="text/javascript">

	function hideOther(divRemains){
		var allDivs=['analytics','screen','device'];
		
		for(key in allDivs){
	
			if(allDivs[key] == divRemains){
				document.getElementById(allDivs[key]).style.display = "block";
			}else{
		document.getElementById(allDivs[key]).style.display = "none";
			}
		}
		
		var id=divRemains+"Nav";
		var navMenus = ['analyticsNav','screenNav','deviceNav'];
		
		
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
	</script>

	<script type="text/javascript">
		function usage() {
			$
					.ajax({
						type : "GET",
						url : "${pageContext.request.contextPath}/digitalQAService/userExperienceTesting/appseeUsage",
						contentType : "application/json; charset=utf-8",
						dataType : "json",
						success : function(data) {

							var wordArrName = JSON.parse(JSON.stringify(data))["DailyUsage"];
							

							//var arrayDetails = wordArrName;
							var date = [];
							var activeusers = [];
							var newusers = [];
							var a = [];
							for (var i = 0; i < wordArrName.length; i++) {
								var object = wordArrName[i];
								var d = object.Date;
								var e;
								d = d.split("-");
								e = d[1] + " " + d[2] + "," + d[0];
								if (d[1] == '01') {
									a = e.replace("01", "Jan");

								} else if (d[1] == '02') {
									a = e.replace("02", "Feb");
								} else if (d[1] == '03') {
									a = e.replace("03", "Mar");

								} else if (d[1] == '04') {
									a = e.replace("04", "Apr");

								} else if (d[1] == "05") {
									a = e.replace("05", "May");

								} else if (d[1] == '06') {
									a = e.replace("06", "Jun");

								} else if (d[1] == '07') {
									a = e.replace("07", "July");

								} else if (d[1] == '08') {
									a = e.replace("08", "Aug");

								} else if (d[1] == '09') {
									a = e.replace("09", "Sep");

								} else if (d[1] == '10') {
									a = e.replace("10", "Oct");

								} else if (d[1] == '11') {
									a = e.replace("11", "Nov");

								} else if (d[1] == '12') {
									a = e.replace("12", "Dec");

								}

								date.push(a);
								activeusers.push(parseInt(object.ActiveUsers));
								newusers.push(parseInt(object.NewUsers));

							}
							Highcharts
									.chart(
											'containerUsage',
											{
												chart : {
													type : 'area',
													spacingBottom : 30
												},
												title : {
													text : '<h3 class="greyTextColor">Daily Users</h3>'
												},
												subtitle : {
													text : '',
													floating : true,
													align : 'right',
													verticalAlign : 'bottom',
													y : 15
												},
												legend : {
													layout : 'vertical',
													align : 'left',
													verticalAlign : 'top',
													x : 150,
													y : 100,
													floating : true,
													borderWidth : 1,
													backgroundColor : (Highcharts.theme && Highcharts.theme.legendBackgroundColor)
															|| '#FFFFFF'
												},
												xAxis : {
													tickInterval : 1,
													categories : date
												},
												yAxis : {
													title : {
														text : ''
													},
													labels : {
														formatter : function() {
															return this.value;
														}
													}
												},
												tooltip : {
													formatter : function() {
														return '<b>' + this.series.name + ': '
																+ this.y + '</b><br/>' +this.x; 
													}
												},
												plotOptions : {
													area : {
														fillOpacity : 1
													}
												},
												credits : {
													enabled : false
												},
												series : [ {
													name : 'ActiveUsers',
													color : '#A9DFBF',
													data : activeusers
												}, {
													name : 'NewUsers',
													color : '#A9DFBF',
													data : newusers
												} ]
											});
						},
						error : function(jqXHR, textStatus, errorThrown) {

						}
					});
			return false;
		};
	</script>
	<script src="${pageContext.request.contextPath}/js/graph/highchart.js"></script>
	<script src="${pageContext.request.contextPath}/js/graph/exporting.js"></script>

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
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/graph/emotion.js"></script>

	<jsp:include page="../../../common/logo.jsp"></jsp:include>

			<div class="marginTop15px"></div>

			<ul class="nav nav-tabs marginLeft15px">
				<li><select class="detailReposrtSelect" id="shows"
					style="margin-right: 5px; background-color: #fff;"
					onchange="setAppName(this.value); callDraw(this.value);">

				</select> 
				
				
				</li>
				<li id="analyticsNav"><a href="#" title="Analytics"
					onclick="return hideOther('analytics')" class="buttonlink"><b><button
								class="btn mobileLabMenu">Analytics</button></b></a></li>
				<li id="screenNav"><a class="buttonlink" href="#"
					title="Screen" onclick="return hideOther('screen')"><b><button
								class="btn mobileLabMenu">Session</button></b></a></li>
				<li id="deviceNav"><a href="#" title="Device"
					onclick="return hideOther('device')" class="buttonlink"><b><button
								class="btn mobileLabMenu">Device Usage</button></b></a></li>
			</ul>
		 
 

		<!-- ******************************** DAILY USERS********************************* -->

		<div class="row marginLeftRight">
			<br>
			<div class="col-sm-12 col-md-12 nodisplay" id="analytics">
				<div class="greyTextColor">
					<h3 class="txtCenter">
						<span id="analyticsApp"></span> - Analytics Graphs
					</h3>
				</div>
				<br>
				<div id="containerUsage" class="col-sm-12 col-md-12"></div>
				<div class="row col-sm-12 col-md-12 marginTop15px">
					<div class="horizontalLine "></div>
				</div>
				<div id="containerCrash"
					class="row col-sm-12 col-md-12 marginTop15px"
					onclick="showDetails()" style="display: block;"></div>
					
				<!-- 	<div id="graphDetails"
					class="row col-sm-12 col-md-12 marginTop15px" style="display: none;">
					grapgh goes here!!!!!
					</div> -->
					
					
					<div id="graphDetails" class="row col-sm-12 col-md-12 marginTop15px" style="display: none;">
						<div class="panel panel-info">
								<div class="panel-heading panel-heading-custom">
									<h3 class="panel-title">Crashes</h3>
								</div>
							<div class="panel-body">	
							<h4><b>java.lang.IllegalArgumentException</b></h4><br>
							<h6 >in android.location.LocationManager.checkListener</h6>
							<br>
						<div id="containerVersion" class="col-sm-4 col-md-4"></div>
						<div id="containerAppVersion" class="col-sm-4 col-md-4"></div>	
						<div id="containerAppDevice" class="col-sm-4 col-md-4"></div>	
						<center><button class="btn btn-primary" onclick="getDeviceDetails('Android','6')">Start Execution</button></center>
						</div>
					</div>
					</div>
					<div id="deviceList" class="row col-sm-12 col-md-12 marginTop15px" style="display: none;">
						<div class="panel panel-info">
								<div class="panel-heading panel-heading-custom">
									<h3 class="panel-title">Recommended  Devices</h3>
								</div>
							<div class="panel-body">
								
						<table class="table table-striped table-bordered" id="allDevices">
						<thead>
						<tr>
						
						<th>Device Name</th>
						<th>OS</th>
						<th>Version</th>
						<th>Status</th>
						<th>Reserve</th>
					</tr>
						</thead>
						<tbody>
						</tbody>
						
						</table>
				<!-- 	<button class="btn btn-primary" onclick="showRuns()">Start Execution</button>  -->
				<center>	<a href="${pageContext.request.contextPath}/console/runHome?toolName=CGAF_Usability"><button class="btn btn-primary">Start Execution</button></a></center>
						</div>
					</div>
					</div>
					
					
					
					
					
					
				<div id="crashDetails" class="row col-sm-12 col-md-12 marginTop15px" style="display: none;">
						<div class="panel panel-info">
								<div class="panel-heading panel-heading-custom">
									<h3 class="panel-title">Crashes</h3>
								</div>
								<div class="panel-body">
					<table class = "table table-striped">
					<thead>
					<tr>
					<th>NAME</th>
					<th>NEW</th>
					<th>REPORTS THIS WEEK</th>
						<th>REPORTS TOTAL</th>
						<th>LAST REPORTED</th>
					</tr>
					</thead>
					<tbody>
					<tr onclick="showpieGraph()">
					<td><b>java.lang.IllegalArgumentException</b><br>
					in android.location.LocationManager.checkListener
					</td>
					<td>New</td>
					<td><img alt="" src="${pageContext.request.contextPath}/styles/images/graph.png">
					<td>1</td>
					<td>Jan 7, 7:54 PM</td>
					</tr>
					</tbody>
					</table>	
					</div>
					</div>
					</div>
					
				<%-- <div class="row col-sm-12 col-md-12 marginTop15px">
					
						<div class="col-sm-12 col-md-12">
						<div class="marginTop50px"></div>
							
							<div class="panel panel-info">
								<div class="panel-heading panel-heading-custom">
									<h3 class="panel-title">Crashes</h3>
								</div>
								<div class="panel-body" onclick="showDetails()">
								<img alt="" src="${pageContext.request.contextPath}/styles/images/inRoad1.png">
								</div>

							</div>
						</div>
					</div> --%>





				<div class="row col-sm-12 col-md-12 marginTop15px" id="topUser">
					<div class="horizontalLine "></div>
					<div class="col-sm-5 col-md-5 verticalline">
						<div class="marginTop50px"></div>

						<div class="panel panel-info">
							<div class="panel-heading panel-heading-custom" id="userActions">
								<h3 class="panel-title">Top User Actions</h3>
							</div>
							<div class="panel-body">
								<div class="row col-sm-12">
									<div class="col-sm-4 innerDiv">
										<div id="boxx1" class="box" style="background-color: #33d6ff;">
											<i class="fa fa-hand-o-up"></i>
										</div>
									</div>
									<div class="col-sm-4">
										<div id="boxx2" class="box" style="background-color: #33d6ff;"></div>
									</div>
									<div class="col-sm-4">
										<div id="boxx3" class="box" style="background-color: #33d6ff;"></div>
									</div>

								</div>
							</div>

						</div>
					</div>

					<div class="col-sm-7 col-md-7">
						<div class="marginTop50px"></div>

						<div class="panel panel-info">
							<div class="panel-heading panel-heading-custom">
								<h3 class="panel-title">
									<span class="glyphicon glyphicon-exclamation-sign"
										id="glyphIcon"></span> Error Events
								</h3>
							</div>
							<div class="panel-body">
								<div class="row col-sm-12">
									<div class="col-sm-3 innerDiv">
										<div id="box1" class="box" style="background-color: #33d6ff;"></div>
									</div>
									<div class="col-sm-3">
										<div id="box2" class="box" style="background-color: #33d6ff;"></div>
									</div>
									<div class="col-sm-3">
										<div id="box3" class="box" style="background-color: #33d6ff;"></div>
									</div>
									<div class="col-sm-3">
										<div id="box4" class="box" style="background-color: #33d6ff;"></div>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>

		</div>

		<!-- ******************************** SESSION ********************************* -->

		<div class="row marginLeftRight">
			<div class="col-sm-12 col-md-12 nodisplay" id="screen">
				<div class="greyTextColor">
					<h3 class="txtCenter">
						<span id="screenApp"></span> - Session Graphs
					</h3>
				</div>
				<div class="col-sm-1 col-md-1"></div>
				<div class="col-sm-4 col-md-4">
					<div class="marginTop15px"></div>
					<div id="containerSession" class="col-sm-4 col-md-4"></div>
				</div>
				<div class="col-sm-1 col-md-1 graphMargin"></div>
				<div class="col-sm-5 col-md-5">
					<div class="marginTop15px"></div>
					<div id="containerScreen" class="col-sm-6 col-md-6"></div>
				</div>

				<!-- <div class="row col-sm-12 col-md-12 marginTop50px">
						<div class="horizontalLine"></div>
						<div class="col-sm-3 col-md-3"></div>
						<div class="col-sm-6 col-md-6 marginTop50px">
							<div id="containerCrash" class="col-sm-6 col-md-6"></div>
						</div>
					</div> -->
			</div>
		</div>

		<!-- ******************************** DEVICE GRAPH ********************************* -->

		<div class="row marginLeftRight">
			<div class="col-sm-12 col-md-12 nodisplay" id="device">
				<div class="greyTextColor">
					<h3 class="txtCenter">
						<span id="deviceApp"></span> - Device Graph
					</h3>
				</div>
				<div class="col-sm-1 col-md-1"></div>
				<div class="col-sm-4 col-md-4 marginTop15px">
					<div id="containerOS" class="col-sm-4 col-md-4"></div>
				</div>
				<div class="col-sm-1 col-md-1 graphMargin"></div>
				<div class="col-sm-6 col-md-6 marginTop15px">
					<div id="containerConnectivity" class="col-sm-5 col-md-5"></div>
				</div>

			</div>
		</div>







		<!-- <div class="col-sm-4 col-md-2">
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

			</div> -->










		<div class="analyticsMargin">
			<jsp:include page="../../../common/footer.jsp"></jsp:include>
		</div>
</body>
<%-- <script type="text/javascript"
	src="${pageContext.request.contextPath}/js/graph/emotion.js"></script> --%>
</html>