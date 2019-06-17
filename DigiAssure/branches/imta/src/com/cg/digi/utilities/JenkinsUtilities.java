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

import java.io.IOException;
import java.io.StringReader;
import java.net.MalformedURLException;
import java.nio.charset.StandardCharsets;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.apache.http.Header;
import org.apache.http.HeaderIterator;
import org.apache.http.HttpHost;
import org.apache.http.HttpRequest;
import org.apache.http.HttpResponse;
import org.apache.http.ProtocolVersion;
import org.apache.http.RequestLine;
import org.apache.http.auth.AuthScope;
import org.apache.http.auth.AuthenticationException;
import org.apache.http.auth.UsernamePasswordCredentials;
import org.apache.http.client.AuthCache;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.CredentialsProvider;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.client.protocol.HttpClientContext;
import org.apache.http.impl.auth.BasicScheme;
import org.apache.http.impl.client.BasicAuthCache;
import org.apache.http.impl.client.BasicCredentialsProvider;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.params.HttpParams;
import org.w3c.dom.Document;
import org.xml.sax.InputSource;

import com.cg.digi.logger.DigiLoggerUtils;
import com.cg.digi.logger.DigiLoggerUtils.LEVEL;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientHandlerException;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.UniformInterfaceException;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.filter.HTTPBasicAuthFilter;
import com.sun.jersey.core.util.Base64;

public class JenkinsUtilities {
	public static void main(String[] args) throws InterruptedException {

	}

	public static String[] listJobs(String url, String username, String password) {
		Client client = Client.create();
		 client.addFilter(new
		 com.sun.jersey.api.client.filter.HTTPBasicAuthFilter(username,
		 password));
		WebResource webResource = client.resource(url + "/api/xml");
		ClientResponse response = webResource.get(ClientResponse.class);
		String jsonResponse = response.getEntity(String.class);
		client.destroy();
		// System.out.println("Response listJobs:::::"+jsonResponse);

		// Assume jobs returned are in xml format, TODO using an XML Parser
		// would be better here
		// Get name from <job><name>...
		String[] jobs = jsonResponse.split("job>"); // 1, 3, 5, 7, etc will
													// contain jobs

		return jobs;
	}

	public static String deleteJob(String url, String jobName, String username, String password) {
		Client client = Client.create();
		client.addFilter(new
		 com.sun.jersey.api.client.filter.HTTPBasicAuthFilter(username,
		 password));
		if (url.endsWith("/")) {
			url = url + "job/" + jobName + "/doDelete";
		} else {
			url = url + "/job/" + jobName + "/doDelete";
		}

		WebResource webResource = client.resource(url);
		ClientResponse response = webResource.post(ClientResponse.class);
		String jsonResponse = response.getEntity(String.class);
		client.destroy();
		// System.out.println("Response deleteJobs:::::"+jsonResponse);
		return jsonResponse;
	}

	public static String copyJob(String url, String newJobName,
			String oldJobName, String username, String password) {
		Client client = Client.create();
		client.addFilter(new
		 com.sun.jersey.api.client.filter.HTTPBasicAuthFilter(username,
		 password));
		if (url.endsWith("/")) {
			url = url + "createItem?name=" + newJobName + "&mode=copy&from="
					+ oldJobName;
		} else {
			url = url + "/createItem?name=" + newJobName + "&mode=copy&from="
					+ oldJobName;
		}

		WebResource webResource = client.resource(url);
		ClientResponse response = webResource.type("application/xml").get(
				ClientResponse.class);
		String jsonResponse = response.getEntity(String.class);
		client.destroy();
		// System.out.println("Response copyJob:::::"+jsonResponse);
		return jsonResponse;
	}

	public static String createJob(String url, String newJobName,
			String configXML,  String username, String password) {
		String jsonResponse = null;
		try {
			Client client = Client.create();
			client.addFilter(new
			 com.sun.jersey.api.client.filter.HTTPBasicAuthFilter(username,
			 password));
			if (url.endsWith("/")) {
				url = url + "createItem?name=" + newJobName;

			} else {
				url = url + "/createItem?name=" + newJobName;
			}
			WebResource webResource = client.resource(url);
			ClientResponse response = webResource.type("application/xml").post(
					ClientResponse.class, configXML);
			jsonResponse = response.getEntity(String.class);
			int statusCode = response.getStatus();
			DigiLoggerUtils
					.log("Status  Creation of Jenkins Job : Job Name :"
							+ newJobName + "   Status Code : " + statusCode,
							LEVEL.info);
			client.destroy();
		} catch (UniformInterfaceException e) {
			DigiLoggerUtils.log(
					"Error while Creating Jenkins Job : Uniform Interface Exception :"
							+ e.getMessage(), LEVEL.error);
		} catch (ClientHandlerException e) {
			DigiLoggerUtils.log(
					"Error while Creating Jenkins Job : Uniform Interface Exception :"
							+ e.getMessage(), LEVEL.error);
		} catch (Exception e) {
			DigiLoggerUtils.log(
					"Error while Creating Jenkins Job : Uniform Interface Exception :"
							+ e.getMessage(), LEVEL.error);
		}
		return jsonResponse;
	}

	public static String readJob(String url, String jobName,  String username, String password) {
		Client client = Client.create();
		 client.addFilter(new
		 com.sun.jersey.api.client.filter.HTTPBasicAuthFilter(username,
		 password));
		if (url.endsWith("/")) {
			url = url + "job/" + jobName + "/config.xml";
		} else {
			url = url + "/job/" + jobName + "/config.xml";
		}
		WebResource webResource = client.resource(url);
		ClientResponse response = webResource.get(ClientResponse.class);
		String jsonResponse = response.getEntity(String.class);
		client.destroy();
		// System.out.println("Response readJob:::::"+jsonResponse);
		return jsonResponse;
	}

	public static String readAnyXmlFromJenkins(String url,String username, String password) {
		Client client = Client.create();
		 client.addFilter(new
		 com.sun.jersey.api.client.filter.HTTPBasicAuthFilter(username,
		 password));
		WebResource webResource = client.resource(url);
		ClientResponse response = webResource.get(ClientResponse.class);
		String jsonResponse = response.getEntity(String.class);
		client.destroy();
		// System.out.println("Response readJob:::::"+jsonResponse);
		return jsonResponse;
	}

	public static HttpResponse buildJob(String jenurl, String jobName, String jenkUsername, String jenkPassword) {
		HttpResponse responseCode = null;
		CloseableHttpResponse response= null;
		
		CloseableHttpClient client = HttpClients.createDefault();
		String finalUrl = "";
		if (jenurl.endsWith("/")) {
			finalUrl = jenurl + "job/" + jobName + "/build";
		} else {
			finalUrl = jenurl + "/job/" + jobName + "/build";
		}
		HttpPost httpPost = new HttpPost(finalUrl);

		UsernamePasswordCredentials creds = new UsernamePasswordCredentials(jenkUsername,
				jenkPassword);
		try {
			httpPost.addHeader(new BasicScheme().authenticate(creds, httpPost, null));
			httpPost.addHeader("Content-type", "application/json");
			httpPost.addHeader("Accept", "application/json");
			System.out.println("posting: " + httpPost);
			response = client.execute(httpPost);
			client.close();
		}
		 catch (IOException e) {
			
			e.printStackTrace();
		} catch (AuthenticationException e ) {
			
			e.printStackTrace();
		}
			
		System.out.println((response.getStatusLine().getStatusCode()));
		System.out.println("Response: " + response);
		responseCode= response;
		return responseCode;
		
		/*		HttpResponse responseCode = null;
		System.out.println("inside http reponse buildjob");
		try {
			HttpClient client = HttpClientBuilder.create().build();
				System.out.println("http: "+Username+" ,Password: "+Password);
			String finalUrl = "";
			if (jenurl.endsWith("/")) {
				finalUrl = jenurl + "job/" + jobName + "/build";
			} else {
				finalUrl = jenurl + "/job/" + jobName + "/build";
			}
			HttpGet get = new HttpGet(finalUrl);
			responseCode = client.execute(get);  //changed
			System.out.println("build job response code: "+responseCode);
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		*/
		
	}

	public static HttpResponse buildJob(String jenurl, String jobName,
			long delay, String jenkUsername, String jenkPassword) {
		HttpResponse responseCode = null;
		CloseableHttpResponse response= null;
		
		CloseableHttpClient client = HttpClients.createDefault();
		String finalUrl = "";
		if (jenurl.endsWith("/")) {
			finalUrl = jenurl + "job/" + jobName + "/build";
		} else {
			finalUrl = jenurl + "/job/" + jobName + "/build";
		}
		if (delay > 0) {
			finalUrl = finalUrl + "?delay=" + delay;
		}
		HttpPost httpPost = new HttpPost(finalUrl);

		UsernamePasswordCredentials creds = new UsernamePasswordCredentials(jenkUsername,
				jenkPassword);
		try {
			httpPost.addHeader(new BasicScheme().authenticate(creds, httpPost, null));
			httpPost.addHeader("Content-type", "application/json");
			httpPost.addHeader("Accept", "application/json");
			System.out.println("posting: " + httpPost);
			response = client.execute(httpPost);
			client.close();
		}
		 catch (IOException e) {
			
			e.printStackTrace();
		} catch (AuthenticationException e ) {
			
			e.printStackTrace();
		}
			
		System.out.println((response.getStatusLine().getStatusCode()));
		System.out.println("Response: " + response);
		responseCode= response;
		return responseCode;
		
/*		HttpResponse responseCode = null;
		try {
			String finalUrl = "";
			if (jenurl.endsWith("/")) {
				finalUrl = jenurl + "job/" + jobName + "/build";
			} else {
				finalUrl = jenurl + "/job/" + jobName + "/build";
			}

			HttpClient client = HttpClientBuilder.create().build();

			if (delay > 0) {
				finalUrl = finalUrl + "?delay=" + delay;
			}
			HttpGet get = new HttpGet(finalUrl);
			responseCode = client.execute(get);
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}*/
		
	}

	// added
	public static String buildStatus(String jenurl, String jobName,
			int buildNumber, String username, String password) {
		String Status = null;
		try {
			String finalUrl = "";
			if (jenurl.endsWith("/")) {
				finalUrl = jenurl + "job/" + jobName + "/" + buildNumber
						+ "/api/xml";
			} else {
				finalUrl = jenurl + "/job/" + jobName + "/" + buildNumber
						+ "/api/xml";
			}

			Client client = Client.create();
			 client.addFilter(new
					 com.sun.jersey.api.client.filter.HTTPBasicAuthFilter(username,
					 password));
			WebResource webResource = client.resource(finalUrl);
			ClientResponse response = webResource.get(ClientResponse.class);
			Status = response.getEntity(String.class);
			client.destroy();
			Status = getResult(Status, "result");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return Status;
	}

	public static String latestBuildStatus(String jenurl, String jobName,  String username, String password) {
		String buildStatus = null;
		try {
			String finalUrl = "";
			if (jenurl.endsWith("/")) {
				finalUrl = jenurl + "job/" + jobName + "/api/xml";
			} else {
				finalUrl = jenurl + "/job/" + jobName + "/api/xml";
			}
			Client client = Client.create();
			client.addFilter(new com.sun.jersey.api.client.filter.HTTPBasicAuthFilter(username, password));
			WebResource webResource = client.resource(finalUrl);
			ClientResponse response = null;
			response = webResource.get(ClientResponse.class);
			String res = response.getEntity(String.class);
			client.destroy();
			if (res.contains("color")) {
				String color = getResult(res, "color");
				if (color.contains("anime")) {
					buildStatus = "In Progress";
				} else if ("red".equalsIgnoreCase(color)) {
					buildStatus = "Failed";
				} else if ("blue".equalsIgnoreCase(color)) {
					buildStatus = "Success";
				} else if ("notbuilt".equalsIgnoreCase(color)) {
					buildStatus = "Not Built";
				} else if ("disabled".equalsIgnoreCase(color)) {
					buildStatus = "Disabled";
				} else if ("aborted".equalsIgnoreCase(color)) {
					buildStatus = "Aborted";
				} else if ("yellow".equalsIgnoreCase(color)) {
					buildStatus = "UnStable";
				} else {
					buildStatus = "UnStable";
				}
			}
			if (res.contains("inQueue")) {
				if (getResult(res, "inQueue").contains("true"))
					buildStatus = "Build in Queue";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return buildStatus;
	}

	private static String getResult(String status, String tosearch) {
		try {
			//System.out.println("inside get result(jenkinsutils) ststus: "+status+" ,tosearch: "+tosearch);
			DocumentBuilder builder = DocumentBuilderFactory.newInstance()
					.newDocumentBuilder();
			InputSource src = new InputSource();
			src.setCharacterStream(new StringReader(status));
			Document doc = builder.parse(src);
			try {
				if (tosearch == "lastBuild") {
					status = doc.getElementsByTagName(tosearch).item(0).getTextContent();
					status = status.split("h")[0];
				} else {
					status = doc.getElementsByTagName(tosearch).item(0)
							.getTextContent();
				}
			} catch (NullPointerException e) {
				System.err.println("Encountered NULL value for '" + tosearch + "' in Jenkins build Status response");
			}
		} catch (Exception e) {
			
			DigiLoggerUtils.log("Failed in getting status of the Job inJenkins Utils "+e.getStackTrace(), LEVEL.error);
		}
		return status;
	}

	public static int newJenkinsJob(String url, String newJobName,
			String configXML, String jenkinsuser, String jenkinspass) {
		System.out.println("inside newjenkinsjob");
		System.out.println("jenkins url: "+url);
		System.out.println("jenkins jobname: "+newJobName);
		System.out.println("jenkins user: "+ jenkinsuser);
		System.out.println("jenkins pass: "+ jenkinspass);
		int jsonResponse = 0;
		try {
			Client client = Client.create();
			 client.addFilter(new HTTPBasicAuthFilter(jenkinsuser,jenkinspass));
			if (url.endsWith("/")) {
				url = url + "createItem?name=" + newJobName;

			} else {
				url = url + "/createItem?name=" + newJobName;
			}
			WebResource webResource = client.resource(url);
			System.out.println("WebRespource Response: "+webResource );
			ClientResponse response = webResource.type("application/xml").post(
					ClientResponse.class, configXML);
		//	System.out.println("Client Response: "+ response);
			jsonResponse = response.getStatus();
		//	System.out.println("json Response: "+response);
			int statusCode = response.getStatus();
			DigiLoggerUtils
					.log("Status  Creation of Jenkins Job : Job Name :"
							+ newJobName + "   Status Code : " + statusCode,
							LEVEL.info);
			client.destroy();
		} catch (UniformInterfaceException e) {
			DigiLoggerUtils.log(
					"Error while Creating Jenkins Job : Uniform Interface Exception :"
							+ e.getMessage(), LEVEL.error);
		} catch (ClientHandlerException e) {
			DigiLoggerUtils.log(
					"Error while Creating Jenkins Job : Uniform Interface Exception :"
							+ e.getMessage(), LEVEL.error);
		} catch (Exception e) {
			DigiLoggerUtils.log(
					"Error while Creating Jenkins Job : Uniform Interface Exception :"
							+ e.getMessage(), LEVEL.error);
		}
		System.out.println("jenkins response"+ jsonResponse);
		return jsonResponse;
	}

}
