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
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.cert.Certificate;
import java.security.cert.X509Certificate;

import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLPeerUnverifiedException;
import javax.net.ssl.SSLSession;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;

public class RESTAPICall {
	public static String xmlString = "";
	
	public String callRESTAPI(String URL){
		//https://partners.perfectomobile.com/services/handsets?operation=list&user=anuja.saraf@capgemini.com&password=Digi2017
		try{
			new RESTAPICall().testIt(URL);
		}catch(Exception e){
			System.out.println("http issue ");
		}
		return xmlString;
	}
	
	public void testIt(String URL) {
		String https_url = URL;
		URL url;
		try {

			// Create a context that doesn't check certificates.
			SSLContext ssl_ctx = SSLContext.getInstance("TLS");
			TrustManager[] trust_mgr = get_trust_mgr();
			ssl_ctx.init(null, // key manager
					trust_mgr, // trust manager
					new SecureRandom()); // random number generator
			HttpsURLConnection.setDefaultSSLSocketFactory(ssl_ctx.getSocketFactory());

			url = new URL(https_url);
			HttpsURLConnection con = (HttpsURLConnection) url.openConnection();
			// Guard against "bad hostname" errors during handshake.
			con.setHostnameVerifier(new HostnameVerifier() {
				public boolean verify(String host, SSLSession sess) {
					if (host.equals("localhost"))
						return true;
					else
						return false;
				}
			});

			// dumpl all cert info
			print_https_cert(con);

			// dump all the content
			print_content(con);

		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (KeyManagementException e) {
			e.printStackTrace();
		}
	}
	
	private TrustManager[] get_trust_mgr() {
		TrustManager[] certs = new TrustManager[] { new X509TrustManager() {
			public X509Certificate[] getAcceptedIssuers() {
				return null;
			}

			public void checkClientTrusted(X509Certificate[] certs, String t) {
			}

			public void checkServerTrusted(X509Certificate[] certs, String t) {
			}
		} };
		return certs;
	}
	
	private void print_https_cert(HttpsURLConnection con) {
		if (con != null) {

			try {
				con.getResponseCode();
				con.getCipherSuite();
				Certificate[] certs = con.getServerCertificates();
				for (Certificate cert : certs) {
					cert.getType();
					cert.hashCode();
					cert.getPublicKey().getAlgorithm();
					cert.getPublicKey().getFormat();
					
				}


			} catch (SSLPeerUnverifiedException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	private void print_content(HttpsURLConnection con) {
		if (con != null) {

			try {


			//	BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream()));
				
				
				
				BufferedReader br;
				if(con.getResponseCode() == 200)
				{
						br = new BufferedReader(new
				InputStreamReader(con.getInputStream()));
				}
				else
				{
						br = new BufferedReader(new
				InputStreamReader(con.getErrorStream()));
				}
				
				

				String input;
				String xml = "";
				while ((input = br.readLine()) != null) {
					xml = xml + input;
				}
				br.close();
				xmlString = xml;

			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
}
