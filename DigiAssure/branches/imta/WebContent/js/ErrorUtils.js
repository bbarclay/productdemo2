/*
$Id: ErrorUtils.js 1783 2009-07-19 05:04:20Z 501349 $
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
	Class Name:	<ERROR_UTILS>
	Class Description: <contains functions to handle error>
	Class Properties: 
	Class Methods:
	Input Parameters: None
	Returns: None
	Usage Syntax:  
	created by :   <User ID >, iGate Automation Team
*/

var ERROR_UTILS = (function() {
	var CALL_STACK_LOG_LEVEL = 0;  // log callstack if in DEBUG
	// TODO: make this log level configurable

	var debugOnError = undefined;
/*
	function Name: <errorUtils.handle>
    function Description: <logs the error>  
    Functions called:                        
    Input Parameters: <args, isWarning>
    Returns: errorUtils
*/   
    function handle(args, isWarning) {
        var msg = LOGGER.doLog((isWarning? 2: 3), args);
		if (msg == null)
			msg = args[0]; 

		if (LOGGER.isEnabled(CALL_STACK_LOG_LEVEL)) { // log the stack frame too if in DEBUG|INFO
			var caller = arguments.callee.caller.caller;
			LOGGER.logCallStack(caller, CALL_STACK_LOG_LEVEL);
		}

        if (isWarning)
			return;

		{ // rethrow, if there is already another error
			var cascadedErr = args[1];
			var isOriginal = false;
			try {
				isOriginal = cascadedErr._isOriginal;
			} catch(e) {
			}
			if (isOriginal)
				throw cascadedErr;
		}

		// throw a new error
		var description = "Unexpected error encountered\n";
		description += "\n>>> " + args[0];
		if (MISC_UTILS.isError(args[1])) {
			description += "\n>>> " + args[1].description;
		}
		description += "\n\nContact support if the problem persists\nSee logs for additional details";

		var error = new Error(description);
		error._details = msg;
		error._isOriginal = true;
		error.toString = function() {
			return this.description;
		}

		// invoke debugger if debugger is enabled
		if (debugOnError == undefined) {
			debugOnError = false;
			try {
				debugOnError =
					CONFIG_PARAMS.getParam("DEBUG_ON_ERROR").toUpperCase() == "YES";
			} catch(e) {
			}
		}
		if (debugOnError) {
			debugger;
		}

        throw(error);
    };

    return {
		handle: handle
	};
})();

/*
	function Name; handleError
	function Description:
		Default handling of error situations
		* Log the error
		* Bubble it to the top
    Input Parameters: <msg>
    Returns: none
    Usage Syntax: 
    created by :  <User ID >, iGate Automation Team
*/

function handleError(msg /*[, Exception, Params]*/) {
    ERROR_UTILS.handle(arguments, false);
}

/*
	function Name; HandleWarning
	function Description:
		Logs the warning
		TODO: optionally, throw the error
    Input Parameters: <msg>
    Returns: none
*/
function handleWarning(msg /*[, Exception, Params]*/) {
    ERROR_UTILS.handle(arguments, true);
}

