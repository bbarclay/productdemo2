package com.cg.digi.utilities;

import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONTokener;

public class InRoads {

	public static JSONObject getVersions(String url, String jobName) {
		
		
		
		String strJSON="{\"OS\": [{\"OSVersion\": \"6.0\",\"Platform \": \"Android\",\"Sessions\": 1}]}";	
		JSONObject jArray = null;
		try {		
			jArray =  (JSONObject) new JSONTokener(strJSON).nextValue();
			System.out.println("The json object is:"+jArray);
		} catch (JSONException e) {
			System.out.println("Error while getting data from listYourApps "+jArray);
		}
		return jArray;
	}
	
public static JSONObject getAppVersions(String url, String jobName) {
		
		
		
		String strJSON="{\"Version\": [{\"AppVersion\": \"3.0\",\"Platform \": \"1.0\",\"Sessions\": 1}]}";	
		JSONObject jArray = null;
		try {		
			jArray =  (JSONObject) new JSONTokener(strJSON).nextValue();
			System.out.println("The json object is:"+jArray);
		} catch (JSONException e) {
			System.out.println("Error while getting data from listYourApps "+jArray);
		}
		return jArray;
	}
	
public static JSONObject getAppDevice(String url, String jobName) {
	
	
	
	String strJSON="{\"Device\": [{\"AppDevice\": \"Samsung S6\",\"Platform \": \"1.0\",\"Sessions\": 1}]}";	
	JSONObject jArray = null;
	try {		
		jArray =  (JSONObject) new JSONTokener(strJSON).nextValue();
		System.out.println("The json object is:"+jArray);
	} catch (JSONException e) {
		System.out.println("Error while getting data from listYourApps "+jArray);
	}
	return jArray;
}

}
