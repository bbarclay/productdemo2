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

import java.util.List;

import org.json.simple.JSONArray;

import com.cg.digi.model.Handset;

public class PerfectoAPI1 {
		
		public static void main(String[] args) {
			long unixTime = System.currentTimeMillis() + ((90 * 60)*1000);
		//	System.out.println(new PerfectoAPI1().getDeviceList("anuja.saraf@capgemini.com", "April@2017"));
			//System.out.println("**"+unixTime);
		//System.out.println(new PerfectoAPI1().reserveDevice("0715F7752C4B3038"));
			new PerfectoAPI1().releaseDevice("40022");
		}
	
		public static void main1(String[] args) {
			
			RESTAPICall rest = new RESTAPICall();
			String username="XXXX";
			String password="XXXX";
			//https://partners.perfectomobile.com/services/handsets?operation=list&user=anuja.saraf@capgemini.com&password=April@2017
			String URL ="https://partners.perfectomobile.com/services/handsets?operation=list&user="+username+"&password="+password;
			String xmlString=rest.callRESTAPI(URL);
			
			//System.out.println(xmlString);
			List<Handset> handsetDetailList= new XMLParser().getDeviceList(xmlString);
			for(Handset s: handsetDetailList){
				System.out.println(s.getSrNo()+" "+s.getDeviceName()+" "+s.getDeviceId()+" "+s.getOs()+" "+s.getVersion()+" "+s.getStatus()+" "+s.getReservationId() );
			}
		}
		
		public JSONArray getDeviceList(String username , String password){ //error
			System.out.println("inside getdevice List method in utilities/PerfectoAPI1");
			String URL ="https://partners.perfectomobile.com/services/handsets?operation=list&user="+username+"&password="+password;
			String xmlString=new RESTAPICall().callRESTAPI(URL);

			JSONArray perfectoDevicesList= new XMLParser().getDeviceList(xmlString);
			System.out.println("successfully implemented getdevice List method in utilities/PerfectoAPI1");
			return perfectoDevicesList;
			
		}
		
		public  String reserveDevice(String deviceId){
			String username="XXXX";
			String password="XXXX";
			// https://partners.perfectomobile.com/services/reservations?operation=create&user=anuja.saraf@capgemini.com&password=April@2017&resourceIds=30EDD233,0E6FBDEEF6C5EECEF71F66904FC4EFDA3F803682&startTime=-1&endTime=1481710827000
			long unixTime = System.currentTimeMillis() + ((90 * 60)*1000);
			String URL ="https://partners.perfectomobile.com/services/reservations?operation=create&user="+username+"&password="+password+"&resourceIds="+deviceId+"&startTime=-1&endTime="+unixTime+"&responseFormat=XML";
			String xmlString=new RESTAPICall().callRESTAPI(URL);
			//String xmlString="<response><reservationIds><reservationId>26520</reservationId><reservationId>26522</reservationId></reservationIds><info><creationTime><formatted>2016-12-14T10:58:27Z</formatted><millis>1481713107178</millis></creationTime><items>2</items><modelVersion>2.6.0.0</modelVersion><productVersion>9.4</productVersion><time>2016-12-14T10:58:27Z</time></info></response>";
			String reservationId= new XMLParser().getreserveId(xmlString);	
			
			return reservationId;
		}
		public  String reserveDevice(String deviceId,long startTime,long endTime){
			String username="XXXX";
			String password="XXXX";
			// https://partners.perfectomobile.com/services/reservations?operation=create&user=anuja.saraf@capgemini.com&password=April@2017&resourceIds=30EDD233,0E6FBDEEF6C5EECEF71F66904FC4EFDA3F803682&startTime=-1&endTime=1481710827000
			String URL ="https://partners.perfectomobile.com/services/reservations?operation=create&user="+username+"&password="+password+"&resourceIds="+deviceId+"&startTime="+startTime+"&endTime="+endTime+"&responseFormat=XML";
			String xmlString=new RESTAPICall().callRESTAPI(URL);
			//String xmlString="<response><reservationIds><reservationId>26520</reservationId><reservationId>26522</reservationId></reservationIds><info><creationTime><formatted>2016-12-14T10:58:27Z</formatted><millis>1481713107178</millis></creationTime><items>2</items><modelVersion>2.6.0.0</modelVersion><productVersion>9.4</productVersion><time>2016-12-14T10:58:27Z</time></info></response>";
			String reservationId= new XMLParser().getreserveId(xmlString);	
			return reservationId;
		}
		
		public  String releaseDevice(String reservationId){
			String username="XXXX";
			String password="XXXX";
			long unixTime = System.currentTimeMillis() + ((90 * 60)*1000);
			String URL ="https://partners.perfectomobile.com/services/reservations/"+reservationId+"?operation=delete&user="+username+"&password="+password;
			String xmlString=new RESTAPICall().callRESTAPI(URL);
			return "Device Released";
		}
		
}
