<%-- <!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
 <!-- <meta http-equiv="refresh" content="10" />  -->
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>

<title>Insert title here</title>

</head>
<body>
 <!-- ******CHAT WINDOW****** -->


    <div id="chat" >
      <div class="panel panel-default" style="width:425px; ">
        <div class="panel-heading text-center" style="height: 50px;">
          <button class="chatButton"><img src="styles/images/boticon.png" style="height: 37px; width: 74px;"/>&nbsp;&nbsp;Chat with Minerva </button>
          <span id="minusID" class="title-btns minimize-minus"></span>&nbsp;<span id="arrowId" class="title-btns minimize-arrow-upright" ></span>
          <input type="hidden" id="sUserID" name="sUserID" value="${sessionScope.UserId}" />        
          <input type="hidden" id="sRole" name="sRole" value="${sessionScope.ROLE}" />
        </div>
        <div class="panel-body">
          <div class="conversation"></div>
          <div class="col-sm-12 chatForm">
          <div class="col-sm-8">
            <input id="yousay" class="form-control" placeholder="Say something..."/>
            </div>
            <div class="col-sm-4">
            <span style="color: #505050;" ><i
			class="fa fa-microphone fa-lg" onclick="startDictation1()" style="cursor: pointer; margin-top: 10px;"></i></span>

			<img alt="clear" src="bot/images/clear-icon.png" onclick="clearConversation()" style="height: 20px; width: 20px; cursor: pointer; margin-left: 2px;">
			
			<img alt="speakOut" src="bot/images/speakout.jpg" onclick="speakOut()" style="height: 15px; width: 20px; cursor: pointer; margin-left: 2px;">
			<i id="notifyID" class="fa fa-bell" style="font-size:16px; margin-left: 2px; cursor: pointer;"></i>
			<i id="notifyID1" class="fa fa-bell-slash" style="font-size:16px; margin-left: 2px; cursor: pointer;"></i>
			</div>
          </div>
        </div>
      </div>
    </div> 
    
    
     <div id="chatajaxloader" class="modal" style="display: none">
        <div class="center" style="margin-left: 980px; margin-top: 350px;">
            <img alt="" style="width: 115px; height: 115px;" src="bot/images/loader2.gif" />
        </div>
    </div>
    <!-- ******END OF CHAT WINDOW****** -->
    <script type="text/javascript" src="chat3.js"></script>
</body>

</html>
 --%>












<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="org.json.simple.JSONArray,org.json.JSONException,org.json.simple.JSONObject"
	%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<!-- META SECTION -->

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
 <!-- <meta http-equiv="refresh" content="10" />  -->
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="js/app-ajax.js" type="text/javascript"></script>

<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.5.0/css/all.css'>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>

.open-button {
 
}

/* The popup chat - hidden by default */
.chat-popup {
  display: none;
  position: fixed;
  bottom: 15%;
  right: 15px;
  border: 3px solid #f1f1f1;
  z-index: 9;
 /*  background-color: #555;
 box-shadow: 0 5px 10px 0 rgba(0, 0, 0, 0.2), 0 10px 30px 0 rgba(0, 0, 0, 0.19); */
 border-radius: 3%;
}

div.chatBox{
 height: 350px;
  overflow: auto;
  background: #fffffb;
  
}


div.bottop{
background-color: #7979ff;
width: 100%;
color: white;
margin-bottom: 10px;

}

.dot {
  height: 10px;
  width: 10px;
  background-color: #66ff66;
  margin-left:2px;
  margin-right: 6px;
  border-radius: 50%;
  display: inline-block;
}

/* Add styles to the form container */
.form-container {
  width: 300px;
  padding: 10px;
  background-color: white;
}

/* Set a style for the submit/send button 
.form-container .btn {
  background-color: #4CAF50;
  color: white;
  
  border: none;
  cursor: pointer;
  
 border-radius: 20%;
  margin-bottom:10px;
  opacity: 0.8;
}
*/

/* Add a red background color to the cancel button */
/*
.form-container .cancel {
  background-color: red;
   color: white;
    border-radius: 40%;
  border: none; 
  
   background-color: DodgerBlue;
  border: none;
  color: white;
 margin-top:10px;
  font-size: 16px;
  cursor: pointer;
  

}*/

/* Add some hover effects to buttons */
.form-container .btn:hover,   {
  opacity: 1;
}

 #myBtn {
  
  position: fixed;
  bottom: 20px;
  right: 30px;
  z-index: 99;
  font-size: 18px;
  border: none;
  outline: none;
  background-color: teal;
  color: white;
  cursor: pointer;
  padding: 15px;
  border-radius: 40%;
}

#myBtn:hover {
  background-color: olive;
}
/*
 #input {
    
    border: 2px solid gray;
    border-radius: 2px;
    padding: 3px;
  }*/

</style>
<!-- end chatbot -->
<!-- chatbot  -->	

<!-- uncomment if bot doesn't work  
<style>
body {
  font-family: Arial, Helvetica, sans-serif;
  font-size: 20px;
}
</style>

-->
</head>
<body > <!-- this line is conflicting with sentiment analysis data  -->
<button type="submit" onclick="openBot()" id="myBtn" title="Chat with Us"  > 
<span class= 'fas fa-comment-dots'>

</span>
</button>
<div class="chat-popup" id="myBot">

 <form class="form-container" action="digichatbot" > 
<div class="bottop">
<label style="font-size:18px">DigiBot</label>

<img src= "styles/images/boticon.png" alt="boticon" width="42" height="42" align="left" style="margin: 5px;" />
<br>
<span class="dot"></span><label style="font-size:13px">Online</label>

</div>
	<div  class = 'chatBox' id= "botbox">
	
	
	</div>
	
	<input id="input" name="inp" type="text" placeholder="Type a message" autocomplete="off" style="width: 100%;"> 
	  
	<!--   <button type="button" class="btn cancel" style="font-size:24px" onclick="closeForm()"> <i class="material-icons">cancel</i></button> -->
	</form>
	
</div>

<script type="text/javascript">

       
        		var accessToken = "3809a01bde584b0b8b97b2158e4711a3";
        		var baseUrl = "https://api.api.ai/v1/";
        		$(document).ready(function()
        		{
        			$("#input").keypress(function(event) 
        			 {
        				if (event.which == 13) 
        				 {
        					
        					$('.chatBox').append('<span class="userInput" style="background-color:#0FB0DF;color :white; float:right; display: inline-block; padding: 12px 20px; border-radius: 10px;">' + $('input').val() + '</span><br><br>')
        					event.preventDefault();
        					let query  = $('input').val()
        					$('input').val('')
        				    sendinp(query);
        					send(query);
        					
        				
        				}
        			});
        		});
        		
        	    function sendinp(query) 
        	    {
        			var inp= query ;
        			  $.ajax(
        			   {
        				  type: "POST",
        		            url: 'Chatbotinput',
        		            data: {input: inp},
        		            
        		            success: function(data)
        		             {
        		              
        		             },
        		            error: function()
        		             {
        		            	//alert('error');
        		             }
        		        }
        		    );
        		}
        	    
        		function send(query)
        		 {
        			var text = query;
        			$.ajax(
        			 {
        				type: "POST",
        				url: baseUrl + "query?v=20180101",
        				contentType: "application/json; charset=utf-8",
        				dataType: "json",
        				headers: 
        				 {
        					"Authorization": "Bearer " + accessToken
        				 },
        				data: JSON.stringify({ query: text, lang: "en", sessionId: "somerandomthing" }),
        				success: function(data) 
        				 {
        					setResponse(data);
        					
        					
        				 }
        				 
        			 }
        			 
        			 );
        		}
        		
        		function setResponse(val) 
        		 {
        			var str = val.result.fulfillment.speech;
        			 var suggest= str.includes("open _suggestionlist");
        			 var fulllist= str.includes("full_list");
        			 var n = str.includes("http");
        			 var host= window.location.hostname;
        			 var port= window.location.port;
        			 var protocol= window.location.protocol;
        		   
        			 if(n)
        			   {
        				 var temp = str.replace("localhost", host);
        				// var tempp= temp.replace("http",protocol);
        				  var res = temp.replace("8080", port);
        			
        				 var abc= '<a href="' + res + '">Please Click Here</a>';
        			
        				  $(".chatBox").append('<img src= "styles/images/boticon.png" alt="boticon" width="42" height="42"><span class="responseData"  style="background-color:#eee; display: inline-block; padding: 12px 20px; padding-right: 2px; text-align:center; border-radius: 10px;">'+ abc + '</span><br><br>');
        				  $(".chatBox").animate({ scrollTop: $(this).height() }, "slow");
        				  sendout(abc);
        			   } 

        			    else if (suggest)
        			     {
        			    	var mk= 'http://localhost:8080/Mydigi/integratedQALabs/mobileLab/deviceSelectionMatrix/marketTrends?market=1';
        			        var mtemp = mk.replace("localhost", host);
        			        var mtrends = mtemp.replace("8080", port);
        			        var ut= 'http://localhost:8080/Mydigi/integratedQALabs/mobileLab/deviceSelectionMatrix/userTrends';
        			        var utemp=ut.replace("localhost", host);
        			        var utrends= utemp.replace("8080", port);
        			        var dr= 'http://localhost:8080/Mydigi/integratedQALabs/mobileLab/deviceSelectionMatrix/recommendDevice?market=GLOBAL&count=20';
        			        var dtemp= dr.replace("localhost", host);
        			        var drecomm= dtemp.replace("8080", port);
        			        var mlm= 'http://localhost:8080/Mydigi/integratedQALabs/mobileLab/deviceSelectionMatrix/showLabDetails';
        			        var mltemp= mlm.replace("localhost", host);
        			        var moblab= mltemp.replace("8080", port);
        			        var sa= 'http://localhost:8080/Mydigi/digitalQAService/userExperienceTesting/sentiment/detailReport.jsp';
        			        var stemp= sa.replace("localhost", host);
        			        var sanaly= stemp.replace("8080", port);
        			        var uea='http://localhost:8080/Mydigi/digitalQAService/userExperienceTesting/analytics/integrated.jsp';
        			        var uetemp= uea.replace("localhost", host);
        			        var ueanaly= uetemp.replace("8080", port);
        			        var mat= 'http://localhost:8080/Mydigi/integratedQALabs/mobileLab/deviceSelectionMatrix/marketTrends?market=1';
        			        var matemp= mat.replace("localhost", host);
        			        var matest= matemp.replace("8080", port);
        			        var crbtest='https://www.browserstack.com/';
        			        var crbauto= 'http://in-pnq-coe19:8081/OPTIK/activate';
        			   
        			         var list= '<ul> <li><a href=" ' + mtrends + ' " style="text-decoration: none">Market Trends</a></li> <li><a href=" ' + utrends + ' " style="text-decoration: none">User Trends</a></li> <li><a href=" ' + drecomm + ' " style="text-decoration: none">Device Recomendation</a></li> <li><a href=" ' + moblab + ' " style="text-decoration: none">Mobile Lab Management</a></li> <li><a href=" ' + sanaly + ' " style="text-decoration: none">Sentiment Analytics</a></li> <li><a href=" ' + ueanaly + ' " style="text-decoration: none">User Experience Analytics</a></li> <li><a href=" ' + matest + ' " style="text-decoration: none">Mobile Apps Testing</a></li> <li><a href=" ' + crbtest + ' " target="_blank" style="text-decoration: none">Cross Browser Testing</a></li> <li><a href=" ' + crbauto + ' " target="_blank" style="text-decoration: none">Cross Browser Automation</a></li></ul> Want Something else?';
        			        
        			        $(".chatBox").append('<img src= "styles/images/boticon.png" alt="boticon" width="42" height="42"><span class="responseData"  style="background-color:#eee; display: inline-block; padding: 12px 20px; padding-right: 2px; text-align:center; border-radius: 10px;">'+ list + '</span><br><br>');
        				  $(".chatBox").animate({ scrollTop: $(this).height() }, "slow");
        				  sendout(list);
        			    }  
        			 
        			     else if (fulllist)
        			     {
        			    	 var ct= 'http://localhost:8080/Mydigi/common/WorkInProgress.jsp';
        			    	 var ctemp= ct.replace("localhost", host);
        			    	 var ctest= ctemp.replace("8080", port);
        			    	 var iot= 'https://partners.app.perfectomobile.com/';
        			    	 var pd= 'http://localhost:8080/Mydigi/common/WorkInProgress.jsp';
        			    	 var ptemp= pd.replace("localhost", host);
        			    	 var paydev= ptemp.replace("8080", port);
        			    	 var at='http://localhost:8080/Mydigi/digitalQAService/accessibilityTesting/viewAllocatedBatch';
        			    	 var atemp= at.replace("localhost", host);
        			    	 var atest = atemp.replace("8080", port);
        			    	 var uft='http://localhost:8080/Mydigi/digitalQAService/crowdSourcing#/';
        			    	 var utemp= uft.replace("localhost", host);
        			    	 var uftest= utemp.replace("8080", port);
        			    	 var sms= 'http://localhost:8080/Mydigi/digitalQAService/socialMediaSentiment/socialMediaSentiment.jsp';
        			    	 var stemp= sms.replace("localhost", host);
        			    	 var smsent= stemp.replace("8080", port);
        			    	 var aa= 'http://localhost:8080/Mydigi/console/runHome?toolName=Automated_Accessibility';
        			    	 var aatemp= aa.replace("localhost", host);
        			    	 var aacc= aatemp.replace("8080", port);
        			    	 var mct= 'http://localhost:8080/Mydigi/digitalQAService/mobileCertification/mac.jsp';
        			    	 var mctemp= mct.replace("localhost", host);
        			    	 var mctest= mctemp.replace("8080", port);
        			    	 var dpt='http://localhost:8080/Mydigi/common/WorkInProgress.jsp';
        			    	 var dtemp= dpt.replace("localhost", host);
        			    	 var dptest= dtemp.replace("8080", port);
        			    	 var it= 'http://localhost:8080/Mydigi/console/runHome?toolName=CGAF_Perfecto';
        			    	 var itemp= it.replace("localhost", host);
        			    	 var iottest= itemp.replace("8080", port);
        			    	 var pt= 'http://localhost:8080/Mydigi/console/runHome?toolName=CGPF_Neoload';
        			    	 var ptemp= pt.replace("localhost", host);
        			    	 var ptest= ptemp.replace("8080", port);
        			    	 var st= 'http://localhost:8080/Mydigi/common/WorkInProgress.jsp';
        			    	 var stemp= st.replace("localhost", host);
        			    	 var stest= stemp.replace("8080", port);
        			    	 var bd= 'http://localhost:8080/Mydigi/console/runHome?toolName=CGAF_Cucumber_Appium';
        			    	 var btemp= bd.replace("localhost", host);
        			    	 var bdd= btemp.replace("8080", port);
        			    	 var sea= 'http://localhost:8080/Mydigi/common/WorkInProgress.jsp';
        			    	 var setemp= sea.replace("localhost", host);
        			    	 var seraut= setemp.replace("8080", port);
        			    	 var usa='http://localhost:8080/Mydigi/console/runHome?toolName=CGAF_Usability';
        			    	 var ustemp= usa.replace("localhost", host);
        			    	 var usaut= ustemp.replace("8080", port);
        			    	 var uia='http://localhost:8080/Mydigi/console/runHome?toolName=CGAF_LayoutTesting';
        			    	 var uitemp= uia.replace("localhost", host);
        			    	 var uiaut= uitemp.replace("8080", port);
        			    	 var app='http://localhost:8080/Mydigi/console/runHome?toolName=Appium_Grid';
        			    	 var aptest= app.replace("localhost", host);
        			    	 var appium= aptest.replace("8080", port);
        			    	 
        			    	 
        			
        			    	 var list= '<ul><li><a href=" ' + atest + ' " style="text-decoration: none">Accessibility Testing</a></li> <li><a href=" ' + aacc + ' " style="text-decoration: none">Automated Accessibility</a></li><li><a href=" ' + iottest + ' " style="text-decoration: none">IOT Testing</a></li> <li><a href=" ' + ptest + ' " style="text-decoration: none">Performance Testing</a></li><li><a href=" ' + bdd + ' " style="text-decoration: none">BDD Automation</a></li> <li><a href=" ' + usaut + ' " style="text-decoration: none">Usability Automation</a></li> <li><a href=" ' + uiaut + ' " style="text-decoration: none">UI Automation</a></li> <li><a href=" ' + appium + ' " style="text-decoration: none">Appium Grid</a></li></ul>';
        			    	 
        			    	 $(".chatBox").append('<img src= "styles/images/boticon.png" alt="boticon" width="42" height="42"><span class="responseData"  style="background-color:#eee; display: inline-block; padding: 12px 20px; padding-right: 2px; text-align:center; border-radius: 10px;">'+ list + '</span><br><br>');
        					  $(".chatBox").animate({ scrollTop: $(this).height() }, "slow");
        					  sendout(list);
        			     }
        			     else
        			      {
        			    	
        				     $(".chatBox").append('<img src= "styles/images/boticon.png" alt="boticon" width="42" height="42"><span class="responseData"  style="background-color:#eee; display: inline-block; padding: 12px 20px; padding-right: 2px; text-align:center; border-radius: 10px;">'+ str + '</span><br><br>');
        				     $(".chatBox").animate({ scrollTop: $(this).height() }, "slow");
        				     sendout(str);
        				     
        				    
        			      }
        			 
        		//	 $(".chatBox").append('<img src= "styles/images/boticon.png" alt="boticon" width="42" height="42"><span class="responseData"  style="background-color:#eee; display: inline-block; padding: 12px 20px; padding-right: 2px; text-align:center; border-radius: 10px;">'+ val.result.fulfillment.speech + '</span><br><br>');
        		}	
        		
        		//scroll to top automatically



          
            function sendout(list) 
        	 {
        			var out= list ;
        			  $.ajax(
        			   {
        				  type: "POST",
        		            url: 'Chatbotoutput',
        		            data: {output: out},
        		            
        		            success: function(data)
        		            {  
        		            	
        		            	
        		            	
        		            },
        		            error: function()
        		            {
        		            	 //alert('outputerror');
        		            }
        		         }
        		    );	
        	}
        	
        
       
        
function scrollFunction() {
  if (document.body.scrollTop > 5 || document.documentElement.scrollTop > 5) {
    document.getElementById("myBtn").style.display = "block";
  } else {
    document.getElementById("myBtn").style.display = "block";
  }
}

// When the user clicks on the button,opens bot popup
 
function openBot() {
	
	
	var x= document.getElementById("myBot");
	 if (x.style.display === ""||x.style.display === "none") {
		    x.style.display = "block";
		    
		    $.ajax(
		    	    {                                //modify this to get data from backend
		    		  type: "GET",
		                url: 'chathistory',
		                datatype: 'json',
		               
		                
		                success: function(data)
		                {
		                console.log(data);  //displayes all hist without refresh
		               // alert(data);
		                checkhistory(data)
		               
		               // alert('history success');
		                },
		                error: function(data)
		                {
		                console.log(data);
		               // alert('history error');
		                }
		             }
		        );
		    
		  } else {
		    x.style.display = "none";
		  }
	  //document.getElementById("myBot").style.display = "block";
	 
	  
}

function checkhistory(data)
{    
      var hist= data;
      console.log('hist in checkhistory is'+hist);
     
       if(hist!=null)
        { 
    	  
    	
    		
       //	var alldata= application.getAttribute("sendingg");  // skips the last data entered without refresh
     <% 
    // JSONArray aldata=(JSONArray)pageContext.getAttribute("opp",PageContext.APPLICATION_SCOPE);
     JSONArray aldata=(JSONArray) session.getAttribute("sendingg");
      // Object aldata= request.getAttribute("opp");
       out.println("hellobot : "+aldata);
      application.setAttribute("pass", aldata);
      
       %>
        
      var alldata= <%= application.getAttribute("pass") %>
    
      console.log('alldata: '+ alldata)
      console.log(alldata.length);
      for(var i=0; i<=alldata.length; i++)
   	   {
   	   //console.log(alldata[i].message);
   	   
   	  
       	
       	
       	   if(alldata[i].sender=='11101')
       	    	{
       	          $('.chatBox').append('<img src= "styles/images/boticon.png" alt="boticon" width="42" height="42"><span class="responseData"  style="background-color:#eee; display: inline-block; padding: 12px 20px; padding-right: 2px; text-align:center; border-radius: 10px;">'+ alldata[i].message + '</span><br><br>')
       	       
       	    	}
       	    else
       	       {
       	    	  $('.chatBox').append('<span class="userInput" style="background-color:#0FB0DF;color :white; float:right; display: inline-block; padding: 12px 20px; border-radius: 10px;">' + alldata[i].message + '</span><br><br>')
       	    	 
       	       }
       	
       	  }
     
        }
      
       
}

/* $( '#myBot' ).load( "DigiChatBot.jsp", function() {
	  alert( "Load was performed." );
	});
 */
/*
function closeForm() {
	  document.getElementById("myBot").style.display = "none";
	}*/
</script>

<!-- chat bot ends -->

</body>
</html>