var STACK_UTILS = new (function(){
	/*
	   Force a maximum frames since recursion is not handled properly
	*/
	var MAX_FRAMES = 20;

	/*
	   Navigate through the stack frames
	   If maxFrames is not provided, MAX_FRAMES is used
		_callee = is usually got as arguments.callee.caller
	*/
	function navigate(callee, funct, maxFrames) {
		if (!maxFrames)
			maxFrames = MAX_FRAMES;

		for (var i=0; callee && (i<maxFrames); ++i) {
			var rc = funct(callee);
			if (rc)
				return rc;
			callee = callee.caller;
		}

		return null;
	}

	/*
		convenience wrapper class for a stack frame
	*/
	function Frame(funct) {
		function name() {
			if (!funct) return "<Global>";

			var fstring = funct.toString();
			if (fstring.match(/^\s*function\s+(\w+)\s*\(/))
				return RegExp.$1;
			return null;
		}
		function parameters() {
			var args = funct.arguments;
			var params=[];

			for(var i=0; i<args.length; i++){
				var s = args[i];

				try {
					s = MISC_UTILS.toString(s);
				} catch(e) {
				}

				params.push(s);
			}

			return params;
		}

		function toString() {
			return "Stack::Frame(" + (this.name? this.name: "anonymous") + ")";
		}

		this.funct = funct;
		this.name = name();	// null if anonymous
		this.parameters = parameters();
		this.toString = toString;

		return this;
	}

	/* get stack frames */
	function getFrames(callee/*, ?maxFrames*/) {
		var frames = [];

		/* check for recursion: since the function would be same; then stop getting grames */
		var hash = { };

		navigate(callee, function(funct) {
			if (hash[funct])
				return true;
			frames.push(new Frame(funct));
			hash[funct] = funct;
		}, arguments[1]);

		return frames;
	}

	/*
	get frame on top of callee
	*/
	function getTopFrame(/*callee*/) {
		// use caller as a default
		var callee = (arguments.length == 0)?  arguments.callee.caller: arguments[0];

		return navigate(callee, function(funct) {
			return new Frame(funct);
		});
	}

	/* Inner classes, exposed for possible reuse */
	this.navigate = navigate;	// general purpose

	// this.Frame = Frame; will be returned. not directly instantiated

	/* Methods typicaly used */
	this.getFrames = getFrames;
	this.getTopFrame = getTopFrame;
	this.toString = function() { return "STACK_UTILS"; };

	return this;
})();
