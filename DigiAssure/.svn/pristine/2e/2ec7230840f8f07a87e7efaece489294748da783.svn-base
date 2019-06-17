/*
$Id: MiscUtils.js 1176 2009-03-25 10:00:49Z 501349 $
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
	Class Name			: <STRING_UTILS>
	Class Description	: contains functions to convert data into text
	Class Methods		:
	Input Parameters	: None
	Returns				: None
	Usage Syntax		:  
*/
var STRING_UTILS = (function() {
    var defaultObjectToString = new Object().toString();
    var defaultErrorToString = new Error().toString();

    function objToString(o, filter) {
       	var s = o.toString();
       	if (s == defaultErrorToString)
           	return errToString(o);
       	if (s != defaultObjectToString) // toString() overridden
           	return s;

        s = "{";
        var d = "";
        for (var attr in o) {
			if (filter && filter(attr))
				continue;
            s += d + attr + "='" + o[attr] + "'";
            d = ",";
        }
        return s + "}";
    };

	function arrayToString(a) {
		var s = "#" + a.length + "[";
		var d = "";
		for (var ix in a) {
			var o = a[ix];
			s += d + objToString(o);
			d = ",";
		}
		s += "]";
		return s;
	}
	
    function errToString(err) {
		var n = err.number;
        return "Error{" + (n == null? "": (n + ", ")) + err.description + "}";
    };

	function argsToString(a) {
		var s = "Arguments#" + a.length + "(";
		var d = "";
		for (var ix=0; ix<a.length; ++ix) {
			var o = a[ix];
			s += d + toString(o);
			d = ",";
		}
		s += ")";
		return s;
	}

    function toString(o) {
        if (arguments.length === 0)  // overloading toString()
            return "STRING_UTILS";

		try {
			switch(MISC_UTILS.typeOf(o)) {
			case "function":
				var fstring = o.toString();
				if (fstring.match(/^\s*function\s+(\w+)\s*\(/))
					return RegExp.$1 + "()";
				return "anonymous()";

			case "object":
                return objToString(o);

			case "array":
				return arrayToString(o);

			case "arguments":
				return argsToString(o);

			case "null":
				return "null";
        	}
			return o.toString();
		} catch(e) {
		}
        return o;   // scalar, null, undefined etc.
    };

	return {
    	objToString: objToString,
    	errToString: errToString,
    	toString: toString
	};
})();
