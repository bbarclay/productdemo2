var JSON_UTILS = (function() {
  /*
    read Json file and return object
  */
  function readJsonFile(fileName) {
	
    try{
      var data = FILE_UTILS.readDataFromFile(fileName);
			if(data != "null")      //TODO: Need to check for any Utils available.
        var json = JSON.parse(data); 
  			return json;
		} catch(oException){
			handleError("No Data in json file", oException, {
				fileName: fileName
			});
			return null;
		}
  }
  return {
    readJsonFile: readJsonFile
  }
})();

