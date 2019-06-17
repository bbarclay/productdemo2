<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
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
		height:25%;
		background-color: #ddd;
		border-top-left-radius:10px;
		border-top-right-radius:10px;
		border-bottom: 1px solid #d5d5d5;
		padding:15px;
		font-size: 15px;
	}
	.projectBody{
		width:100%;
		height:55%;
		background-color: white;
		border-bottom: 1px solid #d5d5d5;
		padding-top: 20px;
	}
	.projectfooter{
		width:100%;
		height:20%;
		background-color: #ddd;
		border-bottom-left-radius:10px;
		border-bottom-right-radius:10px;
		padding-top: 10px;
	}
	
	ul.projectTiles li{
	    float: left;
	    width: 170px;
	    height: 200px;
	    border: 1px solid #e3e3e3;
	    border-radius: 10px;
	    box-sizing: border-box;
	    text-align: center;
	    position: relative;
	    margin-right: 10px;
	    overflow: hidden;
	    margin-bottom: 10px;
	}
	
	.newProject{
		width:100%;
		height:80%;
		background-color: white;
		border-bottom: 1px solid #d5d5d5;
		padding-top: 20px;
	}
</style>
</head>

<body onload="call()">
	<jsp:include page="../../common/logo.jsp"></jsp:include>
		<div class="marginTop65px"></div>

	<div data-ng-controller="">

		<div class="container">
		<div class="row col-sm-12">
			<div class="col-sm-2"></div>
			<div class="col-sm-8">
				<div class="marginTop50px"></div>
				
				<h2>Users Project Details</h2>
				<div>
					<ul id="existingProject" class="projectTiles"></ul>
				</div>
			</div>
			<div class="col-sm-2"></div>
		</div>
	</div>
	</div>
	
	<script type="text/javascript">
	function call(){
		getProject();
		toggleDiv();
	}
	</script>
	
	<script type="text/javascript">
		function getProject(){
			$
			.ajax({
				type : "GET",
				url : "http://localhost:8080/feedback.com/getSurveys/1",
				contentType : "application/json; charset=utf-8",
				dataType : "json",
				success : function(data) {
					//alert(data);
					//var projectList = JSON.parse(JSON.stringify(data))["surveys"];
					
					var surveyid = [];
					var surveyname = [];
					var projectid = [];
					var totalusers = [];
					var creationtime = [];

					var str="<li><div class='newProject'><h3>create New project</h3></div><div class='projectfooter'></div></li>"; 
					
					for(var i=0;i<data.length;i++){
						//alert(projectList[i]["surveyname"])
						surveyid.push(data[i]["surveyid"]);
						surveyname.push(data[i]["surveyname"]);
						totalusers.push(data[i]["totalusers"]);
						creationtime.push(data[i]["creationtime"]);
					
						str+="<li>";
						//str+="<div class='projectContainer'>";
						str+="<div class='projectTitle' id='projectTitle'><b>"+data[i]["surveyname"]+"</b><a href='javascript:editSurvey("+i+")' id='editsurvey"+i+"'><span class='glyphicon glyphicon-certificate pull-right'></a></span></div>";
						str+="<div class='projectBody' id='projectBody"+i+"'><b>Total User :</b>"+data[i]["totalusers"]+"<br><b>Created On :</b>"+data[i]["creationtime"]+"</div>";
						str+="<div class='projectfooter'><a href='#'>report</a></div>";
						//str+="</div></li>";
						str+="</li>";
					}
					
					$('#existingProject').append(str);
				},
				error : function(jqXHR, textStatus, errorThrown) {
					alert('error: ' + textStatus + ': ' + errorThrown);
				}
			});
		}
		
		function editSurvey(val){
			var str="<a href='#'>Delete</a><br><a href='#'>Edit</a>"; 
			$('#projectBody'+val).html(str);
		}
		
		/* $(document)
		.ready(
				function() {
					console.log("in");
					var navListItems = $('a');
					alert(navListItems);
		}); */
		
		function toggleDiv(){
			console.log("div switched");
			var links = $("#projectTitle").find('a').each(function(e) {
		        console.log("clicked !");
		        e.preventDefault();
		        console.log($(this).attr('href'));
		   // console.log(links);
		});
		}		
		$(function(){
			  $('#editsurvey').click(function(){
			     $('#projectBody').toggle();
			     $('#recover-password').toggle(); 
			  });
			});
	</script>
</body>
</html>