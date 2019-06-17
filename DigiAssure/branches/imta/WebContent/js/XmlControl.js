
  function dotest(file, tcName){
    try{
		var getTCStartTime = 0;
		var getTCEndTime = 0;
		var tcFlag = false;
		var emts = []; 
    
		XML_UTILS.readXmlFile(file, tcName, function(aTCEvents) {
    function isEmpty(obj) {
        for(var key in obj) {
          if(obj.hasOwnProperty(key))
            return false;
          }
          return true;
      }
			if(aTCEvents.length>0){
			
				var tcTimeStamp = [];
				cnt = 0;
				for(var evt=0; evt<aTCEvents.length; evt++){
					var step = {};
					for(var attrib=0; attrib<aTCEvents[evt].attributes.length; attrib++){
						
			  
						evAttrib = aTCEvents[evt].attributes[attrib];
						if(evAttrib.nodeName == "tcStartTime"){
							getTCStartTime = evAttrib.nodeValue;
						}
						if(evAttrib.nodeName == "TimeStamp"){
						
							if(aTCEvents[evt].attributes[0].nodeValue == "start"){		
                
	              tcTimeStamp[cnt] = Time_UTILS.timeFormatHMS(parseInt(evAttrib.nodeValue)); 
								//tcTimeStamp[cnt] = evAttrib.nodeValue;	
                //stepStartTime = evAttrib.nodeValue;	
								cnt = cnt + 1;								
							}
							//tcTimeStamp[cnt] = evAttrib.nodeValue;
							
							//step.gettimestamp = evAttrib.nodeValue;
						}
						
						
						if(evAttrib.nodeName == "tcEndTime"){
							getTCEndTime = evAttrib.nodeValue;
						}
						
						if(evAttrib.nodeValue == "start"){
							if(aTCEvents[evt].attributes[attrib+1].nodeName=="key"){
								step.key = aTCEvents[evt].attributes[attrib+1].nodeValue;
								//WScript.Echo(step.key);
							}
						}
							
					}
					//error do it - 

					// Display event parameters
					if(aTCEvents[evt].params.length > 0){
						var parameters = [];
					  //WScript.Echo("Event Parameters are....");  
					  for(var param=0; param<aTCEvents[evt].params.length; param++){
							var paramDef = {}
							//WScript.Echo(aTCEvents[evt].params[param].text);
							evParam = aTCEvents[evt].params[param];
							if(evParam.tagName == "Error"){							
								paramDef.name = "Error: " + evParam.text;
								tcFlag = true;
							}else{
								paramDef.name = evParam.text;
							}
							parameters.push(paramDef);
					  }
					  step.parameters = parameters;
					}
					
					

			if(!isEmpty(step))
			  emts.push(step);

				}
				
				//Time Calculate
				//WScript.Echo("Time");
				//var tcExeTime = Time_UTILS.getSecsDiffInTimeFormat(getTCStartTime, getTCEndTime);
				var tcExeTime = Time_UTILS.dateDiffInTime(getTCStartTime, getTCEndTime);
				var tcStatus;
				if(tcFlag == true){	
					tcStatus = "Failed"
				}else{
					tcStatus = "Passed"
				}
				emts.push(tcTimeStamp);
				emts.push(tcStatus);
				emts.push(tcExeTime);
			//WScript.Echo(emts)
			
			
			//WScript.Echo(name + " " +value)
	  	
		} else{
			emts.push(null);
		}
		
		});
		return emts;
    }catch(e){
      throw "Failed to read Xml file"
    }
   }

