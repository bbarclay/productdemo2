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

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathFactory;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

import com.google.gson.Gson;
import com.ssts.pcloudy.dto.device.MobileDevice;
import com.ssts.pcloudy.exception.ConnectError;

public class XMLParser {
	
		
	@SuppressWarnings("unchecked")
	public  JSONArray getDeviceList(String xmlString) {
		JSONArray handsetDetailList= new JSONArray();
		try {
			DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
			Document doc = dBuilder.parse(new ByteArrayInputStream(xmlString.getBytes("UTF8")));
			doc.getDocumentElement().normalize();
			
			NodeList handsetList = doc.getElementsByTagName("handset");
		//	System.out.println("Total Hand set:"+handsetList.getLength());
			for (int temp = 0; temp < handsetList.getLength(); temp++) {
				JSONObject obj=new JSONObject();
				Node nNode = handsetList.item(temp);
				if (nNode.getNodeType() == Node.ELEMENT_NODE) {
					Element eElement = (Element) nNode;
					
					String deviceId = eElement.getElementsByTagName("deviceId").item(0).getTextContent();
					String modelName = eElement.getElementsByTagName("model").item(0).getTextContent();
					String os = eElement.getElementsByTagName("os").item(0).getTextContent();
					String version = eElement.getElementsByTagName("osVersion").item(0).getTextContent();
					String status = eElement.getElementsByTagName("status").item(0).getTextContent();
					String reservation =eElement.getElementsByTagName("reserved").item(0).getTextContent();
					String location = eElement.getElementsByTagName("location").item(0).getTextContent();
					String resolution =eElement.getElementsByTagName("resolution").item(0).getTextContent();
					String manufacturer=eElement.getElementsByTagName("manufacturer").item(0).getTextContent();
					
					obj.put("id", deviceId);
					obj.put("model", modelName);
					obj.put("deviceName", modelName);
					obj.put("deviceOs", os);
					
					obj.put("osVersion", version);
					obj.put("location", location);
					obj.put("resolution", resolution);
					obj.put("manufacturer", manufacturer);
					obj.put("deviceCategory", "");
					if(status.equalsIgnoreCase("Connected")){
						if(reservation.equalsIgnoreCase("true")){
							
						obj.put("displayStatus", "In Use");
						}
						else{
							obj.put("displayStatus", "Available");

						}
					}else{
						obj.put("displayStatus", "Offline");
					}

					
					

					
						handsetDetailList.add(obj)	;			
				}
			}
			

		} catch (ParserConfigurationException | SAXException | IOException e) {
			System.out.println("issue in fetch device list"+e);
			e.printStackTrace();
		}
		System.out.println(handsetDetailList);
		return handsetDetailList;
	}
	
	//created by Lopamudra
		public  JSONArray getpCloudyDeviceList(MobileDevice[] devices) {
			System.out.println("Inside XMLParser->getpCloudyDeviceList");
			
			String deviceId  ;
			String modelName;
			String os ;
			String version ;
			String status;  //
			 Boolean reservation ; 
			String location ;  //
			String resolution ;
			String manufacturer;
			MobileDevice bookingid ;
			JSONArray handsetDetailList= new JSONArray();
			
			System.out.println("Inside for");
			System.out.println("Devices length: "+devices.length);
			for (int i = 0; i < devices.length; i++) {
				JSONObject obj=new JSONObject();
				
				bookingid= devices[i];
				deviceId= devices[i].id.toString();
				modelName= devices[i].model;
				os= devices[i].platform;
				version= devices[i].version;
				reservation = devices[i].available;
				//System.out.println("status: "+reservation);
				
				resolution= devices[i].resolution;
				manufacturer=devices[i].manufacturer;
				
				if(reservation)
				{
					obj.put("displayStatus", "Available");
				}
				   else if(!reservation)
				    {
					obj.put("displayStatus", "In Use");
				    }
				else
				{
					obj.put("displayStatus", "Offline");
				}
				
				obj.put("bookingid", bookingid);
				//System.out.println("Booking id(XML Parser): "+ bookingid);
				obj.put("id", deviceId);
				obj.put("model", modelName);
				obj.put("deviceName", modelName);
				obj.put("deviceOs", os);
				
				obj.put("osVersion", version);
				obj.put("location", "pCloudy");
				obj.put("resolution", resolution);
				obj.put("manufacturer", manufacturer);
				obj.put("deviceCategory", "");
				handsetDetailList.add(obj);
				//System.out.println("Obj value is: "+obj);
				
				//System.out.println("HandsetList inside for loop:"+ handsetDetailList);
			}
			
			
			//System.out.println("HandsetList:"+ handsetDetailList);
			return handsetDetailList;	
		}
	//till here	
	public  String  getreserveId(String xmlString) {
		String reservationId="";
		try {
			DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
			Document doc = dBuilder.parse(new ByteArrayInputStream(xmlString.getBytes("UTF8")));
			
			if(xmlString.contains("reservationIds")){
				NodeList reservationList = doc.getElementsByTagName("reservationIds");
				for (int temp = 0; temp < reservationList.getLength(); temp++) {
					Node nNode = reservationList.item(temp);
					if (nNode.getNodeType() == Node.ELEMENT_NODE) {
						Element eElement = (Element) nNode;
						reservationId = eElement.getElementsByTagName("reservationId").item(0).getTextContent();
						}
				}
			}

		} catch (ParserConfigurationException | SAXException | IOException e) {
			System.out.println("issue in fetch device list" + e);
			e.printStackTrace();
		}
		return reservationId;

	}

	//till here
	public static void editXMLNode(String fileIn, String fileOut,
			String attributeName, String attributeValue,String attributeReplace) {
		//String fileIn = "NeoloadProject/New folder/repository1.xml";
		//String fileOut = "NeoloadProject/New folder/repository1.xml";
		//attributeName = value
		//attributeValue = .bat
		//attributeReplace = "new path"
				
		try {
			// 1- Build the doc from the XML file
			Document doc = DocumentBuilderFactory.newInstance()
					.newDocumentBuilder().parse(new InputSource(fileIn));

			// 2- Locate the node(s) with xpath
			XPath xpath = XPathFactory.newInstance().newXPath();
			NodeList nodes = (NodeList) xpath.evaluate(
					"//*[contains(@"+attributeName+", '"+attributeValue+"')]", doc,
					XPathConstants.NODESET);

			// 3- Make the change on the selected nodes
			for (int idx = 0; idx < nodes.getLength(); idx++) {
				Node value = nodes.item(idx).getAttributes()
						.getNamedItem("value");
				value.setNodeValue(attributeReplace);
				// value.setNodeValue(val.replaceAll("!Here", "What?"));
			}

			// 4- Save the result to a new XML doc
			Transformer xformer = TransformerFactory.newInstance()
					.newTransformer();
			xformer.transform(new DOMSource(doc), new StreamResult(new File(
					fileOut)));
		} catch (Exception e) {
			System.out.println("error " + e);
		}

	}


	
}
