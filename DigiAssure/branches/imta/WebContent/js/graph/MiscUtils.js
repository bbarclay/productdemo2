/*
$Id: MiscUtils.js 1905 2009-08-12 09:36:33Z 710652 $
Copyright 2008 IGATE GROUP OF COMPANIES. All rights reserved
(Subject to Limited Distribution and Restricted Disclosure Only.)
THIS SOURCE FILE MAY CONTAIN INFORMATION WHICH IS THE PROPRIETARY 
INFORMATION of iGATE GROUP OF COMPANIES AND IS INTENDED FOR USE 
ONLY BY THE ENTITY WHO IS ENTITLED TO AND MAY CONTAIN 
INFORMATION THAT IS PRIVILEGED, CONFIDENTIAL, OR EXEMPT FROM         
DISCLOSURE UNDER APPLICABLE LAW.
YOUR ACCESS TO THIS SOURCE FILE IS GOVERNED BY THE TERMS AND           
CONDITIONS OF AN AGREEMENT BETWEEN YOU AND IGATE GROUP OF COMPANIES.                  
The USE, DISCLOSURE REPRODUCTION OR TRANSFER OF THIS PROGRAM IS      
RESTRICTED AS SET FORTH THEREIN.
*/
 
/*
	Class Name			: <MISC_UTILS>
	Class Description	: <contains functions to display error>
	Class Methods		:
	Input Parameters	: None
	Returns				: None
	Usage Syntax		:  
	created by			: iGate Automation Team
*/
var MISC_UTILS = (function() {
	function typeOf(value) {
    	var type = typeof value;
    	if (type === 'object') {
        	if (!value)
				return "null";

            if (typeof value.length === 'number' &&
				!(value.propertyIsEnumerable('length')) &&
				typeof value.splice === 'function')
                return 'array';

			if (typeof value.length === "number" &&
				typeof value.callee === "function" &&
				typeof value.caller === "object")
				return "arguments";
    	}
    	return type;
	}
	
	/*
	Function Name	:boolCast()
	Description		:to convert string "TRUE/FALSE" to boolean
	Input Parameters: value
	Returns			: Boolean
	Usage Syntax	:<class_Object>.boolCast()
	Created by		:iGate Automation Team
*/ 
	function boolCast(value){
		return String(value).toLowerCase()=="true";
	}
	
	function isEmpty(o) {
    	var i, v;
    	if (typeOf(o) === 'object') {
        	for (i in o) {
            	v = o[i];
            	if (v !== undefined && typeOf(v) !== 'function') {
                	return false;
            	}
        	}
    	}
    	return true;
	}

	var defaultErrorString = (new Error()).toString();
	function isError(o) {
		try {
			return o.toString() === defaultErrorString;
		} catch(e) {
			return false;
		}
	}

/*
	Function Name	:filepathToURL()
	Description		:to get url from the given path
	Input Parameters: sFilePath,hostName
	Returns			: URL
	Usage Syntax	:<class_Object>.filepathToURL()
	Created by		:iGate Automation Team
*/    
    
    function filepathToURL(sFilePath,hostName) {
		return "\\" + "\\" + hostName + "\\" + sFilePath.replace(":","$");
	}	
	
/*
	Function Name	:getTempPath()
	Description		:to get the temporary path
	Input Parameters: None
	Returns			:temp path
	Usage Syntax	:<class_Object>.getTempPath()
	Created by		:iGate Automation Team
*/
	function getTempPath() {	
		try {
			var sPath = FILE_UTILS.getSpecialFolder(2);
			sTempPath = sPath+"\\"+"_iTAK";
			FILE_UTILS.createFolder(sTempPath);
			return sTempPath;
		}catch(oException){
			handleError("couldnt get special folder", oException);
		}
	};
	
/*
	Function Name	:fromJsonFile()
	Description		:to get the path for json File
	Input Parameters: None
	Returns			:
	Usage Syntax	:
	Created by		:iGate Automation Team
*/
    function fromJsonFile(filePath) {
		try {
			var sFileContent=FILE_UTILS.readDataFromFile(filePath);
			return eval("(" + sFileContent + ")");
		}catch(oException){
			handleError("error in reading json file", oException, {
				filePath: filePath
			});
		}
	};
	
/*
	Function Name	:sleep()
	Description		:to keep the system in sleep mode
	Input Parameters: Sec
	Returns			:None
	Usage Syntax	:<class_Object>.Sleep()
	Created by		:iGate Automation Team
*/
	function sleep(ms) {
		try {
			var s = ms*1000;
			var dt = new Date();
			dt.setTime(dt.getTime() + s);
			while (new Date().getTime() < dt.getTime());
			
		} catch(oException) {
			handleError("Not able to execute sleep", oException);
		}
	};	
	function wait(iPollFrequency){
		var s = iPollFrequency*1000;
		setInterval(s);
	};
	function toString(o) {
		if (arguments.length == 0)
			return "MISC_UTILS";
		return STRING_UTILS.toString(o);	// for backward compatibility
	}
	
	 var ZeroPad = function(i, width) {
        var s = "" + i;     // toString
        while (s.length < width) {
            s = "0" + s;
        }
        return s;
    };
	
	function getCurrentDateTime() {
		var d = new Date();
		 return d.getDate() + ""+ (d.getMonth()+1) + "" + d.getYear() + "_"
           + ZeroPad(d.getHours(), 2)
           + ZeroPad(d.getMinutes(), 2)
		   + ZeroPad(d.getSeconds(), 2);
            
	}	
	
	function getWindowsUserName(){
		var objShell = new ActiveXObject("WScript.Shell"); 
		var env = objShell.Environment("process");
		return env("username");
	};
	
	
	function getRemoteMachineStatus(sComputer){
		var wmi = GetObject("winmgmts:{impersonationLevel=Impersonate}\\\\.\\root\\cimv2");
		var query = "SELECT * FROM Win32_PingStatus where address = '" + sComputer + "'";
		e = new Enumerator(wmi.ExecQuery(query));
		var data = e.item();
			if(data.StatusCode != 0)
				return false;
		return true
	}		
	
	function openFile(sFilePathandName){
		var objShell = new ActiveXObject("Shell.Application");
		objShell.ShellExecute(sFilePathandName, "", "", "open", 1);
	}

	return {
		typeOf: typeOf,
		isEmpty: isEmpty,
		isError: isError,
    	filepathToURL: filepathToURL,
		getTempPath: getTempPath,
    	fromJsonFile: fromJsonFile,
		sleep: sleep,
		wait : wait,
		toString: toString,
		getCurrentDateTime: getCurrentDateTime,
		getWindowsUserName : getWindowsUserName,
		getRemoteMachineStatus: getRemoteMachineStatus,
		openFile:openFile,
		boolCast:boolCast
	};
})();
