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

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.util.LinkedList;
import java.util.List;

import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.xml.sax.SAXException;
import org.xml.sax.XMLReader;
public class ApiCall {
	
	
    private static final String UTF_8 = "UTF-8";
    public List<String> findDevicesInError(String host, String user, String password) throws IOException, DocumentException {
        String encodedUser = URLEncoder.encode(user, UTF_8);
        String encodedPassword = URLEncoder.encode(password, UTF_8);
        String urlStr = "https://" + host + "/services/handsets?operation=list&user=" + encodedUser + "&password=" + encodedPassword;
        URL url = new URL(urlStr);
        String response = sendRequest(url);
        List<String> devicesInError = new LinkedList<>();
        if (response != null) {
            devicesInError = parseResponse(response);
        }
        return devicesInError;
    }
    @SuppressWarnings("unchecked")
	private List<String> parseResponse(String response) throws DocumentException {
        byte[] bytes = response.getBytes(getCharset());
        InputStream inputStream = new ByteArrayInputStream(bytes);
        Document doc = readDocument(inputStream);
        Element root = doc.getRootElement();
        checkError(root);
        List<String> devicesInError = new LinkedList<>();
        List<Element> elements = root.elements("handset");
        for (Element element : elements) {
            String status = element.elementText("status");
            String deviceId = element.elementText("deviceId");
            System.out.println("Device: " + deviceId + ", status:" + status);
            if ((status != null) && status.equalsIgnoreCase("error")) {
                devicesInError.add(deviceId);
            }
        }
        return devicesInError;
    }
    private static void checkError(Element root) throws DocumentException {
        Element errorMessageElement = root.element("errorMessage");
        if (errorMessageElement != null) {
            String errorMsg = errorMessageElement.getText();
            throw new DocumentException(errorMsg);
        }
    }
    public static Document readDocument(InputStream inputStream) throws DocumentException {
        try {
            SAXParserFactory factory = SAXParserFactory.newInstance();
            factory.setXIncludeAware(true);
            factory.setNamespaceAware(true);
            SAXParser parser;
            SAXReader saxReader;
            try {
                parser = factory.newSAXParser();
                XMLReader xmlReader = parser.getXMLReader();
                saxReader = new SAXReader(xmlReader);
            }
            catch (ParserConfigurationException e) {
                throw new DocumentException(e);
            }
            catch (SAXException e) {
                throw new DocumentException(e);
            }
            Reader streamReader = new InputStreamReader(inputStream, getCharset());
            Document doc = saxReader.read(streamReader);
            return doc;
        }
        finally {
            try {
                inputStream.close();
            }
            catch (IOException e) {
            }
        }
    }
    private static Charset getCharset() {
        return Charset.forName(UTF_8);
    }
    private static String sendRequest(URL url) throws IOException {
        HttpURLConnection connection = (HttpURLConnection)url.openConnection();
        connection.setDoOutput(true);
        connection.connect();
        int code = connection.getResponseCode();
        if (code > HttpURLConnection.HTTP_OK) {
            handleError(connection);
        }
        return getResponse(connection);
    }
    private static String getResponse(HttpURLConnection connection) throws IOException {
        String response = null;
        InputStream inputStream = connection.getInputStream();
        if (inputStream != null) {
            InputStreamReader inputStreamReader = new InputStreamReader(inputStream, UTF_8);
            BufferedReader bufferReader = new BufferedReader(inputStreamReader);
            try {
                StringBuilder builder = readResponse(bufferReader);
                response = builder.toString();
            }
            finally {
                bufferReader.close();
            }
        }
        return response;
    }
    private static void handleError(HttpURLConnection connection) throws IOException {
        String msg = "Failed to get device list.";
        InputStream errorStream = connection.getErrorStream();
        if (errorStream != null) {
            InputStreamReader inputStreamReader = new InputStreamReader(errorStream, UTF_8);
            BufferedReader bufferReader = new BufferedReader(inputStreamReader);
            try {
                StringBuilder builder = readResponse(bufferReader);
                String response = builder.toString();
                msg += "Response: " + response;
            }
            finally {
                bufferReader.close();
            }
        }
        throw new RuntimeException(msg);
    }
    private static StringBuilder readResponse(BufferedReader bufferReader) throws IOException {
        StringBuilder builder = new StringBuilder();
        String outputString;
        while ((outputString = bufferReader.readLine()) != null) {
            if (builder.length() != 0) {
                builder.append("\n");
            }
            builder.append(outputString);
        }
        return builder;
    }
    public static void main(String[] args) {
        try {
            ApiCall detector = new ApiCall();            
            List<String> devices = detector.findDevicesInError("partners.perfectomobile.com", "XXXX", "XXXX");
            System.out.println("Devices in error: " + devices);
        } catch (IOException | DocumentException e) {
            System.out.println("Failed to detect devices in error - " + e.getMessage());
            e.printStackTrace();
        }
    }
}