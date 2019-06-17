<!DOCTYPE HTML>
<html>
<head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
       <script src="${pageContext.request.contextPath}/js/graph/canvasjs.min.js"></script>
       <title>CanvasJS Example</title>
       
<link rel="stylesheet" href="../../styles/css/digi.css">
</head>

<body onload="genGraph()">
<script type="text/javascript">
function genGraph() {

	$.ajax({
				type : "GET",
				url : "${pageContext.request.contextPath}/digitalQAService/userExperienceTesting/sentimentAnalysis/sentimentBreakdown",
				contentType : "application/json; charset=utf-8",
				dataType : "json",
				success : function(data) {
					
					negative = (data.results.negative);
					positive = (data.results.positive);
					neutral = (data.results.neutral);
					total= negative+positive+neutral;
						
							  var chart = new CanvasJS.Chart("chartContainer", {
		                           title: {
		                                  text: "Basic Column Chart"
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
</script>
       <div id="chartContainer"></div>
</body>

</html>
