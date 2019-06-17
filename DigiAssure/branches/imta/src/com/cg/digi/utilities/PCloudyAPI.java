package com.cg.digi.utilities;

//check parameters fror reserv get device list etc, check with perfecto, contollers etc

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.ArrayUtils;
import org.json.JSONException;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.ssts.pcloudy.Connector;
import com.ssts.pcloudy.dto.device.DevicesDtoResult;
import com.ssts.pcloudy.dto.device.MobileDevice;
import com.ssts.pcloudy.dto.device.devicesDTO;
import com.ssts.pcloudy.dto.generic.BookingDtoResult;
import com.ssts.pcloudy.exception.ConnectError;
public class PCloudyAPI {
//created by Lopamudra
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
	String emailid="lopamudra.chakraborty@capgemini.com";
	String password="Pcloudy@123";
	String apiKey= "5272sdjm6bzmx25bw65c7p6q";
	String URL ="https://capgemini.pcloudy.com";
	String authToken=null;
	Connector con= new Connector("https://capgemini.pcloudy.com");
	
	MobileDevice singleandroid =null;
	List<MobileDevice>  androidDevices= null;
	List<MobileDevice>  iosDevices= null;
	BookingDtoResult bookedDevice =null;
	int n=20;
	MobileDevice[] showdevices= new MobileDevice[n];
	List<MobileDevice> deviceList=null;
	
	


			
			public static void main(String[] args) {
				long unixTime = System.currentTimeMillis() + ((90 * 60)*1000);
			//	System.out.println(new PerfectoAPI1().getDeviceList("anuja.saraf@capgemini.com", "April@2017"));
				//System.out.println("**"+unixTime);
			//System.out.println(new PerfectoAPI1().reserveDevice("0715F7752C4B3038"));
				//new PerfectoAPI1().releaseDevice("40022");
			}
		
			public String authenticateUser() {
				System.out.println("Redirecting to Pcloudy url");
				
				System.out.println("Redirected");
				try {
					System.out.println("inside try");
					authToken = con.authenticateUser(emailid,apiKey);
					System.out.println("Account authenticated");
					return authToken;
				} catch (IOException e) {
					
					e.printStackTrace();
				} catch (ConnectError e) {
				
					e.printStackTrace();
				}
				
				return null;
				
			}
			public MobileDevice[] pcloudymobiledevice() {
				 authToken= authenticateUser();
				 MobileDevice[] android =null;
				 MobileDevice[] ios =null ;
				 MobileDevice[] devices =null;
				try {
					android = con.getDevices(authToken, 10, "android", false);
					ios = con.getDevices(authToken, 10, "ios", false);
					devices = (MobileDevice[]) ArrayUtils.addAll(android, ios);
				} catch (ConnectError e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} 
		
				return devices;
				
			}
			public JSONArray getDeviceList(){ //check
				System.out.println("inside getdevice List method in utilities/pCloudyAPI1");

					 MobileDevice[] devices= pcloudymobiledevice();
					 
					 System.out.println("Device List"+devices);
					 System.out.println("Device Length in pcloudyAPi"+devices.length);
					 JSONArray pcloudydevices= new XMLParser().getpCloudyDeviceList(devices);
					 System.out.println("successfully implemented getdevice List method in utilities/pCloudy"+pcloudydevices);
					 return pcloudydevices;		 
			
			}
			
			
			public  MobileDevice pcloudydevicebookingid( String vendordeviceId){
				  System.out.println("inside pcloudy booking id");
				 // MobileDevice[] devices= pcloudymobiledevice();
				  MobileDevice bookingid = null;
				  JSONArray pcloudydevices= getDeviceList();
				  System.out.println("Size:(pcloudyapi) "+ pcloudydevices.size());
				  System.out.println("pcloudy devices: "+ pcloudydevices);
				  for (int i = 0; i < pcloudydevices.size(); i++) {
					System.out.println("i: "+ i);
				 // not working for devices having vendor id other than 131
                       Object deviceObj= pcloudydevices.get(i);
                       System.out.println("DeviceObj (pcloudyapi): "+ deviceObj);
						JSONObject object = (JSONObject) deviceObj;
						System.out.println("json obj: "+ object);
					    
						String vendorid=object.get("id").toString();
					
						//	bookingid= (MobileDevice) object.get("bookingid");
					//	System.out.println("testing bookng id: "+bookingid);
				 
				  System.out.println("Vendorid(pcloudyapi): "+vendorid);
				
				System.out.println("Selected Device Vendor id(pcloudyapi):  "+vendordeviceId);
				//	String vendorid = object.get("id");
					if(vendordeviceId.equalsIgnoreCase(vendorid))
					{ 
						bookingid= (MobileDevice) object.get("bookingid");
						System.out.println("rawid for device: (pcloudyapi) "+vendordeviceId+"is: "+ bookingid);
					}
				  }
					return bookingid;
				
				  
				  
				  
		/*	try {
					
					 
						 bookedDevice = con.bookDevice(authToken, 10, singleandroid); //singleandroid should have device Id
						 System.out.println(bookedDevice+"Booked");
						 return bookedDevice.toString();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (ConnectError e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}*/
				
				
			}
			public  BookingDtoResult reserveDevice(String deviceId, int time){
				  System.out.println("inside pcloudy reserve device (pcloudyapi)");
				MobileDevice reserveId= pcloudydevicebookingid(deviceId);
				System.out.println("Device booking id is(pcloudyapi) : "+reserveId); //successful
						
				
					try {
				
				 
				 bookedDevice = con.bookDevice(authToken, time, reserveId); //singleandroid should have device Id
				 System.out.println(bookedDevice+"Booked");
				 return bookedDevice;
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ConnectError e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
				return null;
			}
			public  String reserveDevice(String deviceId,long startTime,long endTime){ //check
				try {
					  System.out.println("booking device");
						 bookedDevice = con.bookDevice(authToken, 10, singleandroid);
						 System.out.println(bookedDevice+"Booked");
						 return bookedDevice.toString();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (ConnectError e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				return null;
			}
			
			public  String releaseDevice(BookingDtoResult bookedDevice){
				try {
					//bookedDevice= reserveDevice(deviceId);
					 authToken= authenticateUser();
					System.out.println("Booked Device: "+bookedDevice);
					System.out.println("checking auth token:  "+ authToken);
					System.out.println("checking con: "+ con);
					con.releaseInstantAccessBooking(authToken, bookedDevice); 
					System.out.println("Device Released");
				} catch (ConnectError e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return "Device Released";
			}
			
	}

	

