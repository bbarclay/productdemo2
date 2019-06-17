/******************************************************************************
Copyright © 2016 Capgemini Group of companies. All rights reserved
(Subject to Limited Distribution and Restricted Disclosure Only.)
THIS SOURCE FILE MAY CONTAIN INFORMATION WHICH IS THE PROPRIETARY
INFORMATION OF Capgemini GROUP OF COMPANIES AND IS INTENDED FOR USE
ONLY BY THE ENTITY WHO IS ENTITLED TO AND MAY CONTAIN
INFORMATION THAT IS PRIVILEGED, CONFIDENTIAL, OR EXEMPT FROM
DISCLOSURE UNDER APPLICABLE LAW.
YOUR ACCESS TO THIS SOURCE FILE IS GOVERNED BY THE TERMS AND
CONDITIONS OF AN AGREEMENT BETWEEN YOU AND Capgemini GROUP OF COMPANIES.
The USE, DISCLOSURE REPRODUCTION OR TRANSFER OF THIS PROGRAM IS
RESTRICTED AS SET FORTH THEREIN.
******************************************************************************/

package com.cg.digi.utilities;

import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONTokener;

public class Appsee {

	public static JSONObject getSessions(String url, String jobName) {
		
		
		
		String strJSON = "{\"Durations\": [{\"Bucket\": \"0-3 seconds\",\"Sessions\": 50}, {\"Bucket\": \"3-10 seconds\",\"Sessions\": 52}, {\"Bucket\": \"10-30 seconds\",\"Sessions\": 18}, {\"Bucket\": \"30-60 seconds\",\"Sessions\": 3}, {\"Bucket\": \"1-30 minutes\",\"Sessions\": 3}, {\"Bucket\": \"> 30 minutes\",\"Sessions\": 1}]}";		
		JSONObject jArray = null;
		try {		
			jArray =  (JSONObject) new JSONTokener(strJSON).nextValue();
			System.out.println("The json object is:"+jArray);
		} catch (JSONException e) {
			System.out.println("Error while getting data from listYourApps "+jArray);
		}
		return jArray;
	}
	
	
public static JSONObject getTopuser(String url, String jobName) {
		
		
		
		String strJSON = "{\"ScreenGestures\": [{\"Gesture\": \"Tap\",\"Occurrences\": 16553597,\"UnresponsiveOccurrences\": 184165}, {\"Gesture\": \"SwipeUp\",\"Occurrences\": 6022347,\"UnresponsiveOccurrences\": 25312}, {\"Gesture\": \"SwipeDown\",\"Occurrences\": 4440990,\"UnresponsiveOccurrences\": 37554}]}";
		
		//new code
		JSONObject obj;
		JSONObject outerObject = new JSONObject();
		JSONObject innerObject = new JSONObject();
		try {
			obj = new JSONObject(strJSON);
		
		List<Integer> occurance = new ArrayList<Integer>();
		List<String> newOccurance = new ArrayList<String>();
		List<String> gestures = new ArrayList<String>();
		List<Integer> uoccurance = new ArrayList<Integer>();
		List<Float> percentO = new ArrayList<Float>();
		JSONArray array = obj.getJSONArray("ScreenGestures");
		for(int i = 0 ; i < array.length() ; i++){
			occurance.add( (array.getJSONObject(i).getInt("Occurrences")));
		    gestures.add( (array.getJSONObject(i).getString("Gesture")));
		    uoccurance.add( (array.getJSONObject(i).getInt("UnresponsiveOccurrences")));
		}
		int total_occurance=0;
		for(Integer s: occurance){
			System.out.println("*****"+s);
			total_occurance=total_occurance+s;
		}
		
		for(int i=0 ; i <occurance.size() ; i++){
			System.out.println("++++++++++="+total_occurance/ occurance.get(i));
			percentO.add((float)  Math.round(((occurance.get(i)* 100.0f)/total_occurance)));
		}
		
		for(Float s: percentO){
			System.out.println("*****"+s);
		}
		String numberAsString ="";
		for(Integer s: occurance){
			System.out.println("*****"+s);
			int length = String.valueOf(s).length();
			if(length >= 4)
			{
				int occ = s/1000;
				 numberAsString = Integer.toString(occ)+" K";
				 newOccurance.add(numberAsString);
			}
		 
		}
		 
		JSONArray outerArray = new JSONArray();
		


		for(int i=0 ; i <gestures.size() ; i++){
			innerObject = new JSONObject();
			innerObject.put("Gesture", gestures.get(i));
			innerObject.put("Occurrences", newOccurance.get(i));
			innerObject.put("UnresponsiveOccurrences", uoccurance.get(i));
			innerObject.put("percent", percentO.get(i));
			outerArray.put(innerObject);
		}
		
		outerObject.put("ScreenGestures", outerArray);

		System.out.println(outerObject.toString());
		
		} catch (JSONException e1) {
			System.out.println("json not parsed "+e1);
			e1.printStackTrace();
		}
		
		
		JSONObject jArray = null;
		try {
			jArray = (JSONObject) new JSONTokener(outerObject.toString()).nextValue();
			System.out.println("The json object is:" + jArray);
		} catch (JSONException e) {
			System.out.println("Error while getting data from listYourApps "
					+ jArray);
		}
		return jArray;
	}
	
	public static JSONObject getTopuserOld(String url, String jobName) {
		
		
		
		String strJSON = "{\"ScreenGestures\": [{\"Gesture\": \"Tap\",\"Occurrences\": 16553597,\"UnresponsiveOccurrences\": 184165}, {\"Gesture\": \"SwipeUp\",\"Occurrences\": 6022347,\"UnresponsiveOccurrences\": 25312}, {\"Gesture\": \"SwipeDown\",\"Occurrences\": 4440990,\"UnresponsiveOccurrences\": 37554}]}";
		JSONObject jArray = null;
		//new code
		
		
		
		
		try {
			jArray = (JSONObject) new JSONTokener(strJSON).nextValue();
			System.out.println("The json object is:" + jArray);
		} catch (JSONException e) {
			System.out.println("Error while getting data from listYourApps "
					+ jArray);
		}
		return jArray;
	}
	
	
	public static JSONObject getEvents() {
		
		System.out.println("in get events");
		String strJSON="{\"Events\": [{\"EventName\": \"LoggedError\",\"Occurrences\": 6647742},  {\"EventName\": \"Displayed Trouble LoggingIn\",\"Occurrences\": 198731}, {\"EventName\": \"PubNub client connection lost connection\",\"Occurrences\": 113066}, {\"EventName\": \"The request timed out.\",\"Occurrences\": 87334}]}";
		
		//new code
		//new code
				JSONObject obj;
				JSONObject outerObject = new JSONObject();
				JSONObject innerObject = new JSONObject();
				try {
					obj = new JSONObject(strJSON);
				
				List<String> eventName = new ArrayList<String>();
				List<Integer> occurance = new ArrayList<Integer>();
				List<String> newOccurance = new ArrayList<String>();
				List<Float> percentO = new ArrayList<Float>();
				JSONArray array = obj.getJSONArray("Events");
				for(int i = 0 ; i < array.length() ; i++){
					occurance.add( (array.getJSONObject(i).getInt("Occurrences")));
					eventName.add( (array.getJSONObject(i).getString("EventName")));
				}
				int total_occurance=0;
				for(Integer s: occurance){
					System.out.println("*****"+s);
					total_occurance=total_occurance+s;
				}
				
				for(int i=0 ; i <occurance.size() ; i++){
					System.out.println("++++++++++="+total_occurance/ occurance.get(i));
					percentO.add((float)  Math.round(((occurance.get(i)* 100.0f)/total_occurance)));
				}
				
				for(Float s: percentO){
					System.out.println("*****"+s);
				}
				String numberAsString ="";
				for(Integer s: occurance){
					System.out.println("*****"+s);
					int length = String.valueOf(s).length();
					if(length >= 4)
					{
						int occ = s/1000;
						 numberAsString = Integer.toString(occ)+" K";
						 newOccurance.add(numberAsString);
					}
					
				}
				for(String occ:newOccurance){
				System.out.println("occurances -----"+occ);
				
				}
				System.out.println("adfasd"+total_occurance);
				
				
				JSONArray outerArray = new JSONArray();
				


				for(int i=0 ; i <eventName.size() ; i++){
					innerObject = new JSONObject();
					innerObject.put("EventName", eventName.get(i));
					innerObject.put("Occurrences", newOccurance.get(i));
					innerObject.put("percent", percentO.get(i));
					outerArray.put(innerObject);
				}
				
				outerObject.put("Events", outerArray);

				System.out.println(outerObject.toString());
				
				} catch (JSONException e1) {
					System.out.println("json not parsed "+e1);
					e1.printStackTrace();
				}
				
		
		
		
		JSONObject jArray = null;	
		try {		
				jArray =  (JSONObject) new JSONTokener(outerObject.toString()).nextValue();
			} catch (JSONException e) {
				//System.out.println("Error while getting data from listYourApps "+jArray);
			}
			return jArray;
		}	
	
public static JSONObject getScreen() {
		
		
	String strJSON = "{\"ScreenGestures\": [{\"Gesture\": \"Tap\",\"Occurrences\": 165535,\"UnresponsiveOccurrences\": 184165},{\"Gesture\": \"SwipeUp\",\"Occurrences\": 60223,\"UnresponsiveOccurrences\": 25312},{\"Gesture\": \"SwipeDown\",\"Occurrences\": 44409,\"UnresponsiveOccurrences\": 37554}]}";		
	JSONObject jArray = null;
	try {		
		jArray =  (JSONObject) new JSONTokener(strJSON).nextValue();
		System.out.println("The json object is:"+jArray);
	} catch (JSONException e) {
		System.out.println("Error while getting data from listYourApps "+jArray);
	}
	
	return jArray;
		}	
	
	public static JSONObject getUsage(String url, String jobName) {
		
		
		
	String strJSON=	"{\"DailyUsage\": [{\"Date\": \"2016-11-11\",\"ActiveUsers\": 1,\"NewUsers\": 1,\"Sessions\": 1}, {\"Date\": \"2016-11-12\",\"ActiveUsers\": 2,\"NewUsers\": 1,\"Sessions\": 50}, {\"Date\": \"2016-11-13\",\"ActiveUsers\": 1,\"NewUsers\": 0,\"Sessions\": 12}, {\"Date\": \"2016-11-14\",\"ActiveUsers\": 1,\"NewUsers\": 0,\"Sessions\": 12}, {\"Date\": \"2016-11-15\",\"ActiveUsers\": 21,\"NewUsers\": 10,\"Sessions\": 12}, {\"Date\": \"2016-11-16\",\"ActiveUsers\": 15,\"NewUsers\": 10,\"Sessions\": 12}, {\"Date\": \"2016-11-17\",\"ActiveUsers\": 11,\"NewUsers\": 40,\"Sessions\": 12}]}";
	JSONObject jArray = null;	
	try {		
			jArray =  (JSONObject) new JSONTokener(strJSON).nextValue();
			System.out.println("The json object is:"+jArray);
		} catch (JSONException e) {
			System.out.println("Error while getting data from listYourApps "+jArray);
		}
		return jArray;
	}


public static JSONObject getOS(String url, String jobName) {
	
	
	String strJSON="{\"OS\": [{\"OSVersion\": \"8.3\",\"Platform \": \"iOS\",\"Sessions\": 14353301}, {\"OSVersion\": \"8.2\",\"Platform \": \"iOS\",\"Sessions\": 973635}, {\"OSVersion\": \"8.1.3\",\"Platform \": \"iOS\",\"Sessions\": 972910}]}";	
	JSONObject jArray = null;	
	try {		
			jArray =  (JSONObject) new JSONTokener(strJSON).nextValue();
			System.out.println("The json object is:"+jArray);
		} catch (JSONException e) {
			System.out.println("Error while getting data from listYourApps "+jArray);
		}
		return jArray;
	}	

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

public static JSONObject getResolution(String url, String jobName) {
	
	
	String strJSON = "{\"Resolutions\": [{\"Height\": 568,\"Width\": 320,\"Sessions\": 19392224}, {\"Height\": 1920,\"Width\": 1080,\"Sessions\": 1888727}, {\"Height\": 480,\"Width\": 320,\"Sessions\": 955928}]}";
	JSONObject jArray = null;
	try {
		jArray = (JSONObject) new JSONTokener(strJSON).nextValue();
		System.out.println("The json object is:" + jArray);
	} catch (JSONException e) {
		System.out.println("Error while getting data from listYourApps "
				+ jArray);
	}
	return jArray;
	}

public static JSONObject getCrash(String url, String jobName) {
	
	
	
	String strJSON = "{'DailyStats': [{'Date': '2016-11-13','TotalCrashedSessions': 1}, {'Date': '2016-11-14','TotalCrashedSessions': 0},{'Date': '2016-11-15','TotalCrashedSessions': 0},{'Date': '2016-11-16','TotalCrashedSessions': 1}, {'Date': '2016-11-17','TotalCrashedSessions': 0},{'Date': '2016-11-18','TotalCrashedSessions': 0}],'TotalCrashedSessions': 2}";		
	JSONObject jArray = null;
	try {		
		jArray =  (JSONObject) new JSONTokener(strJSON).nextValue();
		System.out.println("The json object is:"+jArray);
	} catch (JSONException e) {
		System.out.println("Error while getting data from listYourApps "+jArray);
	}
	return jArray;
}

public static JSONObject getConnectivity(String url, String jobName) {
	
	
	
//	String strJSON = "{'Connectivity': [{'Connectivity': 'WiFi','Sessions': 20319041}, {'Connectivity': 'Cellular','Sessions': 3269867}, {'Connectivity': 'No Connectivity','Sessions': 63986}, {'Connectivity': 'Unknown','Sessions': 146}]}";		
	//String strJSON = "{\"Connectivity\": [{\"Connectivity\": \"WiFi\",\"Sessions\": 165535,\"UnresponsiveOccurrences\": 184165},{\"Connectivity\": \"No Connectivity\",\"Sessions\": 60223,\"UnresponsiveOccurrences\": 25312},{\"Connectivity\": \"Unknown\",\"Sessions\": 44409,\"UnresponsiveOccurrences\": 37554}]}";		
	//{"Connectivity": [{'Connectivity': 'WiFi','Sessions': 165535,'UnresponsiveOccurrences': 184165},{'Connectivity': 'No Connectivity','Sessions': 60223,'UnresponsiveOccurrences': 25312},{'Connectivity': 'Unknown','Sessions': 44409,'UnresponsiveOccurrences': 37554}]}
	String strJSON = "{\"Connectivity\": [{\"Connectivity\": \"Wifi\",\"Occurrences\": 500,\"UnresponsiveOccurrences\": 184165},{\"Connectivity\": \"Cellular\",\"Occurrences\": 100,\"UnresponsiveOccurrences\": 25312},{\"Connectivity\": \"No Connectivity\",\"Occurrences\": 409,\"UnresponsiveOccurrences\": 37554}]}";		
	
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
