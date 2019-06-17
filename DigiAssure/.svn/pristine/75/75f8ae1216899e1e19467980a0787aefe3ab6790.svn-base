
<link rel="stylesheet" media="all"  href="${pageContext.request.contextPath}/styles/css/reviewAppbot.css" />
<link rel="stylesheet" media="all"
	href="${pageContext.request.contextPath}/styles/css/emotion.css" />
<script src="${pageContext.request.contextPath}/js/graph/emotion.js"></script>
<script type="text/javascript">window.NREUM||(NREUM={});NREUM.info={"beacon":"bam.nr-data.net","errorBeacon":"bam.nr-data.net","licenseKey":"5eb8b64e01","applicationID":"4256830","transactionName":"J1YMEkAJWg5UQBdVXQtNCwlcSV8MVVdA","queueTime":0,"applicationTime":99,"agent":""}</script>
<script type="text/javascript">window.NREUM||(NREUM={}),__nr_require=function(e,t,n){function r(n){if(!t[n]){var o=t[n]={exports:{}};e[n][0].call(o.exports,function(t){var o=e[n][1][t];return r(o||t)},o,o.exports)}return t[n].exports}if("function"==typeof __nr_require)return __nr_require;for(var o=0;o<n.length;o++)r(n[o]);return r}({1:[function(e,t,n){function r(){}function o(e,t,n){return function(){return i(e,[(new Date).getTime()].concat(u(arguments)),t?null:this,n),t?void 0:this}}var i=e("handle"),a=e(2),u=e(3),c=e("ee").get("tracer"),f=NREUM;"undefined"==typeof window.newrelic&&(newrelic=f);var s=["setPageViewName","setCustomAttribute","setErrorHandler","finished","addToTrace","inlineHit"],l="api-",p=l+"ixn-";a(s,function(e,t){f[t]=o(l+t,!0,"api")}),f.addPageAction=o(l+"addPageAction",!0),f.setCurrentRouteName=o(l+"routeName",!0),t.exports=newrelic,f.interaction=function(){return(new r).get()};var d=r.prototype={createTracer:function(e,t){var n={},r=this,o="function"==typeof t;return i(p+"tracer",[Date.now(),e,n],r),function(){if(c.emit((o?"":"no-")+"fn-start",[Date.now(),r,o],n),o)try{return t.apply(this,arguments)}finally{c.emit("fn-end",[Date.now()],n)}}}};a("setName,setAttribute,save,ignore,onEnd,getContext,end,get".split(","),function(e,t){d[t]=o(p+t)}),newrelic.noticeError=function(e){"string"==typeof e&&(e=new Error(e)),i("err",[e,(new Date).getTime()])}},{}],2:[function(e,t,n){function r(e,t){var n=[],r="",i=0;for(r in e)o.call(e,r)&&(n[i]=t(r,e[r]),i+=1);return n}var o=Object.prototype.hasOwnProperty;t.exports=r},{}],3:[function(e,t,n){function r(e,t,n){t||(t=0),"undefined"==typeof n&&(n=e?e.length:0);for(var r=-1,o=n-t||0,i=Array(o<0?0:o);++r<o;)i[r]=e[t+r];return i}t.exports=r},{}],ee:[function(e,t,n){function r(){}function o(e){function t(e){return e&&e instanceof r?e:e?c(e,u,i):i()}function n(n,r,o){if(!p.aborted){e&&e(n,r,o);for(var i=t(o),a=v(n),u=a.length,c=0;c<u;c++)a[c].apply(i,r);var f=s[w[n]];return f&&f.push([y,n,r,i]),i}}function d(e,t){b[e]=v(e).concat(t)}function v(e){return b[e]||[]}function g(e){return l[e]=l[e]||o(n)}function m(e,t){f(e,function(e,n){t=t||"feature",w[n]=t,t in s||(s[t]=[])})}var b={},w={},y={on:d,emit:n,get:g,listeners:v,context:t,buffer:m,abort:a,aborted:!1};return y}function i(){return new r}function a(){(s.api||s.feature)&&(p.aborted=!0,s=p.backlog={})}var u="nr@context",c=e("gos"),f=e(2),s={},l={},p=t.exports=o();p.backlog=s},{}],gos:[function(e,t,n){function r(e,t,n){if(o.call(e,t))return e[t];var r=n();if(Object.defineProperty&&Object.keys)try{return Object.defineProperty(e,t,{value:r,writable:!0,enumerable:!1}),r}catch(i){}return e[t]=r,r}var o=Object.prototype.hasOwnProperty;t.exports=r},{}],handle:[function(e,t,n){function r(e,t,n,r){o.buffer([e],r),o.emit(e,t,n)}var o=e("ee").get("handle");t.exports=r,r.ee=o},{}],id:[function(e,t,n){function r(e){var t=typeof e;return!e||"object"!==t&&"function"!==t?-1:e===window?0:a(e,i,function(){return o++})}var o=1,i="nr@id",a=e("gos");t.exports=r},{}],loader:[function(e,t,n){function r(){if(!h++){var e=y.info=NREUM.info,t=l.getElementsByTagName("script")[0];if(setTimeout(f.abort,3e4),!(e&&e.licenseKey&&e.applicationID&&t))return f.abort();c(b,function(t,n){e[t]||(e[t]=n)}),u("mark",["onload",a()],null,"api");var n=l.createElement("script");n.src="https://"+e.agent,t.parentNode.insertBefore(n,t)}}function o(){"complete"===l.readyState&&i()}function i(){u("mark",["domContent",a()],null,"api")}function a(){return(new Date).getTime()}var u=e("handle"),c=e(2),f=e("ee"),s=window,l=s.document,p="addEventListener",d="attachEvent",v=s.XMLHttpRequest,g=v&&v.prototype;NREUM.o={ST:setTimeout,CT:clearTimeout,XHR:v,REQ:s.Request,EV:s.Event,PR:s.Promise,MO:s.MutationObserver},e(1);var m=""+location,b={beacon:"bam.nr-data.net",errorBeacon:"bam.nr-data.net",agent:"js-agent.newrelic.com/nr-998.min.js"},w=v&&g&&g[p]&&!/CriOS/.test(navigator.userAgent),y=t.exports={offset:a(),origin:m,features:{},xhrWrappable:w};l[p]?(l[p]("DOMContentLoaded",i,!1),s[p]("load",r,!1)):(l[d]("onreadystatechange",o),s[d]("onload",r)),u("mark",["firstbyte",a()],null,"api");var h=0},{}]},{},["loader"]);</script>

<body onload="loader()" class="newhome ">

	<script type="text/javascript">
		function loader() {
			getEmotions();
			reviews();
		}
	</script>


	<div id="appbot-content">
		<div id="emotion_visualization_container">
			<div id="emotion_visualization"></div>

			<div id="emotion_happy">Pleased</div>
			<div id="emotion_sad">Displeased</div>
			<div id="emotion_sleepy">Passive</div>
			<div id="emotion_awake">Assertive</div>
		</div>
	</div>

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
        {{rating}}
      </div>

    </div>
  </div>
</script>
<script type="text/javascript"></script>
	<script type="text/javascript">
					function getEmotions() {
						$.ajax({
									type : "GET",
									url : "${pageContext.request.contextPath}/digitalQAService/userExperienceTesting/sentimentAnalysis/emotions",
									contentType : "application/json; charset=utf-8",
									dataType : "json",
									success : function(data) {
										var id = [];
										var author = [];
										var rating = [];
										var body = [];
										var subject = [];
										var published_at = [];
										var version = [];
										var country =[];
										var emotions = JSON.parse(JSON.stringify(data))["results"];

 var svgContainer = d3.select("#emotion_visualization").append("svg")
                                     .attr("width", "100%")
                                     .attr("height", "100%");
 var xline =  svgContainer.append("line")
                          .attr("x1", "0")
                          .attr("y1", "50%")
                          .attr("x2", "100%")
                          .attr("y2", "50%")
                          .attr("stroke-width", 1)
                          .attr("stroke", "#ccc");
 var yline =  svgContainer.append("line")
                          .attr("x1", "50%")
                          .attr("y1", "0")
                          .attr("x2", "50%")
                          .attr("y2", "100%")
                          .attr("stroke-width", 1)
                          .attr("stroke", "#ccc");

 var review=emotions;
 var tooltipTemplate = Handlebars.compile($("#review-tooltip-template").html());
 
 var c1=0,c2=0,c3=0,c4=0,c5=0,c0=0;
 for(var i=0;i<review.length;i++){
 	var obj=review[i];
 	if(obj.rating=="1")
 		{
 		var tip = d3.tip().offset([-10, 0]).attr('class', 'emotion-d3-tip');
 		   
 		    svgContainer.call(tip);
 		    c1++;
 		    if(c1==1){
 		    	var cx=40;
 				var cy=40;
 		    }
 		    else if(c1>1){
 		    	var cx=40+2*c1;
 		    	var cy=40+2*c1;
 		    }
 		    cx=cx+"%";
 		    cy=cy+"%";
 		    var circle =  svgContainer.append("circle")
 		                            .attr("cx", cx)
 		                            .attr("cy", cy)
 		                            .attr("r", "7")
 		                            .attr("fill", "#FF5D48")
 		                            .attr("stroke-width", 0)
 		                            .attr("stroke", "#000")
 		                            .on('mouseover', tip.html(tooltipTemplate(obj)).show)
 		                            .on('mouseout', tip.hide);
 		}
 	else if(obj.rating=="2")
		{
			var tip = d3.tip().offset([-10, 0]).attr('class', 'emotion-d3-tip');
		    svgContainer.call(tip);
		    c2++;
 		    if(c2==1){
 		    	var cx=40;
 				var cy=60;
 		    }
 		    else if(c2>1){
 		    	var cx=40+2;
 		    	var cy=60+2;
 		    }
 		    cx=cx+"%";
 		  cy=cy+"%";
		    var circle =  svgContainer.append("circle")
		                            .attr("cx", cx)
		                            .attr("cy", cy)
		                            .attr("r", "7")
		                            .attr("fill", "#FF5D48")
		                            .attr("stroke-width", 0)
		                            .attr("stroke", "#000")
		                            .on('mouseover', tip.html(tooltipTemplate(obj)).show)
		                            .on('mouseout', tip.hide);
		    
		    
			
		}
 	else if(obj.rating=="3")
	{
		var tip = d3.tip().offset([-10, 0]).attr('class', 'emotion-d3-tip');
	    svgContainer.call(tip);
	    c3++;
		    if(c3==1){
		    	var cx=70;
				var cy=40;
		    }
		    else if(c3>1){
		    	var cx=30+2*c3;
		    	var cy=40+2*c3;
		    }
		    cx=cx+"%";
		    cy=cy+"%";
	    var circle =  svgContainer.append("circle")
	                            .attr("cx", cx)
	                            .attr("cy", cy)
	                            .attr("r", "7")
	                            .attr("fill", "#09e57b")
	                            .attr("stroke-width", 0)
	                            .attr("stroke", "#000")
	                            .on('mouseover', tip.html(tooltipTemplate(obj)).show)
	                            .on('mouseout', tip.hide);
	}
 	else if(obj.rating=="4")
	{
		var tip = d3.tip().offset([-10, 0]).attr('class', 'emotion-d3-tip');
	    svgContainer.call(tip);
	    c4++;
		    if(c4==1){
		    	var cx=70;
				var cy=30;
		    }
		    else if(c4>1){
		    	var cx=70+2*c4;
		    	var cy=30+2*c4;
		    }
		    cx=cx+"%";
		    cy=cy+"%";
	    var circle =  svgContainer.append("circle")
	                            .attr("cx", cx)
	                            .attr("cy", cy)
	                            .attr("r", "7")
	                            .attr("fill", "#09e57b")
	                            .attr("stroke-width", 0)
	                            .attr("stroke", "#000")
	                            .on('mouseover', tip.html(tooltipTemplate(obj)).show)
	                            .on('mouseout', tip.hide);
	    
	    
	}
 	else if(obj.rating=="5")
	{
		var tip = d3.tip().offset([-10, 0]).attr('class', 'emotion-d3-tip');
	    svgContainer.call(tip);
	    c5++;
		    if(c5==1){
		    	var cx=60;
				var cy=60;
		    }
		    else if(c5>1){
		    	var cx=60+2*c5;
		    	var cy=45+2*c5;
		    }
		    cx=cx+"%";
		    cy=cy+"%";
	    var circle =  svgContainer.append("circle")
	                            .attr("cx", cx)
	                            .attr("cy", cy)
	                            .attr("r", "7")
	                            .attr("fill", "#09e57b")
	                            .attr("stroke-width", 0)
	                            .attr("stroke", "#000")
	                            .on('mouseover', tip.html(tooltipTemplate(obj)).show)
	                            .on('mouseout', tip.hide);
	}
 	else if(obj.rating=="0")
	{
		var tip = d3.tip().offset([-10, 0]).attr('class', 'emotion-d3-tip');
	    svgContainer.call(tip);
	    c0++;
		    if(c0==1){
		    	var cx=50;
				var cy=50;
		    }
		    else if(c0>1)
		    {
		    	var cx=10+10;
		    	var cy=50;
		    }
		    cx=cx+"%";
		    cy=cy+"%";
	    var circle =  svgContainer.append("circle")
	                            .attr("cx", cx)
	                            .attr("cy", cy)
	                            .attr("r", "7")
	                            .attr("fill", "#EBB70D")
	                            .attr("stroke-width", 0)
	                            .attr("stroke", "#000")
	                            .on('mouseover', tip.html(tooltipTemplate(obj)).show)
	                            .on('mouseout', tip.hide);
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
