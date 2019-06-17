//Date: November 25th 2013
var Time_UTILS = (function() {
  
  
  /*
    Date Diff In Millisecs and return object  
  */
  function dateDiffInMillisecs(date1, date2){
    var dateMillisec = date2-date1;
    return dateMillisec;
  }  
  
  /*
    Date Diff In Secs and return object  
  */
  function dateDiffInSecs(date1, date2){
    var dateMillisec = date2-date1;
    var secs = millisectosecs(dateMillisec);
    return  secs;
  } 
 
 /*
    Date Diff In Secs and return object  
  */
  function dateDiffInTime(date1, date2){
    var dateMillisec = date2-date1;
    var secs = millisectosecs(dateMillisec);
    return  seconds2time(secs);
  } 

  /*
    timeStampFormatHMS and return object
    Hours:Mins:Secs
  */
  function timeFormatHMS(date){
    var d = new Date(date);
    var timeStamp = d.getHours() + ":" + d.getMinutes() + ":" + d.getSeconds();
    return timeStamp;
  } 


  /*
    timeFormatHMSMs and return object 
    Hours:Mins:Secs:Millisec
  */
  function timeFormatHMSMs(date){
    var d = new Date(date);
    var timeStamp2 = d.getHours() + ":" + d.getMinutes() + ":" + d.getSeconds() + ":" + d.getMilliseconds();
    return timeStamp2;
  }  
  
  /*
    Date Format and return object  
  */
  function dateFormat(date){
    var dateFormat = new Date(date);
    var dateStamp = dateFormat.getDate() + "/" + dateFormat.getMonth() + "/" + dateFormat.getFullYear();
    return dateStamp;
  }  

   /*
    Conversion of Millisecs to Secs and return object  
  */
  function millisectosecs(millisec){
    var secs = Math.floor(millisec / 1000);
    return secs;
  }  
  
  
  /*
    Conversion of Secs to Time Format and return object  
  */
	function seconds2time(seconds) {
	  var hours   = Math.floor(seconds / 3600);
	  var minutes = Math.floor((seconds - (hours * 3600)) / 60);
	  var seconds = seconds - (hours * 3600) - (minutes * 60);
	  var time = "";

	  if (hours != 0) {
	    time = hours+":";
	  }
	  if (minutes != 0 || time !== "") {
	    minutes = (minutes < 10 && time !== "") ? "0"+minutes : String(minutes);
	    time += minutes+":";
	 	}
	  if (time === "") {
	    time = seconds+"s";
	  }
	  else {
	    time += (seconds < 10) ? "0"+seconds : String(seconds);
	  }
	  return time;
  } 

  return {
    dateDiffInMillisecs: dateDiffInMillisecs,
    dateDiffInSecs: dateDiffInSecs,
    dateDiffInTime: dateDiffInTime,
    timeFormatHMS: timeFormatHMS,
    timeFormatHMSMs: timeFormatHMSMs,
    dateFormat: dateFormat

  }
})();

