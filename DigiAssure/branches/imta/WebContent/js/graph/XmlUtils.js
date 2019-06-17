
/*
	Class Name			: XML_UTILS()
	Class Description	: To handle the XML files
	Class Methods		: reaXmlFile
	Input Parameter		: None
	Return				: XML Utilities
	Created By			: iGATE Automation Team
*/
var XML_UTILS = (function(){

/*
	Function Name	: readXmlFile()
	Description		: Function to load the XML file	and does the action defined by handlerFunct		
	Parameters		: xmlFilePath , handlerFunct
	Returns			: xml Object
	Usage Syntax	: <ClassName>.loadXML(xmlFilePath,function(xmlEvents){});
	Author			: iGATE Automation Team
*/	

	function readXmlFile(xmlFilePath, testCaseName, handlerFunct) {
		
		try {
		
		//Added	
		tcFlag = false;
		tcbreak = false;
		var aAllEvents = [];
		
		var Scr  = new ActiveXObject("Scripting.FileSystemObject");
		
		var CTF = Scr.OpenTextFile(xmlFilePath, 1, true);
		var data = CTF.ReadAll(); 
		var n = data.split("<event");
		//alert(n.length);
		for(var i=1; i<n.length-1; i++){			
			var oXML = new ActiveXObject("Microsoft.XMLDOM"); 
			oXML.loadXML("<event "+n[i]);
			aAllEvents[i-1] = oXML;
		}
		CTF .Close();
		//Added
		if(data.indexOf(testCaseName) != -1){
			var aTCEvents = [];
			for (var allXML=0; allXML<aAllEvents.length; allXML++){
			var oXmlDoc;   
			try{
				oXmlDoc = new ActiveXObject("Microsoft.XMLDOM"); 
				oXmlDoc.async = false;
			} catch(oException) {
				handleError("Error while creating ActiveXObject", oException);
			}  
			
			try{
				oXmlDoc.load(aAllEvents[allXML]); 
			}catch(oException) {
				handleError("Error while loading XML", oException, {
					file: configXmlFilePath
				});
			} 
			if (oXmlDoc.parseError.errorCode != 0) {
				var myErr = oXmlDoc.parseError;
				handleError("Error while parsing XML", {
					file: configXmlFilePath,
					errorCode: myErr.errorCode,
					errorReason: myErr.reason
				});
			}		
			
			
			
			var aTags = oXmlDoc;
			//WScript.Echo("Commencing action.");
				if(aTags.firstChild.attributes.length > 0){
					var aAllNodes = aTags.childNodes;
					//get Count of TestCase Attributes
					for(var j=0; j<aAllNodes.length; j++){
						if(aAllNodes[j].getAttribute("tcName") == testCaseName){	
								tcFlag = true;							
						}
						if(tcFlag == true){
							var step = aAllNodes[j];
							var oEvent = {} ;
							oEvent.attributes = [];
							oEvent.params = [];
							oEvent.status = [];
							oEvent.attributes = step.attributes;
							oEvent.params = step.childNodes;
							aTCEvents.push(oEvent);	
							if(aAllNodes[j].getAttribute("tcName") == testCaseName){
								if(aAllNodes[j].getAttribute("type") == "end"){	
									tcFlag = false;
									tcbreak = true;
									break;
								}
							}	
						}
					}	
				}	
				if(tcbreak == true){
					break;
				}
			}
				var rc = handlerFunct(aTCEvents); 
				if (rc){
					return rc;	
				}					
				return null;		
		}else {
			return null
		}
		
		} catch(oException) {
			handleError("Handle XML Elements", oException, {
				File: xmlFilePath
			});
		} 
		
	};

	return {
		readXmlFile: readXmlFile
	};    
})();
