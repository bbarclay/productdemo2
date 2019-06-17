/*
	$Id$
	Copyright 2009 iGATE GROUP OF COMPANIES. All rights reserved
	(Subject to Limited Distribution and Restricted Disclosure Only.)
	THIS SOURCE FILE MAY CONTAIN INFORMATION WHICH IS THE PROPRIETARY 
	information of IGATE GROUP OF COMPANIES AND IS INTENDED FOR USE 
	ONLY BY THE ENTITY WHO IS ENTITLED TO AND MAY CONTAIN 
	INFORMATION THAT IS PRIVILEGED, CONFIDENTIAL, OR EXEMPT FROM         
	DISCLOSURE UNDER APPLICABLE LAW.
	YOUR ACCESS TO THIS SOURCE FILE IS GOVERNED BY THE TERMS AND           
	CONDITIONS OF AN AGREEMENT BETWEEN YOU AND IGATE GROUP OF COMPANIES.                  
	The USE, DISCLOSURE REPRODUCTION OR TRANSFER OF THIS PROGRAM IS      
	RESTRICTED AS SET FORTH THEREIN.
*/

/*
	Class Name			: LOGGER
	Class Description	: To create log for debug, info, warn & error
	Class Methods		: 
	Input Parameters	: 
	Returns				: 
	Usage Syntax		: LOGGER()
	Created by 			: iGATE Automation Team
*/
var LOG_UTILS = new (function(){
    var DELIM = "|";
    var LEVEL = 1;
    var LEVEL_NAMES = ["DEBUG", "INFO", "WARN", "ERROR"];

	/*
	    Function Name  : level()
		Description    : return current log level.
						 Optionally, set current log level
	    Parameters     : None
	    Returns        : olevel
	    Author         : iGATE Automation Team
	*/    
    function level() {
        var olevel = LEVEL;

        if (arguments.length > 0) {
            LEVEL = arguments[0];
        }

        return olevel;
    };

    function ZeroPad(i, width) {
        var s = "" + i;     // toString
        while (s.length < width) {
            s = "0" + s;
        }
        return s;
    };

	/*
	    Function Name  : LogTimestamp()
		Description    : Time stamp to be added to every log
	    Parameters     : None
	    Returns        : d.getFullYear
	    Author         : iGATE Automation Team
	*/  
    function LogTimestamp() {
        var d;
        if (arguments.length > 0) { // first arg can be a different date
            d = arguments[0];
        } else {
            d = new Date();
        }
        return d.getFullYear()
            + "." + ZeroPad(d.getMonth()+1, 2)
            + "." + ZeroPad(d.getDate(), 2)
            + " " + ZeroPad(d.getHours(), 2)
            + ":" + ZeroPad(d.getMinutes(), 2)
            + ":" + ZeroPad(d.getSeconds(), 2)
            + ":" + ZeroPad(d.getMilliseconds(), 3);
    };

	/*
	    Function Name  : defaultLogWriter()
		Description    : To writer the default log
	    Parameters     : s: That returns from the 'ZeroPad'
	    Returns        : None
	    Author         : iGATE Automation Team
	*/
    function defaultLogWriter(s) {
        try {
            console.info(s);
            return;
        } catch(oException) {
        }
        try {
            WScript.Echo(s);
            return;
        } catch(oException) {
        }
        try {
            alert(s);
            return;
        } catch(oException) {
        }
        throw "Could not log:" + s + "'";
    };
    
    var WRITER = defaultLogWriter;

	function setLogFile(sLogFileName) {
		if (arguments.length == 0) { // reset any log file
			// TODO: close the file
			WRITER = defaultLogWriter;
			return true;
		}

		var newStream;
		try {
			newStream = FILE_UTILS.openTextFile(sLogFileName, "A");
		} catch(oException) {
        	handleWarning("Can not set logfile to '" + sLogFileName, oException);
			return false;
		}

		function fileWriter(s) {
			var line = LogTimestamp() + DELIM + s;	// prepend timestamp
			newStream.WriteLine(line);
		};

		WRITER = fileWriter;
		return true;
	}

	/*
	    Function Name  : doLog()
		Description    : To writer log
	    Parameters     : level, params
	    Returns        : true/false
	    Author         : iGATE Automation Team
	*/
    function writeLog(level, logger, params) {
        if (!logger.isEnabled(level))
            return null;

        var s = LEVEL_NAMES[level];

		s += DELIM + logger.name;

        for (var i=0; i<params.length; ++i) {
            s += DELIM + STRING_UTILS.toString(params[i]);
        }

        WRITER(s);
        return s;
    };

	function Logger(name) {
		this.toString = function() {
			return "Logger(" + name + ")";
		}

		function isEnabled(level) {
			return level >= LEVEL;
		}

    	function debug() {
        	return doLog(0, arguments);
    	}
    	function info() {
        	return doLog(1, arguments);
    	}
    	function warn() {
        	return doLog(2, arguments);
    	}
    	function error() {
        	return doLog(3, arguments);
    	}

		var x = this;
		function doLog(level, parameters) {
			return writeLog(level, x, parameters);
		}

		function logCallStack(callee, level) {
			try {
				var frames = STACK_UTILS.getFrames(callee);
				for (var i=0; i<frames.length; ++i) {
					var frame = frames[i];
					var s = "Frame[" + i + "]=" + frame + "(" + frame.parameters.join(", ") + ")";
					doLog(level, [s]);
				}
				return true;
			} catch(e) {
				return false;
			}
		}

		this.isEnabled = isEnabled;	// check if log is enabled at a specific level
		this.name = name;

    	this.debug = debug;
    	this.info = info;
    	this.warn = warn;
    	this.error = error;

		this.doLog = doLog;	// used by handleError; TODO: remove this need

		this.logCallStack = logCallStack;

		return this;
	}

	function logger(/*name , context*/) {
		var callerFrame = STACK_UTILS.getTopFrame(arguments.callee.caller);

		var name = arguments[0];

		if (callerFrame)
			name = callerFrame.name;

		if (!name)
			name = "<ANON>";

		var l = new Logger(name);

		if (callerFrame)
			l.debug("Calling context", callerFrame.parameters);

		if (arguments.length > 1)
			l.debug(arguments);	// dump all arguments for debug

		return l;
	}

    this.level = level;
    this.defaultLogWriter = defaultLogWriter;
	this.setLogFile = setLogFile;
	this.Logger = Logger;	// create a Logger by hand, without additional logic

	this.logger = logger;

	return this;
})();

// Default Logger
var LOGGER = LOG_UTILS.logger("<>");
